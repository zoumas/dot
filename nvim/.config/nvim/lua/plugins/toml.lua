-- turn a SchemaStore fileMatch glob into the URI regex taplo expects
local function glob_to_regex(glob)
  local re = glob:gsub("[%^%$%(%)%+%.%[%]%{%}|\\]", "\\%0") -- regex metachars, except glob's * and ?
  re = re:gsub("%*%*/", "\1"):gsub("%*", "[^/]*"):gsub("%?", "[^/]"):gsub("\1", "(.*/)?")
  return ".*/" .. re .. "$"
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "b0o/SchemaStore.nvim" },
    opts = {
      servers = {
        taplo = {
          -- taplo 0.10 fails to parse the current SchemaStore catalog ("data did
          -- not match any variant of untagged enum SchemaCatalog"), so no schema
          -- ever gets associated. Skip the catalog and feed taplo the TOML
          -- entries from SchemaStore.nvim (pyproject.toml, ruff.toml, ...)
          -- as explicit associations instead.
          settings = {
            evenBetterToml = {
              schema = { enabled = true, catalogs = {}, associations = {} },
            },
          },
          -- mutate in place: the client keeps a reference to this settings table
          before_init = function(_, config)
            local associations = config.settings.evenBetterToml.schema.associations
            for _, schema in ipairs(require("schemastore").json.schemas()) do
              for _, match in ipairs(schema.fileMatch or {}) do
                if match:match("%.toml$") then
                  associations[glob_to_regex(match)] = schema.url
                end
              end
            end
          end,
        },
      },
    },
  },
}
