{ pkgs, ... }: {
  opts = {
    #  See `:help 'clipboard'`
    clipboard = {
      providers = {
        wl-copy = {
          enable = true;
          package = pkgs.wl-clipboard;
        };
      };

      # Sync clipboard between OS and Neovim
      register = "unnamedplus";
    };
    guifont =
      "FiraCode Nerd Font:h8"; # The font used in graphical neovim applications
    linespace = 3;
    number = true; # Make line numbers default (default: false)
    relativenumber = true; # Set relative numbered lines (default: false)
    wrap = true; # Display lines as one long line (default: true)
    linebreak = true; # Companion to wrap, don't split words (default: false)
    mouse = "a"; # Enable mouse mode (default: '')
    autoindent =
      true; # Copy indent from current line when starting new one (default: true)
    ignorecase =
      true; # Case-insensitive searching UNLESS \C or capital in search (default: false)
    smartcase = true; # Smart case (default: false)
    shiftwidth =
      2; # The number of spaces inserted for each indentation (default: 8)
    tabstop = 2; # Insert n spaces for a tab (default: 8)
    softtabstop =
      2; # Number of spaces that a tab counts for while performing editing operations (default: 0)
    expandtab = true; # Convert tabs to spaces (default: false)
    scrolloff =
      4; # Minimal number of screen lines to keep above and below the cursor (default: 0)
    sidescrolloff =
      8; # Minimal number of screen columns either side of cursor if wrap is `false` (default: 0)
    cursorline = false; # Highlight the current line (default: false)
    splitbelow =
      true; # Force all horizontal splits to go below current window (default: false)
    splitright =
      true; # Force all vertical splits to go to the right of current window (default: false)
    hlsearch = false; # Set highlight on search (default: true)
    showmode =
      false; # We don't need to see things like # INSERT # anymore (default: true)
    termguicolors =
      true; # Set termguicolors to enable highlight groups (default: false)
    whichwrap =
      "bs<>[]hl"; # Which "horizontal" keys are allowed to travel to prev/next line (default: 'b,s')
    numberwidth = 4; # Set number column width to 2 {default 4} (default: 4)
    swapfile = false; # Creates a swapfile (default: true)
    smartindent = true; # Make indenting smarter again (default: false)
    showtabline = 2; # Always show tabs (default: 1)
    backspace =
      "indent,eol,start"; # Allow backspace on (default: 'indent,eol,start')
    pumheight = 10; # Pop up menu height (default: 0)
    conceallevel = 0; # So that `` is visible in markdown files (default: 1)
    signcolumn = "yes"; # Keep signcolumn on by default (default: 'auto')
    fileencoding = "utf-8"; # The encoding written to a file (default: 'utf-8')
    cmdheight =
      1; # More space in the Neovim command line for displaying messages (default: 1)
    breakindent = true; # Enable break indent (default: false)
    updatetime = 250; # Decrease update time (default: 4000)
    timeoutlen =
      300; # Time to wait for a mapped sequence to complete (in milliseconds) (default: 1000)
    backup = false; # Creates a backup file (default: false)
    writebackup =
      false; # If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited (default: true)
    undofile = true; # Save undo history (default: false)
    completeopt =
      "menuone,noselect"; # Set completeopt to have a better completion experience (default: 'menu,preview')
  };
}
