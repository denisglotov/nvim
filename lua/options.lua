require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"
end

vim.filetype.add {
  extension = {
    vert = "glsl",
    vsh = "glsl",
    vs = "glsl",
    vshader = "glsl",
    frag = "glsl",
    fsh = "glsl",
    fs = "glsl",
    fshader = "glsl",
    geom = "glsl",
    gsh = "glsl",
    gs = "glsl",
    gshader = "glsl",
    comp = "glsl",
    csh = "glsl",
    tesc = "glsl",
    tcsh = "glsl",
    tese = "glsl",
    tesh = "glsl",
    rgen = "glsl",
    rmiss = "glsl",
    rchit = "glsl",
    rahit = "glsl",
    rint = "glsl",
    rcall = "glsl",
    mesh = "glsl",
    task = "glsl",
    glsl = "glsl",
    glslv = "glsl",
    glslf = "glsl",
    glslg = "glsl",
  },
}

