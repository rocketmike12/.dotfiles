vim.cmd("command Pr Prettier")
vim.cmd('command JsxSE %s/\\(className\\)="\\([^"]*\\)"/\\1={styles["\\2"]}/g')
