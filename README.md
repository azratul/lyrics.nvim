# Neovim Plugin for request lyrics into your vim buffer


lyrics.nvim is a plugin for loading lyrics into your vim buffer.

> Plenary plugin installed  is mandatory

# Settings

You need to add this lines into your vimrc or config file:
An example from lyrics.ovh:


```
    require("lyrics").setup({
      url = "https://api.lyrics.ovh/v1/",
    })
```


# How to use

Load the lyrics from the API

Lyrics [artist]:[song]
E.g.:


```
:Lyrics moonspell:alma mater
```


# Documentation

Access the documentation inside vim:


```
:h LyricsHelp
```
