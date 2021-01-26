# CAP - Freight Order

This is a personal experimental project to test CAP capabilities using Fiori UI anotations.

It uses a simulated SAP TM Freight Order as data.

The data is stored in csv files at folder db/data.

File / Folder | Purpose
---------|----------
`app/` | Future UI5 App - not yet implemented
`db/data` | csv files containing the SAP TM Freight Order data
`srv/` | Service model and annotations
`package.json` | project metadata and configuration


## Next Steps...

You can use a SAP Cloud trial account to run it as the project is configured to use a HANA Database. You can also use SQlite by changing the `package.json` file.

- Open a new terminal and run  `cds deploy --to hana`
- Run `cds watch`


## Learn more...

Learn more at https://cap.cloud.sap/docs/get-started/