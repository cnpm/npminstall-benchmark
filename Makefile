
all: pnpm-benchmark cnpmjs.org ghost

pnpm-benchmark:
	# see https://github.com/rstacruz/pnpm#benchmark
	@echo "install babel-preset-es2015 browserify chalk debug minimist mkdirp"
	@echo ------- npminstall@`npminstall -v` -------
	@cd pnpm-benchmark && rm -rf node_modules
	@cd pnpm-benchmark && time npminstall
	@echo ------- pnpm@`pnpm -v` -------
	@cd pnpm-benchmark && rm -rf node_modules shrinkwrap.yaml
	@cd pnpm-benchmark && time pnpm i
	@echo ------- pnpm@`pnpm -v` with shrinkwrap.yaml -------
	@cd pnpm-benchmark && rm -rf node_modules
	@cd pnpm-benchmark && time pnpm i
	@echo ------- npm@`npm -v` -------
	@cd pnpm-benchmark && rm -rf node_modules package-lock.json
	@cd pnpm-benchmark && time npm i
	@echo ------- npm@`npm -v` with package-lock.json -------
	@cd pnpm-benchmark && rm -rf node_modules
	@cd pnpm-benchmark && time npm i
	@echo ------- yarn@`yarn -v` -------
	@cd pnpm-benchmark && rm -rf node_modules yarn.lock
	@cd pnpm-benchmark && time yarn
	@echo ------- yarn@`yarn -v` with yarn.lock -------
	@cd pnpm-benchmark && rm -rf node_modules
	@cd pnpm-benchmark && time yarn

cnpmjs.org:
	@echo "install cnpmjs.org dependencies"
	@echo ------- npminstall@`npminstall -v` -------
	@cd cnpmjs.org && rm -rf node_modules ~/.npminstall_tarball
	@cd cnpmjs.org && time npminstall
	@echo ------- npminstall@`npminstall -v` cache -------
	@cd cnpmjs.org && rm -rf node_modules
	@cd cnpmjs.org && time npminstall
	@echo ------- npminstall@`npminstall -v` --no-cache -------
	@cd cnpmjs.org && rm -rf node_modules
	@cd cnpmjs.org && time npminstall --no-cache
	@echo --------- pnpm@`pnpm -v` -----------
	@cd cnpmjs.org && rm -rf node_modules shrinkwrap.yaml
	@cd cnpmjs.org && time pnpm install
	@echo --------- pnpm@`pnpm -v` with shrinkwrap.yaml -----------
	@cd cnpmjs.org && rm -rf node_modules
	@cd cnpmjs.org && time pnpm install
	@echo ---------- npm@`npm -v` -----------
	@cd cnpmjs.org && rm -rf node_modules ~/.npm
	@cd cnpmjs.org && time npm install
	@echo ---- npm@`npm -v` with cache and package-lock.json ------
	@cd cnpmjs.org && rm -rf node_modules
	@cd cnpmjs.org && time npm install
	@echo --------- yarn@`yarn -v` without yarn.lock -----------
	@cd cnpmjs.org && rm -rf node_modules ~/.yarn-cache yarn.lock
	@cd cnpmjs.org && time yarn
	@echo --------- yarn@`yarn -v` cache and with yarn.lock -----------
	@cd cnpmjs.org && rm -rf node_modules
	@cd cnpmjs.org && time yarn

ghost:
	@echo "install ghost dependencies"
	@echo ------- npminstall@`npminstall -v` -------
	@cd ghost && rm -rf node_modules ~/.npminstall_tarball
	@cd ghost && time npminstall
	@echo ------- npminstall@`npminstall -v` with cache -------
	@cd ghost && rm -rf node_modules
	@cd ghost && time npminstall
	@echo ------- npminstall@`npminstall -v` --no-cache -------
	@cd ghost && rm -rf node_modules
	@cd ghost && time ../../bin/install.js --no-cache
	@echo ---------- npm@`npm -v` -----------
	@cd ghost && rm -rf node_modules
	@npm cache clean
	@cd ghost && time npm install
	@echo ---- npm@`npm -v` with cache ------
	@cd ghost && rm -rf node_modules
	@cd ghost && time npm install
	@echo --------- pnpm@`pnpm -v` -----------
	@cd ghost && rm -rf node_modules shrinkwrap.yaml
	@cd ghost && time pnpm install
	@echo --------- yarn@`yarn -v` -----------
	@cd ghost && rm -rf node_modules
	@cd ghost && time yarn

.PHONY: pnpm-benchmark cnpmjs.org ghost
