# Root Self-Service Repository

Welcome!  
This repository was automatically created by Red Hat Developer Hub and acts as the starting point for managing your team's self-service infrastructure and application deployments.

If you're new to Developer Hub or GitOps workflows, this guide will walk you through how this repository is structured and what it's used for.

---

## What Is This Repository?

This is the Root Self-Service Repository.  
It contains everything needed to manage your own projects using GitOps — all in one place.

It was created using a Developer Hub Software Template, which means:
- It was provisioned automatically with the correct structure
- It's already connected to ArgoCD, Helm, and TechDocs
- It provides a repeatable way to create, manage, and document services

---

## Repository Structure

### `_init_/`
This folder contains bootstrapping ArgoCD applications. It:
- Sets up the self-service namespace in ArgoCD
- Recursively scans the `projects/` folder
- Deploys any ArgoCD Application manifests it finds

Think of this folder as the entry point that wires everything together.

---

### `backstage/`
Contains the `catalog-info.yaml` file, which:
- Registers new components in Developer Hub
- Connects them to their TechDocs documentation
- Makes them visible in the Backstage catalog UI

When you create a new service using Developer Hub, its metadata is registered here.

---

### `docs/`
This is where your Markdown documentation lives.

When TechDocs is enabled in Developer Hub, this folder is rendered as part of the documentation tab for each registered service.  
Write your docs in Markdown and they’ll be published automatically.

---

### `projects/`
Contains the actual applications you're managing.

Each folder:
- Holds an ArgoCD `Application` resource
- Points to a Helm chart defining the service
- Is created and registered automatically by your Developer Hub template

This is where your deployable workloads live, managed through GitOps.

---

## Why Use Developer Hub?

Developer Hub gives you a centralized portal to:

- Create new services through templates
- Manage deployments with ArgoCD and Helm
- Author and publish documentation with TechDocs
- View all services and infrastructure in one place using the Backstage catalog
- Enable developers to deploy safely, with guardrails and governance

---

## What to Do Next

1. Open Developer Hub (Backstage UI)
2. Click "Create" and pick a template (like Kafka or a new app)
3. Fill out the form
4. This repository will be updated with your new project
5. Visit the Developer Hub catalog to view and manage your project

---

This setup helps you standardize and accelerate how teams deploy infrastructure and services — without losing control or visibility.

If you're in a workshop, feel free to explore the folders, launch a service, and see how it all fits together.

---

Happy building!