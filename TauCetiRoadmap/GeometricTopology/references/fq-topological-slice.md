# Fair-use extract: Freedman–Quinn, Topology of 4-Manifolds: topological sliceness
**Source.** M. Freedman, F. Quinn, Topology of 4-Manifolds, Princeton Math. Series 39, 1990.
**Locus.** Disk Embedding Theorem 5.1A (printed p. 85, djvu p. 91); structure Proposition 11.6C (printed pp. 207–208, djvu pp. 213–214); knot-unknotting Theorem 11.7A (printed pp. 209–210, djvu pp. 215–216); Z-slice Theorem 11.7B (printed pp. 210–211, djvu pp. 216–217); slice-links remark §12.3D (printed p. 243, djvu p. 249).
**Supports.** GeometricTopology roadmap, layers 4 and 6 (topological sliceness, [Kir97, 1.36]).
*(Short attributed quotations of the essential statements, surrounding material summarised, for scholarly reference.)*

Printed-to-physical offset: printed page + 6 = djvu physical page (calibrated: printed "4" = djvu p. 10; printed "209" = djvu p. 215). Statements transcribed verbatim from the rendered pages, with the book's own Unicode-equivalent notation. Where OCR could not be cross-checked against a render, this is flagged.

## Summary

The book's central technical achievement is an embedding theorem for locally flat topological 2-disks in 4-manifolds with restricted (poly-(finite or cyclic)) fundamental group; the formal statement is the Disk Embedding Theorem 5.1A in Chapter 5. The classical sliceness consequence is developed in Chapter 11 ("Surgery"), §11.7 "Knots and links." There Freedman and Quinn define an embedding of S¹ in a homology 3-sphere to be "Z-slice" when it bounds a locally flat disk in the contractible 4-manifold bounding the sphere, with fundamental-group-Z complement, and prove (Theorem 11.7B) that a knot in a homology 3-sphere is Z-slice iff the natural homomorphism π₁(complement) → Z has perfect kernel, equivalently iff the knot's Alexander polynomial is 1 (the equivalence of perfect kernel with Alexander polynomial 1 being attributed to Crowell [1]). The proof rests on the surgery/Poincaré-structure Proposition 11.6C (recognition/existence/uniqueness of Poincaré pairs (X,Y) with X a homotopy 1-complex), which in turn rests on the topological machinery flowing from the disk embedding theorem. The corresponding statement for the multi-component case, "Good boundary links with one component (ie. knots with Alexander polynomial 1) are slice," is restated in §12.3D. The companion Theorem 11.7A characterizes unknotted locally flat 2-spheres in S⁴.

This is the precise locus of the famous Freedman corollary that Alexander-polynomial-one knots are topologically slice: Theorem 11.7B (printed pp. 210–211), supported by §12.3D (printed p. 243).

## Key statements (quoted)

### Disk Embedding Theorem 5.1A, locally flat disks (printed p. 85, djvu p. 91)

> **5.1A Theorem.** *Suppose A → M⁴ is an immersion of a union of disks, with algebraically transverse spheres whose algebraic intersections and selfintersection numbers are 0 in Z[π₁M]. If π₁M is poly-(finite or cyclic) then there is a topologically embedded union of disks with the same framed boundary as A, and with transverse spheres.*

Chapter 5 opening (p. 85, quoted): "The keys to the study of 4-manifolds are embedding theorems for 2-disks ... In all cases the goal is to find a collection of disjointly embedded disks." The chapter notes the results depend on immersion lemma 1.2 (so are valid unconditionally for PL/smooth embeddings; the topological case is reduced in Chapter 9 to the smooth/PL embedding theorems). The hypotheses are then spelled out: the algebraic transverse sphere hypothesis is equivalent (by 1.9) to existence of elements αⱼ ∈ π₂M with λ(Aᵢ,αⱼ) = 0 for i ≠ j and = 1 for i = j, λ(αᵢ,αⱼ) = 0, and μ(αⱼ) = 0.

### Structure Proposition 11.6C, Poincaré pairs that are homotopy 1-complexes (printed pp. 207–208, djvu pp. 213–214)

> **11.6C Proposition.** *Suppose Y is a connected orientable 3-dimensional Poincaré space.*
>
> *(1)* **Recognition:** *If (X,Y) is Poincaré, then X is a homotopy 1-complex if and only if π₁X is free, π₁(X,Y) = 0, and Hᵢ(X;Z) = 0 for i > 1.*
>
> *(2)* **Existence:** *There is a Poincaré pair (X,Y) with X a homotopy 1-complex if and only if there is a homomorphism with perfect kernel of π₁Y onto a free group, and then π₁Y → π₁X is such a homomorphism.*
>
> *(3)* **Uniqueness:** *Poincaré pairs (X,Y) with X a homotopy 1-complex are determined up to homotopy by Y.*

This is the structure theorem on which the surgery-based slice argument rests; the proof draws on Wall [3] (stably free relative homology) and, for free π, on P. M. Cohen [1] (finitely generated projective Zπ modules are free for π free).

### Theorem 11.7A, unknotted 2-spheres in S⁴ (printed pp. 209–210, djvu pp. 215–216)

> **11.7A Theorem.** *A locally flat embedding f: S² → S⁴ is unknotted (isotopic to the standard embedding) if and only if π₁(S⁴ − f(S²)) ≃ Z.*

### Theorem 11.7B, Z-slice ⇔ Alexander polynomial 1 (printed pp. 210–211, djvu pp. 216–217)

Definition (p. 210, quoted): "We call an embedding of S¹ in a homology 3-sphere N 'Z-slice' if it extends to a (locally flat) embedding of D² in the contractible 4-manifold bounding N, so that the complement has fundamental group Z."

> **11.7B Theorem.** *An embedding f: S¹ → N, N a 3-dimensional manifold homology sphere, is Z-slice if and only if the the natural homomorphism π₁(N − f(S¹)) → Z has perfect kernel, or equivalently the Alexander polynomial of the knot is 1.*

(The duplicated word "the the" is verbatim from the printed text, p. 210.)

Closing of the proof (p. 211, quoted): "The equivalence of perfectness of the kernel with the Alexander polynomial being 1 is a result of Crowell [1]. Basically, the Alexander polynomial is the determinant of a relation matrix for H₁(M₁;Z[Z]) (the abelianization of the kernel) as a module over Z[Z]. The determinant is 1 (after normalization) if and only if the relations generate the entire module. This means the kernel abelianizes to give the trivial group, so is perfect."

### §12.3D Links known to be slice, the one-component (knot) case (printed p. 243, djvu p. 249)

> **12.3D Links known to be slice.** *Good boundary links with one component (ie. knots with Alexander polynomial 1) are slice, according to theorem 11.6C. A Whitehead double of a 2 component link with trivial linking numbers is slice, by Freedman [9].*

(The text continues: boundary links have trivial linking numbers, so their Whitehead doubles are good boundary links and have been shown slice by Freedman [5]; Bing doubles are not boundary links, so this does not apply to the embedding problem. The π₁-null theorem 5.2 gives slices after two Whitehead doublings.)

## Notes

- **Where the Alexander-polynomial-one slice statement lives.** The precise verbatim statement that an Alexander-polynomial-1 knot bounds a locally flat disk (is topologically slice) is **Theorem 11.7B** (printed pp. 210–211), phrased through the "Z-slice" notion (a locally flat D² in the contractible 4-manifold bounding the homology sphere). The plain English "knots with Alexander polynomial 1 are slice" wording appears in **§12.3D** (printed p. 243). For a knot in S³ ⊂ ∂D⁴ a Z-slice disk lies in a contractible 4-manifold bounding S³, i.e. (since S³ bounds D⁴ and the contractible bounding manifold is D⁴) the standard topologically-slice-in-D⁴ statement.

- **Citation cross-check (Crowell).** Freedman–Quinn attribute the perfect-kernel ⇔ Alexander-polynomial-1 equivalence to "Crowell [1]." This is R. H. Crowell's work on the Alexander module / genus of alternating knots; the exact bibliography entry was not cross-checked against a render (OCR of the reference list was not separately verified). The mathematical attribution as printed is quoted accurately.

- **Logical dependency chain (as stated in the book).** 11.7B (slice) ⇐ 11.6C (Poincaré-pair structure) ⇐ topological surgery / the disk embedding theorem of Part I (5.1A), whose topological case (immersion lemma 1.2) is established in Chapter 9. The introduction's informal "Embedding theorem" (printed p. 5, djvu p. 11) states the single-disk version: an immersion A: D² → M⁴ with a framed immersed sphere B, μ(B) = 0 and λ(A,B) = 1, with π₁M poly-(finite or cyclic), yields a topologically framed embedded disk with the same framed boundary as A.

- **OCR caveat.** Theorems 5.1A, 11.6C(1–3), 11.7A, 11.7B and the §12.3D sentence above were each transcribed from rendered (image) pages, not from raw OCR. The book uses Z for the integers (rendered as bold Z / Z) and π₁ throughout; transcribed here with standard Unicode.
