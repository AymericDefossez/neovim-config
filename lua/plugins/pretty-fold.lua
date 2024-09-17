return {
  'anuvyklack/pretty-fold.nvim',
  name = 'pretty-fold',
  config = function()
    require('pretty-fold').setup({
      sections = {
        left = {
          'content',
        },
        right = {
          ' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
          function(config) return config.fill_char:rep(3) end
        }
      },
      fill_char = '─',
      remove_fold_markers = true,
      keep_indentation = true,
      process_comment_signs = 'spaces',
      comment_signs = {},
      add_close_patterns = true,
      matchup_patterns = {
        { '^%s*do$', 'end' },
        { '^%s*if', 'end' },
        { '^%s*for', 'end' },
        { 'function%s*%(', 'end' },
        { '{', '}' },
        { '%(', ')' },
        { '%[', ']' },
      },
      ft_ignore = { 'neorg' },
    })
  end
}
