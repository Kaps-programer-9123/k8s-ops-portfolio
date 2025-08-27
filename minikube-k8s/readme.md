# **Kubernetes Setup on macOS (M1/M2/M3/M4) using Minikube**

This guide helps you set up, run, and clean up **Minikube** for Kubernetes development on macOS Apple Silicon (M1, M2, M3, M4). It includes **installation, resource allocation, directory structure, disk usage, and full cleanup steps**.

---

## **Why Minikube?**

Minikube allows you to:

* Run Kubernetes locally for development/testing.
* Quickly spin up a lightweight cluster.
* Experiment with Kubernetes features without using cloud resources.

---

## **Supported Platforms**

* macOS 12+ (Monterey or later)
* Apple Silicon: M1, M2, M3, and M4 (ARM64 architecture supported)

---

## **Resource Requirements**

| Feature          | Minikube (Apple Driver)                 |
| ---------------- | --------------------------------------- |
| **CPU**          | 2–4 vCPUs recommended                   |
| **Memory (RAM)** | 4–8 GB (dynamic allocation)             |
| **Disk Space**   | 2–4 GB initial, 10–15 GB with workloads |
| **Architecture** | ARM64                                   |

> **Note:** Memory allocated (e.g., 8 GB) is **not permanently reserved**; it is used only while Minikube is running.

---

## **Installation Steps**

### 1. **Install Minikube**

```bash
brew install minikube
```

* Binary location: `/opt/homebrew/bin/minikube`
* Config/data: `~/.minikube/`

---

### 2. **Start Minikube using Apple Virtualization**

```bash
minikube start --driver=apple --cpus=4 --memory=8g --disk-size=20g
```

* Uses Apple Virtualization Framework.
* Downloads lightweight Linux ISO (\~200 MB).
* Creates a virtual disk (\~2–4 GB initially).

---

### 3. **Verify Installation**

```bash
minikube status
kubectl get nodes
```

---

## **Directory Layout**

* **Cluster data & config:** `~/.minikube/`
* **VM machine files:** `~/.minikube/machines/<cluster-name>/`
* **ISO/cache:** `~/.minikube/cache/`

---

## **Stop / Pause / Delete**

```bash
minikube stop
minikube delete --all
minikube cache delete
```

---

## **Full Cleanup**

```bash
minikube stop
minikube delete --all
rm -rf ~/.minikube
brew uninstall minikube
```

---

## **Expected Disk Usage**

* Installation: **200–300 MB**
* After cluster start: **2–4 GB**
* Heavy workloads: **5–10 GB**

---

## **Automation Script**

Save this as `minikube_setup.sh`:

```bash
#!/bin/bash

set -e
ACTION=$1

install_minikube() {
  echo "Installing Minikube..."
  brew install minikube
  echo "Starting Minikube with Apple driver..."
  minikube start --driver=apple --cpus=4 --memory=8g --disk-size=20g
  echo "Minikube started successfully!"
}

cleanup_minikube() {
  echo "Stopping and deleting Minikube cluster..."
  minikube stop || true
  minikube delete --all || true
  echo "Removing Minikube files..."
  rm -rf ~/.minikube
  echo "Uninstalling Minikube binary..."
  brew uninstall minikube || true
  echo "Cleanup complete!"
}

case "$ACTION" in
  install)
    install_minikube
    ;;
  cleanup)
    cleanup_minikube
    ;;
  *)
    echo "Usage: $0 {install|cleanup}"
    exit 1
    ;;
esac
```

Run it:

```bash
chmod +x minikube_setup.sh
./minikube_setup.sh install   # Install & start Minikube
./minikube_setup.sh cleanup   # Stop & clean everything
```

---

## **Key Points**

* **Supports Apple Silicon (M1–M4)** via Apple Virtualization.
* **Memory is dynamic** — not locked when not running.
* Easy cleanup with a single script.
* Recommended for machines with **≥24 GB RAM and 256 GB SSD**.
---
---

Here’s a **comprehensive Minikube command reference** — starting from **beginner-friendly basics** to **advanced/expert commands** for cluster management, debugging, resource control, and cleanup.

---

kaps@Kapils-MacBook-Air ~ % minikube start --driver=docker --cpus=2 --memory=4g --disk-size=10g

* 😄  minikube v1.36.0 on Darwin 15.5 (arm64)
* ✨  Using the docker driver based on user configuration
* 📌  Using Docker Desktop driver with root privileges
* 👍  Starting "minikube" primary control-plane node in "minikube" cluster
* 🚜  Pulling base image v0.0.47 ...
* 💾  Downloading Kubernetes v1.33.1 preload ...
*    > preloaded-images-k8s-v18-v1...:  327.15 MiB / 327.15 MiB  100.00% 3.71 Mi
*    > gcr.io/k8s-minikube/kicbase...:  463.69 MiB / 463.69 MiB  100.00% 4.54 Mi
* 🔥  Creating docker container (CPUs=2, Memory=4096MB) ...
* 🐳  Preparing Kubernetes v1.33.1 on Docker 28.1.1 ...
*    ▪ Generating certificates and keys ...
*    ▪ Booting up control plane ...
*    ▪ Configuring RBAC rules ...
* 🔗  Configuring bridge CNI (Container Networking Interface) ...
* 🔎  Verifying Kubernetes components...
*    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
* 🌟  Enabled addons: storage-provisioner, default-storageclass
* 🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

---

## **1. Basic Commands (Beginner Level)**

| Command                            | Description                                                         |
| ---------------------------------- | ------------------------------------------------------------------- |
| `minikube start`                   | Starts a Minikube cluster with default settings.                    |
| `minikube start --driver=<driver>` | Start with a specific driver (e.g., `docker`, `apple`, `hyperkit`). |
| `minikube status`                  | Shows the current status of your cluster.                           |
| `minikube stop`                    | Stops the cluster but retains data and config.                      |
| `minikube delete`                  | Deletes the cluster and frees resources (disk, memory).             |
| `minikube dashboard`               | Launches Kubernetes dashboard in your browser.                      |
| `kubectl get pods -A`              | (Works after start) Lists all pods across namespaces.               |
| `minikube version`                 | Displays Minikube version.                                          |
| `minikube update-check`            | Checks for Minikube updates.                                        |

---

## **2. Intermediate Commands (Resource Control & Customization)**

| Command                                               | Description                                             |
| ----------------------------------------------------- | ------------------------------------------------------- |
| `minikube start --cpus=4 --memory=8g --disk-size=20g` | Start cluster with custom CPU, RAM, and disk size.      |
| `minikube ssh`                                        | SSH into the Minikube VM to explore internals.          |
| `minikube service <service-name>`                     | Opens a Kubernetes service in your browser.             |
| `minikube addons list`                                | Shows available addons (like metrics-server, ingress).  |
| `minikube addons enable <addon>`                      | Enables an addon (e.g., `ingress`, `metrics-server`).   |
| `minikube profile list`                               | Lists multiple Minikube clusters (profiles).            |
| `minikube pause`                                      | Pauses the cluster (saves resources without full stop). |
| `minikube unpause`                                    | Resumes a paused cluster.                               |

---

## **3. Advanced Commands (Expert Level)**

| Command                                    | Description                                                         |
| ------------------------------------------ | ------------------------------------------------------------------- |
| `minikube config view`                     | Shows current Minikube configurations.                              |
| `minikube config set memory 8192`          | Sets default memory for all future clusters.                        |
| `minikube node list`                       | Lists all nodes in your Minikube cluster.                           |
| `minikube node add`                        | Adds another node to create a multi-node cluster.                   |
| `minikube cache add <image>`               | Pre-pull and cache Docker images into the cluster.                  |
| `minikube image load <image>`              | Load a local Docker image directly into Minikube.                   |
| `minikube image build -t myapp:1.0 .`      | Build Docker image inside Minikube environment.                     |
| `minikube tunnel`                          | Exposes LoadBalancer services on your local network.                |
| `minikube mount <local-dir>:<mount-point>` | Mount local directory into Minikube VM.                             |
| `minikube kubectl -- get pods`             | Run `kubectl` via Minikube’s built-in client (no separate install). |
| `minikube delete --all --purge`            | Delete all clusters, remove ISO/images, and reclaim space.          |

---

## **4. Debugging & Diagnostics**

| Command                  | Description                               |
| ------------------------ | ----------------------------------------- |
| `minikube logs`          | Show Minikube cluster logs.               |
| `minikube ssh "df -h"`   | Check disk usage inside the Minikube VM.  |
| `minikube ssh "free -h"` | Check memory usage inside Minikube.       |
| `minikube events`        | View Kubernetes cluster events.           |
| `minikube service list`  | List all running services and their URLs. |

---

## **5. Cleanup & Space Reclaim**

| Command                         | Description                                            |
| ------------------------------- | ------------------------------------------------------ |
| `minikube delete --all`         | Deletes all clusters but leaves cached files.          |
| `minikube delete --all --purge` | Full cleanup including cached images, ISO, and config. |
| `rm -rf ~/.minikube`            | Manual cleanup (use with caution).                     |
| `minikube cache delete`         | Clears cached images only.                             |

---

## **Workflow Suggestion for You (24GB RAM / 256GB SSD)**

1. Start with:

   ```bash
   minikube start --driver=apple --cpus=4 --memory=8g --disk-size=20g
   ```
2. Do your Kubernetes trial & testing.
3. Stop when not using:

   ```bash
   minikube stop
   ```
4. Cleanup if done:

   ```bash
   minikube delete --all --purge
   ```

---
