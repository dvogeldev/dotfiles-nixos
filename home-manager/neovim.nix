# User configuration for neovim

{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    extraConfig = ''
      "-------------------- Mappings
      " Mouse can be used in all modes
      set mouse=a

      " Mappings are recursive, so they will keep evaluating until they hit a dead end (a non-recursive mapping or the last mapping)
      set remap

      " Define extra key combinations with a map leader. For example, to save the current file, define: map <leader>w
      let mapleader=","

      " Left and right movements will go to the previous or next line when at start or end of line
      set whichwrap+=<,>,h,l

      "---------- Insert Mode
      " Non-recursive mapping for Shift+Tab to unindent
      inoremap <S-Tab> <C-D>

      "---------- Normal Mode
      " Non-recursive mapping for Space to open/close folds
      nnoremap <Space> za

      " Non-recursive mappings for Ctrl + J and Ctrl + K to move the current line(s)
      nnoremap <C-j> :m .+1<CR>==
      nnoremap <C-k> :m .-2<CR>==

      "---------- Visual and Select Modes
      " Non-recursive mappings for Ctrl + J and Ctrl + K to move selected line(s)
      vnoremap <C-j> :m '>+1<CR>gv=gv
      vnoremap <C-k> :m '<-2<CR>gv=gv

      "---------- Normal, Visual and Operator Pending Modes
      " Non-recursive mappings for n to always search forward and N to always search backward (for / and ?)
      noremap <expr> n  'Nn'[v:searchforward]
      noremap <expr> N  'nN'[v:searchforward]

      " Non-recursive mappings to move around long wrapped lines
      noremap j gj
      noremap k gk

      " Non-recursive mapping for leader + Enter to disable text highlighting
      noremap <silent> <leader><CR> :noh<CR>

      "-------------------- Command Mode
      " Non-recursive abbreviations for common typos when saving/quiting
      cnoreabbrev W! w!
      cnoreabbrev W w
      cnoreabbrev Q! q!
      cnoreabbrev Q q
      cnoreabbrev Wq wq
      cnoreabbrev wQ wq
      cnoreabbrev WQ wq

      " When forgetting to sudo before editing a file which requires root privileges, use w!! instead of w! to save changes
      cmap w!! w !sudo tee % >/dev/null

      "-------------------- UI Settings
      " Set the title of the terminal to the file name (up to maximum 70 characters)
      set title
      set titlestring=neovim:\ %F titlelen=70

      " Format the status line
      set statusline=\ FILE:\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

      " Highlight the column and line where the cursor is currently
      set cursorcolumn
      set cursorline

      " Show the line number where the cursor is located
      set number

      " Height (in number of lines) of the command bar at the bottom
      set cmdheight=2

      " Show matching brackets when text indicator is over them
      set showmatch

      " How many tenths of a second to blink when matching brackets
      set mat=2

      " Minimal number of screen lines to keep above and below the cursor when moving vertically (if possible...)
      set scrolloff=10

      " Display tabs and trailing spaces as ·
      set list listchars=tab:\>·,trail:·

      " Disable word wrapping
      set nowrap

      " Visually line break on lines of 500 characters (without actually inserting line break)
      set linebreak
      set tw=500

      " Don't redraw while executing macros, registers and other commands
      set lazyredraw

      "-------------------- Search Settings
      " Ignore case when searching
      set ignorecase

      "-------------------- Space, Tabs & Indentation
      " An indent is automatically inserted:
      "- After a line ending in '{'.
      "- After a line starting with a keyword from this list: if, else, while, do, for, switch
      "- Before a line starting with '}' (only with the 'O' command).
      set smartindent

      "-------------------- History, Backup & System
      " Hide buffers, instead of closing them.
      " Having unwritten changes in a file and opening a new file using :e, won't force saving or undoing changes first.
      " Undo buffers and marks are preserved while the buffer is open
      set hidden

      " Link to the system clipboard
      set clipboard^=unnamedplus

      " Use Unix as the standard file format
      set fileformats=unix,dos,mac

      " Disable backup
      set nobackup
      set nowritebackup

      " Disable swap file
      set noswapfile

      "-------------------- Wildmenu
      " Ignore case
      set wildignorecase

      " Ignore these files
      set wildignore+=*~,.git\*,.hg\*,.svn\*

      " List all matches without completing
      set wildmode=longest,list,full

      "-------------------- Autocommands
      " Remove all trailing whitespaces right before saving
      autocmd BufWritePre * :%s/\s\+$//e

      autocmd BufNewFile,BufReadPost *.md call SetMarkdownOptions()
      function SetMarkdownOptions()
          " Force Markdown type for all files with the .md extension (from tpope/vim-markdown)
          set filetype=markdown
          " Wrap lines at 80 characters
          setlocal textwidth=80
      endfunction

      " Move the quickfix window at the very bottom, no matter what
      " See ':help :wincmd' and ':help ^WJ' for more info
      autocmd FileType qf wincmd J

      "-------------------- Plugins Settings
      "---------- fzf-vim
      " Non-recursive mapping in Normal and Visual modes for Ctrl+p to start fzf for files
      nnoremap <C-p> :Files<CR>
      vnoremap <C-p> :Files<CR>
      " Non-recursive mapping in Normal and Visual modes for Ctrl+n to start fzf for buffers
      nnoremap <C-n> :Buffers<CR>
      vnoremap <C-n> :Buffers<CR>
      "---------- vim-colors-solarized
      " Use light version of colorscheme
      set background=light

      " Set solarized colorscheme if it's installed (otherwise it fails silently)
      silent! colorscheme solarized

      "---------- tagbar
      " Open tagbar automatically for supported filetypes whenever opening a file
      autocmd FileType * nested :call tagbar#autoopen(0)
    '';

    # Available plugins: https://github.com/NixOS/nixpkgs/blob/master/pkgs/misc/vim-plugins/vim-plugin-names
    plugins = with pkgs.vimPlugins; [
      #---------- Efficiency Plugins
      # Remaps . in a way that plugins can tap into it
      vim-repeat

      # Comment stuff out
      vim-commentary

      # Try to automatically adjust 'shiftwidth' and 'expandtab' based on the current file or its parents
      vim-sleuth

      # Lightning fast left-right movement
      quick-scope

      # Use fzf inside vim to open files and much more
      fzf-vim
      fzfWrapper

      # Change Vim working directory to project root (defined by the presence of a .git directory or anything else, it's configurable)
      vim-rooter

      # Browse the tags of the current file and get an overview of its structure
      tagbar

      #---------- Colorscheme Plugins
      # Solarized light and dark colorscheme
      vim-colors-solarized

      #---------- Language Plugins
      # A collection of language plugins (150+ languages)
      vim-polyglot
    ];

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}