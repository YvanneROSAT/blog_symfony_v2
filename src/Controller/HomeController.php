<?php

namespace App\Controller;

use App\Entity\Post;
use App\Form\PostType;
use App\Repository\PostRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HomeController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function index(PostRepository $postRepository): Response
    {
        $posts = $postRepository->findAll();
        return $this->render('home/index.html.twig', [
            'posts' => $posts,
        ]);
    }

    #[Route('/{slug}-{id}', name: 'show', requirements: ['slug' => '[a-z0-9\-]+', 'id' => '\d+'])]
    public function showArticle(string $slug, int $id, PostRepository $postRepository): Response
    {
        $posts = $postRepository->find($id);
        if (!$posts || $posts->getSlug() !== $slug) {
            return $this->redirectToRoute('show', ['slug' => $posts->getSlug(), 'id' => $posts->getId()], 301);
        }
        return $this->render('category/show.html.twig', [
            'posts' => $posts,
        ]);
    }

    #[Route('edit/{id}', name: 'edit', methods: ['GET', 'POST'])]
    public function edit(Post $post, Request $request, EntityManagerInterface $em): Response
    {
        // create form with post data
        $form = $this->createForm(PostType::class, $post);
        // post form data modify
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            $post->setUpdatedAt(new \DateTimeImmutable());
            $this->addFlash('success', 'L\'article a bien été modifié');
            return $this->redirectToRoute('show', [
                'slug' => $post->getSlug(),
                'id' => $post->getId(),
            ]);
        }
        return $this->render('admin/edit.html.twig', [
            'id' => $post,
            'form' => $form,
        ]);
    }

    // function create
    #[Route('create', name: 'create')]
    public function create(Request $request, EntityManagerInterface $em): Response
    {
        $post = new Post();
        $form = $this->createForm(PostType::class, $post);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($post);
            $em->flush();
            $post->setUpdatedAt(new \DateTimeImmutable());
            $post->setCreatedAt(new \DateTimeImmutable());
            $this->addFlash('success', 'L\'article a bien été créé');
            return $this->redirectToRoute('home');
        }
        return $this->render('admin/create.html.twig', [
            'form' => $form,
        ]);
    }

    #[Route('delete/{id}', name: 'delete', methods: ["DELETE"])]
    public function delete(Post $post, EntityManagerInterface $em): Response
    {
        $em->remove($post);
        $em->flush();
        $this->addFlash('success', 'L\'article a bien été supprimé');
        return $this->redirectToRoute('home');
    }

    // page mentions légales
    #[Route('/mentions-legales', name: 'mentions')]
    public function mentions(): Response
    {
        return $this->render('page/mentionsLegales.html.twig');
    }

    // page conditions générales
    #[Route('/conditions-generales', name: 'conditions')]
    public function conditions(): Response
    {
        return $this->render('page/conditionsGenerales.html.twig');
    }

    private function convertPostsToArray(array $posts): array
    {
        return array_map(function ($post) {
            return [
                'id' => $post->getId(),
                'title' => $post->getTitle(),
                'content' => $post->getContent(),
                'slug' => $post->getSlug(),
                'createdAt' => $post->getCreatedAt()->format('Y-m-d H:i:s'),
                'updatedAt' => $post->getUpdatedAt()->format('Y-m-d H:i:s'),
            ];
        }, $posts);
    }
    // list all articles json
    #[Route('/api/posts', name: 'api_posts')]
    public function listArticlesJson(PostRepository $postRepository): Response
    {
        $posts = $postRepository->findAll();
        $postsArray = $this->convertPostsToArray($posts);
        return $this->render('home/api.html.twig', [
            'posts' => $postsArray,
        ]);
    }
}
