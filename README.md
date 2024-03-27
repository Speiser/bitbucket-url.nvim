# bitbucket-url.nvim
Navigate from a file in Neovim to the Bitbucket Server url

### Why?
I hate it when I need to share a file with a colleague and have to search for it on Bitbucket Server to provide them an url.
This plugin fixes this for me. When you call `open_current_in_bitbucket` on a currently opened file, it opens up your browser with the corresponding Bitbucket Server url.

### How?
It gets the current remote origin url `https://<your_bitbucket_host>/scm/<project_key>/<repo_name>.git` of the repository which your current file is located in) and branch.
It then combines the info of your remote origin url, current file path and branch to `https://<your_bitbucket_host>/projects/<project_key>/repos/<repo_name>/browse<file_path>?at=refs/heads/<branch_name>` and opens it in your browser.

### Setup
With [lazy.nvim](https://github.com/folke/lazy.nvim) TODO
