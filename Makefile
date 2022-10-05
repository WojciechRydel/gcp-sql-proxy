PACKAGES=$(shell ls -d */)
SQL_PROXY_BIN=$(HOME)/.local/bin/cloud_sql_proxy

all: $(SQL_PROXY_BIN)
	stow --target=$(HOME) $(PACKAGES)

.PHONY: all

$HOME/.local/bin:
	mkdir -p $@

$(SQL_PROXY_BIN): | $HOME/.local/bin
	wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O $@




