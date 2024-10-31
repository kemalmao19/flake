{
  keymaps = [
    {
      mode = "n";
      key = "<Space>";
      action = "<Nop>";
      options = { silent = true; };
    }

    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd> w <CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>sn";
      action = "<cmd>noautocmd w <CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<C-q>";
      action = "<cmd> q <CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "x";
      action = ''"_x'';
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<Up>";
      action = ":resize -2<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<Down>";
      action = ":resize +2<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<Left>";
      action = ":vertical resize -2<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<Right>";
      action = ":vertical resize +2<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<Tab>";
      action = ":bnext<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<S-Tab>";
      action = ":bprevious<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>x";
      action = ":bdelete!<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>b";
      action = "<cmd> enew <CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>v";
      action = "<C-w>v";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>h";
      action = "<C-w>s";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>se";
      action = "<C-w>=";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>xs";
      action = ":close<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<C-k>";
      action = ":wincmd k<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<C-j>";
      action = ":wincmd j<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<C-h>";
      action = ":wincmd h<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<C-l>";
      action = ":wincmd l<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>to";
      action = ":tabnew<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>tx";
      action = ":tabclose<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>tn";
      action = ":tabn<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>tp";
      action = ":tabp<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>lw";
      action = "<cmd>set wrap!<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>n";
      action = "<cmd>:NvimTreeToggle<CR>";
      options = { desc = "NTree Toggle"; };
    }
  ];
}
