# bitbucket-url.nvim
**Navigate from a file in neovim to the Bitbucket Server URL**

Tired of manually searching for Bitbucket Server URLs to share with colleagues? This plugin solves this. When you call `open_current_in_bitbucket` on an open file, it opens the corresponding Bitbucket Server URL in your browser.

**How It Works**:
1. Retrieves the current remote origin URL (`https://<your_bitbucket_host>/scm/<project_key>/<repo_name>.git`) for the repository where your file is.
2. Combines the origin URL, file path, and branch to create the complete Bitbucket URL: `https://<your_bitbucket_host>/projects/<project_key>/repos/<repo_name>/browse<file_path>?at=refs/heads/<branch_name>`.

**Setup Example (using [lazy.nvim](https://github.com/folke/lazy.nvim))**:
```lua
{
    "Speiser/bitbucket-url.nvim",
    config = function()
        local bitbucket = require("bitbucket-url")
        vim.keymap.set("n", "<leader>bb", bitbucket.open_current_in_bitbucket, {})
    end,
}
```
