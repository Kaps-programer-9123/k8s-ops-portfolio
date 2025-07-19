# 🚀 Kubernetes Study Guide

This project demonstrates a comprehensive Kubernetes deployment using MicroK8s and k9s, covering multiple key components essential for managing real-world applications. You’ll see how to work with Pods as the smallest deployable units, managed via Deployments and ReplicaSets to ensure high availability. It incorporates persistent storage using PersistentVolumes and PersistentVolumeClaims, while ConfigMaps and Secrets handle configuration and sensitive data securely. Networking is enabled through Services and Ingress for stable access and routing. Additionally, the project includes Namespace usage for resource isolation and implements Horizontal Pod Autoscaling to dynamically scale workloads based on demand. This hands-on demo showcases practical Kubernetes operational skills across core objects, enabling scalable and secure applications on a local cluster.

---

## 🕵️‍♂️ About Me

**Kapil Chaudhari**  
Tata Consultancy Services  
📍 Pune, India  
🔗 [LinkedIn Profile](https://www.linkedin.com/in/kapil-chaudhari-445130171)

---

## 📚 Table of Contents

1. [Core Kubernetes Objects](#core-kubernetes-objects)  
2. [Advanced Workloads](#advanced-workloads)  
3. [🔐 Security](#security)  
4. [🌐 Networking](#networking)  
5. [📅 Scheduling](#scheduling)  
6. [💾 Storage](#storage)  
7. [📈 Scaling](#scaling)  
8. [⚙️ Extensibility](#extensibility)  
9. [📊 Monitoring and Logging](#monitoring-and-logging)  
10. [🛠️ Administration and Debugging](#administration-and-debugging)  

---

## 🧱 Core Kubernetes Objects

| Object       | Purpose                                       |
|--------------|-----------------------------------------------|
| 🐳 **Pod**      | Smallest deployable unit, runs one or more containers. |
| 🖥️ **Node**     | Physical or virtual machine that runs Pods.  |
| 🔗 **Service**  | Stable network access to a set of Pods (load balancing). |
| 🚀 **Deployment** | Declarative management of Pods and ReplicaSets. |
| 🔑 **Secret**   | Secure storage for sensitive information (passwords, keys). |
| ⚙️ **ConfigMap**| Storage for non-sensitive configuration data. |
| 📦 **Namespace**| Virtual cluster partitioning for resource isolation. |
| 💾 **Volume / PVC** | Persistent or ephemeral storage for Pods. |
| 🌐 **Ingress**  | HTTP(S) routing from outside the cluster to Services. |

---

## 🛠️ Advanced Workloads

| Object       | Purpose                                       |
|--------------|-----------------------------------------------|
| 🔁 **ReplicaSet** | Maintains a stable set of replica Pods.     |
| 📢 **DaemonSet** | Runs a copy of a Pod on all or selected nodes. Useful for logging, monitoring. |
| 🗃️ **StatefulSet** | Manages stateful applications with stable network IDs and storage. |
| 🎯 **Job**      | Runs a Pod to completion (batch jobs).        |
| ⏰ **CronJob**  | Runs Jobs on a schedule (like cron).          |

---

## 🔐 Security

| Topic            | Purpose                                    |
|------------------|--------------------------------------------|
| 👮 **RBAC**         | Role-Based Access Control to manage permissions. |
| 🆔 **ServiceAccount**| Identity for Pods to interact with API or cloud services. |
| 🔑 **Secrets**      | Store and manage sensitive data securely.  |
| 🚦 **Network Policies** | Control Pod-to-Pod network traffic.      |

---

## 🌐 Networking

| Topic          | Purpose                                   |
|----------------|-------------------------------------------|
| 🔗 **Services**   | ClusterIP, NodePort, LoadBalancer, ExternalName types. |
| 🌉 **Ingress**    | Manages external HTTP(S) access to services. |
| 📛 **DNS**        | Internal service discovery.               |
| 🔌 **CNI Plugins**| Container Network Interface for Pod networking (e.g., Calico, Flannel). |

---

## 📅 Scheduling

| Topic             | Purpose                                  |
|-------------------|------------------------------------------|
| 🚫 **Taints & Tolerations** | Control which Pods can run on which Nodes. |
| 📌 **Node Affinity**  | Prefer or require Pods to run on specific nodes. |
| ↔️ **Pod Affinity / Anti-Affinity** | Co-locate or separate Pods based on labels. |

---

## 💾 Storage

| Topic             | Purpose                                  |
|-------------------|------------------------------------------|
| 📂 **Volumes**       | Storage attached to Pods (ephemeral or persistent). |
| 🗄️ **PersistentVolumes (PV)** | Cluster storage resource provisioned by admins. |
| 📄 **PersistentVolumeClaims (PVC)** | Pod requests for storage. |
| 🏷️ **StorageClasses** | Define types of storage (e.g., SSD, network storage). |

---

## 📈 Scaling

| Topic             | Purpose                                  |
|-------------------|------------------------------------------|
| 🤖 **Horizontal Pod Autoscaler (HPA)** | Automatically scales Pods based on metrics. |
| 🎚️ **Resource Requests & Limits** | Manage resource allocation and prevent contention. |

---

## ⚙️ Extensibility

| Topic             | Purpose                                  |
|-------------------|------------------------------------------|
| 🧩 **Custom Resource Definitions (CRDs)** | Extend Kubernetes with custom APIs. |
| 🤹‍♂️ **Operators**     | Automate management of complex applications. |
| 📦 **Helm**          | Kubernetes package manager for templated deployments. |

---

## 📊 Monitoring and Logging

| Topic             | Purpose                                  |
|-------------------|------------------------------------------|
| 📝 **kubectl logs**  | Access container logs for debugging.     |
| 📈 **Prometheus & Grafana** | Metrics collection and visualization. |
| 📚 **Fluentd / Loki** | Logging aggregation and analysis.       |

---

## 🛠️ Administration and Debugging

| Topic             | Purpose                                  |
|-------------------|------------------------------------------|
| 💻 **kubectl** commands | `get`, `describe`, `exec`, `port-forward`, `top`, etc. |
| ⚠️ **Events**        | Monitor cluster events for troubleshooting. |
| 🔧 **kubelet & kube-proxy** | Understand node agents and networking proxies. |
| ⚙️ **kubeadm**       | Tool for bootstrapping Kubernetes clusters. |

---

## 📚 Additional Resources

- [Kubernetes Official Documentation](https://kubernetes.io/docs/)  
- [Certified Kubernetes Administrator (CKA) Curriculum](https://training.linuxfoundation.org/certification/certified-kubernetes-administrator-cka/)  
- [Awesome Kubernetes](https://github.com/ramitsurana/awesome-kubernetes) – curated list of Kubernetes resources  

---

*Happy learning and good luck on your Kubernetes journey!* 🎉🐳🚀

