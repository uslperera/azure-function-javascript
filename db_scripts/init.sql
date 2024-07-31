-- public.blog definition

-- Drop table

-- DROP TABLE public.blog;

CREATE TABLE public.blogs (
	blog_id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	url varchar NULL,
	CONSTRAINT blog_unique UNIQUE (blog_id)
);


-- public.post definition

-- Drop table

-- DROP TABLE public.post;

CREATE TABLE public.posts (
	post_id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	title varchar NULL,
	"content" varchar NULL,
	blog_id int4 NULL
);


-- public.post foreign keys

ALTER TABLE public.posts ADD CONSTRAINT post_blog_fk FOREIGN KEY (blog_id) REFERENCES public.blogs(blog_id);

INSERT INTO public.blogs
(url)
VALUES('https://myblog.com');