# Étape 1 — Découverte du système

## Contexte

Linux est organisé comme un arbre de dossiers (répertoires).  
Tout commence à partir de la racine `/`.

---

## Concepts

- `/` → racine du système
- `/home` → dossiers utilisateurs
- `/opt` → applications installées

---

## Commandes importantes

- `pwd` → affiche votre position
- `ls` → liste les fichiers
- `cd` → changer de dossier

---

## Essai

Essayez :

```bash
pwd
ls /
cd /opt
ls

cd /opt/orion-system
ls

## Aide intégrée sous Linux

Sous Linux, chaque commande possède une documentation intégrée.

Deux outils importants :

```bash
man ls
ls --help