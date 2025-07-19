# 🌱 MicroK8s Kubernetes Demo – End-to-End Deployment & Ops

## 🚀 What is MicroK8s?

[**MicroK8s**](https://microk8s.io) is a lightweight, production-grade, certified Kubernetes distribution developed by **Canonical** (the creators of Ubuntu). It's designed for:

* Local Kubernetes development
* Lightweight IoT & edge use-cases
* Production-grade container orchestration with minimal overhead

### 🖥️ System Requirements

| Requirement           | Minimum Recommended          |
| --------------------- | ---------------------------- |
| OS                    | Ubuntu 18.04+ / Debian-based |
| Memory (RAM)          | 2 GB (4 GB+ recommended)     |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
| Disk Space            | 10 GB+ free                  |
| CPU                   | 2 cores                      |
| Internet Connectivity | Required for initial setup   |

📖 Official Docs: [https://microk8s.io/docs](https://microk8s.io/docs)

---

## 🧰 Setup Instructions

### 🔧 Step 1: Install Dependencies

```bash
sudo apt update
sudo apt install docker.io -y
```

### ⚙️ Step 2: Install MicroK8s

```bash
sudo snap install microk8s --classic
microk8s status --wait-ready
```

If necessary:

```bash
sudo microk8s status --wait-ready
```

---

### 🧩 Step 3: Enable Required Kubernetes Add-ons

```bash
microk8s enable dns storage ingress metrics-server
```

💡 *These enable service discovery, storage volumes, HTTP routing, and autoscaling metrics.*

📖 More: [MicroK8s Add-ons →](https://microk8s.io/docs/addons)

---

### 🌐 Step 4: Enable Web Dashboard (Optional)

To enable and access the Kubernetes Dashboard:

```bash
microk8s enable dashboard
microk8s dashboard-proxy
```

🔐 Get the default access token:

```bash
microk8s kubectl -n kube-system get secret | grep default-token
microk8s kubectl -n kube-system describe secret <your-default-token-name>
```

Replace `<your-default-token-name>` with the name listed from the previous command.

🌐 Or run a proxy to access the dashboard via browser:

```bash
microk8s kubectl proxy
# Access in browser:
# http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
```

---

### 🗂️ Step 5: Configure `kubectl` Locally

```bash
mkdir -p ~/.kube
microk8s config > ~/.kube/config
sudo chown -R $USER:$USER ~/.kube
```

Now you can use `kubectl` directly or `microk8s kubectl`.

---

### 🖥️ Step 6: Install k9s (TUI tool for Kubernetes)

```bash
sudo snap install k9s
k9s
```
---
📖 Docs: [https://k9scli.io/](https://k9scli.io/)

---
🛠 Useful k9s Shortcuts & Tips

| Key      | Description                                |
| -------- | ------------------------------------------ |
| `:`      | Command mode (e.g., `:pods`, `:nodes`)     |
| `0`–`9`  | Switch between saved views                 |
| `/`      | Search/filter resources                    |
| `d`      | Describe selected resource (details/debug) |
| `l`      | View logs of selected pod                  |
| `s`      | Shell into the selected pod                |
| `Ctrl+a` | View all resources                         |
| `q`      | Quit current view or exit k9s              |


## 📚 Core Kubernetes Concepts Used

> 📘 *Each component links to its official Kubernetes documentation.*

| Object                                                                                                                    | Purpose                                                        |
| ------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| [**Pod**](https://kubernetes.io/docs/concepts/workloads/pods/)                                                            | Smallest deployable unit that runs one or more containers.     |
| [**Deployment**](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)                                   | Manages desired state for Pods and ReplicaSets.                |
| [**Service**](https://kubernetes.io/docs/concepts/services-networking/service/)                                           | Provides stable access to Pods (via ClusterIP, NodePort, etc). |
| [**Ingress**](https://kubernetes.io/docs/concepts/services-networking/ingress/)                                           | Routes external HTTP(S) traffic to Services.                   |
| [**PersistentVolume (PV)**](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)                              | Cluster-wide storage resource.                                 |
| [**PersistentVolumeClaim (PVC)**](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims) | Pod-specific storage request.                                  |
| [**ConfigMap**](https://kubernetes.io/docs/concepts/configuration/configmap/)                                             | Injects non-sensitive configuration data into Pods.            |
| [**Secret**](https://kubernetes.io/docs/concepts/configuration/secret/)                                                   | Stores sensitive data like passwords and API keys.             |
| [**Namespace**](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/)                            | Logical separation for multi-tenancy or grouping.              |
| [**HPA**](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)                                     | Auto-scales Pods based on CPU or custom metrics.               |

📌 *For component-level details, refer to individual Kubernetes documentation links above.*

---

## 💡 Tips for Users

* Use `k9s` to visually inspect resources quickly.
* Use `microk8s kubectl describe <resource>` to debug issues.
* Use `hostname -I` to get your local IP for browser testing.
* Use `microk8s dashboard-proxy` or `kubectl proxy` to open the dashboard GUI.
* To delete any component safely: `microk8s kubectl delete <resource> --wait=true`

---
