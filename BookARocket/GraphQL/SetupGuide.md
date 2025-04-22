# GraphQL Setup guide

1. Setup Codegen CLI

2. Create your Codegen Configuration
```bash
./apollo-ios-cli init --schema-namespace ENTER_YOUR_SCHEMA_NAMESPACE --module-type swiftPackageManager
```
This generates a basic apollo-codegen-config.json file for our project.

3. Download your server's schema
We need to update our apollo-codegen-config.json to include a `schemeDownloadConfiguration`. Add the following JSON to the end of the config file after the `output` object:
```json
"schemaDownloadConfiguration": {
    "downloadMethod": {
        "introspection": {
            "endpointURL": "https://apollo-fullstack-tutorial.herokuapp.com/graphql",     // Enter your endpoint here.
            "httpMethod": {
                "POST": {}
            },
            "includeDeprecatedInputValues": false,
            "outputFormat": "SDL"
        }
    },
    "downloadTimeout": 60,
    "headers": [],
    "outputPath": "./graphql/schema.graphqls"
}
```
Now that we have updated our config, we can download the schema by running the following command in Terminal:
```bash
./apollo-ios-cli fetch-schema
```
After running this command you should see a graphql folder in your project directory containing a `schema.graphqls` file.

4. Add your needed operations to the project.
- Before adding, please ensure that you have tested the operations through Apollo's Sandbox Explorer.

5. After adding, run the following command for code generation:
```bash
./apollo-ios-cli generate
```

------------------
CONTINUE FROM HERE


In our project:
- Operation file (Operation models): `SpaceX-Company.graphql`



# Code generation

**Important:**
- Apollo iOS code generation uses your `.graphql` files to generate API code that helps you execute GraphQL operations and parse and cache operation responses.
- Whenever you make changes to your GraphQL operation definitions, you'll need to run the code generation engine to re-generate your GraphQL models.
