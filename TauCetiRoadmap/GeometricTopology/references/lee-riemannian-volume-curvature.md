# Fair-use extract: Lee, Introduction to Riemannian Manifolds: volume and curvature
**Source.** J. Lee, Introduction to Riemannian Manifolds, 2nd ed., Springer GTM 176, 2018.
**Locus.** Prop. 2.41 / 2.44 (printed pp. 30-32); Thm. 5.10 with Defs. of metric and symmetric connections (printed pp. 118, 121-122); the (1,3)-curvature endomorphism and (0,4)-curvature tensor Rm (printed pp. 196, 198); Ricci/scalar curvature (printed pp. 207-208); sectional curvature and constant sectional curvature (printed pp. 250-251, 254).
**Supports.** GeometricTopology roadmap, layer 7 (Riemannian volume and curvature).
*(Short attributed quotations of the essential definitions, surrounding material summarised, for scholarly reference.)*

## Summary

This extract collects the foundational definitions of the Riemannian volume form/measure and of curvature from Lee's text.

**(a) Volume.** On an oriented Riemannian n-manifold, the **Riemannian volume form** dV_g is the unique n-form characterised equivalently by: it equals ε¹ ∧ ··· ∧ εⁿ for any oriented orthonormal coframe; it gives value 1 on any oriented orthonormal frame; and in oriented local coordinates it equals √det(g_ij) dx¹ ∧ ··· ∧ dxⁿ (Prop. 2.41, printed p. 30). It is the device that lets one integrate functions, with Vol(M) = ∫_M dV_g. For non-orientable manifolds the corresponding object is the **Riemannian density** (Prop. 2.44, printed p. 31), the unique smooth positive density giving value 1 on every local orthonormal frame; when M is orientable the density equals |dV_g|, and the same notation dV_g is customarily used for both. Lee notes (printed p. 30) that property (b) of Prop. 2.41 depends on the determinant wedge-product convention.

**(b) Levi-Civita connection.** A connection ∇ on TM is **compatible with g** (a **metric connection**) if ∇_X⟨Y,Z⟩ = ⟨∇_X Y, Z⟩ + ⟨Y, ∇_X Z⟩ (eq. 5.1, printed p. 118), equivalently ∇g ≡ 0. It is **symmetric** if ∇_X Y − ∇_Y X ≡ [X,Y], equivalently if its torsion τ(X,Y) = ∇_X Y − ∇_Y X − [X,Y] vanishes (printed p. 121). The **Fundamental Theorem of Riemannian Geometry** (Thm. 5.10, printed p. 122): there is a unique connection that is both compatible and symmetric, the **Levi-Civita connection** (or **Riemannian connection** when g is positive definite).

**(c) Curvature.** The **curvature endomorphism** is the (1,3)-tensor R(X,Y)Z = ∇_X∇_Y Z − ∇_Y∇_X Z − ∇_{[X,Y]}Z (printed p. 196). Lowering the last index gives the (0,4) **(Riemann) curvature tensor** Rm with Rm(X,Y,Z,W) = ⟨R(X,Y)Z, W⟩_g (eq. 7.7, printed p. 198). The **Ricci curvature** Rc is the covariant 2-tensor trace Rc(X,Y) = tr(Z ↦ R(Z,X)Y) (printed p. 207), and the **scalar curvature** S = tr_g Rc (printed p. 208). The **sectional curvature** of a 2-plane Π ⊆ T_pM is the intrinsic Gaussian curvature of the surface swept out by geodesics tangent to Π (printed p. 250), computed by sec(v,w) = Rm_p(v,w,w,v)/|v∧w|² (eq. 8.28, printed p. 251). A metric/manifold has **constant sectional curvature** if the sectional curvatures agree for all planes at all points (printed p. 254).

Sign-convention warnings appear throughout: Lee's (1,3)-tensor is the negative of that in [dC92, GHL04] (printed p. 198), and the sectional-curvature formula uses Rm_p(v,w,w,v) under his convention, Rm_p(v,w,v,w) under the opposite one (printed p. 254).

## Key statements (quoted)

### Riemannian volume form, Proposition 2.41 (printed p. 30)

> **Proposition 2.41 (The Riemannian Volume Form).** *Let* (M, g) *be an oriented Riemannian n-manifold with or without boundary. There is a unique n-form* dV_g *on* M*, called the **Riemannian volume form**, characterized by any one of the following three equivalent properties:*
>
> *(a) If* (ε¹, …, εⁿ) *is any local oriented orthonormal coframe for* T*M*, then*
>
> > dV_g = ε¹ ∧ ··· ∧ εⁿ.
>
> *(b) If* (E₁, …, Eₙ) *is any local oriented orthonormal frame for* TM*, then*
>
> > dV_g(E₁, …, Eₙ) = 1.
>
> *(c) If* (x¹, …, xⁿ) *are any oriented local coordinates, then*
>
> > dV_g = √(det(g_ij)) dx¹ ∧ ··· ∧ dxⁿ.

Volume defined immediately after (printed p. 30):

> Similarly, if M is compact, the **volume of M** is defined to be
>
> > Vol(M) = ∫_M dV_g = ∫_M 1 dV_g.

### Riemannian density, Proposition 2.44 (printed p. 31)

> **Proposition 2.44 (The Riemannian Density).** *If* (M, g) *is any Riemannian manifold, then there is a unique smooth positive density* μ *on* M*, called the **Riemannian density**, with the property that*
>
> > μ(E₁, …, Eₙ) = 1     (2.18)
>
> *for every local orthonormal frame* (E_i).

(Printed p. 31:) "If M is oriented and dV_g is its Riemannian volume form, then its Riemannian density is easily seen to be equal to |dV_g|. … It is customary to denote the Riemannian density by the same notation dV_g that we use for the Riemannian volume form …"

### Metric (compatible) connection, eq. (5.1) (printed p. 118)

> A connection ∇ on TM is said to be **compatible with g**, or to be a **metric connection**, if it satisfies the following product rule for all X, Y, Z ∈ 𝔛(M):
>
> > ∇_X⟨Y, Z⟩ = ⟨∇_X Y, Z⟩ + ⟨Y, ∇_X Z⟩.     (5.1)

Equivalent characterisation (Prop. 5.5(b), printed p. 118): "*g is parallel with respect to* ∇: ∇g ≡ 0."

### Symmetric connection and torsion (printed p. 121)

> We say that a connection ∇ on the tangent bundle of a smooth manifold M is **symmetric** if
>
> > ∇_X Y − ∇_Y X ≡ [X, Y]   for all X, Y ∈ 𝔛(M).

> … the **torsion tensor** of the connection … is the smooth (1,2)-tensor field τ: 𝔛(M) × 𝔛(M) → 𝔛(M) defined by
>
> > τ(X, Y) = ∇_X Y − ∇_Y X − [X, Y].

> Thus a connection ∇ is symmetric if and only if its torsion vanishes identically.

### Levi-Civita connection, Theorem 5.10 (printed p. 122)

> **Theorem 5.10 (Fundamental Theorem of Riemannian Geometry).** *Let* (M, g) *be a Riemannian or pseudo-Riemannian manifold (with or without boundary). There exists a unique connection* ∇ *on* TM *that is compatible with* g *and symmetric. It is called the **Levi-Civita connection of g** (or also, when* g *is positive definite, the **Riemannian connection**).*

### Curvature endomorphism / (1,3)-curvature tensor (printed p. 196)

> … define a map R: 𝔛(M) × 𝔛(M) × 𝔛(M) → 𝔛(M) by
>
> > R(X, Y)Z = ∇_X∇_Y Z − ∇_Y∇_X Z − ∇_{[X,Y]}Z.

> … the map R(X, Y): 𝔛(M) → 𝔛(M) given by Z ↦ R(X, Y)Z is a smooth bundle endomorphism of TM, called the **curvature endomorphism determined by X and Y**. The tensor field R itself is called the **(Riemann) curvature endomorphism** or the **(1, 3)-curvature tensor**.

(Note: by Prop. 7.3 (printed p. 196), R is multilinear over C^∞(M) and thus a (1,3)-tensor field.)

### (Riemann) curvature tensor Rm, eq. (7.7) (printed p. 198)

> We define the **(Riemann) curvature tensor** to be the (0, 4)-tensor field Rm = R♭ (also denoted by Riem by some authors) obtained from the (1, 3)-curvature tensor R by lowering its last index. Its action on vector fields is given by
>
> > Rm(X, Y, Z, W) = ⟨R(X, Y)Z, W⟩_g.     (7.7)

> In terms of any smooth local coordinates it is written
>
> > Rm = R_{ijkl} dx^i ⊗ dx^j ⊗ dx^k ⊗ dx^l,
>
> where R_{ijkl} = g_{lm} R_{ijk}^m.

### Ricci and scalar curvature (printed pp. 207-208)

> The most important such tensor is the **Ricci curvature** or **Ricci tensor**, denoted by Rc (or often Ric in the literature), which is the covariant 2-tensor field defined as the trace of the curvature endomorphism on its first and last indices. Thus for vector fields X, Y,
>
> > Rc(X, Y) = tr(Z ↦ R(Z, X)Y).

> The components of Rc are usually denoted by R_{ij}, so that
>
> > R_{ij} = R_{kij}^k = g^{km} R_{kijm}.

> The **scalar curvature** is the function S defined as the trace of the Ricci tensor:
>
> > S = tr_g Rc = R_i^i = g^{ij} R_{ij}.

### Sectional curvature (printed pp. 250-251)

> … called the **plane section determined by Π**. …
>
> We define the **sectional curvature of Π**, denoted by sec(Π), to be the intrinsic Gaussian curvature at p of the surface S_Π with the metric induced from the embedding S_Π ⊆ M. If (v, w) is any basis for Π, we also use the notation sec(v, w) for sec(Π).

> **Proposition 8.29 (Formula for the Sectional Curvature).** *Let* (M, g) *be a Riemannian manifold and* p ∈ M*. If* v, w *are linearly independent vectors in* T_pM*, then the sectional curvature of the plane spanned by* v *and* w *is given by*
>
> > sec(v, w) = Rm_p(v, w, w, v) / |v ∧ w|².     (8.28)

where (eq. 8.27, printed p. 251) |v ∧ w| = √(|v|² |w|² − ⟨v, w⟩²).

### Constant sectional curvature (printed p. 254)

> A Riemannian metric or Riemannian manifold is said to have **constant sectional curvature** if the sectional curvatures are the same for all planes at all points.

> **Theorem 8.34 (Sectional Curvatures of the Model Spaces).** *The following Riemannian manifolds have the indicated constant sectional curvatures:*
>
> *(a)* (ℝⁿ, ḡ) *has constant sectional curvature 0.*
> *(b)* (Sⁿ(R), g̊_R) *has constant sectional curvature 1/R².*
> *(c)* (ℍⁿ(R), ğ_R) *has constant sectional curvature −1/R².*

## Notes

- **Page-offset note.** The PDF's internal page numbering is not a constant offset from printed pages (front-matter pagination shifts it): printed p. 18 is at PDF page 32 (offset 14), whereas printed p. 196 is at PDF page 207 (offset 11). All locators above are by printed page number, verified against page images.
- **Sign conventions.** Lee's (1,3)-curvature tensor R is the negative of the convention in [dC92], [GHL04] (printed p. 198). There is "much less agreement on the definition of the (0,4)-curvature tensor" (printed p. 198); various permutations of (X,Y,Z,W) appear in the literature, agreeing up to sign after the symmetries. For sectional curvature, under the opposite sign convention formula (8.28) uses Rm_p(v,w,v,w) in place of Rm_p(v,w,w,v) (printed p. 254), so that "positive/negative sectional curvature" has the same meaning under either convention.
- **Index/trace conventions.** Lee writes the (1,3)-tensor with the contravariant (upper) index last (R = R_{ijk}^l dx^i ⊗ dx^j ⊗ dx^k ⊗ ∂_l), contrary to his usual "covector arguments come first" convention (printed p. 196). Ricci is the trace on the first and last indices of R (printed p. 207).
- **Transcription notes.** Unicode used for verbatim statements (∇, ⊗, ∧, ⟨ ⟩, √, ♭, superscript/subscript indices, ḡ/g̊/ğ for the model-space metrics). In Lee's typography the metric on ℝⁿ is an overbar-g, on the sphere a ring-g, on hyperbolic space a check-g; these are rendered here as ḡ, g̊, ğ respectively. The pdftotext extraction garbled many of these symbols; all quoted statements were re-transcribed from the rendered page images.
- **Related material not transcribed here.** Appendix B "Densities" (printed pp. 405-406) gives the general definition of a density on a manifold underlying Prop. 2.44. Prop. 2.43 (printed p. 31) characterises the volume form of a hypersurface as dV_g = (N ⌟ dV_g̃)|_M for a unit normal N. The traceless Ricci tensor and the decomposition Rc = R̊c + (1/n)S g appear at Prop. 7.17 (printed p. 208).
