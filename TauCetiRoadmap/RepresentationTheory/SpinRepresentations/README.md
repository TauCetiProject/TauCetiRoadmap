# Roadmap: Clifford algebras, the Pin and Spin groups, and spin representations

The spin representations are the one part of the finite-dimensional representation theory of the classical
groups that the tensor-power engine cannot reach. Every irreducible representation of `GLₙ` and `SLₙ` is cut
out of a tensor power `V^{⊗d}` of the standard representation, and so is every irreducible of `Spₙ`; for the
orthogonal series this is **false**. The Lie algebras `𝔰𝔬(2l+1)` (type `Bₗ`) and `𝔰𝔬(2l)` (type `Dₗ`) each
carry fundamental representations, the **spin** and **half-spin** representations, whose highest weights are
`½(1,…,1)`, with **half-integer** coordinates; no such weight occurs in any tensor power of the standard
representation, whose weights are integral. These representations exist because `SO(V)` is not simply
connected: they are honest representations of its **double cover** `Spin(V)`, and their carrier space is not
a tensor construction on `V` but the exterior algebra `⋀·W` of a maximal isotropic subspace `W ⊂ V`, made
into a module over the **Clifford algebra** `Cliff(V, Q)`. So
[the classical-groups roadmap](../ClassicalGroups/README.md) is genuinely incomplete without this one: it
builds the `Bₗ`/`Dₗ` irreducibles that are tensor constructions and must borrow the fundamental spin
representations from here.

Mathlib has a substantial Clifford-algebra library and, unusually, already has the Pin and Spin groups as
objects, but it stops exactly where the representation theory begins. It builds `CliffordAlgebra Q` with its
universal property, the `ℤ/2`-grading `evenOdd Q`, the even subalgebra, conjugation and reversal, the
module isomorphism `CliffordAlgebra Q ≃ₗ[R] ExteriorAlgebra R M` in characteristic not two
(`CliffordAlgebra.equivExterior`), the base-change and product-of-forms decompositions, and explicit
identifications of small Clifford algebras with `ℂ`, `ℍ`, and the dual numbers. It defines `lipschitzGroup`,
`pinGroup`, and `spinGroup` as subgroups of the Clifford units and proves they are groups, that they act on
`M` by twisted conjugation keeping vectors as vectors (`spinGroup.conjAct_smul_range_ι`), and that they are
closed under `star`. What it does **not** have is anything that turns this into representation theory: **no
double-cover theorem** (nothing says `Spin(V) → SO(V)` is surjective with kernel `{±1}`; only that the
conjugation action preserves `V`), **no spin module** (`⋀·W` is never made a Clifford module), **no
identification of `𝔰𝔬(V)` with `⋀²V` inside the Clifford algebra**, **no spin or half-spin representation**,
**no highest-weight identification** of them as the `Bₗ`/`Dₗ` fundamentals, **no exceptional isomorphisms**,
**no Bott-periodic classification of the real Clifford algebras**, and **no triality**. (The word "spin" does
not occur elsewhere in these roadmaps except inside "spine", and "Clifford" elsewhere always means
[Clifford theory over a normal subgroup](../InductionRestriction/README.md); the two are unrelated.)

This roadmap builds that theory, ending at the spin and half-spin representations as the fundamental
representations of types `Bₗ` and `Dₗ`, the low-dimensional exceptional isomorphisms, and triality for
`Spin₈`. It rests on [the classical-groups roadmap](../ClassicalGroups/README.md) for the standard
representation and the orthogonal group, on [the highest-weight roadmap](../LieHighestWeight/README.md) for
the theorem of the highest weight and the fundamental weights, and on
[the root-systems roadmap](../RootSystems/README.md) for the `Bₗ`/`Dₗ` root data and the outer-automorphism
graph symmetry that underlies triality. Suggested home:
`TauCeti/LinearAlgebra/CliffordAlgebra/` (the structure theory, the double covers, and the real
classification, upstreamable to Mathlib on their own) and
`TauCeti/RepresentationTheory/Spin/` (the spin modules, the highest-weight identification, and triality).

## Standing conventions

- **The base field is `ℂ` for the representation theory; real forms are named explicitly.** The spin
  modules, their irreducibility, and the highest-weight identification are stated over `ℂ` (algebraically
  closed, characteristic `0`), where a nondegenerate quadratic form has a maximal isotropic subspace of half
  the dimension and `Cliff(V, Q)` is a matrix algebra. The **structure theory** of the Clifford algebra, the
  grading, the filtration, and the Pin/Spin double covers are stated over a general commutative ring `R`
  with `[Invertible (2 : R)]` where that is the honest generality (Mathlib's `equivExterior` and the
  twisted-conjugation lemmas already carry `[Invertible (2 : R)]`), and specialized to a field where
  nondegeneracy and dimension counts are used. The **real Clifford algebras** `Cliff(p, q)` and the real
  groups `Spin(p, q)` are a separate, explicitly real layer; do not fold the signature `(p, q)` into the
  complex theory, where every nondegenerate form of a given rank is equivalent.
- **Reuse Mathlib's Clifford, quadratic-form, and Pin/Spin vocabulary.** The Clifford algebra is
  `CliffordAlgebra Q` for `Q : QuadraticForm R M` (`= QuadraticMap R M R`), with `CliffordAlgebra.ι Q`,
  `CliffordAlgebra.lift`, the grading `CliffordAlgebra.evenOdd Q : ZMod 2 → Submodule R _` and its
  `GradedAlgebra` instance, the even subalgebra `CliffordAlgebra.even Q`, `CliffordAlgebra.involute`,
  `CliffordAlgebra.reverse`, and the module isomorphism `CliffordAlgebra.equivExterior`. The groups are
  `lipschitzGroup Q`, `pinGroup Q`, `spinGroup Q` with `pinGroup.toUnits`, `spinGroup.toUnits`, and the
  action lemmas `spinGroup.conjAct_smul_range_ι`, `spinGroup.involute_act_ι_mem_range_ι`. Isometries are
  `QuadraticForm.IsometryEquiv`; nondegeneracy is `QuadraticForm.Nondegenerate`; the exterior power is
  `exteriorPower R k M = ⋀[R]^k M` and the exterior algebra `ExteriorAlgebra R M`. A representation is
  `Representation ℂ G V`, bundled as `FDRep ℂ G`. Never introduce a private synonym for any of these.
- **`pinGroup Q` and `spinGroup Q` are Mathlib's `Submonoid`s carrying a `Group` instance; the double cover
  targets an abstract orthogonal group.** Mathlib's `orthogonalGroup` and `specialOrthogonalGroup` are
  `Matrix.orthogonalGroup n R = Matrix.unitaryGroup n R` and its determinant-one subgroup, defined for the
  **standard** form on `n → R`. The orthogonal group of an abstract `Q : QuadraticForm R M` is not in
  Mathlib; build it as `orthogonalGroup Q : Subgroup (M ≃ₗ[R] M)`, the `Q`-preserving linear
  automorphisms, and `specialOrthogonalGroup Q` its determinant-one subgroup, and prove the identification
  with `Matrix.orthogonalGroup` under a basis diagonalizing `Q`. The twisted conjugation
  `x ↦ (v ↦ involute x · ι v · x⁻¹)` is the map to `orthogonalGroup Q`; it is the Mathlib content
  `spinGroup.involute_act_ι_mem_range_ι` promoted to a group homomorphism.
- **The spin module is `⋀·W` for a maximal isotropic `W`, made a Clifford module, not a tensor
  construction.** Over `ℂ`, a nondegenerate `Q` on a `2l`- or `(2l+1)`-dimensional `V` admits a maximal
  isotropic subspace `W` with `finrank ℂ W = l`; the spin module is `S = ExteriorAlgebra ℂ W = ⋀·W`, with
  `Cliff(V, Q)` acting by exterior multiplication for `w ∈ W` and contraction for the dual pairing. Pin `W`
  and the resulting algebra homomorphism `CliffordAlgebra Q →ₐ[ℂ] Module.End ℂ S` as named objects. The spin
  representation of `spinGroup Q` is the restriction of this Clifford action along `spinGroup.toUnits`; keep
  the Clifford-module structure and the group representation separate, related by an explicit lemma.
- **Weights are half-integral, and the identification is with the abstract fundamental weights.** The spin
  representation of `𝔰𝔬(V)` has highest weight `ωₗ = ½(1,…,1)` (type `Bₗ`), and the two half-spin
  representations have highest weights `ωₗ₋₁, ωₗ` (type `Dₗ`); these live in the weight lattice of
  [the root-systems roadmap](../RootSystems/README.md), strictly larger than the root lattice, which is why
  they are not tensor-power weights. State the identification against the fundamental weights of
  [the highest-weight roadmap](../LieHighestWeight/README.md) and the `Bₗ`/`Dₗ` root data, not against an ad
  hoc coordinate vector. The Lie algebra `𝔰𝔬(V)` is realized here as `⋀²V ⊂ even Cliff(V, Q)` under the
  commutator bracket, and identified with Mathlib's `LieAlgebra.Orthogonal.so`; the spin action of the group
  differentiates to this bracket action, and that compatibility is a named target.
- **The Clifford grading is `ℤ/2`; the filtration by degree is separate and its associated graded is the
  exterior algebra.** Mathlib's `evenOdd Q` is the `ℤ/2`-grading (a `GradedAlgebra`), and `equivExterior`
  is a *module* isomorphism, not an algebra one. The **filtration** `Fₖ = ⨆_{i ≤ k} (range ι)^i` and the
  associated-graded identification `Fₖ / Fₖ₋₁ ≅ ⋀ᵏV` are a distinct structure, built here on top of
  `equivExterior` and `iSup_ι_range_eq_top`. Keep the two gradings distinct in name and statement.

## What Mathlib already has (consume)

- **The Clifford algebra and its universal property** — `LinearAlgebra/CliffordAlgebra/Basic.lean`:
  `CliffordAlgebra Q` (for `Q : QuadraticForm R M`), `CliffordAlgebra.ι Q : M →ₗ[R] CliffordAlgebra Q` with
  `ι_sq_scalar` (`ι Q m * ι Q m = algebraMap R _ (Q m)`), the universal property
  `CliffordAlgebra.lift Q : {f : M →ₗ[R] A // ∀ m, f m * f m = algebraMap _ _ (Q m)} ≃ (CliffordAlgebra Q →ₐ[R] A)`
  with `ι_comp_lift`, `lift_unique`, `hom_ext`, `induction`, `adjoin_range_ι`; the functoriality
  `CliffordAlgebra.map (f : Q₁ →qᵢ Q₂)` and `CliffordAlgebra.equivOfIsometry`.
- **The `ℤ/2`-grading and the even subalgebra** — `LinearAlgebra/CliffordAlgebra/Grading.lean`:
  `CliffordAlgebra.evenOdd Q : ZMod 2 → Submodule R (CliffordAlgebra Q)`, the `GradedAlgebra (evenOdd Q)`
  instance (`CliffordAlgebra.gradedAlgebra`), `evenOdd_mul_le`, `evenOdd_isCompl`, `iSup_ι_range_eq_top`
  (`⨆ i, (range ι)^i = ⊤`, the top of the filtration), and the induction principles `evenOdd_induction`,
  `even_induction`, `odd_induction`; `LinearAlgebra/CliffordAlgebra/Even.lean`: `CliffordAlgebra.even Q`
  (`= (evenOdd Q 0).toSubalgebra`), `EvenHom`, `CliffordAlgebra.even.lift`.
- **Conjugation, reversal, and the exterior-algebra isomorphism** —
  `LinearAlgebra/CliffordAlgebra/Conjugation.lean`: `CliffordAlgebra.involute` (the grade involution),
  `involuteEquiv`, `CliffordAlgebra.reverse`, `reverseEquiv`, `reverse_comp_involute`;
  `LinearAlgebra/CliffordAlgebra/Contraction.lean`: `CliffordAlgebra.contractLeft`,
  `CliffordAlgebra.contractRight`, `CliffordAlgebra.changeForm`, and the module isomorphism
  `CliffordAlgebra.equivExterior [Invertible (2 : R)] : CliffordAlgebra Q ≃ₗ[R] ExteriorAlgebra R M`.
- **The Lipschitz, Pin, and Spin groups** — `LinearAlgebra/CliffordAlgebra/SpinGroup.lean`:
  `lipschitzGroup Q : Subgroup (CliffordAlgebra Q)ˣ` with
  `lipschitzGroup.conjAct_smul_range_ι` (the twisted conjugation preserves `range ι`, over
  `[Invertible (2 : R)]`) and `lipschitzGroup.involute_act_ι_mem_range_ι`; `pinGroup Q` and `spinGroup Q`
  as `Submonoid (CliffordAlgebra Q)` with their `Group` and `StarMul` instances, `pinGroup.toUnits`,
  `spinGroup.toUnits`, `spinGroup.mem_even`, `spinGroup.involute_eq` (`involute` fixes the spin group),
  `spinGroup.conjAct_smul_ι_mem_range_ι`, and `spinGroup.conjAct_smul_range_ι`.
- **Small Clifford algebras identified** — `LinearAlgebra/CliffordAlgebra/Equivs.lean`:
  `CliffordAlgebraComplex.equiv : CliffordAlgebra CliffordAlgebraComplex.Q ≃ₐ[ℝ] ℂ` (with
  `Q r = -(r * r)`), `CliffordAlgebraQuaternion.equiv : CliffordAlgebra (Q c₁ c₂) ≃ₐ[R] ℍ[R,c₁,0,c₂]`,
  `CliffordAlgebraDualNumber.equiv`, and `CliffordAlgebra (0 : QuadraticForm R Unit) ≃ₐ[R] R`; the
  even-subalgebra isomorphism `LinearAlgebra/CliffordAlgebra/EvenEquiv.lean`:
  `CliffordAlgebra.equivEven : CliffordAlgebra Q ≃ₐ[R] CliffordAlgebra.even (Q' Q)`
  (`Q'` the form with one extra negated coordinate), the seed of Bott periodicity; and the tensor
  decompositions `LinearAlgebra/CliffordAlgebra/Prod.lean` (`CliffordAlgebra.prodEquiv`, over the graded
  tensor product `ᵍ⊗`) and `LinearAlgebra/CliffordAlgebra/BaseChange.lean`
  (`CliffordAlgebra.equivBaseChange`).
- **Quadratic forms and isometries** — `LinearAlgebra/QuadraticForm/Basic.lean` (`QuadraticForm`,
  `Matrix.toQuadraticForm'`, `QuadraticForm.toMatrix'`), `.../QuadraticForm/IsometryEquiv.lean`
  (`QuadraticForm.IsometryEquiv`, `refl`, `symm`, `trans`), `.../QuadraticForm/Radical.lean`
  (`QuadraticForm.Nondegenerate`, `nondegenerate_iff_radical_eq_bot`), and `QuadraticMap.IsOrtho`.
- **The classical groups and the orthogonal Lie algebra** — `LinearAlgebra/UnitaryGroup.lean`
  (`Matrix.orthogonalGroup n R`, `Matrix.specialOrthogonalGroup n R`, `mem_orthogonalGroup_iff`),
  `LinearAlgebra/Matrix/SpecialLinearGroup.lean`, `LinearAlgebra/SymplecticGroup.lean`;
  `Algebra/Lie/Classical.lean`: `LieAlgebra.Orthogonal.so n R` (skew-adjoint matrices for the identity
  form), `so'`, and the type-`B`/`D` presentations `soIndefiniteEquiv`, together with
  `skewAdjointMatricesLieSubalgebra`.
- **Exterior and tensor algebra, and the representation vocabulary** — `LinearAlgebra/ExteriorAlgebra/Basic.lean`
  (`ExteriorAlgebra R M`), `LinearAlgebra/ExteriorPower/Basic.lean` (`exteriorPower R n M = ⋀[R]^n M`,
  `exteriorPower.ιMulti`, `exteriorPower.map`, `exteriorPower.basis`), `Module.Dual`, `Module.End`,
  `Module.finrank`; `RepresentationTheory/Basic.lean` (`Representation`), `RepresentationTheory/FDRep.lean`
  (`FDRep`), `RepresentationTheory/Character.lean` (`FDRep.character`).

## What is missing (build here)

The abstract **orthogonal group** `orthogonalGroup Q : Subgroup (M ≃ₗ[R] M)` of a quadratic form and its
determinant-one subgroup, with the identification against `Matrix.orthogonalGroup` under a basis; the
**degree filtration** `Fₖ` of the Clifford algebra and the associated-graded isomorphism `Fₖ/Fₖ₋₁ ≅ ⋀ᵏV`;
the **structure theorem** identifying `Cliff(V, Q)` over an algebraically closed field with a matrix algebra
(even dimension) or a sum of two (odd dimension), and the even subalgebra one dimension down; the
**twisted-conjugation homomorphism** `pinGroup Q →* orthogonalGroup Q` and `spinGroup Q →* specialOrthogonalGroup Q`,
the **double-cover theorem** (surjective in finite dimension over a field, with kernel `{±1}` of order two),
and the resulting **short exact sequences** `1 → ℤ/2 → Pin(V) → O(V) → 1`, `1 → ℤ/2 → Spin(V) → SO(V) → 1`;
the realization of the **Lie algebra `𝔰𝔬(V) ≅ ⋀²V`** inside `even Cliff(V, Q)` under the commutator, its
identification with `LieAlgebra.Orthogonal.so`, and the differential of the double cover; the **maximal
isotropic subspace** and the **Clifford-module structure on `S = ⋀·W`**, the **spin representation**
`Representation ℂ (spinGroup Q) S`, its **half-spin summands `S⁺, S⁻`** in even dimension, and their
**irreducibility**; the **highest-weight identification** of `S` (type `Bₗ`) and `S⁺, S⁻` (type `Dₗ`) as the
fundamental representations with the half-integer weights, and the **dimension `2ˡ`**; the **low-dimensional
exceptional isomorphisms** `Spin₃ ≅ SL₂`, `Spin₄ ≅ SL₂ × SL₂`, `Spin₅ ≅ Sp₄`, `Spin₆ ≅ SL₄`; the **real
Clifford algebras** `Cliff(p, q)`, their **Bott-periodic** structure `Cliff(p+1, q+1) ≅ Cliff(p, q) ⊗ M₂(ℝ)`
and the mod-`8` table, and the **real groups** `Spin(p, q)`; and **triality** for `Spin₈`, the order-three
outer automorphism cyclically permuting `V, S⁺, S⁻`. None of this is upstream.

`Suggested.lean` pins the load-bearing objects (`orthogonalGroup`, `filtration`, `filtrationGradedEquiv`,
`pinToOrthogonal`, `spinToSpecialOrthogonal`, `soEquivBivector`, `spinAction`, `spinRep`, `spinPlus`,
`spinMinus`, `realCliffordForm`, `spinPQ`, `trialityAut`) and the named milestones below as `sorry`-targets,
so each is claimable and the summit statements (the double cover, the highest-weight identification, and
triality) are machine-checked to be expressible against the pinned Mathlib.

---

## The build, in layers

### Layer 0: the Clifford algebra, its universal property, and the two gradings

- **The universal property, consumed and packaged.** Restate `CliffordAlgebra.lift` and `hom_ext` as the
  working interface, with the basic identities `ι_sq_scalar`, `ι_mul_ι_add_swap` (the polarization
  `ι a · ι b + ι b · ι a = polar Q a b`), and, for orthogonal vectors, the anticommutation
  `ι_mul_ι_comm_of_isOrtho`. Record the functor `CliffordAlgebra.map` and `equivOfIsometry`: an isometry of
  forms induces an algebra isomorphism, so over `ℂ` the Clifford algebra depends only on the rank.
- **The `ℤ/2`-grading.** Consume `evenOdd Q`, the `GradedAlgebra` instance, `evenOdd_isCompl`, and the even
  subalgebra `even Q`; state `involute` as the grade involution (`involute` is `+1` on `evenOdd Q 0`, `-1`
  on `evenOdd Q 1`) and record `spinGroup.mem_even`, `spinGroup.involute_eq`. This grading is what
  distinguishes `pinGroup` from `spinGroup`.
- **The degree filtration and its associated graded.** `filtration Q k = ⨆ i ≤ k, (LinearMap.range (ι Q))^i`,
  an increasing filtration with `filtration Q 0 = 1`, `filtration Q 1 = 1 ⊔ range ι`, and union `⊤`
  (`iSup_ι_range_eq_top`). The **associated-graded isomorphism** `filtrationGradedEquiv`:
  `(filtration Q k ⧸ filtration Q (k-1)) ≃ₗ[R] ⋀[R]^k M` in characteristic not two, built by transporting
  `CliffordAlgebra.equivExterior` (which carries the filtration to the exterior grading) and reading off the
  `k`-th graded piece. In particular `finrank (CliffordAlgebra Q) = 2 ^ finrank M` for finite free `M`,
  matching `∑ₖ (finrank M).choose k`.

### Layer 1: the structure theorem

Stated over a field `K`; the sharp form is over an algebraically closed field.

- **Nondegeneracy and diagonalization.** Consume `QuadraticForm.Nondegenerate`; build the reduction of a
  nondegenerate `Q` over a field of characteristic not two to an orthogonal basis (a diagonal form), and
  over `ℂ` to the standard form `∑ xᵢ²`, so `Cliff(V, Q) ≅ Cliff(∑ xᵢ²)`. This is where `equivOfIsometry`
  does its work.
- **The even-dimensional case.** For `Q` nondegenerate on a `2l`-dimensional `V` over an algebraically
  closed field, `CliffordAlgebra Q ≃ₐ[K] Matrix (Fin (2^l)) (Fin (2^l)) K`, and the even subalgebra
  `even Q ≃ₐ[K] Matrix (Fin (2^(l-1))) _ K × Matrix (Fin (2^(l-1))) _ K`. The isomorphism is exactly the
  Clifford action on the spin module `S = ⋀·W` of Layer 4 (`End S ≅ M_{2^l}`), so this layer and Layer 4
  meet; prove the structure theorem *via* the spin module, or independently and then match.
- **The odd-dimensional case.** For `Q` nondegenerate on a `(2l+1)`-dimensional `V`,
  `CliffordAlgebra Q ≃ₐ[K] Matrix (Fin (2^l)) _ K × Matrix (Fin (2^l)) _ K`, while the even subalgebra is a
  single `Matrix (Fin (2^l)) _ K`. The center is `K` (even case) or `K × K` (odd case); the two
  central idempotents in the odd case are the source of the two inequivalent restrictions to `Pin`.
- **The seed of periodicity.** Consume `CliffordAlgebra.equivEven`
  (`Cliff(Q) ≅ even(Q ⊕ ⟨-1⟩)`) and `CliffordAlgebra.prodEquiv` (the graded tensor product over a
  direct sum of forms); these are the algebraic inputs the complex structure theorem and the real Bott
  periodicity of Layer 7 both rest on.

### Layer 2: the Pin and Spin groups and the double covers

- **The abstract orthogonal group.** `orthogonalGroup Q : Subgroup (M ≃ₗ[R] M)`, the linear automorphisms
  `f` with `Q (f x) = Q x` for all `x` (equivalently `Nonempty (Q.IsometryEquiv Q)` realized as a bundled
  automorphism group), and `specialOrthogonalGroup Q` its determinant-one subgroup. Prove the isomorphism
  with `Matrix.orthogonalGroup (Fin n) K` under a basis diagonalizing `Q` (for the standard form), so the
  abstract and matrix presentations agree.
- **The twisted-conjugation homomorphism.** `pinToOrthogonal Q : pinGroup Q →* orthogonalGroup Q`, sending
  `x` to the automorphism `v ↦ involute x · ι v · x⁻¹` of `M` (well-defined into `range ι ≅ M` by
  `spinGroup.involute_act_ι_mem_range_ι`, and `Q`-preserving because `ι v · ι v = Q v` is central). Its
  restriction `spinToSpecialOrthogonal Q : spinGroup Q →* specialOrthogonalGroup Q` lands in the
  determinant-one subgroup (the spin group is generated by even products of unit vectors, each contributing
  two reflections). Prove functoriality and that a unit vector `ι v` (with `Q v` a unit) maps to the
  **reflection** in `v⊥`.
- **The double cover (the summit of the layer).** For finite-dimensional `V` over a field of characteristic
  not two with nondegenerate `Q`, `pinToOrthogonal Q` and `spinToSpecialOrthogonal Q` are **surjective**
  (Cartan-Dieudonné: every isometry is a product of reflections, each realized by a unit vector), with
  **kernel `{±1}`** of order two (`MonoidHom.ker (spinToSpecialOrthogonal Q)` generated by `-1`,
  `Nat.card = 2`). Assemble the short exact sequences `1 → ℤ/2 → Pin(V) → O(V) → 1` and
  `1 → ℤ/2 → Spin(V) → SO(V) → 1`. This is what makes the spin representations representations of a cover
  rather than of `SO(V)` itself.
- **Simple-connectivity, over `ℂ` and `ℝ`.** State that `Spin(V)` is connected for `dim V ≥ 2` and simply
  connected for `dim V ≥ 3` (so it is *the* universal cover of `SO(V)`), as the topological statement that
  distinguishes it from the disconnected `O(V)` and the non-simply-connected `SO(V)`; the proof consumes the
  path-connectedness of the sphere in `V` and belongs with the real forms of Layer 7.

### Layer 3: the Lie algebra `𝔰𝔬(V) ≅ ⋀²V` inside the Clifford algebra

- **Bivectors as a Lie subalgebra.** The image of `⋀[R]^2 M` in `even Cliff(V, Q)` under
  `w₁ ∧ w₂ ↦ ½(ι w₁ · ι w₂ - ι w₂ · ι w₁)` is closed under the commutator bracket; equip `⋀²V` with the
  induced Lie-algebra structure. `soEquivBivector`: this is a Lie-algebra isomorphism
  `⋀[R]^2 M ≃ₗ⁅R⁆ 𝔰𝔬(V)` onto the skew-adjoint endomorphisms, identified with `LieAlgebra.Orthogonal.so`
  under a basis. The bracket of a bivector with `ι v` is the infinitesimal rotation of `v`, which is the
  differential of the Layer-2 conjugation.
- **The differential of the double cover.** The Lie-algebra homomorphism differentiating
  `spinToSpecialOrthogonal` is the isomorphism `soEquivBivector` composed with the adjoint action; state the
  compatibility `d(conjugation) = ad(bivector)` as a named lemma, so the group double cover and the
  Lie-algebra identification are two views of one object. This is the hook that lets a `spinGroup`
  representation differentiate to an `𝔰𝔬(V)`-module and be compared with
  [the highest-weight roadmap](../LieHighestWeight/README.md).

### Layer 4: the spin and half-spin representations

Stated over `ℂ`, for nondegenerate `Q`.

- **A maximal isotropic subspace.** Over `ℂ`, a nondegenerate `Q` on a `2l`- or `(2l+1)`-dimensional `V` has
  an isotropic subspace `W` with `finrank ℂ W = l` and (in even dimension) a complementary isotropic `W'`
  pairing with `W` by `Q`, so `V = W ⊕ W'` (even) or `V = W ⊕ W' ⊕ ⟨e⟩` (odd). Build `W`, the pairing
  `W' ≃ₗ Module.Dual ℂ W`, and the isotropy `Q.IsOrtho` witnesses.
- **The Clifford module `S = ⋀·W`.** `spinAction Q W : CliffordAlgebra Q →ₐ[ℂ] Module.End ℂ (ExteriorAlgebra ℂ W)`,
  the algebra homomorphism from the universal property, sending `ι w` (for `w ∈ W`) to exterior
  multiplication `w ∧ -` and `ι w'` (for `w' ∈ W'`) to twice the contraction by the dual functional
  `Q(w', -)`; check the Clifford relation `ι v · ι v = Q v` on `V = W ⊕ W'` (`w ∧ (w ∧ -) = 0` gives
  isotropy, and the anticommutator of wedge and contraction gives the pairing). This is the **spinor
  representation of the Clifford algebra**; in even dimension it is an isomorphism onto `End S`
  (`dim S = 2ˡ`), recovering the Layer-1 structure theorem.
- **The spin representation of the group.** `spinRep Q W : Representation ℂ (spinGroup Q) (ExteriorAlgebra ℂ W)`,
  the restriction of `spinAction` along `spinGroup.toUnits`; likewise `pinRep` for `pinGroup`. State the
  compatibility that `spinRep` differentiates to the `𝔰𝔬(V)`-module of Layer 3 on `S`.
- **The half-spin summands.** The `ℤ/2`-grading of the exterior algebra splits `S = S⁺ ⊕ S⁻` (even and odd
  exterior degree); `spinPlus Q W`, `spinMinus Q W`, each of dimension `2^{l-1}` in even dimension, are
  `spinGroup`-subrepresentations (the spin group is even, so it preserves exterior parity). In **odd**
  dimension `S` is irreducible and does not split; in **even** dimension `S⁺` and `S⁻` are the two
  inequivalent half-spin representations.
- **Irreducibility.** `spinRep` is irreducible in odd dimension, and `spinPlus`, `spinMinus` are irreducible
  and inequivalent in even dimension, proved from the structure theorem (the Clifford action is the full
  matrix algebra, so `S` is a simple module and its parity summands are the two simple modules of the even
  subalgebra).

### Layer 5: the fundamental representations of `Bₗ` and `Dₗ`

Built on [the highest-weight roadmap](../LieHighestWeight/README.md) (the theorem of the highest weight, the
fundamental weights) and [the root-systems roadmap](../RootSystems/README.md) (the `Bₗ`/`Dₗ` root data).

- **Weights of the spin module.** Diagonalize the maximal torus of `𝔰𝔬(V)` (the Cartan subalgebra spanned by
  the bivectors `ι wᵢ ∧ ι wᵢ'` of dual isotropic pairs) on `S = ⋀·W`; the weight of a basis vector
  `w_{i₁} ∧ ⋯ ∧ w_{iₖ}` is `½(±1, …, ±1)` with the signs recording which `wᵢ` occur. The weights of `S`
  are exactly the `2ˡ` half-integer sign vectors; the **highest** is `ωₗ = ½(1,…,1)`.
- **Type `Bₗ`: `𝔰𝔬(2l+1)`.** `spinRep` (odd dimension) is the irreducible with highest weight `ωₗ`, the
  **last fundamental weight**; state `spinRep Q W ≅ L(ωₗ)` as `FDRep ℂ (spinGroup Q)` transported to
  `𝔰𝔬(2l+1)` via the differential, with `finrank = 2ˡ`. This is the fundamental representation of `Bₗ`
  that is not a constituent of any `⋀ᵏ V` of the standard representation, completing
  [the classical-groups roadmap](../ClassicalGroups/README.md)'s `Bₗ` fundamentals.
- **Type `Dₗ`: `𝔰𝔬(2l)`.** `spinPlus`, `spinMinus` (even dimension) are the irreducibles with highest
  weights `ωₗ = ½(1,…,1)` and `ωₗ₋₁ = ½(1,…,1,-1)`, the **two fork-node fundamental weights** of `Dₗ`;
  state `spinPlus ≅ L(ωₗ)`, `spinMinus ≅ L(ωₗ₋₁)`, each of dimension `2^{l-1}`. Their sum `S` is the
  restriction of the `Bₗ` spin module. The exchange `ωₗ ↔ ωₗ₋₁` is the `Dₗ` diagram automorphism, the
  seed of triality at `l = 4`.
- **Characters and the Weyl construction, cross-referenced.** State the character of `S` at a torus element
  as `∏ᵢ (tᵢ^{1/2} + tᵢ^{-1/2})` (the Weyl character formula specialized), and record that the *other*
  `Bₗ`/`Dₗ` fundamentals `⋀ᵏ V` are built in [the classical-groups roadmap](../ClassicalGroups/README.md);
  together they are a full set of fundamental representations.

### Layer 6: the low-dimensional exceptional isomorphisms

Each is an isomorphism of the spin group with a small classical group, proved by matching the spin (or
half-spin) representation with the classical group's standard representation.

- **`Spin₃ ≅ SL₂`.** For `V = ℂ³`, `spinGroup Q ≃* SL(2, ℂ)` (type `B₁ = A₁`), with the `2`-dimensional
  spin representation `S` the standard representation of `SL₂`; over `ℝ` this is `Spin(3) ≅ SU(2)`. The
  isomorphism is the Clifford action on `S = ⋀·W`, `dim W = 1`, giving `Cliff⁰ ≅ M₂` and
  `spinGroup ≅ SL₂`.
- **`Spin₄ ≅ SL₂ × SL₂`.** For `V = ℂ⁴` (type `D₂ = A₁ × A₁`), `spinGroup Q ≃* SL(2,ℂ) × SL(2,ℂ)`, with
  `S⁺` and `S⁻` the standard representations of the two factors; this is the reducibility of the `D₂` spin
  module into the two `A₁` standards.
- **`Spin₅ ≅ Sp₄`.** For `V = ℂ⁵` (type `B₂ = C₂`), `spinGroup Q ≃* Sp(4, ℂ)` (`Matrix.symplecticGroup`),
  with the `4`-dimensional spin representation `S` the standard representation of `Sp₄`; the symplectic form
  on `S` comes from the reversal antiautomorphism.
- **`Spin₆ ≅ SL₄`.** For `V = ℂ⁶` (type `D₃ = A₃`), `spinGroup Q ≃* SL(4, ℂ)`, with `S⁺ ≅ ℂ⁴` the standard
  representation and `S⁻ ≅ (ℂ⁴)*` its dual; `V ≅ ⋀²(ℂ⁴)`. These four exhaust the coincidences of the
  `Bₗ`/`Dₗ` diagrams with the `Aₗ`/`Cₗ` diagrams.

### Layer 7: real Clifford algebras, Bott periodicity, and `Spin(p, q)`

- **The real forms `Cliff(p, q)`.** `realCliffordForm p q : QuadraticForm ℝ (Fin (p+q) → ℝ)`, the diagonal
  form with `p` entries `+1` and `q` entries `-1`, and `Cliff(p, q) = CliffordAlgebra (realCliffordForm p q)`.
  Consume the Mathlib base cases `Cliff(0,1) ≅ ℂ` (`CliffordAlgebraComplex.equiv`, up to sign convention)
  and identify `Cliff(0,2) ≅ ℍ` (`CliffordAlgebraQuaternion.equiv`), `Cliff(1,0) ≅ ℝ × ℝ`,
  `Cliff(1,1) ≅ M₂(ℝ)`.
- **Bott periodicity.** The isomorphisms `Cliff(p+1, q+1) ≅ Cliff(p, q) ⊗ᵣ M₂(ℝ)`,
  `Cliff(p+8, q) ≅ Cliff(p, q) ⊗ᵣ M₁₆(ℝ)` (mod-`8` periodicity), built from
  `CliffordAlgebra.equivEven` and `CliffordAlgebra.prodEquiv`; the resulting **classification table** of
  `Cliff(p, q)` as a matrix algebra over `ℝ`, `ℂ`, or `ℍ` (the eightfold way), stated as a function of
  `(q - p) mod 8`. This is the real refinement of Layer 1's complex structure theorem, where all forms of a
  rank are equivalent.
- **The real spin groups.** `spinPQ p q := spinGroup (realCliffordForm p q)`, the double cover of
  `SO(p, q)` from Layer 2 applied to the real form; the compact `Spin(n) = spinPQ n 0` and the split and
  Lorentzian forms `Spin(p, q)`. State the connectivity results of Layer 2 for the compact `Spin(n)`
  (connected for `n ≥ 2`, simply connected for `n ≥ 3`), so it is the universal cover of `SO(n)`.

### Layer 8: triality for `Spin₈`

- **The diagram automorphism.** The `D₄` Dynkin diagram has an **order-three** symmetry cyclically permuting
  its three outer nodes; consume the graph automorphism from [the root-systems roadmap](../RootSystems/README.md)
  and lift it to an order-three automorphism of the root datum of `𝔰𝔬(8)` permuting the three fundamental
  weights `ω₁` (the vector node) and `ω₃, ω₄` (the two spinor nodes).
- **Triality as an outer automorphism of `Spin₈`.** `trialityAut : spinGroup Q₈ ≃* spinGroup Q₈`, an
  order-three automorphism (`trialityAut ^ 3 = 1`, and not inner) whose induced action on representations
  cyclically permutes the three `8`-dimensional irreducibles `V ≅ S⁰`, `S⁺`, `S⁻` (all of dimension `8`,
  the numerical coincidence that makes triality possible). State the permutation as isomorphisms
  `spinRep ∘ trialityAut ≅ (the vector representation)`, and so on around the cycle.
- **The consequences.** The order-`3` symmetry of the three `8`-dimensional representations, the
  `Spin₈`-invariant trilinear form `S⁰ ⊗ S⁺ ⊗ S⁻ → ℂ` permuted by triality, and the relation to the
  octonions (the multiplication `𝕆 ⊗ 𝕆 → 𝕆` as the triality form); state the trilinear form and its
  invariance as the concrete outcome, cross-referencing the octonion structure where it is available.

---

## Worked examples (acceptance criteria)

- **`Cliff(0,1) ≅ ℂ` and `Cliff(0,2) ≅ ℍ`.** The `ℝ`-algebra isomorphisms `CliffordAlgebraComplex.equiv`
  (consumed) and `Cliff(realCliffordForm 0 2) ≃ₐ[ℝ] ℍ[ℝ]` (Layer 7), the first two entries of the Bott
  table; and `Cliff(1,1) ≅ M₂(ℝ)`, the periodicity step.
- **`Spin₃ ≅ SL₂` and its spin representation.** For `V = ℂ³`, `spinGroup Q ≃* SL(2, ℂ)` (Layer 6), with the
  `2`-dimensional spin representation `spinRep Q W` the standard representation of `SL₂`
  (`finrank ℂ (ExteriorAlgebra ℂ W) = 2`, `dim W = 1`). Over `ℝ`, `Spin(3) ≅ SU(2)`, the double cover of
  `SO(3)` with kernel `{±1}` (Layer 2), the smallest instance of the whole theory.
- **The `2ˡ`-dimensional spin representation of `𝔰𝔬(2l+1)`.** For type `Bₗ`, `spinRep Q W` is irreducible of
  dimension `2ˡ` with highest weight `ωₗ = ½(1,…,1)` (Layers 4-5), and its weights are exactly the `2ˡ`
  half-integer sign vectors `½(±1,…,±1)`. Acceptance: `finrank ℂ (ExteriorAlgebra ℂ W) = 2 ^ l` and the
  highest weight is the last fundamental weight of `Bₗ`, not in the root lattice.
- **The half-spin representations of `𝔰𝔬(8)` and triality.** For `V = ℂ⁸` (type `D₄`), `S⁺` and `S⁻` are
  irreducible of dimension `8`, equal to `dim V`; `trialityAut` (Layer 8) is an order-three automorphism of
  `Spin₈` cyclically permuting `V, S⁺, S⁻`, and the trilinear form `V ⊗ S⁺ ⊗ S⁻ → ℂ` is `Spin₈`-invariant.
  Acceptance: `trialityAut ^ 3 = 1`, `trialityAut ≠ 1`, and the three `8`-dimensional representations are
  cyclically permuted.

## Ordering

Layer 0 (the algebra and the two gradings) and Layer 1 (the structure theorem) are the algebraic foundation
and come first; the filtration and `equivExterior` are used everywhere, and the structure theorem is the
engine behind both the double cover and the spin module. Layer 2 (the Pin/Spin double covers) needs Layer 0's
grading and Layer 1's Cartan-Dieudonné diagonalization; it is the load-bearing theorem that Mathlib stops
short of, and its surjectivity is the single hardest target. Layer 3 (`𝔰𝔬(V) ≅ ⋀²V`) needs Layer 0 and gives
the differential of Layer 2; it is the interface to [the highest-weight roadmap](../LieHighestWeight/README.md).
Layer 4 (the spin modules) needs Layer 1's structure theorem for irreducibility and Layer 2 for the group
action, and it meets Layer 1 at `End S ≅ M_{2^l}`. Layer 5 (the highest-weight identification) needs Layer 4
and the highest-weight theory of [the highest-weight roadmap](../LieHighestWeight/README.md) and
[the root-systems roadmap](../RootSystems/README.md); it is what makes "the fundamental representation of
`Bₗ`/`Dₗ`" precise and completes [the classical-groups roadmap](../ClassicalGroups/README.md). Layer 6 (the
exceptional isomorphisms) needs Layers 4-5 for the low-rank spin modules. Layer 7 (the real forms and Bott
periodicity) needs Layer 1's structure theory and Layer 2's double cover, specialized to `ℝ`, and is
independent of Layers 4-6. Layer 8 (triality) needs Layer 5's half-spin identification and
[the root-systems roadmap](../RootSystems/README.md)'s `D₄` diagram automorphism; it is the summit. A
contributor can complete Layers 0-2 (the structure theory and the double cover) and the `Spin₃` and real-form
examples well before the highest-weight identification of Layers 5, 8 lands.

## References

- W. Fulton, J. Harris, *Representation Theory: A First Course*, Springer GTM 129 (1991), Lecture 20 — the
  primary reference: the Clifford algebra, the Pin and Spin groups and the double cover, the spin
  representations `S`, `S⁺`, `S⁻` from a maximal isotropic subspace, their highest weights as the `Bₗ`/`Dₗ`
  fundamentals, the low-dimensional isomorphisms, and triality (Lecture 20, §20.3 and the exercises).
- R. Goodman, N. R. Wallach, *Symmetry, Representations, and Invariants*, Springer GTM 255 (2009),
  Chapter 6 — the spin representations of `𝔰𝔬(n)` uniformly, the Clifford-algebra construction of the spin
  module, the highest-weight theory, and the fundamental representations of `Bₗ` and `Dₗ`.
- H. B. Lawson, M.-L. Michelsohn, *Spin Geometry*, Princeton (1989), Chapter I — the definitive account of
  Clifford algebras `Cliff(p, q)`, their Bott-periodic classification (the eightfold table), the Pin and Spin
  groups as double covers, and the real and complex spinor representations.
- C. Chevalley, *The Algebraic Theory of Spinors*, Columbia (1954) — the algebraic construction of the spin
  representation from a maximal isotropic subspace, the even/odd decomposition into half-spinors, and the
  intrinsic (basis-free) development of the Clifford algebra used in Layer 4.
- É. Cartan, *The Theory of Spinors*, Hermann (1966) — the original discovery of spinors, the geometry of
  isotropic subspaces, and triality for `Spin₈`.
- J. F. Adams, *Lectures on Exceptional Lie Groups*, Chicago (1996) — triality, the octonions, and the
  trilinear form `V ⊗ S⁺ ⊗ S⁻ → ℂ` on `Spin₈` (the octonion multiplication as the triality form).
</content>
</invoke>
