import Mathlib

/-!
# Representations of semisimple Lie algebras and highest weight theory: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.

Mathlib has `sl₂` triples and the primitive-vector integrality argument
(`IsSl2Triple`, `IsSl2Triple.HasPrimitiveVectorWith`, `HasPrimitiveVectorWith.exists_nat`),
Cartan subalgebras, the generalized weight-space machinery (`LieModule.genWeightSpace`,
`LieModule.Weight`, `LieAlgebra.rootSpace`, `iSup_genWeightSpace_eq_top`), the semisimplicity
theory (`LieAlgebra.IsKilling`, `finrank_rootSpace_eq_one`), the **root system of a Killing Lie
algebra** as a `RootPairing` (`LieAlgebra.IsKilling.rootSystem`, `LieAlgebra.IsKilling.coroot`,
`exists_isSl2Triple_of_weight_isNonZero`), the abstract root-system API (`RootPairing.Base`,
`RootPairing.weylGroup`), and the universal enveloping algebra (`UniversalEnvelopingAlgebra`). It
has **no classification of `sl₂`-irreducibles, no integrality of module weights, no PBW basis, no
Verma modules, no `L(λ)`, no dominant-integral classification, no Casimir element, no complete
reducibility, and no Weyl character/dimension/Kostant formulas** (see `README.md` for the map).

The design follows the layers of `README.md`: **Layer 0** the `sl₂` engine (the classification of
`V(n)`), which the later reductions literally call; **Layer 1-2** the root-space decomposition, the
generalized weight-space decomposition and its refinement to honest weight spaces
(`isSemisimple_toEnd_cartan`), and the integrality of weights (the load-bearing `sl₂` reduction);
**Layer 3** Verma modules and `L(λ)`; **Layer 4** the dominant-integral classification; **Layer 5** the
invariant form, the Casimir element, and Weyl's complete reducibility; **Layer 6** the Weyl character
and dimension formulas and Kostant's multiplicity formula; **Layer 7** the center of `U(L)`,
Harish-Chandra, Freudenthal, and the Serre presentation; **Layer 8** the exceptional Lie algebras via
split octonions and the split Albert algebra. `README.md` remains the definitive document.
-/

namespace TauCetiRoadmap.RepresentationTheory.LieHighestWeight

open scoped Classical
open LieModule LieAlgebra Module

universe u

/-! ## Layer 0: `sl₂` representation theory (the engine)

Built first and in full, because Layers 2, 4, and 5 reduce to it. The worked `sl₂` is
`LieAlgebra.SpecialLinear.sl (Fin 2) K` with its standard triple; here we state the results for an
arbitrary `sl₂` triple `t : IsSl2Triple h e f`. Only the integer-spectrum statement applies verbatim
to the triples attached to roots (`exists_isSl2Triple_of_weight_isNonZero`); the finrank and
classification statements require irreducibility **over the triple's own subalgebra** and are false
for modules merely irreducible over the ambient `L` (see their docstrings). -/

section Sl2

variable {K : Type*} [Field K] [CharZero K]
variable {L : Type u} [LieRing L] [LieAlgebra K L]
variable {M : Type u} [AddCommGroup M] [Module K M] [LieRingModule L M] [LieModule K L M]
variable {h e f : L} (t : IsSl2Triple h e f)

/-- **The weight string.** In a finite-dimensional module, `h` acts with **integer** eigenvalues;
this extends `IsSl2Triple.HasPrimitiveVectorWith.exists_nat` from primitive vectors to the whole
spectrum, and is the fact Layer 2 restricts to along each root. -/
theorem sl2_hAction_eigenvalue_isInt [FiniteDimensional K M] {μ : K}
    (hμ : (toEnd K L M h).HasEigenvalue μ) : ∃ n : ℤ, μ = (n : K) := sorry

/-- **Dimension of the highest weight module.** A finite-dimensional module, **irreducible over the
sl₂ subalgebra of the triple itself**, with a highest weight (primitive) vector of weight `n` is
`(n+1)`-dimensional (the module `V(n)`). Irreducibility over an ambient `L` would not suffice: for
`L = sl₃` acting on its 8-dimensional adjoint module, the highest-root vector is primitive of weight
`1` for the `α₁`-triple, and `8 ≠ 2` — the restricted irreducibility is the minimal correct
hypothesis (`htop : t.toLieSubalgebra K = ⊤` is the special case where the two coincide). -/
theorem sl2_finrank_of_hasPrimitiveVector [FiniteDimensional K M]
    [LieModule.IsIrreducible K (t.toLieSubalgebra K) M]
    {m : M} {n : ℕ} (P : t.HasPrimitiveVectorWith m (n : K)) :
    Module.finrank K M = n + 1 := sorry

/-- **Highest weight determines the irreducible.** Two finite-dimensional modules, irreducible over
the triple's sl₂ subalgebra, with primitive vectors of the same weight `n` are isomorphic **as
modules over that subalgebra**: the classification `{fin-dim sl₂-irreducibles}/≅ ≃ ℕ`. The
conclusion cannot be an `L`-equivalence under the restricted hypothesis (the actions outside the
sl₂ may differ); the `L`-level statement requires `htop : t.toLieSubalgebra K = ⊤`, under which this
statement specializes to it. -/
theorem sl2_irreducible_ext {M' : Type u} [AddCommGroup M'] [Module K M'] [LieRingModule L M']
    [LieModule K L M'] [FiniteDimensional K M] [FiniteDimensional K M']
    [LieModule.IsIrreducible K (t.toLieSubalgebra K) M]
    [LieModule.IsIrreducible K (t.toLieSubalgebra K) M']
    {m : M} {m' : M'} {n : ℕ} (P : t.HasPrimitiveVectorWith m (n : K))
    (P' : t.HasPrimitiveVectorWith m' (n : K)) :
    Nonempty (M ≃ₗ⁅K, t.toLieSubalgebra K⁆ M') := sorry

/-- **Existence of `V(n)`.** For each `n`, the standard `(n+1)`-dimensional irreducible with a
primitive vector of weight `n` exists (as `Symⁿ` of the standard module, or on `Kⁿ⁺¹`). Complete
reducibility for `sl₂` (every finite-dimensional module is `⨁ V(nᵢ)`) is the rank-one case of
`weyl_complete_reducibility`. -/
theorem sl2_exists_irreducible (htop : t.toLieSubalgebra K = ⊤) (n : ℕ) :
    ∃ (V : Type u) (_ : AddCommGroup V) (_ : Module K V) (_ : LieRingModule L V) (_ : LieModule K L V)
      (v : V), FiniteDimensional K V ∧ LieModule.IsIrreducible K L V ∧
        t.HasPrimitiveVectorWith v (n : K) := sorry

end Sl2

/-! ## Layers 1-6: the general theory

Fix a Killing-semisimple `L` over an algebraically closed field of characteristic zero, a Cartan
subalgebra `H`, and a base `base` (positive/simple system) of the Mathlib root system
`LieAlgebra.IsKilling.rootSystem H`. Roots, weights, root spaces, coroots, and the Weyl group are all
Mathlib's; the root and weight lattices and the Weyl-group action are the province of
`../RootSystems/README.md`. -/

section General

variable {K : Type*} [Field K] [CharZero K] [IsAlgClosed K]
variable {L : Type u} [LieRing L] [LieAlgebra K L] [LieAlgebra.IsKilling K L] [FiniteDimensional K L]
variable {H : LieSubalgebra K L} [H.IsCartanSubalgebra] [IsTriangularizable K H L]

/- A base (positive/simple system) `base : (LieAlgebra.IsKilling.rootSystem H).Base` is passed
explicitly to each declaration below that depends on it, since the positivity of roots and the
vector `ρ` all depend on the choice. -/

/-! ### Layer 1-2: weight-space decomposition and the integrality of weights -/

/-- **Triangularizability of modules (the *generalized* decomposition).** Over an algebraically closed
field of characteristic zero, every finite-dimensional `L`-module is triangularizable over `H`, so
`iSup_genWeightSpace_eq_top` gives the **generalized** weight-space decomposition
`M = ⨁_χ genWeightSpace M χ`. Algebraic closure delivers only this generalized form; that the summands
are honest simultaneous eigenspaces is the separate theorem `isSemisimple_toEnd_cartan` below. -/
theorem isTriangularizable_of_finiteDimensional {M : Type u} [AddCommGroup M] [Module K M]
    [LieRingModule L M] [LieModule K L M] [FiniteDimensional K M] :
    IsTriangularizable K H M := sorry

/-- **Diagonalizability of the Cartan action (honest weight spaces).** For a finite-dimensional module
over a Killing-semisimple `L`, every `x : H` acts by a **semisimple** endomorphism, so the generalized
weight spaces of `isTriangularizable_of_finiteDimensional` are genuine simultaneous eigenspaces and the
formal character counts honest weight multiplicities. This rests on the abstract Jordan decomposition
(each `x : H` is `ad`-semisimple in `L`, and semisimplicity transfers to every finite-dimensional
representation), so it is **independent of complete reducibility** (Layer 5), avoiding circularity. -/
theorem isSemisimple_toEnd_cartan {M : Type u} [AddCommGroup M] [Module K M]
    [LieRingModule L M] [LieModule K L M] [FiniteDimensional K M] (x : H) :
    (toEnd K H M x).IsSemisimple := sorry

/-- **Integrality of weights (the `sl₂` reduction).** For every weight `χ` of a finite-dimensional
module `M` and every root `α`, the value `χ(α^∨)` is an integer. **Proof:** restrict `M` to the `sl₂`
triple of `α`, where `χ(α^∨)` is an `hₐ`-eigenvalue, and apply `sl2_hAction_eigenvalue_isInt`. This is
the load-bearing use of the engine. -/
theorem weight_apply_coroot_isInt {M : Type u} [AddCommGroup M] [Module K M] [LieRingModule L M]
    [LieModule K L M] [FiniteDimensional K M] (χ : Weight K H M) {α : Weight K H L}
    (hα : α.IsNonZero) : ∃ n : ℤ, χ (LieAlgebra.IsKilling.coroot α) = (n : K) := sorry

/-! ### Layer 3: highest weight vectors, Verma modules, and `L(λ)`

The root-system datum is always the `base`; the subalgebras it determines get their own names, so the
Borel is never also called `base`. `positiveNilradical base = n⁺ = ⨁_{α>0} Lα`, its opposite
`negativeNilradical base = n⁻`, and `borelSubalgebra base = H ⊕ n⁺`. -/

/-- **The positive nilradical** `n⁺ = ⨁_{α>0} Lα` determined by the positive system `base`. -/
def positiveNilradical (base : (LieAlgebra.IsKilling.rootSystem H).Base) : LieSubalgebra K L := sorry

/-- **The negative nilradical** `n⁻ = ⨁_{α<0} Lα`. -/
def negativeNilradical (base : (LieAlgebra.IsKilling.rootSystem H).Base) : LieSubalgebra K L := sorry

/-- **The Borel subalgebra** `𝔟 = H ⊕ n⁺`. Named separately from `base` so the Verma tensor product
`U(L) ⊗_{U(𝔟)} K_λ` never overloads the letter of the root-system base. -/
def borelSubalgebra (base : (LieAlgebra.IsKilling.rootSystem H).Base) : LieSubalgebra K L := sorry

/-- **A highest weight vector** of weight `λ` (relative to the positive system `base`): nonzero, an
`H`-eigenvector of weight `λ`, killed by every positive root space. For a single positive root this is
`IsSl2Triple.HasPrimitiveVectorWith`. -/
def IsHighestWeightVector (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H)
    {M : Type u} [AddCommGroup M] [Module K M] [LieRingModule L M] [LieModule K L M] (v : M) :
    Prop :=
  v ≠ 0 ∧ (∀ x : H, ⁅(x : L), v⁆ = lam x • v) ∧
    ∀ x ∈ positiveNilradical base, ⁅x, v⁆ = 0

/-- **The Verma module** `M(λ) = U(L) ⊗_{U(𝔟)} K_λ` for the Borel `𝔟 = borelSubalgebra base`, the
universal highest weight module. Presented here as an opaque carrier with its `L`-module structure; its
universal property, its freeness over `U(n⁻) = U(negativeNilradical base)`, and its weight
multiplicities (the Kostant partition function `kostantPartition base` below) are the content to
prove. -/
def vermaModule (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    Type u := sorry

noncomputable instance (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    AddCommGroup (vermaModule base lam) := sorry
noncomputable instance (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    Module K (vermaModule base lam) := sorry
noncomputable instance (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    LieRingModule L (vermaModule base lam) := sorry
noncomputable instance (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    LieModule K L (vermaModule base lam) := sorry

/-- The canonical highest weight vector of the Verma module `M(λ)`. -/
theorem exists_isHighestWeightVector_vermaModule (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) :
    ∃ v : vermaModule base lam, IsHighestWeightVector base lam v := sorry

/-- **The Verma universal property**, pinned (previously prose-only, though it is the load-bearing
characterization Layer 7's central-character construction depends on): maps out of `M(λ)` correspond
to highest weight vectors of weight `λ` in the target, by evaluation at the canonical vector. The
freeness of `M(λ)` over `U(n⁻)` is the companion structural target, stated once a `U(n⁻)`-module
structure on the carrier is fixed. -/
theorem vermaModule_universal (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) {M : Type u} [AddCommGroup M] [Module K M] [LieRingModule L M]
    [LieModule K L M] (v : M) (hv : IsHighestWeightVector base lam v) :
    ∃! φ : vermaModule base lam →ₗ⁅K,L⁆ M,
      ∀ w : vermaModule base lam, IsHighestWeightVector base lam w → ∃ c : K, φ w = c • v := sorry

/-- **The irreducible quotient** `L(λ)`: the unique irreducible quotient of `M(λ)`, obtained by
quotienting by the unique maximal submodule. -/
def irreducibleQuotient (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    Type u := sorry

noncomputable instance (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    AddCommGroup (irreducibleQuotient base lam) := sorry
noncomputable instance (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    Module K (irreducibleQuotient base lam) := sorry
noncomputable instance (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    LieRingModule L (irreducibleQuotient base lam) := sorry
noncomputable instance (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    LieModule K L (irreducibleQuotient base lam) := sorry

/-- `L(λ)` is irreducible. -/
theorem isIrreducible_irreducibleQuotient (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) :
    LieModule.IsIrreducible K L (irreducibleQuotient base lam) := sorry

/-- `L(λ)` **is a highest weight module of weight `λ`** — without this pin, any family of pairwise
non-isomorphic irreducibles would discharge the `irreducibleQuotient` targets; this is the
anti-vacuity companion of `isIrreducible_irreducibleQuotient` and
`irreducibleQuotient_nonempty_equiv_iff`. -/
theorem exists_isHighestWeightVector_irreducibleQuotient
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    ∃ v : irreducibleQuotient base lam, IsHighestWeightVector base lam v := sorry

/-- **The classification of irreducible highest weight modules.** `L(λ) ≅ L(μ)` iff `λ = μ`. -/
theorem irreducibleQuotient_nonempty_equiv_iff (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam mu : Module.Dual K H) :
    Nonempty (irreducibleQuotient base lam ≃ₗ⁅K,L⁆ irreducibleQuotient base mu) ↔ lam = mu := sorry

/-! ### Layer 4: the classification of finite-dimensional irreducibles -/

/-- **Dominant integral weights.** `λ` is dominant integral when `⟨λ, αᵢ^∨⟩` is a natural number for
every simple root `αᵢ` (indexed by `base.support`). -/
def IsDominantIntegral (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    Prop :=
  ∀ i ∈ base.support, ∃ n : ℕ, lam ((LieAlgebra.IsKilling.rootSystem H).coroot i) = (n : K)

/-- **Every finite-dimensional irreducible is an `L(λ)` with `λ` dominant integral.** It has a
highest weight vector, and restricting to each simple `sl₂` forces the highest weight to be dominant
integral (Layer 0). -/
theorem exists_isDominantIntegral_isHighestWeightVector_of_irreducible
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) {M : Type u} [AddCommGroup M]
    [Module K M] [LieRingModule L M] [LieModule K L M] [FiniteDimensional K M]
    [LieModule.IsIrreducible K L M] :
    ∃ (lam : Module.Dual K H) (v : M), IsHighestWeightVector base lam v ∧ IsDominantIntegral base lam :=
  sorry

/-- **`L(λ)` is finite-dimensional exactly when `λ` is dominant integral.** The hard direction
(dominant integral `⟹` finite-dimensional) is a real theorem, not a corollary: `fᵢ^{⟨λ,αᵢ^∨⟩+1}` kills
the highest weight vector, so each simple `fᵢ` acts locally nilpotently on `L(λ)`; local nilpotence
propagates from the simple directions to every root direction (making `L(λ)` the maximal integrable
quotient of `M(λ)`); the weight support is then Weyl-stable and bounded inside the convex hull of the
Weyl orbit of `λ`, hence finite; and each weight space is finite-dimensional by the PBW / Kostant
partition bound. See `README.md` Layer 4 for these named sub-milestones. -/
theorem finiteDimensional_irreducibleQuotient_iff (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) :
    FiniteDimensional K (irreducibleQuotient base lam) ↔ IsDominantIntegral base lam := sorry

/-- **The classification theorem.** A finite-dimensional irreducible module has a unique dominant
integral highest weight; combined with `finiteDimensional_irreducibleQuotient_iff` and
`irreducibleQuotient_nonempty_equiv_iff`, `λ ↦ L(λ)` is a bijection from dominant integral weights to
isomorphism classes of finite-dimensional irreducibles. -/
theorem existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible
    (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    {M : Type u} [AddCommGroup M] [Module K M] [LieRingModule L M] [LieModule K L M]
    [FiniteDimensional K M] [LieModule.IsIrreducible K L M] :
    ∃! lam : Module.Dual K H, IsDominantIntegral base lam ∧ ∃ v : M, IsHighestWeightVector base lam v :=
  sorry

/-! ### Layer 5: the Casimir element and Weyl's complete reducibility -/

/-- **`ρ`**, the half-sum of the positive roots (relative to `base`), a weight in `Module.Dual K H`.
Introduced here because the Casimir eigenvalue and the invariant form on weights below both depend on
it. -/
noncomputable def weylVector (base : (LieAlgebra.IsKilling.rootSystem H).Base) : Module.Dual K H :=
  sorry

/-- **The `W`-invariant symmetric form `⟨·,·⟩` on weights**, transported from the Killing form on `H`
via `cartanEquivDual`. This is the form appearing in the Casimir eigenvalue, the Weyl formulas, and
Freudenthal's recursion; pinning it (and its normalization against coroots, next) is a prerequisite of
`casimirElement`, not an afterthought. -/
noncomputable def invForm (lam mu : Module.Dual K H) : K := sorry

/-- **Normalization of the invariant form against coroots**: `⟨λ, α^∨⟩ ⟨α, α⟩ = 2 ⟨λ, α⟩`, i.e.
`α^∨` pairs as `2α / ⟨α, α⟩`. This is the compatibility of `invForm` with the root/coroot API of
`LieAlgebra.IsKilling.rootSystem` that makes the Casimir scalar `⟨λ+ρ, λ+ρ⟩ - ⟨ρ, ρ⟩` agree with the
coroot pairings. -/
theorem invForm_coroot (lam : Module.Dual K H) (i : H.root) :
    lam ((LieAlgebra.IsKilling.rootSystem H).coroot i)
        * invForm ((LieAlgebra.IsKilling.rootSystem H).root i)
            ((LieAlgebra.IsKilling.rootSystem H).root i)
      = 2 * invForm lam ((LieAlgebra.IsKilling.rootSystem H).root i) := sorry

/-- **The Casimir element** of `U(L)`, built from a basis of `L` and its Killing-dual basis; central,
and acting on `L(λ)` by the scalar `invForm (λ+ρ) (λ+ρ) - invForm ρ ρ` (with `ρ = weylVector base`),
well-defined by `invForm_coroot`. -/
noncomputable def casimirElement : UniversalEnvelopingAlgebra K L := sorry

/-- The Casimir element is central in `U(L)`. -/
theorem casimirElement_mem_center :
    (casimirElement : UniversalEnvelopingAlgebra K L) ∈
      Subalgebra.center K (UniversalEnvelopingAlgebra K L) := sorry

/-- **Weyl's complete reducibility theorem.** Every finite-dimensional module over a
Killing-semisimple Lie algebra in characteristic zero is a direct sum of irreducibles: every
submodule has a complement. Proved via the Casimir element; the `sl₂` case is its rank-one instance.
Hypothesis note for the implementation: this theorem and the Casimir pair above need only
semisimplicity and characteristic zero — the section-blanket `[IsAlgClosed K]` and
`[IsTriangularizable K H L]` are not required and should be shed when the code lands (they sit here
only because the roadmap section fixes them for the weight theory). -/
theorem weyl_complete_reducibility {M : Type u} [AddCommGroup M] [Module K M] [LieRingModule L M]
    [LieModule K L M] [FiniteDimensional K M] (N : LieSubmodule K L M) :
    ∃ N' : LieSubmodule K L M, IsCompl N N' := sorry

/-! ### Layer 6: the Weyl character, dimension, and Kostant formulas -/

/-- **The formal character** of a finite-dimensional module: `μ ↦ dim Mμ` (honest weight
multiplicities, by `isSemisimple_toEnd_cartan`), an element of the integral group algebra of the weight
lattice. Additive on short exact sequences, multiplicative on tensor products, and Weyl-invariant. -/
noncomputable def formalCharacter {M : Type u} [AddCommGroup M] [Module K M] [LieRingModule L M]
    [LieModule K L M] [FiniteDimensional K M] : AddMonoidAlgebra ℤ (Module.Dual K H) := sorry
-- The carrier is the group algebra of the whole dual, a faithful over-embedding of the README's
-- `ℤ[X]` (the weight lattice `X` group algebra): all characters land in the lattice part.

/-- **Multiplicativity of the formal character** (coverage: the representation-ring interface): on
tensor products, `ch (M ⊗ N) = ch M · ch N`. Together with additivity on short exact sequences this
makes `formalCharacter` the character homomorphism from the Grothendieck **ring** of
finite-dimensional `L`-modules into `ℤ[X]` — the multiplicative structure the family index promises
(the finite-group representation ring itself is pinned in `../CharacterTheory`); Racah-Speiser and
Littlewood-Richardson tensor decompositions are computations in its image. -/
theorem formalCharacter_tensor {M N : Type u} [AddCommGroup M] [Module K M] [LieRingModule L M]
    [LieModule K L M] [FiniteDimensional K M] [AddCommGroup N] [Module K N] [LieRingModule L N]
    [LieModule K L N] [FiniteDimensional K N] :
    formalCharacter (K := K) (L := L) (H := H) (M := TensorProduct K M N)
      = formalCharacter (M := M) * formalCharacter (M := N) := sorry

/-- The integer pairing `⟨λ, αᵢ^∨⟩ ∈ ℤ` of an integral weight against a coroot (well-defined by
`weight_apply_coroot_isInt`); indexed by the roots `H.root`. Total on `Module.Dual K H` for
signature convenience, but **meaningful only on the integral weight lattice** (junk elsewhere); its
uses below are at `λ + ρ` and `ρ` with `λ` dominant integral, and any new consumer must carry the
integrality hypothesis or take the lattice from `../RootSystems` as its domain. -/
noncomputable def coweightPairing (lam : Module.Dual K H) (i : H.root) : ℤ := sorry

/-- **The Weyl denominator**, stated in the *integral* group algebra where it actually lives:
`Δ = ∏_{α>0} (1 - e^{-α})`. The symmetric form `∏_{α>0}(e^{α/2} - e^{-α/2})` differs from this by the
factor `e^{ρ}` and needs half-weights `α/2 ∉ X`; the `∏(1 - e^{-α})` form has all exponents in the
weight lattice `X` and is the one used here. -/
noncomputable def weylDenominator (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    AddMonoidAlgebra ℤ (Module.Dual K H) := sorry

/-- **The Weyl numerator** `∑_{w ∈ W} sgn(w) e^{w(λ+ρ) - ρ}` for a dominant integral weight `λ`, the
`ρ`-shifted numerator matching the `∏(1 - e^{-α})` denominator; every exponent lies in the weight
lattice. -/
noncomputable def weylNumerator (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) : AddMonoidAlgebra ℤ (Module.Dual K H) := sorry

/-- **The Weyl character formula** in the integral group algebra:
`ch L(λ) · ∏_{α>0}(1 - e^{-α}) = ∑_{w ∈ W} sgn(w) e^{w(λ+ρ) - ρ}`. -/
theorem weyl_character_formula (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) (hlam : IsDominantIntegral base lam)
    [FiniteDimensional K (irreducibleQuotient base lam)] :
    (formalCharacter (M := irreducibleQuotient base lam)) * weylDenominator base
      = weylNumerator base lam := sorry

/-- **The Weyl dimension formula**: `dim L(λ) = ∏_{α>0} ⟨λ+ρ, α^∨⟩ / ⟨ρ, α^∨⟩`, an identity in `ℚ`
(the product is a positive integer). The product is over the positive roots (`Base.IsPos`). -/
theorem weyl_dimension_formula (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) (hlam : IsDominantIntegral base lam) :
    (Module.finrank K (irreducibleQuotient base lam) : ℚ)
      = ∏ i ∈ Finset.univ.filter (fun i => base.IsPos i),
          (coweightPairing (lam + weylVector base) i : ℚ) / (coweightPairing (weylVector base) i : ℚ) :=
  sorry

/-- **Self-duality of `L(λ)`** (coverage: the compact Frobenius-Schur interface of
`../CompactGroups`): `L(λ)` carries a nonzero invariant bilinear form iff `−(w₀ • λ) = λ` for the
longest Weyl element `w₀` — characterized here, without importing a length function, as a Weyl
element carrying the dominant cone to its negative. For an irreducible, a nonzero invariant form is
exactly self-duality, so this is the `−w₀λ = λ` criterion in invariant-form clothing. -/
theorem exists_invariantForm_iff_neg_longest_smul_eq
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H)
    (hlam : IsDominantIntegral base lam)
    [FiniteDimensional K (irreducibleQuotient base lam)] :
    (∃ B : LinearMap.BilinForm K (irreducibleQuotient base lam), B ≠ 0 ∧
        ∀ (x : L) (v w : irreducibleQuotient base lam), B ⁅x, v⁆ w + B v ⁅x, w⁆ = 0) ↔
      ∃ w ∈ (LieAlgebra.IsKilling.rootSystem H).weylGroup,
        (∀ mu : Module.Dual K H, IsDominantIntegral base mu →
          IsDominantIntegral base (-(RootPairing.Equiv.weightEquiv _ _ w mu))) ∧
        -(RootPairing.Equiv.weightEquiv _ _ w lam) = lam := sorry

/-- **The real-vs-quaternionic sign criterion** (coverage companion, pinned as an exact formula
rather than prose): on a self-dual `L(λ)` the invariant form is unique up to scalar, and it is
symmetric or alternating according to the **Tits sign** `(−1)^{⟨λ, 2ρ^∨⟩}`, where
`⟨λ, 2ρ^∨⟩ = ∑_{α > 0} ⟨λ, α^∨⟩` is the sum of the coroot pairings over the positive roots:
`+1` gives the orthogonal (real) type, `−1` the symplectic (quaternionic) type. Self-duality alone
(`−w₀λ = λ`) does not decide between them — this sign does. -/
theorem invariantForm_isSymm_iff_tits_sign
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H)
    (hlam : IsDominantIntegral base lam)
    [FiniteDimensional K (irreducibleQuotient base lam)]
    (B : LinearMap.BilinForm K (irreducibleQuotient base lam)) (hB : B ≠ 0)
    (hinv : ∀ (x : L) (v w : irreducibleQuotient base lam), B ⁅x, v⁆ w + B v ⁅x, w⁆ = 0) :
    ((∀ v w, B v w = B w v) ↔
        (-1 : ℤˣ) ^ (∑ i : {j : H.root // base.IsPos j}, coweightPairing lam (i : H.root)) = 1) ∧
    ((∀ v w, B v w = - B w v) ↔
        (-1 : ℤˣ) ^ (∑ i : {j : H.root // base.IsPos j}, coweightPairing lam (i : H.root)) = -1) :=
  sorry

/-- **The Kostant partition function** `P(ν)` for a base `base`: the number of ways to write `ν` as a sum
of positive roots with multiplicity. -/
noncomputable def kostantPartition (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (nu : Module.Dual K H) : ℕ := sorry

/-- The Weyl-alternating sum `∑_{w ∈ W} sgn(w) P(w(λ+ρ) - (μ+ρ))` that Kostant's formula equates with
a weight multiplicity. Named so the multiplicity statement is expressible before the Weyl-group action
on weights (`../RootSystems/README.md`) is fully in place. -/
noncomputable def kostantMultiplicity (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam mu : Module.Dual K H) : ℤ := sorry

/-- **Kostant's multiplicity formula**: the multiplicity of the weight `μ` in `L(λ)` is
`∑_{w ∈ W} sgn(w) P(w(λ+ρ) - (μ+ρ))`, the weight-by-weight refinement of the character formula. -/
theorem kostant_multiplicity_formula (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) (hlam : IsDominantIntegral base lam)
    [FiniteDimensional K (irreducibleQuotient base lam)] (mu : Module.Dual K H) :
    (formalCharacter (M := irreducibleQuotient base lam)) mu = kostantMultiplicity base lam mu := sorry

/-! ### Layer 7: the center of `U(L)`, Harish-Chandra, Freudenthal, and Serre's relations

The center `Z(U(L)) = Subalgebra.center K (UniversalEnvelopingAlgebra K L)` is the commutative algebra
in which `casimirElement` lives; its central characters `χ_λ`, the Harish-Chandra isomorphism
`Z(U(L)) ≅ S(H)^{W·}`, the linkage principle, Freudenthal's recursion, and the Serre presentation of
`L` from its Cartan matrix are the content. -/

/-- **The central character** `χ_λ : Z(U(L)) →ₐ[K] K`: the scalar by which the center acts on the
highest weight module of weight `λ`. It is defined through the action of the center on the
one-dimensional top weight line of the Verma module `M(λ)` (which the center preserves), so its
construction depends on the Layer 3 Verma/highest-weight machinery, not on Schur's lemma alone. -/
noncomputable def centralCharacter (lam : Module.Dual K H) :
    Subalgebra.center K (UniversalEnvelopingAlgebra K L) →ₐ[K] K := sorry

/-- **The dot action** `w · λ = w(λ+ρ) - ρ` of the Weyl group on weights: the ordinary linear Weyl
action conjugated by translation by `ρ`. This is **affine**, not the linear Weyl action, so it is the
one under which the Harish-Chandra invariants and the orbit statement are taken. -/
noncomputable def dotAction (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (w : (LieAlgebra.IsKilling.rootSystem H).weylGroup) (lam : Module.Dual K H) :
    Module.Dual K H := sorry

/-- **The Harish-Chandra projection** `Z(U(L)) →ₐ[K] S(H)`: the **raw** restriction `ξ` to the
`U(H) = S(H)` factor of the triangular decomposition (Layer 3), with **no** `ρ`-shift. The choice is
forced by the headline: the raw `ξ` has image the dot-invariants `S(H)^{W·}` below, whereas the
`ρ`-shifted `γ = τ_{-ρ} ∘ ξ` has image the ordinary invariants `S(H)^W`; composing the shift in
while targeting the dot-invariants would be inconsistent. The `ξ`/`γ` bridge is exactly the
evaluation characterization recorded in `dotInvariants`. -/
noncomputable def hcProjection (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    Subalgebra.center K (UniversalEnvelopingAlgebra K L) →ₐ[K] SymmetricAlgebra K H := sorry

/-- **The dot-invariants** `S(H)^{W·}`, defined by the **affine (evaluation) dot action**, not the
linear Weyl action: `p ∈ S(H)` is invariant when `p (w · λ) = p (λ)` for all `w` and all `λ`,
equivalently when the `ρ`-translate of `p` is invariant under the ordinary linear Weyl action. This is
the honest target of `harishChandraIso`; the opaque signature is pinned to that evaluation
characterization. -/
noncomputable def dotInvariants (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    Subalgebra K (SymmetricAlgebra K H) := sorry

/-- **The Harish-Chandra isomorphism** `Z(U(L)) ≃ₐ[K] S(H)^{W·}`: `hcProjection` corestricts to an
algebra isomorphism onto the dot-invariants. -/
noncomputable def harishChandraIso (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    Subalgebra.center K (UniversalEnvelopingAlgebra K L) ≃ₐ[K] dotInvariants base := sorry

/-- **Central characters and the dot orbit**: `χ_λ = χ_μ` iff `μ ∈ W · λ` (dot action). This is the
central-character/orbit theorem behind Verma-module homomorphisms. The full **linkage principle** of
category `O` (composition factors, the integral Weyl group, and the order constraints of the block
decomposition) is a strictly stronger, separate development stated on its own. -/
theorem centralCharacter_eq_iff_dotOrbit (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam mu : Module.Dual K H) :
    centralCharacter lam = centralCharacter mu ↔
      ∃ w : (LieAlgebra.IsKilling.rootSystem H).weylGroup, mu = dotAction base w lam := sorry

/-- **Freudenthal's base case**: the top weight `λ` of `L(λ)` has multiplicity one. The recursion below
is anchored here and computes the lower multiplicities. -/
theorem freudenthal_top_mult (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) (hlam : IsDominantIntegral base lam)
    [FiniteDimensional K (irreducibleQuotient base lam)] :
    (formalCharacter (M := irreducibleQuotient base lam)) lam = 1 := sorry

/-- The Freudenthal double sum `2 Σ_{α>0} Σ_{j≥1} mult_{μ+jα}(L(λ)) · ⟨μ+jα, α⟩`. The inner sum over
`j ≥ 1` is finite because `μ + j • α` leaves the (finite) weight set for large `j`, so it ranges over a
finite `Finset`; packaged opaquely so the recursion is expressible before the positive-root sum
machinery is in place. -/
noncomputable def freudenthalRHS (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam mu : Module.Dual K H) : K := sorry

/-- **Freudenthal's multiplicity formula**: the recursion
`(⟨λ+ρ,λ+ρ⟩ - ⟨μ+ρ,μ+ρ⟩) · mult_μ = 2 Σ_{α>0} Σ_{j≥1} mult_{μ+jα} ⟨μ+jα,α⟩`, anchored at
`freudenthal_top_mult`. For `μ` strictly below `λ` the Casimir denominator
`invForm (λ+ρ) (λ+ρ) - invForm (μ+ρ) (μ+ρ)` is nonzero, so the identity solves for `mult_μ` downward
from `λ`, complementing Kostant's closed form. -/
theorem freudenthal_multiplicity_formula (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) (hlam : IsDominantIntegral base lam)
    [FiniteDimensional K (irreducibleQuotient base lam)] (mu : Module.Dual K H) :
    (invForm (lam + weylVector base) (lam + weylVector base)
        - invForm (mu + weylVector base) (mu + weylVector base))
      * ((formalCharacter (M := irreducibleQuotient base lam)) mu : K)
      = 2 * freudenthalRHS base lam mu := sorry

/-- **A Chevalley system.** Before the presentation theorem one must fix, for each simple root `αᵢ`,
normalized generators `eᵢ ∈ Lα`, `fᵢ ∈ L_{-α}`, `hᵢ = αᵢ^∨` with `⁅eᵢ, fᵢ⁆ = hᵢ` and the correct
`⁅hᵢ, eᵢ⁆ = ⟨αᵢ, αⱼ^∨⟩ eⱼ` scalings: the root spaces are only lines, so the `eᵢ`, `fᵢ` require an
explicit normalization (and sign choice) for the Cartan-matrix and higher Serre relations to hold with
Mathlib's `CartanMatrix.Relations` conventions. The data is bundled — root-space membership for
`eᵢ`/`fᵢ`, `hᵢ` the coroot vector, `⁅eᵢ, fᵢ⁆ = hᵢ`, and the `h`-eigenvalue relations — because a
bare "nonzero functions exist" conclusion would be unrelated to the Serre presentation this
milestone feeds; the higher Serre relations (`ad(eᵢ)^{1-aᵢⱼ} eⱼ = 0`) are consumed by
`serre_presentation_equiv` below. -/
theorem exists_chevalleySystem (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    ∃ e f : H.root → L,
      (∀ i, e i ≠ 0) ∧ (∀ i, f i ≠ 0) ∧
      (∀ i : H.root, e i ∈ LieAlgebra.rootSpace H (i.1 : H → K)) ∧
      (∀ i : H.root, f i ∈ LieAlgebra.rootSpace H (-(i.1 : H → K))) ∧
      (∀ i : H.root, ⁅e i, f i⁆ = (LieAlgebra.IsKilling.coroot i.1 : L)) ∧
      ∀ i j : H.root, ⁅(LieAlgebra.IsKilling.coroot i.1 : L), e j⁆
          = (j.1 : H → K) (LieAlgebra.IsKilling.coroot i.1) • e j := sorry

/-- **The Serre presentation** of a **simple** `L`. Mathlib builds `Matrix.ToLieAlgebra K CM`, the
quotient of the free Lie algebra by the Serre relations of a Cartan matrix `CM`
(`Mathlib/Algebra/Lie/SerreConstruction.lean`). For simple `L`, the Chevalley system of
`exists_chevalleySystem` satisfies exactly the Serre relations of `base.cartanMatrix` and the induced
map is a Lie-algebra isomorphism. Simplicity keeps `base.cartanMatrix` indecomposable; the reducible
Killing-semisimple case is the direct sum of the simple-ideal presentations, handled componentwise. -/
theorem serre_presentation_equiv [LieAlgebra.IsSimple K L]
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    Nonempty (Matrix.ToLieAlgebra K base.cartanMatrix ≃ₗ⁅K⁆ L) := sorry

end General

/-! ## Layer 8: the exceptional Lie algebras, explicitly

Mathlib names `LieAlgebra.e₆`, `e₇`, `e₈`, `f₄`, `g₂` as `Matrix.ToLieAlgebra` quotients but proves
none of their structural theorems (finite-dimensionality, dimensions, Killing-semisimplicity and type,
concrete models, representations), and has **no octonions**. This section works entirely in the
**split** track: over the char-zero field `K` (defaulting, as elsewhere, to algebraically closed `K`)
it builds the **split** octonions `𝕆` and the **split** Albert algebra `H₃(𝕆)`, their derivation Lie
algebras `G₂ = Der(𝕆)` and `F₄ = Der(H₃(𝕆))`, and the split `E`-series, identifying each with the
split Serre-construction object `LieAlgebra.g₂`/`f₄`/`e₆`/`e₇`/`e₈` via `serre_presentation_equiv`. The
formally real / compact division forms live over `K = ℝ` and are **not** identified with the split
Serre algebras without a separate base-change of forms. -/

section Exceptional

variable (K : Type) [Field K] [CharZero K]

/-- **The split octonions** `𝕆`, the split Cayley algebra over `K`, built by Cayley-Dickson doubling of
the split quaternions: an `8`-dimensional non-associative alternative composition algebra. This is the
**split** form (the one whose derivations are the split `LieAlgebra.g₂`); the compact division
octonions are a distinct `K = ℝ` real form. Absent from Mathlib, so building it is itself a target. The
multiplication is `K`-bilinear and unital (hence `NonAssocRing` — which packages the unit — with the
two scalar towers, not a bare `Mul` or a separate `One`). -/
def Octonion (K : Type) : Type := sorry

noncomputable instance : NonAssocRing (Octonion K) := sorry
noncomputable instance : Module K (Octonion K) := sorry
noncomputable instance : SMulCommClass K (Octonion K) (Octonion K) := sorry
noncomputable instance : IsScalarTower K (Octonion K) (Octonion K) := sorry

/-- `𝕆` is `8`-dimensional. -/
theorem finrank_octonion : Module.finrank K (Octonion K) = 8 := sorry

/-- **Octonion conjugation** `x ↦ x̄`, a `K`-linear map fixing `1` and negating the imaginary part. -/
noncomputable def octonionConj : Octonion K →ₗ[K] Octonion K := sorry

/-- **The octonion norm** `N(x)`, the composition-algebra norm form, given here as its underlying
map to `K` (with `N(x) • 1 = x * octonionConj x`). -/
noncomputable def octonionNorm : Octonion K → K := sorry

/-- The norm is **multiplicative**: `N(x y) = N(x) N(y)`, the defining property of a composition
algebra. -/
theorem octonionNorm_mul (x y : Octonion K) :
    octonionNorm K (x * y) = octonionNorm K x * octonionNorm K y := sorry

/-- `𝕆` is **alternative** (left alternative law); with the right law this is the associator being
alternating. -/
theorem octonion_left_alternative (x y : Octonion K) : x * x * y = x * (x * y) := sorry

/-- **The imaginary octonions** `Im 𝕆`, the `7`-dimensional trace-zero subspace, the carrier of the
`7`-dimensional fundamental representation of `G₂ = Der(𝕆)`. -/
noncomputable def imaginaryOctonion : Submodule K (Octonion K) := sorry

/-- `Im 𝕆` is `7`-dimensional. -/
theorem finrank_imaginaryOctonion : Module.finrank K (imaginaryOctonion K) = 7 := sorry

/-- **The derivation Lie algebra** `Der(A)` of a non-unital non-associative `K`-algebra `A`: the
`K`-linear maps `D` with `D (x * y) = D x * y + x * D y`, a Lie algebra under commutator. The
multiplication must be `K`-bilinear (the `NonUnitalNonAssocSemiring` together with the two scalar
towers), which `[Mul A]` alone does not supply; for a Lie algebra `A` this specializes to Mathlib's
`LieDerivation`. -/
def derivationLieAlgebra (A : Type u) [NonUnitalNonAssocSemiring A] [Module K A]
    [SMulCommClass K A A] [IsScalarTower K A A] : Type u := sorry

noncomputable instance (A : Type u) [NonUnitalNonAssocSemiring A] [Module K A]
    [SMulCommClass K A A] [IsScalarTower K A A] : LieRing (derivationLieAlgebra K A) := sorry
noncomputable instance (A : Type u) [NonUnitalNonAssocSemiring A] [Module K A]
    [SMulCommClass K A A] [IsScalarTower K A A] : LieAlgebra K (derivationLieAlgebra K A) := sorry

/-- **`G₂ = Der(𝕆)`** is `14`-dimensional. Its `7`-dimensional fundamental representation is
`imaginaryOctonion`. -/
theorem finrank_derivationOctonion : Module.finrank K (derivationLieAlgebra K (Octonion K)) = 14 :=
  sorry

/-- `Der(𝕆)` is the **split** simple Lie algebra of type `G₂`: it is isomorphic to Mathlib's
`LieAlgebra.g₂`, the Serre construction on `CartanMatrix.G₂`. -/
theorem derivationOctonion_equiv_g2 :
    Nonempty (derivationLieAlgebra K (Octonion K) ≃ₗ⁅K⁆ LieAlgebra.g₂ (R := K)) := sorry

/-- **The split Albert algebra** `J = H₃(𝕆)` of `3×3` Hermitian split-octonionic matrices under the
symmetrized product `x ∘ y = ½(x y + y x)`, a `27`-dimensional exceptional Jordan algebra. This is the
**split** form (derivations the split `LieAlgebra.f₄`); the formally real Albert algebra is the
`K = ℝ` division-octonion form and is not identified with `LieAlgebra.f₄ ℝ` here. Absent from Mathlib.
The product is commutative and `K`-bilinear. -/
def AlbertAlgebra (K : Type) : Type := sorry

noncomputable instance : NonUnitalNonAssocCommRing (AlbertAlgebra K) := sorry
noncomputable instance : Module K (AlbertAlgebra K) := sorry
noncomputable instance : SMulCommClass K (AlbertAlgebra K) (AlbertAlgebra K) := sorry
noncomputable instance : IsScalarTower K (AlbertAlgebra K) (AlbertAlgebra K) := sorry

/-- `H₃(𝕆)` is `27`-dimensional. -/
theorem finrank_albertAlgebra : Module.finrank K (AlbertAlgebra K) = 27 := sorry

/-- `H₃(𝕆)` satisfies the (commutative) Jordan identity (`Mathlib.Algebra.Jordan.Basic`). -/
theorem isCommJordan_albertAlgebra : IsCommJordan (AlbertAlgebra K) := sorry

/-- **The Albert trace** `J → K`, a `K`-linear functional; its kernel is the trace-zero subspace. -/
noncomputable def albertTrace : AlbertAlgebra K →ₗ[K] K := sorry

/-- **The trace-zero Albert subspace** `J₀ = ker albertTrace`, the `26`-dimensional fundamental
representation of `F₄ = Der(J)`. -/
noncomputable def traceZeroAlbert : Submodule K (AlbertAlgebra K) := sorry

/-- `J₀` is `26`-dimensional. -/
theorem finrank_traceZeroAlbert : Module.finrank K (traceZeroAlbert K) = 26 := sorry

/-- **`F₄ = Der(H₃(𝕆))`** is `52`-dimensional. Its `26`-dimensional fundamental representation is
`traceZeroAlbert` (`J₀`). -/
theorem finrank_derivationAlbert :
    Module.finrank K (derivationLieAlgebra K (AlbertAlgebra K)) = 52 := sorry

/-- `Der(H₃(𝕆))` is the **split** simple Lie algebra of type `F₄`: isomorphic to Mathlib's
`LieAlgebra.f₄`. -/
theorem derivationAlbert_equiv_f4 :
    Nonempty (derivationLieAlgebra K (AlbertAlgebra K) ≃ₗ⁅K⁆ LieAlgebra.f₄ (R := K)) := sorry

/-- A summand of the **Vinberg `ℤ/3`-model** of split `E₈`: `⋀³(K⁹)` is `84`-dimensional, so
`𝔰𝔩₉ ⊕ ⋀³(K⁹) ⊕ ⋀³(K⁹)^*` has dimension `248 = 80 + 84 + 84`. This `ℤ/3`-graded model (graded bracket
pairing the exterior summands into `𝔰𝔩₉`) is one concrete construction of split `E₈`; it is **not** the
Freudenthal-Tits magic square built from a pair of composition algebras, and `E₆`/`E₇` are separate
constructions, not "rows" of this model. -/
theorem finrank_exteriorPower_three_nine :
    Module.finrank K (⋀[K]^3 (Fin 9 → K)) = 84 := sorry

/-- **`E₈`** (Mathlib's `LieAlgebra.e₈`, the split Serre-construction algebra of type `E₈`, realized by
the Vinberg model above) is `248`-dimensional; the adjoint `248` is its smallest representation. -/
theorem finrank_e8 : Module.finrank K (LieAlgebra.e₈ (R := K)) = 248 := sorry

/-- **`E₆`** is `78`-dimensional, with its `27`-dimensional representation `H₃(𝕆)`; **`E₇`** is
`133`-dimensional, with its `56`-dimensional representation. -/
theorem finrank_e6_e7 :
    Module.finrank K (LieAlgebra.e₆ (R := K)) = 78 ∧
      Module.finrank K (LieAlgebra.e₇ (R := K)) = 133 := sorry

end Exceptional

end TauCetiRoadmap.RepresentationTheory.LieHighestWeight
