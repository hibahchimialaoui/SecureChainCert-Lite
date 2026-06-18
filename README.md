# SecureChainCert Lite

**SecureChainCert Lite** est une application décentralisée (dApp) de gestion et de vérification d'authentification des diplômes académiques. Développé dans un cadre d'étude en **Cybersécurité et Web3**, ce projet vise à éliminer la fraude documentaire et à automatiser l'audit des certifications sans dépendre d'une infrastructure serveur centralisée vulnérable.

L'application exploite l'immuabilité de la **Blockchain Sepolia (Ethereum Testnet)** et la puissance du hachage cryptographique local pour garantir l'intégrité absolue des données.

---

## Fonctionnalités Clés

* **Hachage Cryptographique Client-Side :** Les données du diplôme (Nom, Filière, Année) sont concaténées et hachées localement en **SHA-256** via `CryptoJS` avant toute transmission. Aucune donnée nominative n'est stockée en clair sur la blockchain, respectant ainsi la confidentialité.
* **Contrôle d'Accès Strict (`onlyAdmin`) :** Le Smart Contract Solidity intègre une barrière de sécurité interdisant l'écriture dans le registre à toute entité autre que l'adresse officielle de l'École (Account 1).
* **Détection d'Intrusion en Temps Réel :** Le frontend écoute dynamiquement l'extension `MetaMask` (`accountsChanged`). Si un attaquant (Account 2/Pirate) tente de forcer une émission, l'interface intercepte l'action et déclenche une alerte de sécurité.
* **Audit Public Instantané et Gratuit :** Les recruteurs peuvent interroger le Smart Contract en temps constant $O(1)$ pour vérifier l'existence d'une empreinte numérique. Cette opération de lecture (`view`) est entièrement gratuite et ne consomme aucun gaz.

---

## 🛠️ Architecture Technique & Outils

Le projet est structuré selon une approche modulaire unitaire :
1. **Smart Contract :** Développé en `Solidity ^0.8.20` et compilé/déployé via **Remix IDE** sur le réseau **Sepolia**.
2. **Gestion de l'Identité & Consensus :** Fournie par **MetaMask** pour la signature cryptographique des transactions et la gestion des paires de clés privées. Le réseau Sepolia s'appuie sur le consensus **Proof of Stake (PoS)**.
3. **Moteur d'Intrusion & Intégration :** Développé en JavaScript natif à l'aide de la bibliothèque **Ethers.js (v6)** pour orchestrer la communication Web3 (fournisseur injecté).
4. **Interface Utilisateur :** Conçue en HTML5 avec un design "Business Dark" via **Tailwind CSS**.

---

## Structure du Répertoire

* `SecureChainCert.sol` : Le code source Solidity du contrat intelligent (Logique métier et sécurité EVM).
* `index.html` : L'interface utilisateur dynamique (Dashboard d'émission et d'audit public).
* `app.js` : Le moteur JavaScript (Gestion MetaMask, appels RPC Ethers.js, et hachage CryptoJS).

---

## Installation et Déploiement Local

### Prérequis
* Un navigateur web avec l'extension **MetaMask** installée.
* Des jetons **SepoliaETH** (récupérables gratuitement sur un Faucet Web3).

### Lancement
1. Clonez ce dépôt ou téléchargez les fichiers sources.
2. Ouvrez le fichier `SecureChainCert.sol` sur [Remix IDE](https://remix.ethereum.org), compilez-le et déployez-le sur le réseau de test **Sepolia** en utilisant l'environnement *Injected Provider*.
3. Copiez l'adresse du contrat générée par Remix et collez-la dans la variable `CONTRACT_ADDRESS` tout en haut du fichier `app.js`.
4. Lancez simplement le fichier `index.html` dans votre navigateur (via un serveur local ou double-clic).

---

## 🔮 Perspectives d'Évolution

* **Intégration de QR Codes :** Génération d'un QR Code unique sur les versions imprimées pour un audit mobile instantané.
* **Stockage Décentralisé IPFS :** Migration vers InterPlanetary File System pour l'hébergement décentralisé et sécurisé des documents PDF originaux.
* **Application Mobile Dédiée :** Développement d'une interface portable optimisée pour les recruteurs et les entreprises partenaires.
