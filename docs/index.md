# Software Templates

The software templates included in this repository are used within [Red Hat Developer Hub](https://developers.redhat.com/rhdh/overview), and allow platform engineering teams to provide developers with supported approaches through a self-service catalog.  Read the upstream Backstage docs for more on [software templates](https://backstage.io/docs/features/software-templates/).

## Why This Pattern

A collection of the templates is used as a workshop to deploy Red Hat OpenShift AI (RHOAI), see [Using the Templates](#using-the-templates) for more details.

The RHOAI workshop templates deploy OpenShift AI with GitOps through ArgoCD applications.  Developer Hub has a concept of [entities](https://backstage.io/docs/features/software-catalog/references/) to offer a logical representation of those components.  We built the ability to create entities in Developer Hub for the following reasons:
* Show a representation of our infrastructure using [well-known relations](https://backstage.io/docs/features/software-catalog/well-known-relations/).
* Entity relationships and associated entity metadata are also defined through GitOps, so if persistent data in Developer Hub was lost, the defined entities in Git can be reimported to Developer Hub.
* AI Assistant DevSpaces Configuration and Continue Workspace are not defined entities in our project, as we chose for our end user to configure OpenShift AI workspaces ephemerally.  They could in theory be defined entities if we wanted to persist this.

## Prerequisites

* Red Hat OpenShift
* Red Hat Developer Hub (tested with 1.2 and 1.3)

Many of the templates are used to install Red Hat OpenShift AI, and this [knowledgebase article](https://access.redhat.com/articles/rhoai-supported-configs) lists supported configurations for it.

## Installing

Existing software templates, such as the ones provided in this repository, can be imported to Red Hat Developer Hub.  For convenience, we have grouped the templates together using [Locations](https://backstage.io/docs/features/software-catalog/system-model/#location).  The following Location is used to import [all templates in this repository](/catalogs/templates.yaml).

In the `app-config.yaml` configuration file, modify the `catalog.rules` section to include a rule for templates, and configure the `catalog.locations` section to point to the template that you want to add, as shown in the following example:

```
# ...
catalog:
  rules:
    - allow: [Component, API, System, Resource, Location, Template] # <-- add Template to your existing list
  locations:
    - type: url
      target: https://github.com/poc-examples/software-templates/blob/main/catalogs/templates.yaml
```

Afterwards, recycle the Developer Hub pod so it can read the new `app-config.yaml` configuration file.  See the [documentation](https://docs.redhat.com/en/documentation/red_hat_developer_hub/1.3/html/administration_guide_for_red_hat_developer_hub/index#proc-adding-templates_assembly-admin-templates) for more on importing an existing software template.

## Using the Templates

To run the RHOAI workshop, templates should be executed in this order:
* [Create a GitLab Root Self-Service Repository (One-Time Use)](/catalogs/argocd/setup-root-self-service-repository/template.yaml)
* [Red Hat OpenShift AI - Data Science Project](/catalogs/openshift-ai/datascience/project/template.yaml)
* [Red Hat OpenShift AI - Data Connector](/catalogs/openshift-ai/datascience/data-connector/template.yaml)
* [Red Hat OpenShift AI - Data Science Sync Model](/catalogs/openshift-ai/datascience/sync-model/template.yaml)
* [Red Hat OpenShift AI - Single Model Server](/catalogs/openshift-ai/datascience/single-model-server/template.yaml)
* [DevSpaces - Continue Configuration](/catalogs/devspaces/continue-workspace/template.yaml)

## Contributing

Please read [CONTRIBUTING.md](/CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

- Christopher Engleby - [poc-examples](https://github.com/poc-examples)
- Kevin Chung
- Connor Wooley

## License

This project is licensed under the [MIT License](/LICENSE)
