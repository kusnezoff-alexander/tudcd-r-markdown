const puppeteer = require('puppeteer');
const path = require('path');
const fs = require('fs');

// Function to determine the full file URL
function getFileUrl(inputHtml) {
  // Check if the path is absolute
  if (!path.isAbsolute(inputHtml)) {
    // Resolve relative path to absolute
    inputHtml = path.resolve(process.cwd(), inputHtml);
  }

  // Ensure the file exists
  if (!fs.existsSync(inputHtml)) {
    throw new Error(`File not found: ${inputHtml}`);
  }

  // Return the file URL
  return `file://${inputHtml}`;
}

async function captureAlignedSvg(inputHtml, outputSvg) {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  // Load HTML as a file
  const fileUrl = getFileUrl(inputHtml);
  await page.goto(fileUrl, { waitUntil: 'networkidle0' });

  // Wait until the mindmap is rendered
  await page.waitForSelector('svg#mindmap g, svg#mindmap path, svg#mindmap foreignObject');

  const svgString = await page.$eval('svg#mindmap', svg => {
    const xmlns = 'http://www.w3.org/2000/svg';

    // Clone so we don’t disturb original
    const clone = svg.cloneNode(true);

    // Inline computed CSS styles for all nodes and paths
    function inlineStyles(el) {
      const cs = window.getComputedStyle(el);
      const style = [];
      for (const prop of cs) {
        style.push(`${prop}:${cs.getPropertyValue(prop)}`);
      }
      el.setAttribute('style', style.join(';'));
    }
    clone.querySelectorAll('*').forEach(inlineStyles);

    // Convert foreignObject text to <text> elements
    clone.querySelectorAll('foreignObject').forEach(fo => {
      const div = fo.querySelector('div');
      if (div) {
        const txt = div.textContent.trim();
        if (txt) {
          const textEl = document.createElementNS(xmlns, 'text');
          // compute target position via bounding box
          const bbox = fo.getBBox();
          // place at top-left of the fo bounding box
          textEl.setAttribute('x', bbox.x);
          textEl.setAttribute('y', bbox.y + parseFloat(window.getComputedStyle(div).fontSize || 12));
          textEl.setAttribute('fill', 'black');
          textEl.setAttribute('font-family', getComputedStyle(div).fontFamily);
          textEl.setAttribute('font-size', getComputedStyle(div).fontSize);
          textEl.textContent = txt;
          fo.parentNode.appendChild(textEl);
        }
      }
      fo.remove();
    });

    // Add necessary svg attributes
    clone.setAttribute('xmlns', xmlns);
    clone.setAttribute('version', '1.1');
    // Optionally preserve original width/height if present
    if (!clone.hasAttribute('width')) {
      clone.setAttribute('width', svg.clientWidth || 800);
    }
    if (!clone.hasAttribute('height')) {
      clone.setAttribute('height', svg.clientHeight || 600);
    }
    // We do *not* remove viewBox here, so if there's a viewBox, it will keep scaling

    return clone.outerHTML;
  });

  await browser.close();

  const xmlDecl = `<?xml version="1.0" encoding="UTF-8"?>\n`;
  fs.writeFileSync(outputSvg, xmlDecl + svgString, 'utf8');
  console.log('Captured aligned SVG:', outputSvg);
}

// CLI usage
if (require.main === module) {
  const [inp, out] = process.argv.slice(2);
  if (!inp || !out) {
    console.error('Usage: node captureAlignedSvg.js input.html output.svg');
    process.exit(1);
  }
  captureAlignedSvg(inp, out).catch(err => {
    console.error('Error:', err);
    process.exit(1);
  });
}
