FVM := "C:\Users\ebobola\AppData\Local\Pub\Cache\bin\fvm.bat"

FLUTTER := $(FVM) flutter

.PHONY: get clean pub-upgrade doctor

get:
	$(FLUTTER) pub get

clean:
	$(FLUTTER) clean

pub-upgrade:
	$(FLUTTER) pub upgrade

doctor:
	$(FLUTTER) doctor -v

# Build Runner
.PHONY: build_runner watch_runner clean_runner

build_runner:
	$(FVM) dart run build_runner build --delete-conflicting-outputs

watch_runner:
	$(FVM) dart run build_runner watch --delete-conflicting-outputs

clean_runner:
	$(FVM) dart run build_runner clean

# Pub commands
.PHONY: add remove outdated

add:
	@echo "Usage: make add name=package[:version]"
	@[ -n "$(name)" ] && $(FLUTTER) pub add $(name)

remove:
	@echo "Usage: make remove name=package"
	@[ -n "$(name)" ] && $(FLUTTER) pub remove $(name)

outdated:
	$(FLUTTER) pub outdated

# Build
.PHONY: build-apk build-ios build-web

build-apk:
	$(FLUTTER) build apk --release

build-ios:
	$(FLUTTER) build ios --release
