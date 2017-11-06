<?php
/**
 * Plugin Name: Ministry of Justice
 * Plugin URI: https://github.com/evomase/moj
 * Description: Base plugin for the site
 * Version: 0.0.9b
 * Author: David Ogilo
 * Author URI: http://www.davidogilo.co.uk
 * License: MIT
 */

add_action('init', function () {
    register_post_type('event', array(
        'labels'      => array('name' => __('Events'), 'singular_name' => __('Event')),
        'public'      => true,
        'rewrite'     => array('slug' => 'events', 'feeds' => true, 'with_front' => false),
        'taxonomies'  => array('post_tag'),
        'has_archive' => true,
        'supports'    => array('comments', 'title', 'editor')
    ));

    register_post_type('blog_post', array(
        'labels'      => array('name' => __('Blog Posts'), 'singular_name' => __('Blog Post')),
        'public'      => true,
        'rewrite'     => array('slug' => 'blog-posts', 'feeds' => true, 'with_front' => false),
        'taxonomies'  => array('post_tag'),
        'has_archive' => true,
        'supports'    => array('comments', 'title', 'editor')
    ));

    register_post_type('news-post', array(
        'labels'      => array('name' => __('News Posts'), 'singular_name' => __('News Post')),
        'public'      => true,
        'rewrite'     => array('slug' => 'news-posts', 'feeds' => true, 'with_front' => false),
        'taxonomies'  => array('post_tag'),
        'has_archive' => true,
        'supports'    => array('comments', 'title', 'editor')
    ));
});