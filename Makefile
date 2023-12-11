FILE 			= your_file.py
SCENES			= YourScene
DOCKER_IMAGE	= manim_v

OPTIONS_LOW		= --quality l
OPTIONS_HIGH	= --quality h

define MANIM
manim $(1) $(FILE) $(SCENES)
endef

define DOCKER_MANIM
docker run --rm -it -v $(CURDIR):/manim $(DOCKER_IMAGE) $(call MANIM, $(1))
endef


dry_run:
	$(call DOCKER_MANIM, --dry_run)

quality_low:
	$(call DOCKER_MANIM, $(OPTIONS_LOW))

quality_high:
	$(call DOCKER_MANIM, $(OPTIONS_HIGH))

clean:
	rm -r $(CURDIR)/media

docker_image:
	docker build -t $(DOCKER_IMAGE) .

.PHONY: clean
