### created two helpful Bash scripts:

* `build-deploy.sh` for initial build, image loading, and deployment
* `config-deploy.sh` for configuration reloads and HPA updates

Here’s how you can **clearly explain these commands** in your README under a new section, like:

---

## 🧪 Automating App Deployment

To streamline your local Kubernetes workflow, use the following scripts:

---

### 📦 `build-deploy.sh` — *Build, Package, and Deploy*

This script performs a **full end-to-end deployment** of your FastAPI app:

```bash
./build-deploy.sh
```

#### 🔍 What it does:

1. **Builds a Docker image locally** from your FastAPI project.
2. **Exports the image to a `.tar` file** and loads it into MicroK8s.
3. **Applies Kubernetes manifests** for:

   * `ConfigMap` (app config)
   * `Secret` (e.g., API keys, DB passwords)
   * `Deployment` (app Pods)
   * `Service` (ClusterIP or NodePort for networking)
   * `Ingress` (to expose app via HTTP)
4. 🎯 Access the app at: `http://<your-ip>/test`

---

### 🔄 `config-deploy.sh` — *Update Configuration and Autoscaling*

Run this when you **change configs or need to restart your app** without rebuilding the Docker image:

```bash
./config-deploy.sh
```

#### 🔍 What it does:

1. **Deletes** any existing Deployment or HPA (ignores errors if they don’t exist).
2. **Re-applies** the latest:

   * `ConfigMap` and `Secret`
   * `Deployment` and `Service`
   * `HorizontalPodAutoscaler` (HPA)
   * `Ingress`

> 🧠 This is useful for **debugging**, **tuning**, or **redeploying** without building the image again.

---

### 💡 Tips

* Replace `<your-ip>` with the output of `hostname -I | awk '{print $1}'`
* Make scripts executable if needed:

  ```bash
  chmod +x build-deploy.sh config-deploy.sh
  ```
* Add logging with `set -e` or `set -x` for troubleshooting.

---

