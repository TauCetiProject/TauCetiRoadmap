# Fair-use extract: Rolfsen, Knots and Links: Dehn surgery
**Source.** D. Rolfsen, Knots and Links, Publish or Perish, 1976.
**Locus.** Chapter 9 ("3-Manifolds and Surgery on Links"), §§F–I, printed pp. 257–278 (physical djvu pp. 270–291); framing conventions from §2E ("Solid Tori"), printed pp. 29–32 (physical djvu pp. 42–45). Physical-to-printed offset is +13.
**Supports.** GeometricTopology roadmap, layer 5 (Dehn surgery).
*(Short attributed quotations of the essential statements, surrounding material summarised, for scholarly reference.)*

## Summary

Rolfsen develops Dehn surgery on a link in a 3-manifold by removing disjoint tubular neighbourhoods of the link components and regluing solid tori according to specified simple closed curves (slopes) on each boundary torus. The meridian/longitude framing conventions used to encode slopes as rational surgery coefficients are set up earlier, in §2E on solid tori.

Key framing facts (§2E, pp. 29–32):
- A **solid torus** is a space homeomorphic with S¹ × D². A **framing** of V is a specified homeomorphism h : S¹ × D² → V.
- A **meridian** of V is a simple closed curve in ∂V that is essential in ∂V but homotopically/homologically trivial in V (equivalently bounds a disk in V; equivalently of the form h(1 × ∂D²)). It is intrinsic to V.
- A **longitude** of V is any simple closed curve in ∂V of the form h(S¹ × 1); it involves a choice (infinitely many ambient-isotopy classes).
- For V ⊂ S³, the **preferred framing** is the one (unique up to ambient isotopy) whose longitude h(S¹ × 1) is homologically trivial in the exterior X = closure(S³ − V); equivalently (after §5D) the longitude with linking number zero with the core of V. Rolfsen warns the preferred longitude is not always the visually "obvious" one.

Dehn surgery construction (§9F, pp. 257–258): given a 3-manifold M, a link L = L₁ ∪ … ∪ Lₙ in int M, disjoint closed tubular neighbourhoods Nᵢ, and a specified simple closed curve Jᵢ in each ∂Nᵢ, one removes the open neighbourhoods and reglues the Nᵢ via homeomorphisms hᵢ : ∂Nᵢ → ∂Nᵢ ⊂ M each carrying a meridian νᵢ of Nᵢ onto the specified Jᵢ. The homeomorphism type of the result M′ depends only on the homotopy classes of the Jᵢ (Theorem 2C16), so the surgery instruction is the slope Jᵢ.

Surgery coefficients / slopes (§9G, pp. 258–259): for an oriented link L in R³ or S³, each component Lᵢ has a preferred framing giving a longitude λᵢ and meridian μᵢ with lk(μᵢ, Lᵢ) = +1. The instruction curve is written hₓ(μᵢ) = [Jᵢ] = aᵢλᵢ + bᵢμᵢ, and the **surgery coefficient** is the rational number rᵢ = bᵢ/aᵢ (with rᵢ = ∞ when aᵢ = 0, bᵢ = ±1). Note bᵢ = lk(Lᵢ, Jᵢ). Orientation of S³ is fixed (right-hand rule) so the rᵢ are well-defined.

Surgery on the unknot gives lens spaces (§9G Example 1, p. 260): the trivial knot with coefficient r = b/a yields M³ ≅ L(b, a); in particular S² × S¹ if r = 0 and S³ if r = ±1, ±1/2, ±1/3, …, ∞. (Note the lens-space labelling matches: example 9G2 shows 3/4 surgery on the unknot gives L(3, 4) = L(3, 1).)

Lickorish–Wallace theorem (§9I, "The Fundamental Theorem of Lickorish and Wallace", p. 273): every closed, orientable, connected 3-manifold is surgery on a link in S³, and one may take all coefficients ±1 with unknotted components. The proof given is Lickorish's (1962), via the Lickorish twist theorem (§9I2) and a handlebody lemma (§9I4); Wallace (1960) found an independent proof.

Related results in the chapter: Corollary 9I6 (every closed orientable 3-manifold bounds a simply-connected orientable 4-manifold); Remark 9I7 (Kirby's 1976 result gives the converse, two surgery descriptions yield the same 3-manifold iff equivalent under the two modification moves, establishing the link/3-manifold correspondence); §9J on property P.

## Key statements (quoted)

**Solid torus, framing, meridian, longitude (§2E, printed pp. 29–30):**

> **E.** SOLID TORI. … A solid torus is a space homeomorphic with S¹ ∪ D². [printed: S¹ × D²] … Throughout, V will denote a solid torus; a specified homeomorphism h : S¹ × D² → V is called a framing of V.

> **2.** DEFINITION : A simple closed curve in ∂V satisfying the conditions of the exercise is called a meridian of V . A longitude of V is any simple closed curve in ∂V of the form h(S¹×1) , for some framing h of V .

The "conditions of the exercise" (§2E1, p. 29) characterizing a meridian, for J an essential simple closed curve in ∂V:

> (a)  J is homologically trivial in V ,
> (b)  J is homotopically trivial in V ,
> (c)  J bounds a disk in V ,
> (d)  for some framing h : S¹ × D² → V , J = h(1×∂D²) .

**Preferred framing (§2E7–8, printed p. 31):**

> **7.** EXERCISE : Up to ambient isotopy of V , there is a unique longitude which is homologically trivial in X . Moreover, there is a framing (also unique up to ambient isotopy) h : S¹ × D² → V such that h(S¹×1) is homologically trivial in X .

> **8.** DEFINITION : The framing specified in the above exercise is called a preferred framing of a solid torus in S³ .

(Here X = closure(S³ − V); §2E11, p. 32, adds that the preferred longitude "is characterized by having linking number zero with the core of V .")

**The Dehn surgery construction (§9F, printed pp. 257–258):**

> **F.** SURGERY ON 3-MANIFOLDS. We wish now to generalize the construction that has already been encountered in example D3 and sections 6C,D and 7C.
>           Suppose the following data are given:
> (a)  a 3-manifold M , perhaps with boundary,
> (b)  a link L = L₁ ∪ … ∪ Lₙ of simple closed curves in the interior M̊ of M ,
> (c)  disjoint closed tubular neighbourhoods Nᵢ of the Lᵢ in M̊ ,
> (d)  a specified simple closed curve Jᵢ in each ∂Nᵢ .
> We may then construct the 3-manifold
>
>     M′ = (M − (N̊₁ ∪ … ∪ N̊ₙ)) ∪ₕ (N₁ ∪ … ∪ Nₙ) ,
>
> where h is a union of homeomorphisms hᵢ : ∂Nᵢ → ∂Nᵢ ⊂ M , each of which take a meridian curve νᵢ of Nᵢ onto the specified Jᵢ .

> **2.** DEFINITION : The 3-manifold M′ is said to be the result of a Dehn surgery on M along the link L with surgery instructions (c) and (d) .

(§9F adds, p. 258: "By Theorem 2C16, we need only specify the homotopy class of the Jᵢ in ∂Nᵢ … The most important special case will be M = S³ or R³ , and in this setting the surgery instructions can be expressed simply by assigning a rational number rᵢ (possibly = ∞) to each component Lᵢ of the link …")

**Surgery coefficient / slope (§9G, printed pp. 258–259):**

> **G.** SURGERY INSTRUCTIONS IN R³ (OR S³) . Each component Lᵢ of an oriented link L in R³ has a preferred framing (see 2E8 ) for a tubular neighbourhood Nᵢ in which the longitude λᵢ is oriented in the same way as Lᵢ and the meridian μᵢ has linking number = +1 with Lᵢ . Then we may write the curve Jᵢ in terms of this basis:
>
>     hₓ(μᵢ) = [Jᵢ] = aᵢλᵢ + bᵢμᵢ
>
> with ambiguity of a ± sign depending on how one wishes to orient J . Notice that bᵢ = lk(Lᵢ,Jᵢ) . The ambiguity disappears if we take the ratio
>
>     rᵢ = bᵢ/aᵢ
>
> We'll call rᵢ the surgery coefficient associated with the component Lᵢ . If aᵢ = 0 , then bᵢ = ±1 and we write rᵢ = ∞ .

**Surgery on the unknot gives lens spaces (§9G Example 1, printed p. 260):**

> **1.** EXAMPLE : Take L = the trivial knot. Then the surgery coefficient r = b/a determines the surgery manifold M³ ≅ L(b,a) , a lens space.
>     In particular   M ≅ S² × S¹  if  r = 0
>                     M ≅ S³  if  r = ±1 , ±1/2 , ±1/3 , … , ∞ .

**The Lickorish–Wallace fundamental theorem (§9I1, printed p. 273):**

> **I.** THE FUNDAMENTAL THEOREM. We'll complete this chapter with a proof of what I call the fundamental theorem of surgery on 3-manifolds.

> **1.** THEOREM : Every closed, orientable, connected 3-manifold may be obtained by surgery on a link in S³ . Moreover, one may always find such a surgery presentation in which the surgery coefficients are all ±1 and the individual components of the link are unknotted.

(Following remark, p. 273: "The proof given here is due to Lickorish [1962]; another quite different proof was discovered independently by Wallace [1960].")

**The Lickorish twist theorem (§9I2, printed p. 273), used in the proof:**

> **2.** THE LICKORISH TWIST THEOREM : Let M² be a closed orientable 2-manifold of genus g . Then every orientation-preserving homeomorphism of M is isotopic to a product of twist homeomorphisms along the 3g − 1 curves pictured.

**Corollary (§9I6, printed p. 277):**

> **6.** COROLLARY : Every closed orientable 3-manifold is the boundary of some orientable 4-manifold, in fact a simply-connected one.

## Notes

- OCR/transcription corrections: In §2E the printed text renders the solid-torus definition as "S¹ ∪ D²"; the rendered page and context make clear this is "S¹ × D²" (product), which I have flagged inline. The framing map is correctly printed as h : S¹ × D² → V.
- The reference "2E8" inside §9G points to the preferred-framing material in §2E; the actual definitions of preferred framing are §2E7 (exercise) and §2E8 (definition) on printed p. 31. (Exercise 8 of §2F, on printed p. 37, is unrelated, it concerns tubular neighbourhoods of manifolds with boundary.)
- The surgery construction (§9F) is stated for a general 3-manifold M; the rational-coefficient encoding via meridian/longitude (the slope rᵢ = bᵢ/aᵢ) is specific to M = S³ or R³ (§9G), where the preferred framing exists.
- Slope convention: the instruction curve satisfies [Jᵢ] = aᵢλᵢ + bᵢμᵢ, so the coefficient rᵢ = bᵢ/aᵢ is (meridian-coefficient)/(longitude-coefficient). This is the inverse of some other authors' "p/q where the slope is pμ + qλ" conventions; verify orientation/basis when porting to Lean. Rolfsen fixes the orientation of S³ by the right-hand rule for linking number (§5D).
- Lens space labelling: Rolfsen's L(b, a) from r = b/a on the unknot matches L(3,4) = L(3,1) in his Example 9G2 (p. 260). His L(p, q) convention should be checked against the roadmap's chosen convention.
- The converse to the surgery correspondence (Kirby's 1976 calculus result) is noted in Remark 9I7 (p. 278) but not proved here; see the Kirby-calculus reference (gs-kirby-calculus.md) in this directory.
- Property P material (§9J, pp. 280–282) is adjacent and may support later layers: Definition 9J1 (property P) and Theorem 9J8 (any composite of nontrivial tame knots has property P).
