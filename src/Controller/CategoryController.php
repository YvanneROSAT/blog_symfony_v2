<?php

namespace App\Controller;

use App\Repository\CategoryRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[Route('/category', name: 'category.')]
class CategoryController extends AbstractController
{
    #[Route('/', name: 'index')]
    public function index(CategoryRepository $CategoryRepository): Response
    {
        $categories  = $CategoryRepository->findAll();
        return $this->render('category/index.html.twig', [
            'categories' => $categories,
        ]);
    }

    #[Route('/{slug}', name: 'posts', requirements: ['slug' => '[a-z0-9\-]+'])]
    public function showListArticleCategory(Request $request, CategoryRepository $categoryRepository): Response
    {
        $slug = $request->get('slug');
        $categories  = $categoryRepository->findOneBy(['slug' => $slug]);
        $categoryId = $categories->getId();
        $listPostsCategory = $categoryRepository->findPostByCategory($categoryId);

        return $this->render('category/posts.html.twig', [
            'listPostsCategory' => $listPostsCategory,
        ]);
    }

    // #[Route('/create', name: 'create')]
    // public function create(CategoryRepository $CategoryRepository, Request $request, EntityManagerInterface $em): Response
    // {
    //     $category  = $CategoryRepository->findAll();
    //     $form = $this->createForm(CategoryType::class, $category);
    //     $form->handleRequest($request);
    //     if ($form->isSubmitted() && $form->isValid()) {
    //         $em->persist($category);
    //         $em->flush();
    //         $this->addFlash('success', 'Category Created Successfully');
    //         return $this->redirectToRoute('admin.category.index');
    //     }
    //     return $this->render('admin/category/create.html.twig');
    // }

    // #[Route('/edit/{id}', name: 'edit')]
    // public function edit(Category $category, Request $request, CategoryRepository $CategoryRepository, EntityManagerInterface $em): Response
    // {
    //     $category  = $CategoryRepository->findAll();
    //     $form = $this->createForm(CategoryType::class, $category);
    //     $form->handleRequest($request);
    //     if ($form->isSubmitted() && $form->isValid()) {
    //         $em->persist($category);
    //         $em->flush();
    //         $this->addFlash('success', 'Category Updated Successfully');
    //         return $this->redirectToRoute('admin.category.index');
    //     }
    //     return $this->render('admin/category/create.html.twig');
    // }

    // #[Route('/delete/{id}', name: 'delete')]
    // public function delete(Category $category, EntityManagerInterface $em): Response
    // {
    //     $em->remove($category);
    //     $em->flush();
    //     $this->addFlash('success', 'Category Deleted Successfully');
    //     return $this->redirectToRoute('admin.category.index');
    // }
}
