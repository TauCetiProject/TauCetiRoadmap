# Roadmap: hopfological algebra

**Summary.** Hopfological algebra replaces the square-zero differential of homological algebra by
an action of a finite-dimensional Hopf algebra `H`. This roadmap builds the theory from integrals
and the Larson–Sweedler Frobenius theorem, through the stable category `H-StMod` as a
triangulated monoidal category, left module algebras `A`, smash products `A # H` and the finite
dual bridge to comodule algebras, to Qi's relative homotopy category `C(A,H)`, its derived
category `D(A,H)`, cofibrant replacement, compact generation and Grothendieck groups. The
differential examples are the exterior Hopf superalgebra, Sweedler's algebra, the truncated
primitive algebras of characteristic `p` with their slash homology, one-generator Nichols and Taft
algebras, and the Laugwitz–Qi multi-differential construction `O_n` in every characteristic. The
end theorems are the Frobenius, Nakayama and symmetric-algebra criteria for finite Hopf algebras,
the triangulated monoidal structure on `H-StMod`, the existence and universal property of `A # H`,
the module-algebra/comodule-algebra equivalence over the finite dual, Qi's description of `D(A,H)`
and its compact objects, Khovanov–Qi's slash-homology detection theorem, and the Grothendieck rings
of the Taft stable categories and of `O_n`.

## Scope and ownership

This roadmap owns: integrals and cointegrals of Hopf algebras over a field, the modular character,
the Hopf-algebra form of the Nakayama automorphism and the symmetric criterion; the monoidal
structure on the category of **all** left `H`-modules, its tensor ideal of projectives and its
descent to `H-StMod`; left module algebras, smash products, right comodule algebras and the finite
dual comparison; the relative hopfological theory `C(A,H)`, `D(A,H)`, property (P), cofibrant
replacement, compactness and finiteness; Hopfological Grothendieck groups; the bicharacter-braided
graded ambient, one-generator Nichols algebras, bosonization and the differential examples; and
the Laugwitz–Qi category `O_n`.

It leaves to named owners:

- Frobenius functionals, the Nakayama automorphism of a Frobenius functional, self-injectivity,
  Frobenius exact structures, the stable category of a Frobenius exact structure and Happel's
  triangulation are already in the library (Tau Ceti, see the supplier contracts). The remaining
  stable-category interfaces (universal property of the additive quotient, exact functors between
  Frobenius categories, idempotent completion) are stated by StablePeriodicCurved, Layers 0 and 1.
- The monoidal and rigid category `FiniteHopfModuleCat` of finite-dimensional modules over a Hopf
  algebra, with tensor over `k` through the coproduct, the counit unit, associator and unitors, the
  right dual through `S` and the left dual through `S⁻¹` when `S` is bijective, is stated by
  QuantumGroups, Q8 item 5. Layer 2 here extends it to all modules and compares the two on
  finite-dimensional objects; it does not construct the finite case again.
- The Hopf structure on the linear dual of a finite projective Hopf algebra is already in the
  library as `TauCeti.ConvolutionDual.instHopfAlgebra`; Layer 3 consumes it.
- Graded modules over a `ℤ`-graded algebra, with abelian structure and grading shift, are already
  in the library as `TauCeti.GradedModuleCat`; Layers 7 and 8 use it for graded `H`-modules.
- Ordinary DG algebras, chain homotopy, derived categories of DG modules and Verdier quotients of
  DG categories are stated by DGAInfinity, Layers 0, 1, 5 and 7.
- Exact and triangulated Grothendieck groups, their quotient presentations and Laurent-graded
  `K₀` are stated by GrothendieckEulerForms, Layers 0, 2 and 6.

The constructions here select no Hopf algebra for an ADE or E8 problem, quotient no affine null
root, and construct or categorify no lattice. Roots of unity and the Jones–Wenzl projector appear
only as published examples of the general theory.

## Conventions

- `k` is a field. The core theory assumes `H` is a finite-dimensional Hopf algebra over `k`; a
  Hopf algebra over a field is never the zero ring, since `ε(1)=1`. `S` is Mathlib's
  `HopfAlgebra.antipode`. Its bijectivity is a theorem for finite-dimensional `H` (Layer 1); a
  statement beyond finite dimension carries `Function.Bijective (HopfAlgebra.antipode k)` as a
  hypothesis.
- Unqualified modules are **left** modules. Sweedler notation `Δh = Σ h₁ ⊗ h₂` in prose denotes a
  finite representation of Mathlib's `Coalgebra.comul`; Lean statements use `Coalgebra.Repr` and
  never a chosen basis.
- A left `H`-module algebra satisfies `h·1 = ε(h)1` and `h·(ab) = Σ (h₁·a)(h₂·b)`. Tau Ceti's
  comodules are right comodules, `ρ : A → A ⊗ C`; a right comodule algebra has `ρ(1) = 1 ⊗ 1` and
  `ρ(ab) = ρ(a)ρ(b)` in the tensor-product algebra.
- The smash product `A # H` has carrier `A ⊗ H`, unit `1 # 1` and product
  `(a # h)(b # l) = Σ a(h₁·b) # h₂l`.
- The tensor action on modules is `h·(m ⊗ n) = Σ (h₁·m) ⊗ (h₂·n)`, with `h·c = ε(h)c` on the unit.
- A left integral is a **nonzero** `Λ ∈ H` with `hΛ = ε(h)Λ`; the submodule of all such elements
  together with `0` is `LeftIntegral`. A right cointegral is `φ ∈ H*` with `Σ φ(h₁)h₂ = φ(h)1`.
  The modular character `α : H → k` of a left integral is defined by `Λh = α(h)Λ`.
- Nakayama conventions. Tau Ceti's `LinearMap.IsFrobeniusFunctional.nakayamaAut` is the stable
  convention `φ(ab) = φ(b ν_S(a))`, as in StablePeriodicCurved, Layer 0. The Hopf convention
  `φ(xy) = φ(ν_H(y)x)` gives `ν_H = ν_S⁻¹`. Theorems about Hopf algebras state `ν_H` as the
  inverse of the library automorphism.
- Gradings are by `ℤ`, with Tau Ceti's shift `(M{r})_p = M_{p-r}`: an element of degree `i` of `M`
  has degree `i + r` in `M{r}`, and `[M{1}] = q[M]` in graded `K₀`. The triangulated suspension `T`
  is distinct from `{1}`.
- The structural DG, `p`-DG and one-generator `N`-complex differentials have degree `+1`;
  Qi–Sussan use degree `+2`, and Laugwitz–Qi's `d_k` has degree `n_k = n/p_k`.
- Ordinary tensor products carry no Koszul sign. Super and `q`-graded examples use the braiding of
  their ambient category, and that braiding produces the sign or the power of `q`.
- `H-StMod` is the stable quotient of **all** left `H`-modules; `H-stmod` is its essentially small
  full subcategory on finite-dimensional modules. A morphism of `C(A,H)` is a quasi-isomorphism
  when its restriction to `H` is invertible in `H-StMod`.

## Exact supplier contracts

**From Mathlib.** `HopfAlgebra`, `Bialgebra`, `Coalgebra.comul`, `Coalgebra.Repr` (the `ℛ`
notation) and `IsGroupLikeElem`; `ModuleCat`; `Module.Dual`, `Module.Basis.dualBasis` and
`Module.Dual.eval`; `WithConv`, `WithConv.toConv` and `WithConv.linearEquiv`;
`Algebra.TensorProduct` for the algebra `A ⊗ C`; `CategoryTheory.HopfObj` for Hopf monoids in a
braided category; `CategoryTheory.ObjectProperty.triangEnvelope` (thick envelopes, retracts
included) and `CategoryTheory.ObjectProperty.trW` (Verdier localization at a triangulated
subcategory); `Polynomial.cyclotomic` and `Polynomial.cyclotomic_prime` (the geometric sum for a
prime); `IsPrimitiveRoot`. Each is used as it stands at the pin.

**From Tau Ceti.**

- `TauCeti.Comodule` (`TauCeti.Algebra.Coalgebra.Comodule.Basic`): right coaction with
  coassociativity and counit laws, no multiplicativity. Layer 3 adds the comodule-algebra
  condition.
- `TauCeti.ConvolutionDual`, `TauCeti.ConvolutionDual.instHopfAlgebra` and
  `TauCeti.ConvolutionDual.antipode_apply` (`TauCeti.Algebra.HopfAlgebra.FiniteDual.Basic`): the
  Hopf algebra `H*` of a finite projective Hopf algebra over a commutative ring, with convolution
  product, `Δf(x ⊗ y) = f(xy)`, `ε(f) = f(1)` and antipode precomposition with `S`.
- `LinearMap.IsFrobeniusFunctional`, `LinearMap.IsSymmetricFrobeniusFunctional`,
  `LinearMap.IsFrobeniusFunctional.nakayamaAut`, `LinearMap.IsFrobeniusFunctional.apply_mul_nakayamaAut`,
  `LinearMap.IsFrobeniusFunctional.coe_nakayamaAut_eq` and
  `LinearMap.IsFrobeniusFunctional.moduleInjective_self` (`TauCeti.Algebra.Algebra.Frobenius.Basic`):
  nondegeneracy of `(a,b) ↦ φ(ab)`, the Nakayama automorphism in the stable convention with its
  uniqueness, and self-injectivity, for finite-dimensional algebras over a field.
- `TauCeti.ExactStructure.abelian` (`TauCeti.CategoryTheory.Exact.Abelian`): all short exact
  sequences of an abelian category. `TauCeti.ExactStructure.IsFrobenius`
  (`TauCeti.CategoryTheory.Exact.Frobenius`): enough relative projectives and injectives, and the
  two classes agree. `TauCeti.ExactStructure.IsFrobenius.stableIsTriangulated`
  (`TauCeti.CategoryTheory.Exact.Stable.Triangulated`): Happel's triangulation of the stable
  category. `FGModuleCat.abelian_isFrobenius` (`TauCeti.Algebra.Category.FGModuleCat.Frobenius`):
  the finitely generated module category of a two-sided self-injective finite-dimensional algebra;
  it does not treat infinitely generated modules.
- `TauCeti.Bialgebra.comul_pow_of_primitive` (`TauCeti.Algebra.Bialgebra.Primitive`): the binomial
  formula for `Δ(a^n)` with `a` primitive, over any commutative semiring. The quotient bialgebras
  of `TauCeti.Algebra.Bialgebra.Quotient` present the examples by generators and relations.
- `TauCeti.InternalGrading` (`TauCeti.Algebra.Module.GradedModule.Internal`) and
  `TauCeti.GradedModuleCat` with `TauCeti.GradedModuleCat.shiftFunctor`
  (`TauCeti.Algebra.Category.GradedModuleCat.Basic`, abelian structure in `.Abelian`): genuine
  internal `ℤ`-gradings, graded modules over `𝒜 : ℤ → Submodule k A` with degree-zero morphisms,
  and the shift `(M{n})_p = M_{p-n}`. It carries no tensor product through a coproduct.

**From TauCetiRoadmap.QuantumGroups.** Q8 item 5: `FiniteHopfModuleCat k H`, its monoidal
structure and its rigid structure (right duals through `S`, left duals through `S⁻¹` given
bijectivity), for any Hopf algebra over a field.

**From TauCetiRoadmap.StablePeriodicCurved.** Layer 0: the additive quotient by an ideal and its
universal property, the ideal of maps factoring through a class of objects. Layer 1: exact
functors between Frobenius categories descend to triangle functors; triangulated structure on
extension-closed Frobenius subcategories.

**From TauCetiRoadmap.DGAInfinity.** Layers 0 and 1: graded modules with Koszul signs, DG algebras
and DG modules, chain homotopy. Layer 7: Verdier quotients and the comparison with DG quotients.

**From TauCetiRoadmap.GrothendieckEulerForms.** Layer 0: exact structures and conflation-exact
functors. Layer 2: the exact and triangulated Grothendieck groups and the quotient sequence for a
Verdier quotient by a thick subcategory. Layer 6: Laurent coefficients and graded `K₀` over
`ℤ[q,q⁻¹]`.

## How to read the build

Layer 1 proves that finite Hopf algebras are Frobenius and pins the integral, cointegral and
Nakayama conventions. Layer 2 builds the monoidal category of all `H`-modules and its stable
quotient `H-StMod`, triangulated and monoidal. Layer 3 builds module algebras, smash products,
comodule algebras and the finite dual comparison. Layer 4 builds the relative Frobenius exact
structure on `A # H`-modules and the homotopy category `C(A,H)`. Layer 5 localizes at
quasi-isomorphisms, builds cofibrant replacement and proves compact generation. Layer 6 computes
Grothendieck groups. Layer 7 constructs the differential examples, the braided graded ambient,
Nichols and Taft algebras and slash homology. Layer 8 builds Laugwitz–Qi's `O_n` and computes
its Grothendieck ring.

## Layer 1: finite Hopf algebras are Frobenius

### 1.1 Integrals and cointegrals

Define the submodules `LeftIntegral` and `RightIntegral` of `H` by `hΛ = ε(h)Λ` and
`Λh = ε(h)Λ`, and the predicate `IsRightCointegral` on `H*` by `Σ φ(h₁)h₂ = φ(h)1`; equivalently a
right cointegral is a right integral of the convolution algebra `ConvolutionDual k H`. Define left
cointegrals symmetrically. *Needs:* Mathlib `HopfAlgebra`, `Coalgebra.Repr`; Tau Ceti
`TauCeti.ConvolutionDual`.

- The integral spaces are closed under scalars and are mapped onto each other by Hopf algebra
  isomorphisms.
- `S` maps left integrals to right integrals, and `S⁻¹` maps right integrals to left integrals when
  `S` is bijective.
- `IsRightCointegral φ` holds exactly when `φ` is a right integral of `ConvolutionDual k H`.
- For finite-dimensional `H`, `finrank_leftIntegral`: the left integrals form a one-dimensional
  space (Larson–Sweedler, as recalled by Erdmann–Solberg–Wang, §2, p. 4). The same holds for right
  integrals and for left and right cointegrals; the right-cointegral line is chosen in `H*` and the
  left-integral line in `H`, and the two choices are independent.

**Checks.**

- For `H = k` both integral spaces are `k`, spanned by `1`; a definition that normalized `ε(Λ) = 1`
  would also accept this, so it is the next Check that separates the two.
- For `H = k[C₂]` with `char k = 2`, the integrals are spanned by `Λ = 1 + g`, and `ε(Λ) = 0`: an
  integral need not have nonzero counit (Maschke fails), so a definition requiring `ε(Λ) = 1`
  would make the space zero, contradicting `finrank_leftIntegral`.
- In Sweedler's `H₄` (generators `g, x`, `g² = 1`, `x² = 0`, `xg = −gx`, `Δx = x ⊗ 1 + g ⊗ x`),
  the left integrals are spanned by `(1 + g)x` and the right integrals by `x(1 + g) = x − gx`:
  distinct lines, so a model identifying left and right integrals fails here.
- In `H₄` the right cointegrals are spanned by the functional `x*` with `x*(x) = 1` and `x*` zero on
  `1, g, gx`; the counit `ε` is not a cointegral (at `h = g` it gives `g ≠ 1`).

### 1.2 The Frobenius theorem and bijectivity of the antipode

For finite-dimensional `H`, prove `isFrobeniusFunctional_of_isRightCointegral`: a nonzero right
cointegral is a Frobenius functional in Tau Ceti's sense, so `x ↦ (y ↦ φ(xy))` is a linear
equivalence `H ≃ H*`, with Frobenius dual bases `{S(t₂), t₁}` for a right integral `t` normalized
by `φ(t·) = ε` (Fischman–Montgomery–Schneider, Lemma 1.5, pp. 4861–4862). Prove
`antipode_bijective` (Larson–Sweedler). Consume Tau Ceti's
`LinearMap.IsFrobeniusFunctional.moduleInjective_self` for self-injectivity, and prove
`hMod_abelian_isFrobenius`: for all left `H`-modules, not only finite-dimensional ones, projective
and injective objects coincide, so `ExactStructure.abelian (ModuleCat H)` is Frobenius (Khovanov,
Proposition 1). *Needs:* §1.1; Tau Ceti `LinearMap.IsFrobeniusFunctional`,
`TauCeti.ExactStructure.abelian`, `TauCeti.ExactStructure.IsFrobenius`; for all modules, the
standard fact that over a Frobenius algebra arbitrary projective and injective modules coincide.

**Checks.**

- For `H₄` the cointegral `x*` gives the pairing with `x*(1·x) = 1`, `x*(g·gx) = x*(x) = 1`,
  `x*(x·g) = x*(−gx) = 0`, `x*(gx·g) = x*(−x) = −1`: the Gram matrix on `1, g, x, gx` is
  invertible.
- `S` on `H₄` satisfies `S²(x) = −x`, so `S` has order four and `S⁻¹ ≠ S`: a model taking
  `S⁻¹ = S` fails.
- For `H = k`, `H-Mod` is semisimple and every module is projective and injective; for
  `H = k[d]/(d²)` in characteristic two, `k` is neither projective nor injective while `H` is both,
  so the Frobenius property is not the statement that every module is projective.

### 1.3 The modular character and the Nakayama automorphism

For a nonzero left integral `Λ`, define the modular character `α : H → k` by `Λh = α(h)Λ`; it is
an algebra map, unique given `Λ`, independent of rescaling `Λ` by a nonzero scalar. Prove
`nakayamaAut_symm_eq_winding`: for a nonzero right cointegral `φ`, the inverse of Tau Ceti's
`nakayamaAut` is `ν_H(h) = Σ α(h₁) S²(h₂)` (Fischman–Montgomery–Schneider, Lemma 1.5, p. 4862,
stated there as `η(a) = S²(a ↼ α')` for the stable convention and the modular character `α'` of a
right integral; `α' = α⁻¹` because `S(Λ)` is a right integral; Erdmann–Solberg–Wang, Theorem
2.2(b)). Prove the companion formula `ν_H(h) = a⁻¹(Σ α(h₂) S⁻²(h₁)) a`, where `a` is the
distinguished group-like element defined by `Σ φ(h₂)h₁ = φ(h)a⁻¹`. *Needs:* §§1.1–1.2; Tau Ceti
`LinearMap.IsFrobeniusFunctional.nakayamaAut`, `LinearMap.IsFrobeniusFunctional.coe_nakayamaAut_eq`.

- `α ∘ S = α⁻¹` (convolution inverse) and `α ∘ S² = α`.
- `ν_H = ν_S⁻¹`, and `ν_S` is what the stable-category interface consumes.

**Checks.**

- In `H₄`: `Λ = (1 + g)x`, `Λg = −Λ`, so `α(g) = −1`, `α(x) = 0`; then `ν_H(g) = −g` and
  `ν_H(x) = α(g)S²(x) = x`. Direct computation with `φ = x*` confirms `φ(ag) = φ(ν_H(g)a)` for
  all basis elements `a`.
- In the Taft algebra with `N = 3` (`K³ = 1`, `d³ = 0`, `Kd = qdK`, `Δd = d ⊗ 1 + K ⊗ d`):
  `α(K) = q`, `S²(d) = q⁻¹d`, so `ν_H(K) = qK`, `ν_H(d) = d`, while `ν_S(K) = q⁻¹K`. This separates
  the two orientations, which coincide on `H₄`.
- In `H₄` with `φ = x*`, `Σ φ(x₂)x₁ = g = φ(x)a⁻¹`, so `a = g`, and the companion formula gives
  `ν_H(x) = g(−x)g = x`, agreeing with the first formula.
- For a group algebra `k[G]`, `α = ε` and `S² = id`, so `ν_H = id`; with `Λ = 0` the defining
  equation would hold for every algebra map `α`, which is why the integral is required nonzero.

### 1.4 Symmetric finite Hopf algebras

Define `IsSymmetricFrobenius` (some functional is a symmetric Frobenius functional),
`IsUnimodular` (`LeftIntegral = RightIntegral`) and `AntipodeSquareIsInner`
(`S²(h) = uhu⁻¹` for a unit `u`). Prove `symmetric_iff_unimodular_and_antipodeSquare_inner` for
finite-dimensional `H` (Erdmann–Solberg–Wang, Theorem 2.2(c)). *Needs:* §1.3; Tau Ceti
`LinearMap.IsSymmetricFrobeniusFunctional`.

**Checks.**

- `k[G]` and `k[d]/(d^p)` in characteristic `p` are unimodular with `S² = id`, hence symmetric.
- `H₄`: `S²(x) = −x = gxg⁻¹` is inner, but `α(g) = −1 ≠ ε(g)`, so `H₄` is not unimodular and not
  symmetric; this shows inner `S²` alone does not suffice.
- Finite dimensionality alone does not give symmetry: the Taft algebras with `N ≥ 2` are not
  unimodular.

### Examples

`H = k`, `k[C₂]` in characteristic two, Sweedler's `H₄` and the Taft algebras give the integral,
cointegral and Nakayama values recorded in the Checks.

### Dependencies

Mathlib `HopfAlgebra`, `Coalgebra.Repr`, `ModuleCat`; Tau Ceti Frobenius functionals and Frobenius
exact structures; StablePeriodicCurved, Layer 0 for the stable-category interfaces.

## Layer 2: Hopf modules and their stable monoidal category

### 2.1 The monoidal category of all `H`-modules

Extend QuantumGroups Q8 item 5 from finite-dimensional modules to all left `H`-modules: the
diagonal action on `M ⊗ N`, independent of the chosen coproduct representation, the unit `k`
with action through `ε`, associator and unitors, all of which need only a bialgebra. Prove the
inclusion of `FiniteHopfModuleCat k H` is a fully faithful monoidal functor. Prove that `M ⊗ P`,
`P ⊗ M`, `Hom_k(M, P)` and `Hom_k(P, M)` are projective when `P` is projective, with the internal
Hom action `(h·f)(m) = Σ h₁ f(S(h₂)m)`, so the maps factoring through projectives form a two-sided
tensor ideal (Khovanov, Proposition 2; Qi, Lemma 2.3). *Needs:* QuantumGroups Q8 item 5; Layer 1
for the finite-dimensional ideal statements.

**Checks.**

- For `H = k[C₂]`, `g(m ⊗ n) = gm ⊗ gn`, and the right dual action is `(g·f)(m) = f(g⁻¹m)`; these
  agree with the values of QuantumGroups Q8 item 5 on finite-dimensional modules.
- For `H₄`, `x(m ⊗ n) = xm ⊗ n + gm ⊗ xn`, so the tensor action is not the symmetric formula
  `xm ⊗ n + m ⊗ xn`, which would not even define an action.
- `H ⊗ M` is free of rank `dim M` for finite-dimensional `M`; for `H = k[d]/(d²)` in characteristic
  two, `H ⊗ k ≅ H` while `k ⊗ k ≅ k` is not projective.

### 2.2 The stable category `H-StMod`

Form `H-StMod` as Tau Ceti's stable category of `ExactStructure.abelian (ModuleCat H)`, triangulated
by `TauCeti.ExactStructure.IsFrobenius.stableIsTriangulated` through `hMod_abelian_isFrobenius`, and
define `H-stmod` as its full subcategory on finite-dimensional modules. After choosing `Λ`, model
the suspension by `T(M) = M ⊗ (H/kΛ)` and its inverse by `M ⊗ ker ε`, independent of `Λ` up to
natural isomorphism (Khovanov, §1, p. 3). Prove that the tensor product descends, that tensoring on
either side is a triangle functor, that `H-StMod` has arbitrary coproducts, and that `H-stmod` is
closed under tensor products, suspension and duals. Both are symmetric monoidal when `H` is
cocommutative; a braiding otherwise needs a quasitriangular structure. A morphism is zero exactly
when it factors through a projective, and `Hom_{H-StMod}(M, N) = Hom_k(M,N)^H / Λ·Hom_k(M,N)`
(Qi, Corollary 5.5). *Needs:* §2.1; Tau Ceti stable-category files; StablePeriodicCurved, Layer 1.

**Checks.**

- `H = k`: `H-StMod = 0`, since every module is projective.
- `H = k[d]/(d²)`, characteristic two: `H/kΛ = H/(d) ≅ k`, so `T(k) ≅ k`; ungraded, the stable
  category is the homotopy category of modules with a square-zero differential.
- `H = k[d]/(d³)`, characteristic three: `H/kΛ = H/(d²)` is two-dimensional, so `T(k)` is not
  isomorphic to `k`; a definition of `T` as the identity fails, while `T²(k) ≅ k`.

### Examples

`k[d]/(d^p)` in characteristic `p` gives the homotopy category of `p`-complexes. `k[C_p]` in
characteristic `p` is isomorphic to `k[d]/(d^p)` as an algebra through `d = g − 1`, so the two stable
categories agree as triangulated categories, but `g` is group-like and `d` primitive, so their
tensor products are defined through different coproducts.

### Dependencies

Layer 1; QuantumGroups Q8 item 5; Tau Ceti `TauCeti.ExactStructure.IsFrobenius.stableIsTriangulated`;
StablePeriodicCurved, Layers 0 and 1.

## Layer 3: module algebras, comodule algebras and smash products

### 3.1 Left module algebras and the smash product

Define `LeftAction` and `LeftModuleAlgebra` with the two equations of the conventions. Define
`smashMulPure` and the structure `SmashProduct`, which bundles a `k`-algebra, a linear equivalence
with `A ⊗ H`, the pure-tensor product and unit, and the algebra maps `a ↦ a # 1` and `h ↦ 1 # h`.
Prove `smashProduct_nonempty` (Qi, Example 2.8) and the universal property
`SmashProduct.lift_unique` for pairs satisfying `SmashCompatible`, the covariance
`fH(h)fA(a) = Σ fA(h₁·a) fH(h₂)`. *Needs:* Mathlib `Coalgebra.Repr`, `TensorProduct`; the quotient
bialgebras of `TauCeti.Algebra.Bialgebra.Quotient` for examples presented by relations.

- Equivariant algebra maps, restriction along bialgebra maps and invariant subalgebras.
- `A # H`-modules are the same as `A`-modules with a compatible `H`-action, `h·(am) = Σ (h₁·a)(h₂·m)`.
- The map `a ↦ a # 1` is injective for every `A`, since `H ≠ 0`. The map `h ↦ 1 # h` is injective
  when `A` is nonzero; for `A = 0` the smash product is zero and the map has kernel `H`.
  Restriction of scalars uses the algebra map in both cases.
- Functoriality of `A # H` in equivariant algebra maps and Hopf maps.

**Checks.**

- `A = k`: `k # H ≅ H` through `h ↦ 1 # h`, injective.
- `A = 0`: `0 # H = 0`, and `h ↦ 1 # h` sends `1` and `0` to `0`; any statement asserting
  injectivity without `A ≠ 0` fails here.
- `C₂` acting on `k[x]` (`char k ≠ 2`) by `g·x = −x`: `(1 # g)(x # 1) = −x # g`, so `A # H` is
  noncommutative although `A` and `H` are commutative; the plain tensor-product algebra would give
  `x # g`.
- The trivial action `h·a = ε(h)a` is a module algebra and gives `A # H ≅ A ⊗ H`; an action by an
  anti-automorphism of `A` fails the product equation.

### 3.2 Right comodule algebras

Define `IsRightComoduleAlgebra` on Tau Ceti's `TauCeti.Comodule k C A`: the coaction is unital
and multiplicative for the tensor-product algebra `A ⊗ C`. Prove that `A # H` has the right
coaction `ρ(a # h) = Σ (a # h₁) ⊗ h₂`, a comodule algebra (Qi, Definition 2.4). Khovanov uses left
comodule algebras; they are translated into this convention explicitly. *Needs:* Tau Ceti
`TauCeti.Comodule`; Mathlib `Algebra.TensorProduct`.

**Checks.**

- For `C = k[G]`, comodule algebras are `G`-graded algebras, `ρ(a) = a ⊗ g` for `a ∈ A_g`.
- The trivial coaction `a ↦ a ⊗ 1` is a comodule algebra.
- For `g ≠ 1`, `ρ(a) = a ⊗ g` is coassociative (`a ⊗ g ⊗ g` both ways) and counital
  (`ε(g) = 1`), so it is a comodule, but `ρ(1) = 1 ⊗ g ≠ 1 ⊗ 1`, so it is not a comodule algebra.

### 3.3 The finite dual comparison

For finite-dimensional `H`, consume `TauCeti.ConvolutionDual.instHopfAlgebra` and prove
`exists_leftModuleAlgebra_equiv_rightComoduleAlgebra`: left `H`-module algebra structures on `A`
correspond bijectively to right comodule algebra structures over `ConvolutionDual k H`, with forward
coaction `ρ(a) = Σ (eᵢ·a) ⊗ eᵢ*` for every basis `e` of `H` (hence independent of the basis) and
inverse `h·a = (id ⊗ ev_h)(ρ(a))`, using `evalConv` (Montgomery's duality between `H`-modules and
`H*`-comodules; the multiplicativity of `ρ` is the product equation of the module algebra, its
unit law is `h·1 = ε(h)1`, and coassociativity is associativity of the action). Relate `A # H` to
the comodule-algebra smash construction over `H*`. Over a commutative ring, the same comparison
holds for finite projective `H`; finite generation alone does not suffice. *Needs:* §§3.1–3.2;
Tau Ceti `TauCeti.ConvolutionDual`, `TauCeti.ConvolutionDual.antipode_apply`.

**Checks.**

- Sign action of `C₂` on `k[x]`: `ρ(x) = x ⊗ δ₁ − x ⊗ δ_g`, which evaluates to `x` at `1` and `−x`
  at `g`; the basis `{1 + g, 1 − g}` gives the same tensor.
- The trivial action gives `ρ(a) = a ⊗ ε`, and `ε` is the unit of the convolution algebra, so
  `ρ(1) = 1 ⊗ 1`.
- The formula `ρ(a) = Σ (S(eᵢ)·a) ⊗ eᵢ*` evaluates at `h` to `S(h)·a`, whose product rule uses
  `Σ (S(h₂)·a)(S(h₁)·b)`; for a non-cocommutative `H` such as `H₄` it is not multiplicative, so the
  antipode must not be inserted.

### Examples

Skew group algebras `A # k[G]`; differential graded algebras as module algebras over the exterior
Hopf superalgebra (Layer 7); `G`-graded algebras as `k[G]`-comodule algebras.

### Dependencies

Layer 1 for finite dimension; Mathlib `Coalgebra.Repr`, `Algebra.TensorProduct`; Tau Ceti
`TauCeti.Comodule`, `TauCeti.ConvolutionDual`.

## Layer 4: the relative hopfological category

### 4.1 The Hom action and the integral null ideal

Let `B = A # H`. On `Hom_A(M, N)` define Qi's action `(h·g)(m) = Σ h₂·g(S⁻¹(h₁)·m)` (Qi,
Definition 5.1), and prove `Hom_B(M, N) = Hom_A(M, N)^H` (Qi, Lemma 5.2). For a nonzero left
integral `Λ`, construct the `B`-linear map `λ_M : M → M ⊗ H`, `m ↦ m ⊗ Λ`, where `M ⊗ H` has the
diagonal `B`-action through the coaction of §3.2. A `B`-linear `f : M → N` is **hopfologically
null-homotopic** when it factors through some `X ⊗ H`; prove this is equivalent to factoring through
`λ_M` (Qi, Lemma 2.6) and to `f = Λ·g` for an `A`-linear `g`, so that the morphism space of
`C(A,H)` is `Hom_A(M,N)^H / Λ·Hom_A(M,N)` (Qi, Corollary 5.5 and Lemma 5.4). The integral is
required nonzero; the ideal is unchanged by rescaling `Λ`. *Needs:* Layers 1 and 3; Layer 1
`antipode_bijective` for `S⁻¹`.

**Checks.**

- `H = A = k`, `M = N = k`: `Λ = 1`, `id = Λ·id`, so `id` is null and `C(k,k) = 0`. With `Λ = 0` the
  condition would read `f = 0`, making only the zero map null; this is why `Λ ≠ 0` is part of the
  definition.
- `H = k[G]`: `(g·f)(m) = g f(g⁻¹m)`, and invariants are the `G`-equivariant `A`-linear maps.
- `d` primitive with `S⁻¹(d) = −d`: `(d·f)(m) = d f(m) − f(dm)`, the commutator, which is the
  Hom-complex differential once super signs are installed (Layer 7).

### 4.2 The relative Frobenius exact structure and `C(A,H)`

Give `B-Mod` the exact structure whose conflations are short exact sequences of `B`-modules that
split as `A`-modules, the maps being `B`-linear and only the splitting `A`-linear. Prove it is
Frobenius, with projective-injectives the retracts of the modules `X ⊗ H`, and define `C(A,H)` as
its stable category; it is triangulated with `T(M) = M ⊗ (H/kΛ)` (Qi, Definition 3.1, Theorem 3.5)
and is a right module category over `H-StMod` (Qi, Proposition 2.7). Compare with the ordinary
stable category of `B`: every `B`-projective is relatively projective, and equality is not
asserted. *Needs:* §4.1; GrothendieckEulerForms, Layer 0; StablePeriodicCurved, Layers 0 and 1;
Tau Ceti `TauCeti.ExactStructure.IsFrobenius.stableIsTriangulated`.

**Checks.**

- `A = k`: every sequence splits over `k`, the exact structure is `ExactStructure.abelian` and
  `C(k,H) = H-StMod`.
- `H = k`: `A`-split sequences are split sequences, every object is projective-injective and
  `C(A,k) = 0`, matching §4.1.
- For `A = k[t]/(t²)` and `H = k`, the sequence `0 → (t) → A → A/(t) → 0` is exact but not split, so
  it is not a conflation: the relative structure is not the abelian one.

### Examples

DG modules over a DG algebra (exterior Hopf superalgebra), `p`-DG modules over `p`-DG algebras
(`H = k[d]/(d^p)`), and `H`-equivariant modules (`A = k`).

### Dependencies

Layers 1–3; DGAInfinity, Layer 1 for the comparison with chain homotopy; StablePeriodicCurved,
Layers 0 and 1.

## Layer 5: derived localization, property (P) and compact objects

### 5.1 Quasi-isomorphisms and `D(A,H)`

Restriction along `H → A # H` induces a triangle functor `C(A,H) → H-StMod`. A morphism is a
quasi-isomorphism when its image is invertible. Prove the quasi-isomorphisms form a localizing
class (Qi, Theorem 4.2), that `M` is acyclic exactly when it is projective as an `H`-module, and
that `D(A,H) = C(A,H)[qis⁻¹]` is equivalent to the Verdier quotient of `C(A,H)` by the thick
subcategory of acyclics, Mathlib's `CategoryTheory.ObjectProperty.trW` localization. `D(A,H)` is
triangulated and a right module category over `H-StMod`. *Needs:* Layer 4; DGAInfinity, Layer 7;
Mathlib `CategoryTheory.ObjectProperty.trW`.

**Checks.**

- `A = k`: quasi-isomorphisms are the isomorphisms of `H-StMod` and `D(k,H) = H-StMod`.
- `H = k`: every morphism is a quasi-isomorphism and `D(A,k) = 0`.
- For the exterior Hopf superalgebra, quasi-isomorphisms are the classical quasi-isomorphisms of DG
  modules, and `D(A,H)` is the derived category of DGAInfinity, Layer 5.

### 5.2 Cofibrant modules and property (P)

A `B`-module `P` is cofibrant when every map from `P` to the target of a surjective
quasi-isomorphism lifts (Qi, Definition 6.1). Prove `P` is cofibrant exactly when it is projective
as an `A`-module and `Hom_A(P, K)` is a projective `H`-module for every acyclic `K` (Qi,
Corollary 6.9). Call `P` cellular when it has an exhaustive filtration by `B`-submodules, split
over `A`, whose layers are `B`-isomorphic to `A ⊗ V` for `H`-modules `V` with the action
`(a # h)(b ⊗ v) = Σ a(h₁·b) ⊗ h₂v`; Qi's layers are sums of `A ⊗ V` with `V` indecomposable, and
the two notions agree by refining along the radical filtration of `V`. A module has property (P)
when it is isomorphic in `C(A,H)` to a cellular module (Qi, Definition 6.3). Prove: cellular
modules are cofibrant (Qi, Corollary 6.5); cofibrant modules are the `B`-module retracts of
cellular modules (Qi, Corollary 6.8); the bar resolution is functorial, cellular, and surjects by
quasi-isomorphisms (Qi, Theorem 6.6); morphisms out of cofibrant objects agree in `C(A,H)` and
`D(A,H)`; and the full subcategories on cellular and on cofibrant objects are each equivalent to
`D(A,H)` (Qi, Corollary 6.10). *Needs:* §5.1.

**Checks.**

- `H = k`, `A = k[t]/(t²)`, `M = A/(t)`: `C(A,k) = 0`, so `M` has property (P), but every surjection
  is a quasi-isomorphism, so cofibrant means `A`-projective, which `M` is not.
- For nonsemisimple `H` acting trivially on the same `A`, `M ⊗ H` is relatively projective, zero in
  `C(A,H)` and so has property (P), but the surjective quasi-isomorphism `A ⊗ H → M ⊗ H` has no
  section.
- `A ⊗ V` is cellular with a one-step filtration, hence cofibrant.

### 5.3 Compact generation and finiteness

Compactness of `P` in `D(A,H)` is preservation of coproducts by `Hom(P, −)` into abelian groups
(Qi, Definition 7.1). Prove `D(A,H)` is compactly generated by the finite set `{A ⊗ V}`, `V` simple
(Qi, Proposition 7.6), and that the compact objects are the thick envelope
`CategoryTheory.ObjectProperty.triangEnvelope` of these generators (Qi, Corollary 7.15). Prove
`A` is left Noetherian iff `A # H` is, using finite freeness of `A # H` over `A` on the side given by
the antipode normal form; define `Dᵇ(A,H)` (objects isomorphic to finitely generated `A`-modules)
and `Dᶠ(A,H)` (finite length over `A`) (Qi, Definition 9.1). For Artinian `A`, compact objects are
isomorphic to finite projective `A`-modules (Qi, Lemma 9.6). For `A` smooth (finite projective
bimodule resolution, Qi, Definition 9.4), basic in Qi's split sense (all simple modules
one-dimensional, Qi, Definition 9.3) and with trivial `H`-action, `Dᶜ(A,H) ≃ Dᶠ(A,H)` (Qi,
Proposition 9.8). For Qi–Sussan's `p`-DG algebras `A = A_n^!`, the categorified Jones–Wenzl
projector has a finite-cell representative if and only if `p` divides `n − 1` (Qi–Sussan 2017,
Theorem 5.5). *Needs:* §§5.1–5.2; Mathlib `CategoryTheory.ObjectProperty.triangEnvelope`.

**Checks.**

- `A = k`: the compact objects of `D(k,H) = H-StMod` are the objects isomorphic to
  finite-dimensional modules, `H-stmod` (Qi, Corollary 9.9).
- Over `k = ℝ`, `A = ℂ` with trivial action is Artinian and smooth but not basic in Qi's sense
  (its simple module is two-dimensional), so the smooth-basic comparison does not apply.
- `n = p + 1`: `p ∣ n − 1`, so the Jones–Wenzl projector is finite-cell; `n = 2` with `p ≥ 3` is not.

### Examples

`H = k[d]/(d²)` in characteristic two with a DG algebra `A`: compact objects are perfect DG modules,
recovering DGAInfinity, Layer 5.

### Dependencies

Layer 4; DGAInfinity, Layers 5 and 7; Mathlib triangulated envelopes and `trW`.

## Layer 6: Grothendieck groups and rings

### 6.1 Stable and compact-derived `K₀`

Using GrothendieckEulerForms, Layer 2, form `K₀(H-stmod)`; the tensor product makes it a ring
(commutative when `H` is cocommutative), the quotient of the representation ring by the classes of
projectives. Define `K₀(A,H) = K₀(Dᶜ(A,H))`, a right `K₀(H-stmod)`-module through the tensor action
(Qi, §9; Khovanov, Corollary 1, states the left-module form for left comodule algebras). Define `G₀(A,H)` from `Dᵇ(A,H)` and `G₀ᶠ(A,H)` from `Dᶠ(A,H)` for
Noetherian `A`. State Qi's pairing as `Dᶜ(A,H) × Dᶠ(A,H) → H-StMod`, or into `Dᶠ(k,H)` when the
finite-length modules in play are finite-dimensional over `k`. When `A` is commutative and `H`
cocommutative, construct the internal tensor product and the ring `K₀(A,H)`. For smooth basic `A`
with trivial action, prove `K₀(A,H) ≅ K₀(A) ⊗_ℤ K₀(H-stmod)` (Qi, Proposition 9.10), and its
graded form over `ℤ[q,q⁻¹]`. *Needs:* Layers 2 and 5; GrothendieckEulerForms, Layers 2 and 6.

**Checks.**

- The finite-target pairing fails without finite dimension: `k = 𝔽₂`, `H = k[d]/(d²)`, `A = k(t)`
  with trivial action, `P = M = A`; the derived Hom is `A` with `d = 0`, and its stable invariants are
  `A`, infinite-dimensional over `k`, so it does not lie in `Dᶠ(k,H)`.
- `H = k[d]/(d²)` in characteristic two, graded with `deg d = 1`: `K₀(H-stmod) = ℤ[q,q⁻¹]/(1 + q)`.
- `A = k`: `K₀(k,H) = K₀(H-stmod)` as a module over itself.

### Examples

For `H = k[d]/(d^p)` graded with `deg d = 1` and `A = k`, `K₀ = ℤ[q,q⁻¹]/(1 + q + ⋯ + q^(p−1))`
(Layer 7).

### Dependencies

Layers 2 and 5; GrothendieckEulerForms, Layers 0, 2 and 6.

## Layer 7: differential, super, Nichols, Sweedler and Taft examples

### 7.1 The characteristic-zero obstruction and the two sign repairs

Prove that an ordinary bialgebra over a field with `char k ≠ 2` has no nonzero primitive `d` with
`d² = 0`: by `TauCeti.Bialgebra.comul_pow_of_primitive`, `0 = Δ(d²) = 2(d ⊗ d)`, and `d ⊗ d ≠ 0`.
Construct the two repairs. The exterior Hopf superalgebra `E(d)`, `d` odd, `d² = 0`, `Δd = d ⊗ 1 + 1 ⊗ d`,
`Sd = −d`, is a Hopf algebra in super vector spaces, where the super tensor multiplication makes the
middle terms cancel; its module algebras are DG algebras with `d(ab) = d(a)b + (−1)^|a| a d(b)`.
Sweedler's `H₄` (`g² = 1`, `d² = 0`, `gd = −dg`, `Δg = g ⊗ g`, `Δd = d ⊗ 1 + g ⊗ d`, `Sd = −gd`) is its
bosonization; on a module algebra with internal `ℤ`-grading, `g` acts by `(−1)^r` in degree `r`
and `d` raises degree by one. Prove that the hopfological null ideal in these models is the
ordinary chain-homotopy ideal with its signs, comparing with DGAInfinity, Layer 1. *Needs:* Tau
Ceti `TauCeti.Bialgebra.comul_pow_of_primitive`, `TauCeti.InternalGrading`; DGAInfinity, Layers 0–1.

**Checks.**

- In the ordinary tensor product, `(d ⊗ 1 + 1 ⊗ d)² = d² ⊗ 1 + 2(d ⊗ d) + 1 ⊗ d²`; in the super tensor
  product the middle terms are `d ⊗ d + (−1)(d ⊗ d) = 0`.
- In `H₄`, `Δ(d)² = d² ⊗ 1 + (dg + gd) ⊗ d + g² ⊗ d² = 0`, since `dg + gd = 0`.
- In characteristic two `k[d]/(d²)` with `d` primitive is an ordinary Hopf algebra, so the
  obstruction needs `char k ≠ 2`.

### 7.2 Truncated primitives and slash homology

Let `p` be prime and `char k = p`. Construct `H_p = k[d]/(d^p)` with `d` primitive; `(d^p)` is a Hopf
ideal because the intermediate binomial coefficients vanish. Recognize it through the structure
`TruncatedPrimitive` (a primitive `d` with `d^p = 0` whose powers below `p` form a basis) and the
module differential `TruncatedPrimitive.moduleDifferential`. Module algebras are `p`-DG algebras
with unsigned Leibniz rule. A degree-zero map of `p`-complexes is null exactly when
`f = Σ_{i=0}^{p−1} d_N^i h d_M^(p−1−i)` with `h` of degree `1 − p` (degree `2 − 2p` in Qi–Sussan's
regrading). Define `SlashHomology`, `H^{/j}(M) = ker(d^(j+1)) / (im(d^(p−j−1)) + ker(d^j))` for
`0 ≤ j ≤ p − 2` (Khovanov–Qi, §2, p. 14), whose denominator lies in the cycles when `d^p = 0`. Prove
homotopy invariance and `slashHomology_subsingleton_iff_projective`: a finite-dimensional module is
projective iff all its slash homology groups vanish (Khovanov–Qi, §2, p. 14, decomposition (20)
of a module as slash homology plus a maximal projective summand). Prove
`K₀(H_p-stmod) ≅ ℤ[q,q⁻¹]/(1 + q + ⋯ + q^(p−1))` for `deg d = 1`, which equals
`ℤ[q,q⁻¹]/(Φ_p(q))` by `Polynomial.cyclotomic_prime` (Khovanov, Proposition 5). *Needs:* §7.1;
Layer 2; GrothendieckEulerForms, Layer 6; Mathlib `Polynomial.cyclotomic_prime`.

**Checks.**

- `p = 2`: `H^{/0}(M) = ker d / im d`, ordinary homology.
- `p = 3`, `M = k` with `d = 0`: `H^{/0} = k`, `H^{/1} = 0`; `M = k[d]/(d²)`: `H^{/0} = kd` and
  `H^{/1} = k`, both nonzero, and `M` is not projective; `M = H₃`: both vanish.
- In characteristic two, `k[d]/(d⁴)` is also a Hopf algebra (Frobenius twice), with
  `K₀ = ℤ[q,q⁻¹]/(1 + q + q² + q³)`, which is not `ℤ[q,q⁻¹]/(Φ₄)`: the cyclotomic identity is for
  prime exponent only.

### 7.3 The bicharacter-braided graded ambient, Nichols algebras and bosonization

Build the category of `G`-graded vector spaces, `G` an abelian group, with tensor graded by total
degree and, for a bicharacter `χ : G × G → kˣ`, the braiding `v ⊗ w ↦ χ(|v|,|w|) w ⊗ v`; it covers
`G = ℤ`, `χ(i,j) = q^(ij)` and the super case `G = ℤ/2`, `χ(i,j) = (−1)^(ij)`. A Hopf algebra in it is
a Hopf monoid `CategoryTheory.HopfObj`; prove the equivalence with records of graded pieces,
braided tensor multiplication and Hopf equations. Construct Yetter–Drinfeld modules, braided
primitives, Nichols algebras in the finite diagonal cases used here, and the Radford–Majid
bosonization, with the monoidal equivalence between internal modules and rational modules over the
bosonization (Laugwitz–Qi, Proposition 3.1 and Proposition 3.3). For `N ≥ 2` and `q` a primitive
`N`th root with `char k ∤ N`, construct the Nichols algebra `k[d]/(d^N)` with `q`-binomial coproduct.
Its bosonization is the Taft algebra `K^N = 1`, `d^N = 0`, `Kd = qdK`, `ΔK = K ⊗ K`,
`Δd = d ⊗ 1 + K ⊗ d`, `SK = K⁻¹`, `Sd = −K⁻¹d`, of dimension `N²`, whose module algebras satisfy
`d(ab) = d(a)b + (K·a)d(b)`. Prove Khovanov's `K₀ ≅ ℤ[q,q⁻¹]/(1 + q + ⋯ + q^(N−1))` for the graded
Taft stable category (Khovanov, Proposition 7; Qi, §4.3, p. 19). *Needs:* §§7.1–7.2; Mathlib
`CategoryTheory.HopfObj`; Tau Ceti `TauCeti.GradedModuleCat`; GrothendieckEulerForms, Layer 6.

**Checks.**

- `q = −1`, `N = 2` gives the exterior superalgebra and Sweedler's `H₄`.
- `N = 1` gives `k[d]/(d) = k`, losing the generator; `q = 1` in characteristic zero gives the
  polynomial algebra `k[d]`, not a truncation. Both are excluded by `N ≥ 2` and primitivity.
- Taft with `N = 3`: `α(K) = q` and `dim = 9`; `N = 4`: `1 + q + q² + q³ = Φ₂Φ₄`, not `Φ₄`, so the
  Taft category does not categorify the fourth cyclotomic integers.

### Examples

`E(d)`, `H₄`, `k[d]/(d^p)` in characteristic `p`, and the Taft algebras.

### Dependencies

Layers 2, 3 and 6; Tau Ceti `TauCeti.Bialgebra.comul_pow_of_primitive`, `TauCeti.GradedModuleCat`;
DGAInfinity, Layers 0–1; GrothendieckEulerForms, Layer 6.

## Layer 8: the Laugwitz–Qi cyclotomic construction

### 8.1 Factorization data, `H_n` and its bosonization

For an integer `n ≥ 2` write `n = ∏_{k=1}^t p_k^{a_k}` with distinct primes and `a_k ≥ 1`, and put
`m = ∏ p_k`, `N = n²/m`, `n_k = n/p_k`, `m_k = m/p_k`; these are derived from the factorization,
never independent parameters. Let `q ∈ k` be a primitive `N`th root, so `char k ∤ N`; put
`ξ = q^(n/m)`, a primitive `n`th root, and `ξ_k = ξ^(m_k) = q^(n_k)`, of order `p_k·(n/m)`. The
self-braiding `ξ_k^(n_k) = q^(n_k²)` has order `p_k`. In `q`-graded vector spaces define
`H_n = k[d₁, …, d_t]/(d_k^(p_k))`, `deg d_k = n_k`, with commuting braided-primitive generators,
`S(d_k) = −d_k`, Frobenius trace on the top monomial and integral `∏ d_k^(p_k − 1)` (Laugwitz–Qi,
Definition 3.5, Lemmas 3.6 and 3.7). Its bosonization by `C_N` has `K^N = 1`, `Kd_k = ξ_k d_k K`,
`Δd_k = d_k ⊗ 1 + K^(n_k) ⊗ d_k`, `Sd_k = −K^(−n_k)d_k`, basis `K^j d₁^(e₁)⋯d_t^(e_t)` and dimension
`N·m` (Laugwitz–Qi, Lemmas 3.11 and 3.12). Rational graded modules recover graded `H_n`-modules,
objects of `TauCeti.GradedModuleCat`, monoidally. The square of the braiding on `H_n ⊗ H_n` is in
general nontrivial. *Needs:* §7.3; Tau Ceti `TauCeti.GradedModuleCat`; Mathlib `IsPrimitiveRoot`.

**Checks.**

- `n = 4`: `t = 1`, `m = 2`, `N = 8`, `n₁ = 2`; `ξ₁ = q²` has order `4`, not `2`, while
  `ξ₁^(n₁) = q⁴` has order `2 = p₁`. `H_4 = k[d]/(d²)` with `deg d = 2`, bosonization of dimension `16`.
- `n = 6`: `m = N = 6`, `(n₁, n₂) = (3, 2)`, `dim H_6 = 6`, bosonization of dimension `36`.
- A prime list omitting a divisor of `n` (for `n = 12`, the list `(2)`) violates
  `n = ∏ p_k^{a_k}`.

### 8.2 The ideal `I`, the quotient `O_n` and its Grothendieck ring

Let `H_n-gmod` be the stable category of finite-dimensional graded `H_n`-modules, monoidal through
the braided coproduct. For `t > 1` let `W_k = H_n ⊗_{H_{n_k}} k`, `H_{n_k} = k[d_k]/(d_k^(p_k))`,
and let `I_k` consist of direct summands of modules with a finite filtration by graded
submodules whose layers are shifts `W_k{r}` (Laugwitz–Qi, Definitions 4.4 and 4.5); for `t = 1`,
`I_1` is the projective-injectives. `I` consists of objects isomorphic to `U₁ ⊕ ⋯ ⊕ U_t` with
`U_k ∈ I_k` (Laugwitz–Qi, Definition 4.12). Prove Laugwitz–Qi Proposition 4.16: for `k ≠ l`, every
degree-zero map from an object of `I_k` to one of `I_l` factors through a graded projective; first
for shifts of `W_k` and `W_l`, then by dévissage. Prove that `I` is a thick two-sided tensor ideal
of `H_n-gmod` (Laugwitz–Qi, Theorem 5.5), form `O_n` as the `CategoryTheory.ObjectProperty.trW`
localization (Laugwitz–Qi, Definition 5.6) with monoidal localization functor and descended
tensor and Hom functors (Laugwitz–Qi, Lemma 5.8). With `v_k = 1 + ν^(n_k) + ⋯ + ν^((p_k−1)n_k)`, the
graded dimension of `H_{n_k}`, and `w_k = ∏_{l≠k} v_l`, the graded dimension of `W_k` (Laugwitz–Qi,
equation (4.5)), prove `K₀(H_n-gmod) ≅ ℤ[ν,ν⁻¹]/(v₁⋯v_t)` (Laugwitz–Qi, Lemma 5.14) and, as rings
with `[k{1}] ↦ ν`:

- for `t ≥ 2`, `K₀(O_n) ≅ ℤ[ν,ν⁻¹]/(w₁, …, w_t)`;
- for `t ≤ 2`, `K₀(O_n) ≅ ℤ[ν,ν⁻¹]/(Φ_n(ν))`.

Route: `K₀` of the Verdier quotient by a thick subcategory is `K₀(H_n-gmod)` modulo the classes of
`I` (GrothendieckEulerForms, Layer 2); objects of `I_k` are graded free over the subalgebra
generated by the `d_l`, `l ≠ k`, so their classes are multiples of `w_k`, and `[W_k{r}] = ν^r w_k`.
For `t = 2`, `n = p^a q^b`, `v₁ = Φ_n x`, `v₂ = Φ_n y` with `(x, y)` the unit ideal of `ℤ[ν]`, since
a maximal ideal containing `Φ_d` and `Φ_e` forces `d/e` to be a power of the residue
characteristic. For `t ≥ 3` the cyclotomic identification fails, although Laugwitz–Qi Theorem 5.15
(arXiv v4, pp. 27–28) asserts it for every `n`: each `w_k` is divisible by `Φ_n^(t−1)`, so reduction
modulo `Φ_n²` is a surjective ring map `K₀(O_n) → ℤ[ν,ν⁻¹]/(Φ_n²)` with `Φ_n([k{1}]) ↦ Φ_n(ν) ≠ 0`;
the gap is the gcd step in the final paragraph of that proof. *Needs:* §8.1; Layers 2 and 6;
GrothendieckEulerForms, Layers 2 and 6; Mathlib `CategoryTheory.ObjectProperty.trW`,
`Polynomial.cyclotomic`.

**Checks.**

- `n = 30`, `(p_k) = (2,3,5)`, `(n_k) = (15,10,6)`: `v₁ = 1 + ν^15`, `v₂ = 1 + ν^10 + ν^20`,
  `v₃ = 1 + ν^6 + ⋯ + ν^24`, each with `Φ₃₀` to multiplicity one; the gcd of `w₁, w₂, w₃` over `ℚ` is
  `Φ₆Φ₁₀Φ₁₅Φ₃₀²` of degree `30`, so `K₀(O₃₀)` has rank `30`, not `φ(30) = 8`.
- `n = 6`: `v₁ = 1 + ν³ = Φ₂Φ₆`, `v₂ = 1 + ν² + ν⁴ = Φ₃Φ₆`, and `(1 + ν + ν²) − ν(1 + ν) = 1`, so
  `K₀(O₆) ≅ ℤ[ν,ν⁻¹]/(ν² − ν + 1)`.
- `n = 4`, `t = 1`: `I_1` is the projectives and `K₀(O₄) ≅ ℤ[ν,ν⁻¹]/(1 + ν²)`; the `t ≥ 2` formula
  with the empty product `w₁ = 1` would give the zero ring.
- `n = 12`: the gcd of `w₁ = 1 + ν⁴ + ν⁸` and `w₂ = 1 + ν⁶` over `ℚ` is `Φ₁₂`, of degree `4 = φ(12)`.

### Examples

For `n = p^a`, `O_n` is the homotopy category of graded `p`-complexes with differential of degree
`p^(a−1)`; in characteristic zero `H_n` is a braided lift, never an ordinary primitive truncated
polynomial Hopf algebra.

### Dependencies

Layers 2, 6 and 7; Tau Ceti `TauCeti.GradedModuleCat`; GrothendieckEulerForms, Layers 2 and 6;
Mathlib `CategoryTheory.ObjectProperty.trW`, `Polynomial.cyclotomic`.

## Downstream consumers

StablePeriodicCurved cites this roadmap as the owner of the hopfological quotient of modules over a
module algebra, kept distinct from its stable quotients. The tensor-triangulated categories
`H-StMod`, `C(A,H)`, `D(A,H)` and `O_n` are inputs for root-of-unity categorification; this roadmap
builds no Jones invariant and no lattice categorification.

## References

- M. Khovanov, [*Hopfological algebra and categorification at a root of unity: the first
  steps*](https://arxiv.org/abs/math/0509083), J. Knot Theory Ramifications 25 (2016), no. 3,
  1640006. Numbering of arXiv v2.
- Y. Qi, [*Hopfological algebra*](https://arxiv.org/abs/1205.1814), Compos. Math. 150 (2014), 1–45,
  [doi:10.1112/S0010437X13007380](https://doi.org/10.1112/S0010437X13007380). Numbering of arXiv v2.
- M. Khovanov and Y. Qi, [*An approach to categorification of some small quantum
  groups*](https://arxiv.org/abs/1208.0616), Quantum Topol. 6 (2015), 185–311. Pages of arXiv v3.
- Y. Qi and J. Sussan, [*Categorification at prime roots of unity and hopfological
  finiteness*](https://arxiv.org/abs/1509.00438), Contemp. Math. 683 (2017), 261–286.
- R. Laugwitz and Y. Qi, [*A categorification of cyclotomic rings*](https://arxiv.org/abs/1804.01478),
  Quantum Topol. 13 (2022), 539–577, [doi:10.4171/QT/172](https://doi.org/10.4171/QT/172). Pages of
  arXiv v4.
- D. Fischman, S. Montgomery and H.-J. Schneider, [*Frobenius extensions of subalgebras of Hopf
  algebras*](https://doi.org/10.1090/S0002-9947-97-01814-X), Trans. Amer. Math. Soc. 349 (1997),
  4857–4895.
- K. Erdmann, Ø. Solberg and X. Wang, [*On the structure and cohomology ring of connected Hopf
  algebras*](https://arxiv.org/abs/1710.11558), J. Algebra 527 (2019), 366–398. Numbering of the
  arXiv preprint.
- R. G. Larson and M. E. Sweedler, *An associative orthogonal bilinear form for Hopf algebras*,
  Amer. J. Math. 91 (1969), 75–94, cited through the two preceding references.
- S. Montgomery, *Hopf Algebras and Their Actions on Rings*, CBMS 82, AMS, 1993.
- D. E. Radford, *The structure of Hopf algebras with a projection*, J. Algebra 92 (1985), 322–347;
  S. Majid, [*Comments on bosonisation and biproducts*](https://arxiv.org/abs/q-alg/9512028), 1995.
- M. Kapranov, [*On the q-analog of homological algebra*](https://arxiv.org/abs/q-alg/9611005), 1996.
