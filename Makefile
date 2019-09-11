.PHONY: github html clean serve poster

html:
	@cd site && hugo
	@touch site/public/.nojekyll

serve:
	@cd site && hugo --i18n-warnings server -D

clean:
	@rm -rf site/public

github: | clean html
	./push_dir_to_repo.py \
	  --branch gh-pages \
	  --email web@xd-con.org \
	  --committer "xd-web" \
	  --message "Update website" \
	  --force \
	     ./site/public git@github.com:xd-con/imagexd-2019

poster:
	cp poster/poster-header.md poster/poster.md
	python ./tools/schedule_to_md.py >> poster/poster.md
	pandoc poster/poster.md --pdf-engine=xelatex -H poster/preamble.tex -o poster/poster.pdf
