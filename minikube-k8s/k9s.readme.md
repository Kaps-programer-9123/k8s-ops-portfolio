
# 🐶 K9s - Kubernetes CLI Manager

K9s is a **terminal-based UI** to interact with your Kubernetes clusters. It provides a fast, minimal, and powerful way to manage and observe your workloads without leaving your terminal.

---

## 🚀 What is K9s?

[K9s](https://k9scli.io) is an open-source terminal user interface that helps you **navigate, observe, and manage** your Kubernetes clusters. It allows DevOps engineers, developers, and cluster admins to:

- View real-time status of pods, deployments, services, and more
- Interact with resources (edit, delete, scale, etc.)
- Monitor logs and metrics
- Perform actions without using long `kubectl` commands

📦 It's like `kubectl`, but with superpowers — **TUI (Text User Interface)** style.

---

## 🌟 Why Use K9s?

- 🧭 Navigate your cluster faster than typing `kubectl` over and over
- 🐛 Troubleshoot issues with real-time logs and metrics
- ✨ Minimal setup — just download and run
- 🧠 Learn Kubernetes by seeing it in action
- ⚡ Speed up daily tasks for ops and developers

---

## 📦 Installation

Official install guide: [https://k9scli.io/topics/install/](https://k9scli.io/topics/install/)

### macOS (via Homebrew)
```bash
brew install derailed/k9s/k9s
````

### Linux

```bash
curl -sS https://webinstall.dev/k9s | bash
```

Or download binaries directly from the [releases page](https://github.com/derailed/k9s/releases).

### Windows

Download from the [GitHub Releases](https://github.com/derailed/k9s/releases) and add to your PATH.

---

## 📘 Basic Usage

Once installed, simply run:

```bash
k9s
```

K9s will use your current `kubectl` context and config.

### Switch context

```bash
:ctx
```

### Change namespace

```bash
:ns
```

---

## 🧩 Common K9s Commands

| Command    | Description                                   |
| ---------- | --------------------------------------------- |
| `k9s`      | Start the K9s UI using the current kubeconfig |
| `:q`       | Quit K9s                                      |
| `:`        | Enter command/search/filter mode              |
| `:ctx`     | Switch Kubernetes context                     |
| `:ns`      | Change namespace                              |
| `gg` / `G` | Go to top / bottom of list                    |
| `/`        | Filter resource list                          |
| `d`        | Delete selected resource                      |
| `e`        | Edit selected resource using default editor   |
| `l`        | View logs of selected pod                     |
| `s`        | View shell into selected pod                  |
| `Ctrl-a`   | View all resources                            |
| `Ctrl-f`   | View all port-forwards                        |
| `?`        | Help screen                                   |
| `Shift-S`  | Save current resource view layout             |

---

## 🧠 Tips & Tricks

* Use `:` to type commands like `:po` (pods), `:dp` (deployments), `:svc` (services)
* Hit `/` to filter any list by name or label
* Use arrow keys, `j/k` to navigate up/down
* You can use multiple kubeconfigs via `KUBECONFIG=...` environment variable

---

## 🛠️ Customization

K9s stores configuration in:

```bash
~/.k9s
```

You can customize themes, plugins, and views. See [Configuration Docs](https://k9scli.io/topics/config/)

---

## 📷 Screenshots

![K9s UI](https://raw.githubusercontent.com/derailed/k9s/master/assets/k9s.gif)

More screenshots: [https://k9scli.io/screens/](https://k9scli.io/screens/)

---

## 📚 Learn More

* 📖 Docs: [https://k9scli.io/](https://k9scli.io/)
* 🐙 GitHub: [https://github.com/derailed/k9s](https://github.com/derailed/k9s)
* ❓ FAQ: [https://k9scli.io/topics/faq/](https://k9scli.io/topics/faq/)
* 🧪 Plugins: [https://k9scli.io/topics/plugins/](https://k9scli.io/topics/plugins/)

---

## 🤝 Contributing

Want to help improve K9s? Check out the [Contributing Guide](https://github.com/derailed/k9s/blob/master/CONTRIBUTING.md).

---

## 📝 License

K9s is licensed under the [Apache 2.0 License](https://github.com/derailed/k9s/blob/master/LICENSE).

---

## 🐾 Final Thoughts

K9s is like having a **Kubernetes sidekick in your terminal** — once you start using it, you'll wonder how you lived without it. 🎯

Happy learning! 🚀