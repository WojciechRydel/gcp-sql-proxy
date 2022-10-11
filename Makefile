HOME_BIN_DIR=$(HOME)/.local/bin
SQL_PROXY_BIN=$(HOME_BIN_DIR)/cloud_sql_proxy


all: $(SQL_PROXY_BIN)
	stow --target=$(HOME) gcp-sql-proxy

.PHONY: all

$(HOME_BIN_DIR):
	mkdir -p $@

$(SQL_PROXY_BIN): | $(HOME_BIN_DIR)
	wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O $@




