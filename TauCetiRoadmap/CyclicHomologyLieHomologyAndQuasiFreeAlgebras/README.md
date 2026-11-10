# Roadmap: cyclic homology, Lie algebra homology of matrices and quasi-free algebras

**Summary.** Build, on the cyclic homology of RefinedTraceMethods and KTheoryFiniteLocalFields,
the classical theorems that connect it with Lie algebras, with derivations and nilpotent
extensions, with noncommutative smoothness and with rings without unit. The carriers are
associative unital algebras `A` over a commutative ring `k` (a field of characteristic zero where
said), Lie algebras over `k` with Mathlib's `LieRing` and `LieAlgebra`, tensor powers
`⨂[k] _ : Fin p, Fin r → k` with Mathlib's `PiTensorProduct`, `k`-algebra maps `A →ₐ[k] R`, and
nonunital rings through Mathlib's `Unitization`. The end theorems are: Connes' description of
cyclic homology as `Tor` over the cyclic category, `HC_n(X) ≅ Tor_n^(kΛᵒᵖ)(k♮, X)` for every
cyclic `k`-module `X`, its dual `HC^n(A) ≅ Ext^n_(kΛ)(A♮, k♮)` over a field of characteristic
zero, and the cyclic homology of tensor algebras (Layer 1); for a field `k` of characteristic zero
and every unital `k`-algebra `A`, the Loday–Quillen–Tsygan theorem
`Prim H_n(𝔤𝔩(A); k) ≅ HC_(n−1)(A)`, so that `H_*(𝔤𝔩(A); k)` is the free graded-commutative
algebra on `HC_(*−1)(A)`, with its invariant-theory input (the permutations of the factors of
`(kʳ)^⊗p` span the commutant of `𝔤𝔩_r(k)`, and are linearly independent exactly when `p ≤ r` by
Tau Ceti's faithfulness threshold) and the stability of `H_i(𝔤𝔩_n(A))` for `i < n − 1`, and, over
every field, the isomorphism `H₂(𝔰𝔩(A)) ≅ HC₁(A)` (Layer 2); Goodwillie's theorems: over every
field a derivation acts trivially on periodic cyclic homology, and over a field of
characteristic zero `HP_*(A) → HP_*(A/I)` is an isomorphism for every nilpotent two-sided ideal
`I` (Layer 3); Cuntz–Quillen's quasi-free algebras, defined by lifting along
square-zero extensions, their characterisations (nilpotent lifting, Hochschild cohomological
dimension at most one, projectivity of `Ω¹A`), free algebras as examples and `k[x, y]` as a
non-example, the X-complex, `HP_*(A) ≅ H_*(X̂(R, I))` for every extension `A = R/I` with `R`
quasi-free, the Fedosov product and excision in periodic cyclic homology (Layer 4); Wodzicki's
H-unitality and its equivalence with excision in Hochschild and cyclic homology, the
Suslin–Wodzicki rational excision theorem, firm modules over nonunital rings and their Morita
equivalences, and Quillen's group `K₀′` of a nonunital ring with its Morita invariance (Layer 5).

Suggested home: `TauCeti/Algebra/Homology/Cyclic/` for Layers 1 and 3–4,
`TauCeti/Algebra/Lie/Homology/` for Layer 2, `TauCeti/RingTheory/NonUnital/` for Layer 5.

## Scope and ownership

**Owned here.** The `Tor` and `Ext` descriptions of cyclic homology over Connes' cyclic category,
the classifying space of that category, and the cyclic homology of tensor algebras (Layer 1); the
Chevalley–Eilenberg chain complex `(⋀^• 𝔤, d)` of a Lie algebra over a commutative ring with
trivial coefficients, its homology and the Hopf algebra structure for `𝔤𝔩(A)`, the commutant
of `𝔤𝔩_r` acting on tensor powers and its coinvariant form, the Loday–Quillen–Tsygan theorem, its
low-degree corollary and the stability theorem (Layer 2); the action of derivations on cyclic
homology and Goodwillie's nil-invariance of periodic cyclic homology relative to a field of
characteristic zero (Layer 3); quasi-free algebras, the X-complex, the universal extension with
its Fedosov product, and excision in periodic cyclic homology (Layer 4); H-unitality, excision in
Hochschild and cyclic homology, the Suslin–Wodzicki criterion for rational excision in K-theory,
firm modules over nonunital rings, Morita contexts between them, and the group `K₀′` (Layer 5).
No other roadmap owns the Loday–Quillen–Tsygan theorem, Lie algebra homology of matrices, the
Chevalley–Eilenberg chain complex, quasi-free algebras, the X-complex, H-unitality, Wodzicki
excision, firm modules over noncommutative rings, Morita contexts or Quillen's `K₀′`. The
Chevalley–Eilenberg cochain complexes in all degrees are ArithmeticLocallySymmetricSpaces ALS.F.5
(Lie algebra cochains, relative cochains and invariant forms) and LieGroupoidsPoisson §G1.3 (for a
Lie algebroid over a manifold, and for a Lie algebra in all degrees); 2.1 owns the chain complex
with trivial coefficients over a commutative ring, which neither states, and uses neither. Mathlib
has only low-degree Lie algebra cochains (`LieModule.Cohomology.twoCochain`). The firm and unitary
modules of 5.4, over an arbitrary nonunital ring, are the general statement of which
SmoothRepresentationsOfLocalGroups' nondegenerate modules over an idempotented algebra are an
instance. SmoothRepresentationsOfLocalGroups SR.1.3 (*locally-unital-algebra*) states the
idempotented-algebra case independently and cites nothing here; 5.4 records it as an
instance.

**Left to Tau Ceti.** The action of `Σ_p` and of its group algebra on `(kʳ)^⊗p` by permuting the
factors, the threshold `p ≤ r` for its faithfulness, and Schur–Weyl duality for the diagonal
operators (`TauCeti.permTensorActionAlgHom`, `TauCeti.permTensorActionAlgHom_injective_iff`,
`TauCeti.mem_range_permTensorActionAlgHom_iff_forall_commute`). Target 2.2 consumes them and owns
only the form with the Lie algebra action of `𝔤𝔩_r(k)`. Connes' cyclic cohomology `HCⁿ(A)` of a
unital algebra by cyclic cochains, periodic cyclic cohomology, and the relative cyclic cohomology of
a nonunital algebra through its forced unitisation (`TauCeti.cyclicCohomology`,
`TauCeti.periodicCyclicCohomology`, `TauCeti.relativeCyclicCohomology`), which 1.1's dual, 1.2
and 4.6 consume; the universal forms of a nonunital algebra through its forced unitisation
(`TauCeti.UniversalForms`, `TauCeti.UniversalOneForms`), of which the normalised forms of a unital
algebra in 4.1 and 4.3 are a quotient; and the cyclic quotient `A/[A, A]`
(`TauCeti.cyclicQuotient`), the target of the trace in 2.5.

**Left to RefinedTraceMethods.** Connes' cyclic category `Λ`, cyclic objects and their
presentation by `(d_i, s_j, t_n)` (RefinedTraceMethods §1.1); Connes' operator
`B = (1 − t)sN` and mixed complexes (§1.2); the cyclic, negative cyclic and periodic
totalisations, `HC`, `HC⁻` and `HP` of a mixed complex and of an algebra, the SBI sequence and
the comparison with Connes' complex `C^λ(A) = C(A)/(1 − t)` when `ℚ ⊆ k` (§1.4); Morita
invariance of cyclic homology and the matrix trace (§1.6); Cortiñas' theorem that the obstruction
to excision in rational K-theory is the obstruction to excision in cyclic homology, shifted by one
(§4.18, truncating invariants). RefinedTraceMethods §4.9 states that `HP(−⊗ℚ/ℚ)` is truncating,
hence nil-invariant by its §4.18. 3.2 cites it for `k = ℚ` and keeps the form for `HP` relative to
an arbitrary field `k` of characteristic zero.

**Left to KTheoryFiniteLocalFields.** The cyclic structure on Hochschild chains, the Connes
mixed complex, `HH`, `HC`, `HC⁻`, `HP` of an algebra with their functoriality, relative fibres
and products, and the HKR comparison with its characteristic-zero de Rham form
(KTheoryFiniteLocalFields §4.0, `cyclicHomologyModel`).

**Left to the K-theory roadmaps.** Reduced `K₀` and `K₁` of a nonunital ring through its Dorroh
unitisation (AlgebraicKTheory §3.4); K-theory of nonunital rings as a relative fibre and the
definition of absolute excision with Suslin's integral `Tor` criterion (GeneralAlgebraicKTheory
§§8.3 and 8.10). Layer 5 consumes them.

**Left to TopologicalKTheory.** Relative K-theory `K⁰(X, Y)` of a compact pair through bounded
complexes of vector bundles exact on `Y` (TopologicalKTheory T3.2), the topological model of
Quillen's `K₀′` of 5.6.

**Neighbouring constructions.** NoncommutativeGeometry N1 constructs universal differential forms,
cyclic cochains and periodic cyclic cohomology for complex algebras through their forced
unitisation, with locally convex variants; the forms `ΩA` of 4.3 are those of a unital algebra
over a field `k` of characteristic zero, and for a unital complex algebra they are N1's
normalized forms. PerfectoidSpaces P0.4 defines firm modules for the idempotent ideal `m̃` of a
basic setup of almost mathematics over a commutative ring; 5.4 treats modules over an arbitrary
nonunital ring and uses nothing from P0.4.

**Out of scope.** Topological and bivariant versions beyond the statement of 4.6 (entire cyclic
cohomology, Fréchet completions, the bivariant Chern character), the cyclic homology of group
algebras and of smooth functions on manifolds, Hochschild homology of schemes, Loday's rank
filtration of `HC_(*−1)(A)` inside `H_*(𝔤𝔩(A))` and the representation-theoretic refinements of
the Loday–Quillen–Tsygan theorem (Hanlon, Feigin–Tsygan), the Hermitian and orthogonal analogues
for `𝔬(A)` and `𝔰𝔭(A)`, Quillen's derived categories of firm modules, and the finer theory of firm
modules that 5.4 and 5.5 do not state: Marín's equivalence of closed modules and his
characterisation of the Morita contexts that induce equivalences of firm modules (left acceptable
contexts) (Marín 1998), left xst rings and the abelian category of their firm modules, and the
González-Férez–Marín ring whose firm left modules do not form an abelian category
(González-Férez–Marín 2007).

## Conventions

1. **Ground rings.** Layer 1 (except 1.1's dual and the operator `S` of 1.2; 1.4 for a flat
   `k`-module `V`), 2.1's complex and its `Tor` comparison, 2.5 (for `A` free as a `k`-module),
   4.1's definition and nilpotent lifting, 4.2's free algebras, 5.1, and 5.2 (for `k`-flat
   algebras) work over a commutative ring `k`; 3.1 and everything else in 4.1–4.2 take `k` a
   field; 1.1's dual, the operator `S` of 1.2, 2.1's Hopf structure, 2.2–2.4, 2.6, 3.2 and 4.3–4.6
   take `k` a field of characteristic zero, as Loday–Quillen §6, Goodwillie's nil-invariance and
   Cuntz–Quillen do. Hochschild and cyclic homology over `k` are those of RefinedTraceMethods §1.4
   and KTheoryFiniteLocalFields §4.0, derived (computed from a `k`-flat resolution) when the
   algebra is not `k`-flat; on a `k`-flat algebra they are the homology of the Hochschild complex
   itself, which is what 1.4, 3.1 and 5.2 use. Witness: the reduced cyclic homology `H̄C₁(k[x])` is
   `0` for `k = ℚ` and nonzero for `k = 𝔽₂` (1.4, Checks), so the characteristic-zero hypothesis of
   the later layers is not decorative.
2. **Cyclic operator and Connes' complex.** `t(a₀ ⊗ ⋯ ⊗ a_n) = (−1)^n a_n ⊗ a₀ ⊗ ⋯ ⊗ a_(n−1)`,
   the signed operator of RefinedTraceMethods §1.2, and `C^λ_n(A) = A^⊗(n+1)/(1 − t)` with the
   Hochschild boundary `b(a₀ ⊗ a₁) = a₀a₁ − a₁a₀` (Loday–Quillen 1984, §1). Witness: in degree
   one `t(a ⊗ a) = −a ⊗ a`, so `2 (a ⊗ a) = 0` in `C^λ₁(A)`; with the unsigned rotation `a ⊗ a`
   would survive.
3. **Chevalley–Eilenberg differential.** On `⋀^n 𝔤`,
   `d(x₁ ∧ ⋯ ∧ x_n) = Σ_(i<j) (−1)^(i+j) [x_i, x_j] ∧ x₁ ∧ ⋯ x̂_i ⋯ x̂_j ⋯ ∧ x_n`
   (Loday–Quillen 1984, §6, p. 583). Witness: `d(x ∧ y) = −[x, y]`, so `H₁(𝔤) = 𝔤/[𝔤, 𝔤]`; for
   the two-dimensional nonabelian algebra `[x, y] = y`, `H₁ = k·x̄`.
4. **The degree shift.** `Prim H_n(𝔤𝔩(A)) ≅ HC_(n−1)(A)` through `Tr ∘ λ` with
   `λ(x₀ ∧ ⋯ ∧ x_n) = (−1)^n Σ_σ sgn(σ) (x₀, x_σ1, …, x_σn)` (Loday–Quillen 1984, Lemma 6.1,
   p. 584). Witness: for `n = 1`, `H₁(𝔤𝔩(A)) = 𝔤𝔩(A)/[𝔤𝔩(A), 𝔤𝔩(A)] ≅ A/[A, A] = HC₀(A)` by the
   trace; without the shift `H₁` would be compared with `HC₁(A)`, which is `0` for `A = k`.
5. **Square-zero and nilpotent.** A square-zero extension is a surjective algebra map whose
   kernel has all products zero; nilpotent of order `n` means every product of `n` kernel
   elements vanishes. Witness: `k[ε]/(ε²) → k` is square-zero; `k[x]/(x³) → k` is nilpotent of
   order 3 and not square-zero (`x · x ≠ 0`).
6. **The X-complex.** `X(R)` is `ℤ/2`-graded with `X₀ = R`, `X₁ = Ω¹R_♮ = Ω¹R/[R, Ω¹R]`,
   `♮d : X₀ → X₁` and `b : X₁ → X₀`, `b(♮(x dy)) = [x, y]` (Cuntz–Quillen 1995b, §4, p. 392).
   Witness: for
   `R = k[x]` over `ℚ ⊆ k`, `b = 0` and `♮d = d : k[x] → k[x]dx`, so `H₀ = k`, `H₁ = 0`, the
   periodic cyclic homology of `k`.
7. **The bar complex.** `B_q(A) = A^⊗q` for `q ≥ 1`, with
   `b′(a₁ ⊗ ⋯ ⊗ a_q) = Σ_(i=1)^(q−1) (−1)^(i−1) a₁ ⊗ ⋯ ⊗ a_i a_(i+1) ⊗ ⋯ ⊗ a_q`
   (Wodzicki 1989, (2), p. 592). Witness: `b′(a ⊗ b) = ab`, so `H₁(B(A)) = A/A²`.
8. **Modules over nonunital rings.** Modules are left modules unless said; for a nonunital ring
   `A`, an `A`-module is a module over `Unitization ℤ A`, and `A ⊗_A M` is
   `(A ⊗_ℤ M)/⟨ab ⊗ m − a ⊗ bm⟩`. Witness: for `A = 2ℤ` and `M = ℤ/2` with `2ℤ` acting by zero,
   `A ⊗_A M ≅ ℤ/2` while `AM = 0`: the multiplication map is zero and not bijective.

## Exact supplier contracts

**From Mathlib** (at the pins).

- Tensor powers and permutations: `PiTensorProduct` with `PiTensorProduct.tprod`,
  `PiTensorProduct.map`, `Equiv.Perm`, `MonoidAlgebra`, `Module.End`, `Commute`, `AlgHom.range`,
  `Function.update`.
- Lie algebras: `LieRing`, `LieAlgebra`, `LieSubalgebra`, `UniversalEnvelopingAlgebra`,
  `exteriorPower` (`⋀[R]^n M`), `Matrix`, `Matrix.trace`, `LieAlgebra.SpecialLinear.sl`.
- Algebras: `AlgHom`, `FreeAlgebra` with `FreeAlgebra.lift` and `FreeAlgebra.ι`, `MvPolynomial`,
  `Polynomial`, `Algebra.TensorProduct`, `MulOpposite`, `KaehlerDifferential`, `List.prod`,
  `TwoSidedIdeal`, `Unitization`, `instModuleTensorProductMop` (`A` as an `A ⊗[k] Aᵐᵒᵖ`-module).
- Homological algebra: `ChainComplex`, `HomologicalComplex.homology`, `ModuleCat`,
  `CategoryTheory.Abelian.Ext`, `CategoryTheory.HasProjectiveDimensionLE`, `Module.Projective`,
  `Module.Flat`.
- Simplicial and homotopical: `CategoryTheory.nerve`, `SSet.toTop`, `HomotopyGroup`.

**From Tau Ceti** (at the pin).

- In `TauCeti/RepresentationTheory/Symmetric/TensorAction/`: `Basic.lean`
  (`TauCeti.permTensorAction`, `TauCeti.permTensorActionAlgHom`, the action of `Σ_p` and of
  `k[Σ_p] = MonoidAlgebra k (Equiv.Perm (Fin p))` on `(kʳ)^⊗p` by permuting the factors),
  `Faithful.lean` (`TauCeti.permTensorActionAlgHom_injective_iff`: injective if and only if
  `p ≤ r`, over a nontrivial commutative ring), `SchurWeyl.lean`
  (`TauCeti.mem_range_permTensorActionAlgHom_iff_forall_commute`: over a field in which `p!` is
  nonzero, the range is the commutant of the diagonal operators `f^⊗p`).
- `TauCeti.cyclicCohomology`, in `TauCeti/RingTheory/CyclicCohomology/Cohomology.lean`: Connes'
  cyclic cohomology `HCⁿ(A; M)` of a unital algebra, the cohomology of the cyclic cochains; over a
  ground ring containing `ℚ` it agrees with the cohomology of the cyclic bicomplex.
- `TauCeti.periodicCyclicCohomology`, in
  `TauCeti/RingTheory/CyclicCohomology/PeriodicCohomology.lean`: `HPⁿ(A; M)`, the direct limit of
  the cohomology of the total cyclic bicomplex in degrees `n + 2m` under `S`.
- `TauCeti.relativeCyclicCohomology`, in `TauCeti/RingTheory/CyclicCohomology/Relative.lean`: the
  cyclic cohomology of a nonunital algebra relative to the ground ring, through its forced
  unitisation.
- `TauCeti.UniversalForms`, in `TauCeti/NoncommutativeGeometry/UniversalDifferential/Complex.lean`,
  and `TauCeti.UniversalOneForms`, in
  `TauCeti/NoncommutativeGeometry/UniversalDifferential/OneForms.lean`: the universal forms
  `A⁺ ⊗ A^⊗n` of a nonunital algebra with the forced unitisation `A⁺` kept even when `A` has a
  unit, and the universal one-forms as the kernel of the multiplication of `A⁺ ⊗ A⁺`.
- `TauCeti.cyclicQuotient`, in `TauCeti/Algebra/Algebra/CyclicQuotient.lean`: the cyclic quotient
  `A/[A, A]`.

**From RefinedTraceMethods.** §1.1 (Connes' cyclic category `Λ`, cyclic objects of a category as
functors `Λᵒᵖ ⥤ C`, the inclusion `Δ → Λ`, the presentation by `(d_i, s_j, t_n)`); §1.2 (Connes'
operator `B`, mixed complexes, the normalised mixed complex of a cyclic module); §1.4 (`HC`,
`HC⁻`, `HP` of a mixed complex and of an algebra, the SBI sequence, the comparison with Connes'
complex when `ℚ ⊆ k`); §1.6 (Morita invariance of cyclic homology, the matrix trace
`HC_*(M_r(A)) ≅ HC_*(A)`); §4.9 (`HP(−⊗ℚ/ℚ)` is a truncating invariant); §4.18 (truncating
invariants are nil-invariant, and Cortiñas' theorem: the obstruction to excision in rational
K-theory is that in cyclic homology, shifted by one).

**From KTheoryFiniteLocalFields.** §4.0 (`cyclicHomologyModel`: Hochschild homology `HH_*(A/k)`,
`HC_*(A/k)`, `HP_*(A/k)` with functoriality in algebra maps, relative fibres for an ideal and the
characteristic-zero HKR comparison).

**From AlgebraicKTheory.** §3.4 (reduced `K₀(J) = ker(K₀(J⁺) → K₀(ℤ))` of a nonunital ring `J`
with `J⁺ = Unitization ℤ J`, functorial in nonunital homomorphisms).

**From GeneralAlgebraicKTheory.** §8.3 (K-theory of a nonunital ring as the fibre of its
unitisation augmentation, and the comparison map to the relative K-theory of a pair `(R, I)`);
§8.10 (absolute excision in degree `n`, quantified over every unital ring containing `I` as a
two-sided ideal).

## How to read the build

Layer 1 extends RefinedTraceMethods' cyclic category to Connes' `Tor` and `Ext` description of
cyclic homology, the classifying space of `Λ` and the cyclic homology of tensor algebras. Layer 2
defines Lie algebra homology, proves the invariant theory of `𝔤𝔩_r` on tensor powers from Tau Ceti's
Schur–Weyl duality (stated in Lean on Mathlib and Tau Ceti) and deduces the Loday–Quillen–Tsygan
theorem, its corollary in degree two and stability; it uses Layer 1 only through the Connes complex.
Layer 3 is Goodwillie's theory of derivations and nilpotent extensions in periodic cyclic homology.
Layer 4 defines quasi-free algebras by a lifting property on Mathlib's algebra maps (4.1–4.2 stated
in Lean), gives their characterisations and examples, then builds the X-complex and proves that it
computes periodic cyclic homology, using Layer 3's nil-invariance for the independence of the
extension, and ends with excision. Layer 5 treats rings without unit: H-unitality and Wodzicki's
excision, rational excision in K-theory, firm modules and Morita contexts, and Quillen's `K₀′`.

## Layer 1: cyclic homology over the cyclic category

### 1.1 Cyclic homology as Tor over the cyclic category

Define the trivial cyclic module `k♮` (the constant functor `Λᵒᵖ ⥤ ModuleCat k` at `k`) and the
`Tor` groups `Tor_n^(kΛᵒᵖ)(k♮, X)` of a cyclic `k`-module `X`, computed in the abelian category
of functors `Λᵒᵖ ⥤ ModuleCat k`, as the left derived functors of `X ↦ k♮ ⊗_(Λᵒᵖ) X =
colim_(Λᵒᵖ) X`. Prove: for every commutative ring `k` and every cyclic `k`-module `X`,
`HC_n(X) ≅ Tor_n^(kΛᵒᵖ)(k♮, X)`, naturally in `X`, where `HC` is the cyclic homology of the mixed
complex of `X` (RefinedTraceMethods §1.4). Route: the columns of the cyclic bicomplex of the
cyclic module `k[Λ(−, [n])]` assemble into a projective resolution of `k♮` (Loday, *Cyclic
Homology*, §6.2). Over a field of characteristic zero, prove the dual statement
`HC^n(A) ≅ Ext^n_(kΛ)(A♮, k♮)` for a unital `k`-algebra `A` with its cyclic module `A♮`,
`[n] ↦ A^⊗(n+1)`, where `HC^n(A)` is Tau Ceti's `TauCeti.cyclicCohomology` with coefficients in
`k`, Connes' cyclic cochains, which compute the cohomology of the cyclic bicomplex when `ℚ ⊆ k`
(Connes 1983; Connes, *Noncommutative Geometry*, Chapter III, Appendix A, Theorem 10).
*Needs:* RefinedTraceMethods §1.1, §1.2, §1.4; Tau Ceti `TauCeti.cyclicCohomology`; Mathlib
`CategoryTheory.Abelian.Ext`, `ModuleCat`.

**Checks.**

- `X = k♮`: `Tor_n(k♮, k♮)` is `k` for `n` even and `0` for `n` odd, matching `HC_*(k) = k[u⁻¹]`
  of RefinedTraceMethods §1.4; the `Tor` over the simplicial category `Δᵒᵖ` instead would give
  `k` in degree 0 only, the Hochschild homology of `k`.
- `Tor₀(k♮, X) = colim_(Λᵒᵖ) X = X₀/im(d₀ − d₁)`, since `t₀ = id`; for `X = A♮`,
  `d₀(a ⊗ b) = ab` and `d₁(a ⊗ b) = ba`, giving `A/[A, A] = HC₀(A)`. Degree zero does not see the
  cyclic structure, degree two does: `HC₂(k) = k` while `HH₂(k) = 0`.
- Naturality in `X`: the unital map `k → M₂(k)` induces on `HC₀` the map `k → M₂(k)/[M₂(k),
  M₂(k)] ≅ k`, `1 ↦ tr(1) = 2`, under the trace of RefinedTraceMethods §1.6; the isomorphism of
  1.1 commutes with it, so it cannot be built from choices made algebra by algebra.

### 1.2 The cyclic cohomology of the trivial module

Prove: over a commutative ring `k`, `Ext^*_(kΛ)(k♮, k♮)` is the polynomial algebra `k[u]` on a
class `u` of degree 2 under the Yoneda product, and, over a field of characteristic zero, Connes'
periodicity operator `S : HC^n(A) → HC^(n+2)(A)` on `TauCeti.cyclicCohomology` is the Yoneda
product with `u` under 1.1's dual, so that `TauCeti.periodicCyclicCohomology`, the direct limit
under `S`, is the direct limit of `Ext^(n+2m)_(kΛ)(A♮, k♮)` under the product with `u` (Connes
1983; Connes, *Noncommutative Geometry*, Chapter III, Appendix A, Theorem 11 a), which gives
`Ext^*_Λ(ℤ♮, ℤ♮) = ℤ[σ]` with `σ` of degree 2, and the paragraph after it, where the Yoneda
product with `σ` is the operator `S`; Loday, *Cyclic Homology*, §6.2).
*Needs:* 1.1; RefinedTraceMethods §1.4 (the SBI sequence and the operator `S`); Tau Ceti
`TauCeti.cyclicCohomology`, `TauCeti.periodicCyclicCohomology`.

**Checks.**

- In degree 0, `Ext⁰(k♮, k♮) = Hom(k♮, k♮) = k`, the endomorphisms of a constant functor on a
  connected category.
- `Ext¹(k♮, k♮) = HC¹(k) = 0` for `k = ℚ`, by 1.1's dual for `A = k`: the odd cyclic cohomology
  of `k` vanishes, so a class `u` of degree 1 would contradict 1.1.
- `u` is not nilpotent: `Sᵐ : HC⁰(k) → HC^(2m)(k)` is an isomorphism `k ≅ k` for every `m`, so
  `uᵐ ≠ 0`; an exterior algebra on `u` would give `HC⁴(k) = 0`.

### 1.3 The classifying space of the cyclic category

Prove: the geometric realisation `|NΛ|` of the nerve of `Λ` is an
Eilenberg–Mac Lane space `K(ℤ, 2)`: it is path-connected, `π₂(|NΛ|) ≅ ℤ` and `π_n(|NΛ|) = 0` for
`n ≠ 2` (Connes 1983; Connes, *Noncommutative Geometry*, Chapter III, Appendix A, Theorem 11 b),
`BΛ = BS¹ = P^∞(ℂ)`; Dwyer–Hopkins–Kan 1985, §5, p. 287, which records `BΛ ≃ K(ℤ, 2)` from
Connes; Loday, *Cyclic Homology*, Chapter 7). Route:
`|NΛ|` is the homotopy orbit space of a point for the circle action of the realisation of a
cyclic set, `ES¹ ×_(S¹) *`; equivalently, 1.2 computes its cohomology ring `k[u]` and the
paracyclic category `Λ_∞` of RefinedTraceMethods §1.1 has contractible nerve.
*Needs:* 1.2; RefinedTraceMethods §1.1 (`Λ_∞` and the functor `Λ_∞ → Λ`); Mathlib
`CategoryTheory.nerve`, `SSet.toTop`, `HomotopyGroup`.

**Checks.**

- `|NΛ|` is path-connected: every object `[n]` receives a morphism from `[0]`.
- The nerve of the simplex category is contractible, `[0]` being terminal in it, so `Δ → Λ` is
  not a homotopy equivalence: `π₂ = ℤ` comes from the cyclic automorphisms, of order `n + 1` on
  `[n]`, and not from `Δ`.
- `H^*(|NΛ|; k) = k[u]` with `|u| = 2` agrees with `Ext^*_(kΛ)(k♮, k♮)` of 1.2, the cohomology of
  a category with constant coefficients being the cohomology of its nerve.

### 1.4 Cyclic homology of tensor algebras

For a flat `k`-module `V` and the tensor algebra `T(V)`, which is then `k`-flat, so that its
Hochschild and cyclic homology are those of its Hochschild complex (Convention 1), prove: the
reduced cyclic homology is `H̄C_n(T(V)) ≅ ⊕_(m>0) H_n(ℤ/m, V^⊗m)`, where the cyclic group acts on
`V^⊗m` by cyclic permutation `σ` of the factors, with no sign. In particular, if `ℚ ⊆ k`,
`H̄C₀(T(V)) = ⊕_(m>0) V^⊗m/(1 − σ)` and `H̄C_n(T(V)) = 0` for `n > 0` (Loday–Quillen 1984,
Proposition 5.4, p. 583).
*Needs:* RefinedTraceMethods §1.2, §1.4; KTheoryFiniteLocalFields §4.0.

**Checks.**

- `V = k` gives `T(V) = k[x]`; over `ℚ ⊆ k`, `H̄C₀(k[x]) = ⊕_(m>0) k xᵐ` and `H̄C_n = 0` for
  `n > 0`, the homotopy invariance `HC_n(k[x]) = HC_n(k)` for `n ≥ 1` of RefinedTraceMethods
  §1.4.
- Over `k = 𝔽₂` and `V = k`, the summand `m = 2` contributes `H_n(ℤ/2, k) = k` in every degree,
  so `H̄C_n(𝔽₂[x]) ≠ 0` for all `n`: the characteristic-zero vanishing does not hold integrally.
- `V = k²` over `ℚ`, `m = 2`: `V^⊗2/(1 − σ)` has dimension 3 (the symmetric tensors), not 4;
  the commutator quotient of `T(V)` in degree 2 identifies `xy` with `yx`.
- Flatness is needed: for `k = ℤ` and `V = ℤ/2`, `T(V) = ℤ[x]/(2x)` and `T(V)[x⁻¹] = 𝔽₂[x, x⁻¹]`;
  the derived `HH_*(𝔽₂[x, x⁻¹]/ℤ)`, a localisation of `HH_*(T(V)/ℤ)`, contains `HH_*(𝔽₂/ℤ)`, which
  is `𝔽₂` in every even degree, so `HH_n(T(V)/ℤ) ≠ 0` for arbitrarily large `n`, whereas the
  Hochschild complex of `T(V)` has `H_n = 0` for `n ≥ 2` (Loday–Quillen 1984, Lemma 5.2, p. 582),
  the step on which the formula rests.

### Examples

- `A = k`: `A♮ = k♮` and 1.1 gives `HC_*(k) = Tor_*(k♮, k♮)`, `k` in even degrees.
- For a free algebra `k⟨x₁, …, x_d⟩ = T(kᵈ)` over `ℚ`, 1.4 gives `HC₀` the space of cyclic words
  and `HC_n = HC_n(k)` for `n > 0`; 4.2 shows that these algebras are quasi-free, and 4.4 recovers
  `HP_*(T(V)) = HP_*(k)` from the X-complex.

### Dependencies

RefinedTraceMethods §§1.1, 1.2 and 1.4, KTheoryFiniteLocalFields §4.0, Tau Ceti's cyclic
cohomology for 1.1's dual and 1.2, and Mathlib. Within the layer, 1.2 uses 1.1 and 1.3 uses 1.2.

## Layer 2: Lie algebra homology of matrices

### 2.1 Chevalley–Eilenberg homology

Define, for a Lie algebra `𝔤` over a commutative ring `k`, the Chevalley–Eilenberg complex
`(⋀^• 𝔤, d)` with the differential of Convention 3, and `H_n(𝔤; k)` as its homology. For
`𝔤𝔩(A) = colim_r 𝔤𝔩_r(A)` over a field `k` of characteristic zero, define the product
`H_*(𝔤𝔩(A)) ⊗ H_*(𝔤𝔩(A)) → H_*(𝔤𝔩(A))` induced by the direct sum `𝔤𝔩_r ⊕ 𝔤𝔩_s → 𝔤𝔩_(r+s)` and
the coproduct induced by the diagonal (Loday–Quillen 1984, §6, pp. 583–584, where `k` has
characteristic zero throughout the section). Prove:

- `d² = 0`, over every commutative ring `k`.
- Functoriality: a Lie algebra map `𝔤 → 𝔥` induces a chain map `⋀^• 𝔤 → ⋀^• 𝔥`, hence maps
  `H_n(𝔤; k) → H_n(𝔥; k)`, compatibly with identities and composition.
- For `𝔤` projective as a `k`-module, `H_n(𝔤; k) ≅ Tor_n^(U(𝔤))(k, k)`, with `U(𝔤)` Mathlib's
  `UniversalEnvelopingAlgebra` (Cartan–Eilenberg, Chapter XIII; Loday–Quillen 1984, §6, p. 583).
- Over a field `k` of characteristic zero, the product and the coproduct make `H_*(𝔤𝔩(A))` a
  graded-commutative and cocommutative connected Hopf algebra (Loday–Quillen 1984, §6,
  pp. 583–584).

*Needs:* Mathlib `LieAlgebra`, `exteriorPower`, `ChainComplex`, `HomologicalComplex.homology`,
`UniversalEnvelopingAlgebra`, `Matrix`.

**Checks.**

- `H₀(𝔤) = k` and `H₁(𝔤) = 𝔤/[𝔤, 𝔤]` (Convention 3). The unsigned formula
  `x ∧ y ∧ z ↦ [x, y] ∧ z + [x, z] ∧ y + [y, z] ∧ x` gives the same `H₁` but its square sends
  `x ∧ y ∧ z` to `[[x, y], z] + [[x, z], y] + [[y, z], x] = −2[[z, x], y]` by Jacobi, nonzero for
  `(x, y, z) = (h, e, f)` in `𝔰𝔩₂(ℚ)`.
- Abelian `𝔤`: `d = 0` and `H_n(𝔤) = ⋀^n 𝔤`; for `𝔤 = k²`, `H₂ = k`.
- `𝔤 = 𝔰𝔩₂(ℚ)` with `[h, e] = 2e`, `[h, f] = −2f`, `[e, f] = h`: `d(e ∧ f ∧ h) = −h ∧ h +
  [e, h] ∧ f − [f, h] ∧ e = −2e ∧ f + 2e ∧ f = 0`, and its class spans `H₃ = ℚ`, while
  `H₁ = H₂ = 0` (Whitehead's lemmas).
- The product on `H_*(𝔤𝔩(A))` uses the direct sum, not the tensor product of matrices: on `H₁`,
  the map `H₁(𝔤𝔩_r(A)) × H₁(𝔤𝔩_s(A)) → H₁(𝔤𝔩_(r+s)(A))` induced by the block sum is
  `(a, b) ↦ a + b` under the trace, the trace of a block-diagonal matrix being the sum of the
  traces of its blocks; the product itself sends `H₁ ⊗ H₁` to `H₂`.

### 2.2 Invariant theory of tensor powers

The permutation action of `Σ_p` on `(kʳ)^⊗p` and its group-algebra form
`k[Σ_p] → End((kʳ)^⊗p)` are Tau Ceti's `TauCeti.permTensorAction k r p` and
`TauCeti.permTensorActionAlgHom k r p`, and their faithfulness threshold is Tau Ceti's
`TauCeti.permTensorActionAlgHom_injective_iff`: over every nontrivial commutative ring `k`, the
algebra map is injective if and only if `p ≤ r`, the antisymmetriser `Σ_σ sgn(σ) σ` lying in the
kernel when `p > r`. This target restates neither. Define `glAction k r p x`, the action of
`x ∈ 𝔤𝔩_r(k)` on `(kʳ)^⊗p` as the derivation `Σ_i 1 ⊗ ⋯ ⊗ x ⊗ ⋯ ⊗ 1`. Prove
`mem_range_permTensorActionAlgHom_of_commute_glAction`: over a field of characteristic zero, every
endomorphism of `(kʳ)^⊗p` commuting with `glAction k r p x` for all `x` is in the range of
`TauCeti.permTensorActionAlgHom k r p` (Weyl's first fundamental theorem, as used by Loday–Quillen
1984, §6.3, pp. 584–585). Route: in characteristic zero the operators `glAction k r p x` generate
an associative subalgebra containing every diagonal operator `f^⊗p` (by polarisation, from
`glAction k r 2 x ^ 2 − glAction k r 2 (x²) = 2 (x ⊗ x)` in degree two and its analogue in degree
`p`), so the hypothesis gives commutation with every `f^⊗p`, and Tau Ceti's
`TauCeti.mem_range_permTensorActionAlgHom_iff_forall_commute` concludes. By the trace duality
`𝔤𝔩_r(k)* = 𝔤𝔩_r(k)` and the faithfulness threshold, deduce the coinvariant form: for `r ≥ p`,
`(𝔤𝔩_r(k)^⊗p)_(𝔤𝔩_r(k)) ≅ k[Σ_p]`, with `Σ_p` acting on `k[Σ_p]` by conjugation (loc. cit.,
p. 585).
*Needs:* Tau Ceti `TauCeti.permTensorActionAlgHom`, `TauCeti.permTensorActionAlgHom_injective_iff`,
`TauCeti.mem_range_permTensorActionAlgHom_iff_forall_commute`; Mathlib `PiTensorProduct.map`,
`Function.update`, `Commute`, `AlgHom.range`.

**Checks.**

- `glAction k r p 1 = p • 1`: for `p = 2` the identity of `𝔤𝔩_r(k)` acts by `2`, while the
  diagonal operator `1 ⊗ 1` is the identity; a definition by `x ⊗ ⋯ ⊗ x` would not be a Lie
  algebra action.
- `glAction` is a Lie algebra map: for `r = p = 2`, `x = E₁₂`, `y = E₂₁` and `[x, y] = E₁₁ − E₂₂`,
  on `e₂ ⊗ e₂` the operator `glAction y` gives `0` and `glAction y (glAction x (e₂ ⊗ e₂)) =
  glAction y (e₁ ⊗ e₂ + e₂ ⊗ e₁) = 2 e₂ ⊗ e₂`, so the commutator gives `−2 e₂ ⊗ e₂`, which is
  `glAction (E₁₁ − E₂₂) (e₂ ⊗ e₂)`; the diagonal operators `x ⊗ x` give `−e₂ ⊗ e₂` against
  `+e₂ ⊗ e₂`.
- `r = 2`, `p = 3`: `glAction k 2 3 x` for `x = E₁₂` sends `e₂ ⊗ e₂ ⊗ e₂` to
  `e₁ ⊗ e₂ ⊗ e₂ + e₂ ⊗ e₁ ⊗ e₂ + e₂ ⊗ e₂ ⊗ e₁`, a symmetric tensor; the cyclic permutation
  `(123)` commutes with it, while the projection onto `e₁ ⊗ e₂ ⊗ e₂` alone does not, and is not
  in the range of `TauCeti.permTensorActionAlgHom k 2 3`.
- The coinvariant form needs `r ≥ p`: for `r = 1`, `p = 2`, `(k¹)^⊗2 = k` and both permutations
  act as the identity, so `id − swap` is in the kernel of `TauCeti.permTensorActionAlgHom k 1 2`,
  as `TauCeti.permTensorActionAlgHom_injective_iff` predicts from `¬ 2 ≤ 1`; for `r = p = 2` the
  identity and the swap send `e₁ ⊗ e₂` to distinct basis tensors.

### 2.3 Coinvariants and primitive elements

Prove the coinvariant theorem: if `𝔤 ⊆ 𝔤′` are Lie algebras over a field `k` of characteristic
zero and every `⋀^n 𝔤′` is semisimple as a `𝔤`-module, then the projection
`⋀^• 𝔤′ → (⋀^• 𝔤′)_𝔤` is a quasi-isomorphism (Loday–Quillen 1984, Proposition 6.4, p. 585).
Apply it to `𝔤𝔩(k) ⊆ 𝔤𝔩(A)`: `(⋀^• 𝔤𝔩(A))_(𝔤𝔩(k))` is a differential graded Hopf algebra, and its
primitive part is Connes' complex `C^λ_(*−1)(A)`, through `Tr ∘ λ` of Convention 4
(Loday–Quillen 1984, Lemma 6.1, p. 584, and Proposition 6.6, p. 585).
*Needs:* 2.1, 2.2; RefinedTraceMethods §1.4 (Connes' complex); RefinedTraceMethods §1.6 (the
matrix trace).

**Checks.**

- `n = 1`: `(⋀¹ 𝔤𝔩(A))_(𝔤𝔩(k)) = 𝔤𝔩(A)/[𝔤𝔩(k), 𝔤𝔩(A)]`, and the trace identifies it with `A`,
  which is `C^λ₀(A)`; coinvariants under `𝔤𝔩(A)` instead of `𝔤𝔩(k)` would give `A/[A, A]`,
  already homology.
- Semisimplicity is needed: for `𝔤′` with basis `x, y`, `[x, y] = y`, and `𝔤 = k·y`, `ad y` is
  nilpotent and nonzero on `⋀¹ 𝔤′`. The coinvariant complex is `k(x ∧ y) → 𝔤′/k·y → k` with zero
  first differential (`d(x ∧ y) = −y`), so its `H₂` is `k`, while `H₂(𝔤′) = 0`: the projection is
  not a quasi-isomorphism.
- The sign `(−1)^n` in `λ` (Convention 4) gives `bλ = λd` in the lowest degree:
  `λ(x₀ ∧ x₁) = −(x₀, x₁)`, so `bλ(x₀ ∧ x₁) = −[x₀, x₁]`, and `λd(x₀ ∧ x₁) = λ(−[x₀, x₁]) =
  −[x₀, x₁]`; without the sign the two sides differ by `−1`.

### 2.4 The Loday–Quillen–Tsygan theorem

Prove: for a field `k` of characteristic zero and every associative unital
`k`-algebra `A`, `Tr ∘ λ` induces an isomorphism `Prim H_*(𝔤𝔩(A); k) ≅ HC_(*−1)(A)`
(Loday–Quillen 1984, Theorem 6.2, p. 584; Tsygan 1983). Deduce, by the structure theorem for
connected graded-commutative and cocommutative Hopf algebras over a field of characteristic zero
(Milnor–Moore 1965), that `H_*(𝔤𝔩(A); k)` is the free graded-commutative algebra on
`HC_(*−1)(A)`.
*Needs:* 2.1, 2.3; KTheoryFiniteLocalFields §4.0 (`HC_*(A)`); RefinedTraceMethods §1.4.

**Checks.**

- `A = k`: `HC_(*−1)(k)` is `k` in degrees `1, 3, 5, …`, so `H_*(𝔤𝔩(k))` is the exterior algebra
  on generators of degrees `1, 3, 5, …`, the stable cohomology of `𝔤𝔩_r(k)` found by
  Hopf–Koszul; a polynomial algebra on the same generators would be wrong in degree 2 (`x₁² = 0`).
- `A = k × k`: `𝔤𝔩(k × k) = 𝔤𝔩(k) × 𝔤𝔩(k)`, so `H_*(𝔤𝔩(k × k)) = H_*(𝔤𝔩(k))^⊗2` by Künneth, whose
  primitives are twice those of `H_*(𝔤𝔩(k))`, as `HC_(*−1)(k × k) = HC_(*−1)(k)²` requires.
- `A = k[ε]/(ε²)`: `HC₀(A) = A` is two-dimensional, so `Prim H₁(𝔤𝔩(A)) = H₁ = 𝔤𝔩(A)/[𝔤𝔩(A),
  𝔤𝔩(A)]` is two-dimensional, the classes of `E₁₁` and `εE₁₁`.

### 2.5 Low degrees: `𝔰𝔩(A)`

Define `𝔰𝔩(A)` as the kernel of the trace `𝔤𝔩(A) → A/[A, A]`, with values in Tau Ceti's
`TauCeti.cyclicQuotient`. Prove: for a commutative ring `k` and a unital `k`-algebra `A` that is
free as a `k`-module, in particular for every algebra over a field, in every characteristic,
`H₂(𝔰𝔩(A); k) ≅ HC₁(A)` (Loday–Quillen 1984, Corollary 6.7, p. 586, and the Remark after it,
p. 587; Kassel–Loday 1982, Corollaire 1.9, p. 124, where cyclic homology is indexed one higher and
the group is written `HC₂(A)`). Route: the Steinberg Lie algebra `𝔰𝔱(A)`, generated by symbols
`u_ij(a)` subject to the Steinberg relations, is the universal central extension of `𝔰𝔩(A)` and its
kernel is `HC₁(A)` (Kassel–Loday 1982, Théorème 1.7, pp. 123–124, and Proposition 1.8, p. 124); for
a perfect Lie algebra over `k`, free as a `k`-module, `H₂` is the kernel of the universal central
extension.
*Needs:* 2.1; RefinedTraceMethods §1.4 (`HC₁`); Tau Ceti `TauCeti.cyclicQuotient`; Mathlib
`LieAlgebra.SpecialLinear.sl` for `A = k`.

**Checks.**

- `A = k`: `𝔰𝔩(k)` is perfect and `HC₁(k) = 0`, so `H₂(𝔰𝔩(k)) = 0`: `𝔰𝔩(k)` has no nontrivial
  central extension, matching Whitehead's second lemma for each `𝔰𝔩_r`, `r ≥ 2`.
- `A = k[x]` over `ℚ`: `HC₁(k[x]) = Ω¹/dΩ⁰ = 0` by 1.4, so `H₂(𝔰𝔩(k[x])) = 0`; for
  `A = k[x, x⁻¹]`, `HC₁ = k·[x⁻¹dx] ≠ 0`, the class of the central extension that gives affine
  Lie algebras.
- Positive characteristic: for commutative `A`, `HC₁(A) = Ω¹_A/dA` (Kassel–Loday 1982, p. 124);
  over `k = 𝔽_p` the class of `x^(p−1)dx` in `Ω¹/dΩ⁰` of `𝔽_p[x]` is nonzero, since
  `d(xᵐ) = m x^(m−1)dx` vanishes for `m = p`, so `H₂(𝔰𝔩(𝔽_p[x])) ≠ 0`, while over `ℚ` it is `0`; a
  statement in characteristic zero only would miss this case.
- The trace is taken in `A/[A, A]`: for `A = M₂(k)`, the `1 × 1` matrix with entry
  `E₁₁ − E₂₂ = [E₁₂, E₂₁]` has nonzero trace in `A` and zero trace in `A/[A, A]`, so it lies in
  `𝔰𝔩(A)`; trace zero in `A` would give a smaller algebra, not equal to `[𝔤𝔩(A), 𝔤𝔩(A)]`.

### 2.6 Stability

Prove: for a field `k` of characteristic zero and an associative unital
`k`-algebra `A`, the map `H_i(𝔤𝔩_(n−1)(A)) → H_i(𝔤𝔩_n(A))` is an isomorphism for `i < n − 1` and
surjective for `i = n − 1`; if `A` is commutative, it is also injective for `i = n − 1` and there
is an exact sequence
`H_n(𝔤𝔩_(n−1)(A)) → H_n(𝔤𝔩_n(A)) → Ω^(n−1)_A/dΩ^(n−2)_A → 0`
(Loday–Quillen 1984, Theorem 6.9, p. 587).
*Needs:* 2.1, 2.2, 2.3; Mathlib `KaehlerDifferential`, `exteriorPower`.

**Checks.**

- `A = k`, `n = 2`, `i = 0`: both sides are `k`; at `i = 1 = n − 1`, `H₁(𝔤𝔩₁(k)) = k → H₁(𝔤𝔩₂(k))
  = k` (the trace) is onto, and an isomorphism since `k` is commutative.
- `A = k`, `n = 2`, `i = 2`: `Ω¹_k = 0`, so `H₂(𝔤𝔩₁) → H₂(𝔤𝔩₂)` is onto; `H₂(𝔤𝔩₁(k)) = ⋀²k = 0`
  and `H₂(𝔤𝔩₂(k)) = 0`, consistently.
- `A = k[x]`, `n = 2`: the cokernel term is `Ω¹/dΩ⁰ = k[x]dx/d(k[x]) = 0` in characteristic zero,
  while over `𝔽_p` the class of `x^(p−1)dx` survives; the theorem is stated in characteristic
  zero only.

### Examples

- The cohomology of `𝔤𝔩_r(ℂ)` in degrees below `r` is the exterior algebra on classes of degrees
  `1, 3, …, 2r − 1`; 2.4 and 2.6 recover its stable range from `HC_*(ℂ)`.
- For `A` commutative and smooth over `ℚ`, 2.4 with the HKR comparison of
  KTheoryFiniteLocalFields §4.0 expresses `Prim H_n(𝔤𝔩(A))` through `Ω^(n−1)_A/dΩ^(n−2)_A` and de
  Rham cohomology.

### Dependencies

Mathlib for 2.1–2.2 and Tau Ceti for 2.2 and 2.5; RefinedTraceMethods §§1.4 and 1.6 and
KTheoryFiniteLocalFields §4.0 from 2.3 on. Within the layer, 2.2–2.4 and 2.6 each use the previous
targets, and 2.5 uses 2.1 only.

## Layer 3: derivations and nilpotent extensions

### 3.1 Derivations act trivially on periodic cyclic homology

For a derivation `D` of a unital algebra `A` over a field `k` of any characteristic, define its
action `L_D(a₀ ⊗ ⋯ ⊗ a_n) = Σ_i a₀ ⊗ ⋯ ⊗ D a_i ⊗ ⋯ ⊗ a_n` on Hochschild chains, which commutes
with `b` and `B` and induces endomorphisms of `HH_*(A)`, `HC_*(A)` and `HP_*(A)`. Prove:
`L_D` acts as zero on `HP_*(A)`, and `S ∘ L_D = 0` on `HC_*(A)`. Both are Getzler 1993,
Theorem 2.4 (2), p. 8 of the author's text: for a Hochschild cocycle `D`, here a derivation,
`u L_D` is chain homotopic to zero on `(C(A)[[u]], b − uB)` by a `k[u]`-linear homotopy; this
gives `L_D = 0` on `HP_*(A)`, and on `HC_*(A)`, the homology of `(C(A) ⊗_k W, b − uB)` for
`W = k[u, u⁻¹]/uk[u]` (Getzler 1993, §2, the list before Theorem 2.4), on which `u` acts as `S`,
it gives `S ∘ L_D = 0`. Route: the Cartan homotopy formula
`[b − uB, ι_D] = u L_D` (Getzler 1993, (2.1) and Definition 2.1), with `ι_D = b{D} − u B{D}`,
where `B{D}` is Rinehart's operator; the identities have integer coefficients, so no hypothesis on
the characteristic is used.
*Needs:* RefinedTraceMethods §1.2, §1.4; KTheoryFiniteLocalFields §4.0.

**Checks.**

- A field, not a commutative ring: over `k = ℤ` the algebra `A = 𝔽₂[x]` is not `ℤ`-flat, and
  `A ⊗_ℤ A = A ⊗_(𝔽₂) A`, so its Hochschild chains `A^⊗(n+1)` have `H_n = HH_n(𝔽₂[x]/𝔽₂) = 0`
  for `n ≥ 2`, while the derived `HH₂(𝔽₂[x]/ℤ) ⊇ HH₂(𝔽₂/ℤ) ⊗ 𝔽₂[x] ≠ 0` of Convention 1: the
  formula for `L_D` acts on a complex that does not compute the `HH_*(A)` of the statement.
- Inner derivations `D = [x, −]` already act as zero on `HH_*(A)` and `HC_*(A)`: on `HH₀ = A/[A,
  A]`, `L_D(a) = [x, a] = 0`.
- Over `ℚ ⊆ k`, `A = k[x]`, `D = x d/dx` (the Euler derivation): on `HC₀ = k[x]`, `L_D(xᵐ) = m xᵐ`,
  nonzero for `m > 0`, so `L_D ≠ 0` on `HC`; but `S : HC₀ → HC₋₂ = 0`, and `HP₀(k[x]) = k` (the
  constants), where `L_D = 0`.
- Positive characteristic: over `𝔽_p`, `D = x d/dx` acts on the weight-`m` part of
  `H̄C_n(𝔽_p[x])`, `n ≥ 1`, by `m`, and by 1.4 this part is nonzero only when `p ∣ m`, where
  `m = 0` in `𝔽_p`; so `L_D = 0` there, as the statement over every field predicts,
  whereas a weight `m` prime to `p` with nonzero homology in degree `n ≥ 1` would refute it.

### 3.2 Nil-invariance of periodic cyclic homology

Prove: for a field `k` of characteristic zero, a unital `k`-algebra `A` and a nilpotent two-sided
ideal `I ⊆ A` (some `Iᴺ = 0`), the quotient map induces an isomorphism `HP_*(A) ≅ HP_*(A/I)`
(Goodwillie 1985, Theorem II.5.1; see also Cuntz–Quillen 1997, 3.5; both as cited in Cortiñas 2006,
p. 3). For `k = ℚ` this is RefinedTraceMethods §4.9 (`HP(−⊗ℚ/ℚ)` is truncating) with its §4.18
(truncating invariants are nil-invariant), which 3.2 cites; 3.2 owns the form for `HP` relative to
an arbitrary field `k` of characteristic zero. Route: reduce to `I² = 0`, filter by powers of `I`,
and apply 3.1 to the derivation acting on the associated graded with weight `m` on `(I/I²)^⊗m`,
dividing by `m`.
*Needs:* 3.1; RefinedTraceMethods §4.9, §4.18; KTheoryFiniteLocalFields §4.0 (functoriality,
relative fibres).

**Checks.**

- `A = k[ε]/(ε²)`, `I = (ε)`: `HP_*(A) = HP_*(k)`, `k` in even degrees, while
  `HC₀(A) = A/[A, A] = A` is two-dimensional and `HC₀(k) = k`: nil-invariance fails for `HC` and
  holds after periodisation.
- Nilpotence is needed: `k[x, x⁻¹] → k`, `x ↦ 1`, has kernel `(x − 1)`, not nilpotent, and
  `HP₁(k[x, x⁻¹]) = k ≠ 0 = HP₁(k)`.
- `I` two-sided and nilpotent, not only nil in a quotient: for `A = T₂(k)`, the upper triangular
  matrices, and `I` its strictly upper triangular part, `I² = 0` and 3.2 gives
  `HP₀(T₂(k)) = HP₀(k × k) = k²`.
- The route divides by weights: over `𝔽_p`, the weight derivation acts on weight `m` by `m`, which
  is `0` for `p ∣ m`, so 3.1 gives nothing there; the computation below shows that nil-invariance
  indeed fails in characteristic `p`, which is why 3.2, unlike 3.1, is made in characteristic
  zero.

Not a target: nil-invariance fails in characteristic `p > 0`, already for `𝔽_p[ε]`, `ε² = 0`
(own computation). The normalised chains of `k[ε]` split by weight, the number of `ε`'s. In weight
`w ≥ 1` they have the basis `x_w = 1 ⊗ ε^⊗w` in degree `w` and `y_(w−1) = ε ⊗ ε^⊗(w−1)` in
degree `w − 1`, with `b y_(w−1) = 0`, `B x_w = 0`, `b x_w = (1 + (−1)^w) y_(w−1)` (the first and
last faces; the middle ones contain `ε²`) and `B y_(w−1) = Σ_(i<w) (−1)^(i(w−1)) x_w`, which is
`w x_w` for `w` odd and `0` for `w` even. The periodic complex is the product of its weight
pieces. In characteristic zero each piece of weight `w ≥ 1` is acyclic and `HP_*(k[ε]) = HP_*(k)`,
as 3.2 says. In characteristic `p` the piece of weight `w` has zero differential for every odd
multiple `w` of `p` when `p` is odd, and for every even `w` when `p = 2`; each such piece adds `k`
in both parities, so `HP₁(𝔽_p[ε]) ≠ 0 = HP₁(𝔽_p)`.

### Examples

- For a finite-dimensional algebra `A` over a field of characteristic zero with Jacobson radical
  `J`, 3.2 gives `HP_*(A) = HP_*(A/J)`, and `A/J` is semisimple, so by Morita invariance
  (RefinedTraceMethods §1.6) `HP₀(A)` is `k` to the number of simple factors when `k` is
  algebraically closed, and `HP₁(A) = 0`.
- For the upper triangular matrices `T₂(k)`, `J` is the strictly upper triangular part and
  `HP₀(T₂(k)) = k²`.

### Dependencies

RefinedTraceMethods §§1.2, 1.4, 1.6, 4.9 and 4.18 and KTheoryFiniteLocalFields §4.0. 3.2 uses
3.1.

## Layer 4: quasi-free algebras and the X-complex

### 4.1 Quasi-free algebras

Define `IsQuasiFree k A` for a `k`-algebra `A` over a commutative ring `k`: for every surjective
`π : R →ₐ[k] S` whose kernel has zero products (Convention 5), every `f : A →ₐ[k] S` is
`π.comp g` for some `g : A →ₐ[k] R`, with `R` and `S` in the universe of `A`. Here
`Ω¹A = ker(A ⊗_k A → A)` and `Ω²A = Ω¹A ⊗_A Ω¹A` are the forms of the unital algebra `A`, the
normalised quotient of Tau Ceti's forced-unitisation `TauCeti.UniversalOneForms` and
`TauCeti.UniversalForms`, and `A^e = A ⊗_k Aᵐᵒᵖ`. Prove:

- Lifting along square-zero surjections: the definition, for every `π` as above.
- `IsQuasiFree.exists_lift_of_nilpotent`: if `A` is quasi-free, `π : R →ₐ[k] S` is surjective and
  every product of `n` elements of its kernel vanishes, every `f : A →ₐ[k] S` lifts through `π`
  (Cuntz–Quillen 1995a, §6, p. 275). Route: lift through `R/Kⁱ → R/K^(i−1)` one square-zero
  step at a time.
- `isQuasiFree_iff_hasProjectiveDimensionLE_one`: over a field `k`, `A` is quasi-free if and only
  if `A`, as an `A^e`-module through Mathlib's `instModuleTensorProductMop`, has projective
  dimension at most one (`CategoryTheory.HasProjectiveDimensionLE` in `ModuleCat (A ⊗[k] Aᵐᵒᵖ)`),
  that is `Ext²_(A^e)(A, M) = 0` for every `A`-bimodule `M` (Hochschild cohomological dimension
  at most one) (Cuntz–Quillen 1995a, Proposition 3.3, p. 267).
- Over a field `k`: `A` is quasi-free if and only if the bimodule `Ω¹A` is projective over `A^e`
  (loc. cit., Proposition 3.3, p. 267).
- Over a field `k`: `A` is quasi-free if and only if `Ω¹A` admits a right connection, a left
  `A`-linear map `∇ : Ω¹A → Ω²A` with `∇(ωa) = ∇(ω)a + ω da` (Cuntz–Quillen 1995a,
  Proposition 3.4 (4), p. 268).
*Needs:* Tau Ceti `TauCeti.UniversalOneForms`, `TauCeti.UniversalForms`; Mathlib `AlgHom`,
`List.prod`, `Algebra.TensorProduct`, `MulOpposite`, `instModuleTensorProductMop`, `ModuleCat`,
`CategoryTheory.HasProjectiveDimensionLE`, `CategoryTheory.Abelian.Ext`, `Module.Projective`.

**Checks.**

- The square-zero hypothesis is the definition, nilpotence the theorem: for `A = k[x]` and
  `π : k[t]/(t³) → k[t]/(t²)`, the map `x ↦ t` lifts (`x ↦ t`), as every map from `k[x]` does;
  for `A = k[x, y]` and `π : R → k[x, y]` the quotient of `R = k⟨x, y⟩/J²` by `J/J²`, where `J`
  is the ideal generated by `xy − yx`, the identity does not lift (4.2).
- `n = 1` in `exists_lift_of_nilpotent`: the kernel is zero, `π` is bijective and `g = π⁻¹ ∘ f`;
  `n = 0`: products of zero elements are `1`, so `R` is the zero ring, `S` too, and the lift is the
  unique map to the zero ring.
- Universe: `R` and `S` range over `Type u` with `A : Type u`. A definition quantifying only
  over `R = S ⊕ M` split square-zero extensions would make every algebra quasi-free (the map
  `a ↦ (f a, 0)` lifts), which is why the definition takes all square-zero surjections.

### 4.2 Examples and non-examples

Prove `isQuasiFree_freeAlgebra`: for every commutative ring `k` and type `X`, `FreeAlgebra k X` is
quasi-free (Cuntz–Quillen 1995a, p. 267); the route lifts the images of the generators, using only
the surjectivity of `π`. Prove `not_isQuasiFree_mvPolynomial_fin_two`: over a field `K`, `K[x, y]`
is not quasi-free, its Hochschild cohomological dimension being 2 (Cuntz–Quillen 1995a, §5, p. 273).
Prove that separable algebras over a field are quasi-free (loc. cit., p. 267); that finite products,
free products, matrix algebras `M_r(A)` and localisations of quasi-free algebras over a field are
quasi-free (loc. cit., Proposition 5.3, p. 273), so that `k[x]` and `k[x, x⁻¹]` are; and that a
quasi-free `A` lifts every homomorphism `A → R/I` to the `I`-adic completion `R̂ = lim R/Iⁿ`, for
every algebra `R` and ideal `I` (loc. cit., Proposition 6.1 (1), p. 275).
*Needs:* 4.1; Mathlib `FreeAlgebra.lift`, `FreeAlgebra.ι`, `MvPolynomial`, `Polynomial`,
`Matrix`.

**Checks.**

- `FreeAlgebra k Unit ≅ k[x]` is quasi-free, as `isQuasiFree_freeAlgebra` gives for `X = Unit`;
  `FreeAlgebra k Empty ≅ k` is quasi-free since `π` maps `1` to `1`.
- `K[x, y] = K[x] ⊗ K[y]`: a tensor product of two quasi-free algebras need not be quasi-free,
  while the free product `K⟨x, y⟩` is.
- Separability gives quasi-freeness only over a field: `ℤ/2` is separable over `ℤ`
  (`ℤ/2 ⊗_ℤ (ℤ/2)ᵐᵒᵖ = ℤ/2`) and not quasi-free over `ℤ`, since the identity does not lift along
  the square-zero surjection `ℤ/4 → ℤ/2` (a lift `g` would have `0 = g(1 + 1) = 2 ≠ 0`).
- `M₂(K)` is separable, hence quasi-free of cohomological dimension 0; `K[ε]/(ε²)` is not
  quasi-free: the identity does not lift along `K[t]/(t³) → K[t]/(t²)`, since a lift would send
  `ε` to an element of square zero in `K[t]/(t³)` mapping to `t`, and `(t + ct²)² = t² ≠ 0`.
- Completion lifts maps and does not preserve quasi-freeness: `ℚ[x]` is quasi-free and its
  `x`-adic completion `ℚ⟦x⟧` is not, since a quasi-free algebra is formally smooth and
  `Ω_(ℚ⟦x⟧/ℚ)` is not projective (its fibre at the closed point has dimension at most 1 and its
  generic rank is `2^ℵ₀`); what the completion clause gives on `R = ℚ[x]`, `I = (x)` is only that
  maps `ℚ[x] → ℚ` lift to `ℚ⟦x⟧`, which they do.

Not a target: for a field `k` and a group `G`, the group algebra `k[G]` is quasi-free exactly
when `G` is the fundamental group of a graph of finite groups whose orders are invertible in `k`
(own argument from Dunwoody 1979). By 4.1 quasi-free means Hochschild cohomological dimension at
most one. For a `k[G]`-bimodule `M`, `HHⁿ(k[G], M) ≅ Hⁿ(G, M_ad)`, with `G` acting on `M` by
`g·m = g m g⁻¹`, so the Hochschild dimension is at most `cd_k G`. Conversely, for a `k[G]`-module
`N` the bimodule `N ⊗_k k[G]`, `g(x ⊗ h)g′ = gx ⊗ ghg′`, has adjoint module the direct sum over
the conjugacy classes of `h` of `G`-stable summands, and the class of `1` gives `N`; so `Hⁿ(G, N)`
is a direct summand of `HHⁿ(k[G], N ⊗_k k[G])` and the Hochschild dimension is `cd_k G`.
Dunwoody's theorem characterises `cd_k G ≤ 1` as above. Hence `ℚ[SL₂(ℤ)]`, with
`SL₂(ℤ) ≅ ℤ/4 *_(ℤ/2) ℤ/6`, and `k[F_r]` are quasi-free, while `k[ℤ²] = k[x^(±1), y^(±1)]`
(`cd_k ℤ² = 2`) and `𝔽_p[ℤ/p]` (`cd_(𝔽_p) ℤ/p = ∞`) are not. This agrees with 4.2: `k[G]` for a
finite `G` of order invertible in `k` is separable, and `k[ℤ] = k[x, x⁻¹]`.

### 4.3 Noncommutative forms and the X-complex

For a unital algebra `R` over a field `k` of characteristic zero, define the differential graded
algebra of noncommutative forms `ΩR` with `Ω^nR = R ⊗ R̄^⊗n`, `R̄ = R/k`, the unital (normalised)
forms, a quotient of Tau Ceti's forced-unitisation `TauCeti.UniversalForms`; the Hochschild
operator `b` with `b(ω da) = (−1)^|ω| [ω, a]`, the Karoubi operator `κ = 1 − (db + bd)` and
Connes' operator `B` (Cuntz–Quillen 1995b, §3, p. 388). Define `Ω¹R_♮ = Ω¹R/[R, Ω¹R]`, the
`ℤ/2`-graded complex `X(R)` of Convention 6 (loc. cit., §4, p. 392), and, for an ideal `I ⊆ R`,
the completion `X̂(R, I) = lim X(R/Iⁿ)`. Prove:

- `d² = 0` and the Leibniz rule make `ΩR` a differential graded algebra, and `Ω^nR = R ⊗ R̄^⊗n`
  as a left `R`-module, with `a₀ da₁ ⋯ da_n ↦ a₀ ⊗ ā₁ ⊗ ⋯ ⊗ ā_n`.
- `b² = 0`, `B² = 0` and `bB + Bb = 0`, and `(ΩR, b, B)` is the normalised mixed complex of
  RefinedTraceMethods §1.2.
- `κ(ω da) = (−1)^|ω| da ω` on `Ω^(≥1)R`.
- `b ∘ ♮d = 0` and `♮d ∘ b = 0` on `X(R)`.
- The `I`-adic filtration of `X(R)` is a filtration by subcomplexes, and an algebra map
  `R → R′` carrying `I` into `I′` induces a map of completed complexes `X̂(R, I) → X̂(R′, I′)`.

*Needs:* RefinedTraceMethods §1.2; Tau Ceti `TauCeti.UniversalForms`; Mathlib
`KaehlerDifferential`.

**Checks.**

- `♮d ∘ b = 0`: `♮d(yz) = ♮(dy z + y dz) = ♮(z dy + y dz)`, symmetric in `y, z`, so
  `♮d[y, z] = 0`; in `Ω¹R` itself `d[y, z] = dy z + y dz − dz y − z dy` is not zero for `R` free
  on `y, z`.
- For commutative `R`, `Ω¹R_♮` is Kähler differentials `Ω¹_(R/k)` and `b = 0`; for `R = k[x]`,
  `X(R)` has `H₀ = k`, `H₁ = 0` (Convention 6).
- `κ(ω da) = (−1)^|ω| da ω` on `Ω^(≥1)R`: on `Ω¹R`, `κ(a₀ da₁) = da₁ a₀`, which differs from
  `a₀ da₁` by the commutator `[da₁, a₀]`, so `κ ≠ 1` on `Ω¹R` for `R = k⟨x, y⟩`, while `κ = 1` on
  the quotient `Ω¹R_♮`.

### 4.4 The X-complex computes periodic cyclic homology

Prove: for a field `k` of characteristic zero, a unital `k`-algebra `A` and an
extension `0 → I → R → A → 0` with `R` quasi-free, `HP_*(A) ≅ H_*(X̂(R, I))`, naturally in the
extension; in particular `HP_*(R) ≅ H_*(X(R))` for `R` quasi-free (Cuntz–Quillen 1995b, (2),
p. 373, Theorem 6.2, p. 403, and Corollary 9.4, p. 417). Route: for quasi-free `R` the normalised
mixed complex `(ΩR, b, B)` contracts onto its quotient `ΩR/F²`, quasi-isomorphic to `X(R)`;
independence of the extension uses 3.2 and lifting from the quasi-free `R` into towers `(Sₙ)`
(Cuntz–Quillen 1995b, Proposition 9.2 and Theorem 9.3, p. 416).
*Needs:* 4.1, 4.2, 4.3, 3.2; KTheoryFiniteLocalFields §4.0 (`HP_*`).

**Checks.**

- `R = A = k[x]`, `I = 0`: `H_*(X(k[x])) = (k, 0) = HP_*(k[x])`.
- `R = k[x]`, `A = k[ε]/(ε²)`, `I = (x²)`: the `I`-adic and `x`-adic topologies agree, so
  `X̂(R, I)` is the X-complex of `k[[x]]` with completed forms, `H₀ = k` and `H₁ = 0`, the answer
  `HP_*(k[ε]/(ε²)) = HP_*(k)` of 3.2.
- Quasi-freeness of `R` is needed: `X(k[x, y]) = (k[x, y] → Ω¹, b = 0)` has
  `H₁ = Ω¹/dΩ⁰ ∋ [x dy] ≠ 0`, while `HP₁(k[x, y]) = H¹_dR ⊕ H³_dR ⊕ ⋯ = 0`; through the quasi-free
  `R = k⟨x, y⟩ → k[x, y]` the theorem gives the right answer.

### 4.5 The universal extension and the Fedosov product

For a unital algebra `A` over a field `k` of characteristic zero, define on
`Ω^evA = ⊕_n Ω^(2n)A` the Fedosov product `ω ∘ η = ωη − dω dη`, prove that it is associative and
unital, and that `RA = (Ω^evA, ∘)` is universal for unit-preserving linear maps: for every unital
algebra `B`, restriction to `Ω⁰A = A` is a bijection from unital algebra maps `RA → B` to
unit-preserving linear maps `A → B`. Prove that the kernel `IA` of the multiplication
`RA → A` is `⊕_(n≥1) Ω^(2n)A` with `(IA)ⁿ = ⊕_(m≥n) Ω^(2m)A`, and that `RA` is quasi-free
(Cuntz–Quillen 1995a, Proposition 1.2, p. 255; Quillen 1989).
*Needs:* 4.1, 4.3; Mathlib `FreeAlgebra`.

**Checks.**

- For `a, b ∈ A = Ω⁰A`, `a ∘ b = ab − da db`: the Fedosov product of two degree-zero forms has a
  degree-two term, so `A → (Ω^evA, ∘)` is linear and not multiplicative, the defect being the
  curvature `ab − a ∘ b = da db ∈ IA`.
- `A = k`: `Ω^(≥1)k = 0` (normalised forms, `k̄ = 0`), so `RA = k` and `IA = 0`.
- The filtration: `(da db) ∘ (dc de) = da db dc de − d(da db) d(dc de) = da db dc de`, since
  `d² = 0`, of form degree 4 and in `(IA)²`.
- `a ∘ 1 = a − da d1 = a`, since `d1 = 0` in the normalised forms `A ⊗ Ā^⊗n`: `1` is the unit of
  `∘`; with unnormalised forms `d1 ≠ 0` and `1` would not be a unit.

### 4.6 Excision in periodic cyclic homology

Prove: for a field `k` of characteristic zero and every extension of (possibly
nonunital) `k`-algebras `0 → J → A → B → 0`, with `HP` of a nonunital algebra defined through its
unitisation relative to `k`, the homological counterpart of the convention of Tau Ceti's
`TauCeti.relativeCyclicCohomology`, there is a six-term exact sequence
`HP₀(J) → HP₀(A) → HP₀(B) → HP₁(J) → HP₁(A) → HP₁(B) → HP₀(J)`, natural in the extension
(Cuntz–Quillen 1997, as recorded in Cortiñas 2006, (3), p. 2; Cuntz–Quillen 1993 for the
approximately H-unital case).
*Needs:* 4.4, 4.5; KTheoryFiniteLocalFields §4.0 (`HP_*`, relative fibres); Tau Ceti
`TauCeti.relativeCyclicCohomology`.

**Checks.**

- `J = A`, `B = 0`: the sequence is `HP(A) ≅ HP(A)`.
- `A = k[x]`, `J = (x)`, `B = k`: `HP₀(J) = 0 = HP₁(J)`, consistently with `HP(k[x]) = HP(k)`. `J =
  xk[x]` is not H-unital (`J² ≠ J`), so by 5.2 some extension containing `J` fails excision in `HC`.
  The map `C = k[x, y]/(xy) → k[x]`, `y ↦ 0`, carries the ideal `J = (x)` of `C` isomorphically onto
  `xk[x]`; the class `[x dy] ≠ 0` of `HC₁(C) = Ω¹_C/dC` lifts to `HC₁(C, J)` (since `HC₁(C/J) =
  HC₁(k[y]) = 0`), while `HC₁(k[x], xk[x]) = 0`, so the excision map `HC₁(C, J) → HC₁(k[x], xk[x])`
  is not injective. `k[x] = J⁺` itself never fails, `HC(J)` being defined through it.
- `A = k[x, x⁻¹]`, `J = (x − 1)`, `B = k`: `HP₀(A) → HP₀(B)` is an isomorphism `k ≅ k` and
  `HP₁(B) = 0`, so exactness gives `HP₀(J) = 0` and `HP₁(J) ≅ HP₁(A) = k`.

### Examples

- Every algebra is a quotient of the quasi-free algebra `RA` (4.5) or of a free algebra (4.2),
  so 4.4 applies to every `A`; for `A = k[ε]/(ε²)` it recovers `HP(A) = HP(k)`, as 3.2 does.
- For `A = M_r(B)`, 4.6 with Morita invariance (RefinedTraceMethods §1.6) gives `HP(M_r(J)) =
  HP(J)` for nonunital `J`.

### Dependencies

Mathlib and Tau Ceti's universal forms for 4.1–4.3; RefinedTraceMethods §1.2 and
KTheoryFiniteLocalFields §4.0 from 4.3 on; Tau Ceti's relative cyclic cohomology for 4.6; 4.4
uses 3.2. Within the layer, each target uses the previous ones.

## Layer 5: rings without unit

### 5.1 H-unitality

For a nonunital algebra `A` over a commutative ring `k` (a `k`-module with an associative
`k`-bilinear multiplication), define the bar complex `B_*(A)` of Convention 7 and call `A`
H-unital if `B_*(A) ⊗_k V` is acyclic for every `k`-module `V` (Wodzicki 1989, (2) and the
definition after it, p. 592). Prove:

- Unital algebras are H-unital.
- An algebra with left local units (for every finite family `a₁, …, a_n` there is `e` with
  `e a_i = a_i`) is H-unital (Wodzicki 1989, Corollary 4.5, p. 609).
- An H-unital algebra satisfies `A² = A`, since `H₁(B(A)) = A/A²` (Convention 7).

*Needs:* Mathlib `Module.Flat`, `ChainComplex`.

**Checks.**

- `A` unital: `s(a₁ ⊗ ⋯ ⊗ a_q) = 1 ⊗ a₁ ⊗ ⋯ ⊗ a_q` is a contracting homotopy, `b′s + sb′ = 1`.
- `A = k` with zero multiplication: `b′ = 0` and `H₁ = A/A² = k ≠ 0`, not H-unital.
- `A = ⊕_(n∈ℕ) k` (finitely supported sequences, pointwise product) has no unit but has left
  local units (the indicator of a finite set), so it is H-unital; `A = x k[x]` has `A² = x²k[x] ≠ A`
  and is not.

### 5.2 Wodzicki's excision theorem

Prove: for a nonunital `k`-algebra `A` that is flat as a `k`-module, the following are
equivalent: `A` is H-unital; for every extension `0 → A → R → S → 0` of `k`-algebras with `R`
and `S` flat over `k` (such an extension is pure as an extension of `k`-modules), the Hochschild
homology long sequence `⋯ → HH_n(A) → HH_n(R) → HH_n(S) → HH_(n−1)(A) → ⋯` is exact, with
`HH(A)` defined through the unitisation; the same for cyclic homology (Wodzicki 1989, (3),
p. 592, excision there meaning excision for pure extensions, p. 591). Flatness makes the homology
of KTheoryFiniteLocalFields §4.0 that of the Hochschild complexes, on which Wodzicki works
(Convention 1); the unitisation `k ⊕ A` of a flat `A` is flat, so the extension `A → k ⊕ A → k`
is among those quantified.
*Needs:* 5.1; KTheoryFiniteLocalFields §4.0 (`HH`, `HC`, relative fibres); RefinedTraceMethods
§1.4.

**Checks.**

- `A` unital, `R = A × S`: the sequence splits, consistently with 5.1's first Check.
- `A = εk[ε]` (square-zero): `H₁(B(A)) = A/A² = k·ε ≠ 0`, so `A` is not H-unital, and by 5.2
  some extension of `k`-flat algebras containing `A` violates excision in Hochschild homology.
- Flatness is automatic over a field and is used over `k = ℤ`: for `A = pℤ ⊂ ℤ` the extension
  `0 → pℤ → ℤ → ℤ/p → 0` is not among those quantified (`ℤ/p` is not flat, and the extension is
  not pure), and `pℤ` is not H-unital (`A² ≠ A`).

### 5.3 Rational excision in algebraic K-theory

The comparison of the two obstructions is Cortiñas' theorem, stated by RefinedTraceMethods §4.18
(truncating invariants): the obstruction to excision in rational K-theory is the obstruction to
excision in rational cyclic homology, shifted by one (Cortiñas 2006, Corollary 0.2, p. 2). This
target does not restate it and deduces from it, with 5.2, the Suslin–Wodzicki criterion: a ring
`A` without unit satisfies excision in rational algebraic K-theory, in the sense of
GeneralAlgebraicKTheory §8.10 after tensoring with `ℚ`, if and only if `A ⊗_ℤ ℚ` is H-unital
(the "if" direction is Suslin–Wodzicki 1992, Theorem A, the "only if" direction Wodzicki 1989,
(4), p. 592). Route: by Cortiñas' theorem, rational K-excision for `A` inside every unital ring
containing it is excision in cyclic homology for the `ℚ`-algebra `A ⊗_ℤ ℚ`, which 5.2
characterises by H-unitality. Deduce that every C*-algebra satisfies rational excision, since
C*-algebras are H-unital (Wodzicki 1989, p. 593, proved in its Sections 4–8).
*Needs:* 5.1, 5.2; RefinedTraceMethods §4.18; GeneralAlgebraicKTheory §8.3, §8.10.

**Checks.**

- `A = ℚ` (unital): H-unital, and excision holds, as for every unital ring.
- `A = εℚ[ε]` (square-zero, nonunital): `A ≠ A²`, so excision fails rationally already in degree 1,
  matching GeneralAlgebraicKTheory §8.10's criterion `I = I²` in degree one.
- `A = ℤ` with zero multiplication: `A ⊗ ℚ = ℚ` with zero multiplication is not H-unital, so by
  5.3 some unital ring containing `A` violates rational excision; the Dorroh unitisation
  `ℤ[ε]/(ε²) = ℤ ⋉ ℤε` itself never does, its excision map being the identity
  (GeneralAlgebraicKTheory §8.10).

### 5.4 Firm modules

For a nonunital ring `A`, define a left `A`-module `M` to be unitary if `AM = M` and firm if the
multiplication `A ⊗_A M → M` is bijective (Convention 8), and the full subcategories of firm and
of unitary modules (González-Férez–Marín 2010, Definition 1, p. 84; the terminology is Quillen's,
Böhm–Vercruysse 2009, §1.1, p. 4 of the arXiv text). Prove:

- For unital `A`, firm, unitary and unital modules coincide.
- Firm modules are unitary.
- Over a ring with left local units (5.1) every unitary module is firm: if `Σ a_i m_i = 0` and
  `e a_i = a_i` for all `i`, then `Σ a_i ⊗ m_i = e ⊗ Σ a_i m_i = 0` in `A ⊗_A M`. In particular
  such a ring is firm as a left module over itself.
*Needs:* 5.1 (left local units); Mathlib `Unitization`.

**Checks.**

- `A = 2ℤ`, `M = ℤ/2` with zero action: unitary fails (`AM = 0`), and `A ⊗_A M → M` is zero
  (Convention 8), so not firm.
- `A = ⊕_(n∈ℕ) ℤ` with local units: every unitary module is firm, and `A ⊗_A A → A` is bijective.
- Unitary does not imply firm. Let `k` be a field and `V = ⋃_n k[x^(1/2ⁿ)]` localised at the
  maximal ideal `(x^(1/2ⁿ))` of each term, a union of discrete valuation rings each dominated by
  the next, hence a valuation ring with value group `ℤ[1/2]`. Its maximal ideal `m` (the
  elements of positive value) satisfies `m² = m`, since `x^q = x^(q/2) x^(q/2)`, and is not
  principal, `ℤ[1/2]` having no least positive element. Take `A = m` and `M = m/xV` for a
  nonzero `x ∈ m`. Then `AM = (m² + xV)/xV = M`; since `m` is flat over `V` and `m ⊗_V m = m`,
  and `m = m²` lets every `v ∈ V` be moved across `⊗_A`, `A ⊗_A M = m ⊗_V M = m/xm`, and
  `A ⊗_A M → M` has kernel `xV/xm ≅ V/m ≠ 0`. A definition of firm modules by `AM = M` would
  accept `M`. The field hypothesis matters: for `k = ℤ/6` the quotient of `⋃_n k[x^(1/2ⁿ)]` by
  the ideal of the `x^(1/2ⁿ)` is `ℤ/6`, so that ideal is not prime and the localisation does not
  exist.

### 5.5 Morita contexts

Define a Morita context `(A, B, P, Q, φ, ψ)` between nonunital rings: bimodules `ₐP_B`, `_BQ_A`
and bimodule maps `φ : P ⊗_B Q → A`, `ψ : Q ⊗_A P → B` satisfying the two associativity
conditions. Prove: if `φ` and `ψ` are surjective, `P ⊗_B −` and `Q ⊗_A −` are inverse equivalences
between the categories of firm `B`-modules and firm `A`-modules. This is the Kato–Ohtake theorem
in the form of Böhm–Vercruysse 2009, Theorem 1.12 and Remark 1.13, pp. 11–12 of the arXiv text,
applied to the context `(Ã, B̃, P, Q, φ, ψ)` of the unital rings `Ã = Unitization ℤ A` and
`B̃ = Unitization ℤ B`, in which the images of `φ` and `ψ` are the ideals `A` and `B`. Route:
for surjective `φ`, the map `P ⊗_B Q ⊗_A M → M` induced by `φ` is bijective exactly when `M` is
firm (loc. cit., Lemma 1.10, p. 9, stated there for right modules).
*Needs:* 5.4.

**Checks.**

- The unital context `(A, M_r(A), Aʳ, Aʳ)` has surjective pairings and recovers the classical
  Morita equivalence of `A` with `M_r(A)`.
- The context `(A, A, A, A)` with multiplication pairings for `A = ⊕_(n∈ℕ) ℤ`: surjective pairings
  (local units), and the equivalence is the identity of firm modules.
- Surjectivity is used: `(ℤ, 0, 0, 0, 0, 0)` is a Morita context with `φ = 0` not surjective;
  the firm `ℤ`-modules are all abelian groups, the firm modules over the zero ring are zero, and
  `Q ⊗_A − = 0` is not an equivalence.
- Surjectivity is not necessary: for `A = B = P = Q = εℤ[ε]` (square-zero) with `φ = ψ = 0`, a
  firm module `M` satisfies `M = AM = A²M = 0`, both categories are zero and the two functors are
  inverse equivalences; the statement is an implication only.

### 5.6 Quillen's `K₀′`

For a nonunital ring `A` and a unital ring `R` containing `A` as a two-sided ideal, define
`K₀′(A)` as the Grothendieck group of bounded complexes of finitely generated projective
`R`-modules that become acyclic after reduction modulo `A`, with relations from short exact
sequences of complexes, homotopy equivalent complexes being identified (Quillen 1996,
Introduction, p. 197). Prove:

- `K₀′(A)` does not depend on `R`: the map from `Ã = Unitization ℤ A` to `R` gives an
  isomorphism of the two groups (loc. cit., p. 197, the excision corollary).
- Morita invariance: for a Morita context `[[R, Q], [P, S]]` linking unital rings `R` and `S`,
  `K₀′(QP) ≅ K₀′(PQ)`, where `QP ⊆ R` and `PQ ⊆ S` are the ideals spanned by the products
  (loc. cit., Theorem (2), p. 197).
- There is a natural surjection `K₀′(A) → K₀(A)` onto AlgebraicKTheory §3.4's reduced `K₀`, and it
  is an isomorphism when `A` is a C*-algebra (loc. cit., p. 198).

The topological
model of `K₀′`, the class of a bounded complex of vector bundles on a compact space `X` exact on a
closed subspace `Y` in `K⁰(X, Y)` (loc. cit., p. 198), is TopologicalKTheory T3.2 and is not
restated here.
*Needs:* 5.5; AlgebraicKTheory §3.4; Mathlib `Module.Projective`, `ChainComplex`, `Unitization`.

**Checks.**

- `A = R` unital: complexes acyclic modulo `R` are all bounded complexes of finitely generated
  projectives, and their Euler characteristic gives `K₀′(R) ≅ K₀(R)`.
- For idempotent matrices `P, Q` over a unital ring with `P − Q` having entries in `A`,
  `tr((P − Q)^(2k+1)) = tr P − tr Q` for all `k ≥ 0` over a commutative ring: for
  `P = [[1, 1], [0, 0]]`, `Q = [[1, 0], [0, 0]]`, `P − Q = [[0, 1], [0, 0]]` has cube `0`, and
  `tr P − tr Q = 0`; for `P = diag(1, 0)`, `Q = 0`, `(P − Q)³ = P` with trace `1`. This is the
  trace formula that pairs the class `[P] − [Q]` of `K₀(A)` with traces on `A`.
- `A = εℤ[ε]` square-zero: reduced `K₀(A) = 0` (idempotents lift uniquely along nilpotent
  ideals), and the surjection `K₀′(A) → K₀(A)` has target `0`; the map is not claimed injective
  outside the C*-algebra case.

### Examples

- For the compact operators `𝒦` on a separable Hilbert space, a C*-algebra, 5.3 gives rational
  excision for `𝒦` inside every unital ring containing it as an ideal, and 5.6 gives
  `K₀′(𝒦) ≅ K₀(𝒦)`.
- For a ring with local units, 5.1, 5.4 and 5.5 apply together: it is H-unital, its firm and
  unitary modules coincide, and its Morita contexts with surjective pairings give equivalences
  of the categories of firm modules.

### Dependencies

Mathlib for 5.1 and 5.4; KTheoryFiniteLocalFields §4.0 and RefinedTraceMethods §1.4 for 5.2;
RefinedTraceMethods §4.18 and GeneralAlgebraicKTheory §§8.3 and 8.10 for 5.3; AlgebraicKTheory
§3.4 for 5.6. Within the layer,
5.2, 5.3 and 5.4 use 5.1, 5.5 uses 5.4 and 5.6 uses 5.5.

## Downstream consumers

No roadmap consumes a target of CyclicHomologyLieHomologyAndQuasiFreeAlgebras.
SmoothRepresentationsOfLocalGroups SR.1.3 (*locally-unital-algebra*) states the idempotented-algebra
case of 5.4 independently and cites nothing here; 5.4 records it as an instance. RefinedTraceMethods
obtains the nil-invariance of `HP(−⊗ℚ/ℚ)` from its own §§4.9 and 4.18 and does not use 3.2.
NoncommutativeGeometry fixes its nonunital conventions by forced unitisation and assumes no
H-unitality (Scope, conventions and suppliers); it cites no roadmap for excision.

## Research context

The Loday–Quillen–Tsygan theorem makes cyclic homology an additive analogue of algebraic
K-theory, with `H_*(𝔤𝔩(A))` in the role of `H_*(GL(A))`; the filtration of `HC_(*−1)(A)` by the
rank `n` of the matrices `𝔤𝔩_n(A)` from which a primitive class comes is not well understood, and
the vanishing conjectured by Loday and Quillen for it holds for smooth commutative algebras and
fails in general. Cuntz and Quillen's programme treats quasi-free algebras as noncommutative
smooth spaces and periodic cyclic homology as their de Rham cohomology; open questions there
concern the homological algebra of firm modules over nonunital rings and the derived categories
they generate. Quillen's notebooks 1983-1, 1983-6, 1988-1, 1991-4 and 1992-1 (Clay Mathematics
Institute) work on these questions.

Quillen asked whether the firm modules over a nonunital ring always form an abelian category
(González-Férez–Marín 2010, p. 83). González-Férez and Marín (2007) answered no, by a ring with a
monomorphism of firm modules that is not a kernel (loc. cit., p. 83); the category of firm modules
is abelian if and only if the composite of two kernels is a kernel (González-Férez–Marín 2010,
Theorem 3, p. 86).

## References

- A. Connes, « Cohomologie cyclique et foncteurs Extⁿ », *C. R. Acad. Sci. Paris Sér. I Math.*
  296 (1983), 953–958. Zbl 0534.18009.
- A. Connes, *Noncommutative Geometry*, Academic Press, San Diego, 1994. Zbl 0818.46076. Open:
  the author's site. Cited as Connes, *Noncommutative Geometry*.
- W. G. Dwyer, M. J. Hopkins, D. M. Kan, « The homotopy theory of cyclic sets », *Trans. Amer.
  Math. Soc.* 291 (1985), 281–289. doi:10.1090/S0002-9947-1985-0797060-1. Zbl 0594.55020.
- J.-L. Loday, D. Quillen, « Cyclic homology and the Lie algebra homology of matrices »,
  *Comment. Math. Helv.* 59 (1984), 565–591. doi:10.1007/BF02566367. Zbl 0565.17006. Open scan:
  GDZ, PPN358147735_0059.
- B. L. Tsygan, « The homology of matrix Lie algebras over rings and the Hochschild homology »,
  *Russian Math. Surveys* 38 (1983), no. 2, 198–199. doi:10.1070/RM1983v038n02ABEH003481.
  Zbl 0526.17006.
- C. Kassel, J.-L. Loday, « Extensions centrales d'algèbres de Lie », *Ann. Inst. Fourier* 32
  (1982), no. 4, 119–142. doi:10.5802/aif.896. Zbl 0485.17006. Open: Numdam,
  AIF_1982__32_4_119_0.
- J.-L. Loday, *Cyclic Homology*, Grundlehren Math. Wiss. 301, Springer, 1992. Zbl 0780.18009.
  Second edition 1998, doi:10.1007/978-3-662-11389-9, Zbl 0885.18007.
- H. Cartan, S. Eilenberg, *Homological Algebra*, Princeton University Press, 1956.
- J. W. Milnor, J. C. Moore, « On the structure of Hopf algebras », *Ann. of Math.* 81 (1965),
  211–264. doi:10.2307/1970615.
- T. G. Goodwillie, « Cyclic homology, derivations, and the free loopspace », *Topology* 24
  (1985), 187–215. doi:10.1016/0040-9383(85)90055-2. Zbl 0569.16021.
- E. Getzler, « Cartan homotopy formulas and the Gauss-Manin connection in cyclic homology », in
  *Quantum deformations of algebras and their representations*, Isr. Math. Conf. Proc. 7, Bar-Ilan
  University, 1993, 65–78. Zbl 0844.18007. Open: the author's page (page numbers of that text).
- M. J. Dunwoody, « Accessibility and groups of cohomological dimension one », *Proc. London
  Math. Soc.* (3) 38 (1979), no. 2, 193–215. doi:10.1112/plms/s3-38.2.193. Zbl 0419.20040.
- J. Cuntz, D. Quillen, « Algebra extensions and nonsingularity », *J. Amer. Math. Soc.* 8
  (1995), 251–289. doi:10.1090/S0894-0347-1995-1303029-0. Zbl 0838.19001. Cited as 1995a.
- J. Cuntz, D. Quillen, « Cyclic homology and nonsingularity », *J. Amer. Math. Soc.* 8 (1995),
  373–442. doi:10.1090/S0894-0347-1995-1303030-7. Zbl 0838.19002. Cited as 1995b.
- J. Cuntz, D. Quillen, « On excision in periodic cyclic cohomology », *C. R. Acad. Sci. Paris
  Sér. I Math.* 317 (1993), 917–922. Zbl 0803.18007.
- J. Cuntz, D. Quillen, « Excision in bivariant periodic cyclic cohomology », *Invent. Math.* 127
  (1997), 67–98. doi:10.1007/s002220050115. Zbl 0889.46054.
- D. Quillen, « Algebra cochains and cyclic cohomology », *Publ. Math. IHÉS* 68 (1988), 139–174.
  Numdam: PMIHES_1988__68__139_0. Zbl 0689.57026.
- D. Quillen, « Cyclic cohomology and algebra extensions », *K-Theory* 3 (1989), 205–246.
  doi:10.1007/BF00533370. Zbl 0696.16021.
- M. Wodzicki, « Excision in cyclic homology and in rational algebraic K-theory », *Ann. of
  Math.* 129 (1989), 591–639. doi:10.2307/1971518. Zbl 0689.16013. Open scan: the author's page
  at Berkeley.
- A. A. Suslin, M. Wodzicki, « Excision in algebraic K-theory », *Ann. of Math.* 136 (1992),
  51–122. doi:10.2307/2946546. Zbl 0756.18008.
- D. Quillen, « K₀ for nonunital rings and Morita invariance », *J. Reine Angew. Math.* 472
  (1996), 197–217. doi:10.1515/crll.1996.472.197. Zbl 0837.19001. Open scan: GDZ,
  PPN243919689_0472.
- L. Marín, « Morita equivalence based on contexts for various categories of modules over
  associative rings », *J. Pure Appl. Algebra* 133 (1998), 219–232.
  doi:10.1016/S0022-4049(97)00197-7. Zbl 0928.16007.
- J. González-Férez, L. Marín, « The category of firm modules need not be abelian », *J. Algebra*
  318 (2007), 377–392. doi:10.1016/j.jalgebra.2007.08.007. Zbl 1137.16010.
- J. González-Férez, L. Marín, « Monomorphisms and kernels in the category of firm modules »,
  *Glasg. Math. J.* 52A (2010), 83–91. doi:10.1017/S0017089510000224. Zbl 1235.16008. Open: the
  journal's site.
- G. Böhm, J. Vercruysse, « Morita theory for comodules over corings », *Comm. Algebra* 37
  (2009), 3207–3247. doi:10.1080/00927870902747993. arXiv:0710.1017 (numbering and pages of the
  arXiv text).
- G. Cortiñas, « The obstruction to excision in K-theory and in cyclic homology », *Invent. Math.*
  164 (2006), 143–173. doi:10.1007/s00222-005-0473-9. Zbl 1092.19001. arXiv:math/0111096
  (theorem numbering of the arXiv version).
