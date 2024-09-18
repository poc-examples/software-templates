const nunjucks = require('nunjucks');
const fs = require('fs');
const path = require('path');
const yaml = require('js-yaml');
const assert = require('assert');

nunjucks.configure({ autoescape: true });

// Collect The Use-Case
const yamlFile = process.argv[2];
const yamlContent = yaml.load(fs.readFileSync(path.join("use-cases/", yamlFile), 'utf8'));

// Collect The Template
let template = fs.readFileSync(path.join(__dirname, yamlContent["template"]), 'utf8');

// Replace all instances of "${{" with "{{"
template = template.replace(/\${{/g, '{{');

// Render the template with the YAML content
const renderedOutput = nunjucks.renderString(template, yamlContent);

// Assert the rendered output is equal to the expected result
try {
    assert.strictEqual(
        renderedOutput, 
        yamlContent["expected"], 
        'Rendered output does not match expected result.'
    );
    console.log(`Test ${yamlFile}: Passed`);
} catch (error) {
    console.error(`Test ${yamlFile}: Failed - Does not match expected`);
}
