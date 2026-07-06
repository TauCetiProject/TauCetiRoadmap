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
`V(n)`), which the later reductions literally call; **Layer 1-2** the root-space/weight-space
decomposition and the integrality of weights (the load-bearing `sl₂` reduction); **Layer 3** Verma
modules and `L(λ)`; **Layer 4** the dominant-integral classification; **Layer 5** the Casimir element
and Weyl's complete reducibility; **Layer 6** the Weyl character and dimension formulas and Kostant's
multiplicity formula. `README.md` remains the definitive document.
-/

namespace TauCetiRoadmap.RepresentationTheory.LieHighestWeight

open scoped Classical
open LieModule LieAlgebra Module

universe u

/-! ## Layer 0: `sl₂` representation theory (the engine)

Built first and in full, because Layers 2, 4, and 5 reduce to it. The worked `sl₂` is
`LieAlgebra.SpecialLinear.sl (Fin 2) K` with its standard triple; here we state the results for an
arbitrary `sl₂` triple `t : IsSl2Triple h e f`, so they apply verbatim to the triples attached to
roots (`exists_isSl2Triple_of_weight_isNonZero`). -/

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

/-- **Dimension of the highest weight module.** A finite-dimensional irreducible with a highest
weight (primitive) vector of weight `n` is `(n+1)`-dimensional (the module `V(n)`). -/
theorem sl2_finrank_of_hasPrimitiveVector [FiniteDimensional K M] [LieModule.IsIrreducible K L M]
    {m : M} {n : ℕ} (P : t.HasPrimitiveVectorWith m (n : K)) :
    Module.finrank K M = n + 1 := sorry

/-- **Highest weight determines the irreducible.** Two finite-dimensional irreducibles with primitive
vectors of the same weight `n` are isomorphic: the classification `{fin-dim irreducibles}/≅ ≃ ℕ`. -/
theorem sl2_irreducible_ext {M' : Type u} [AddCommGroup M'] [Module K M'] [LieRingModule L M']
    [LieModule K L M'] [FiniteDimensional K M] [FiniteDimensional K M']
    [LieModule.IsIrreducible K L M] [LieModule.IsIrreducible K L M']
    {m : M} {m' : M'} {n : ℕ} (P : t.HasPrimitiveVectorWith m (n : K))
    (P' : t.HasPrimitiveVectorWith m' (n : K)) :
    Nonempty (M ≃ₗ⁅K,L⁆ M') := sorry

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
subalgebra `H`, and a base `b` (positive/simple system) of the Mathlib root system
`LieAlgebra.IsKilling.rootSystem H`. Roots, weights, root spaces, coroots, and the Weyl group are all
Mathlib's; the root and weight lattices and the Weyl-group action are the province of
`../RootSystems/README.md`. -/

section General

variable {K : Type*} [Field K] [CharZero K] [IsAlgClosed K]
variable {L : Type u} [LieRing L] [LieAlgebra K L] [LieAlgebra.IsKilling K L] [FiniteDimensional K L]
variable {H : LieSubalgebra K L} [H.IsCartanSubalgebra] [IsTriangularizable K H L]

/- A base (positive/simple system) `b : (LieAlgebra.IsKilling.rootSystem H).Base` is passed
explicitly to each declaration below that depends on it, since the positivity of roots and the
vector `ρ` all depend on the choice. -/

/-! ### Layer 1-2: weight-space decomposition and the integrality of weights -/

/-- **Triangularizability of modules.** Over an algebraically closed field of characteristic zero,
every finite-dimensional `L`-module is triangularizable over `H`, so `iSup_genWeightSpace_eq_top`
gives the weight-space decomposition `M = ⨁_χ Mχ`. -/
theorem isTriangularizable_of_finiteDimensional {M : Type u} [AddCommGroup M] [Module K M]
    [LieRingModule L M] [LieModule K L M] [FiniteDimensional K M] :
    IsTriangularizable K H M := sorry

/-- **Integrality of weights (the `sl₂` reduction).** For every weight `χ` of a finite-dimensional
module `M` and every root `α`, the value `χ(α^∨)` is an integer. **Proof:** restrict `M` to the `sl₂`
triple of `α`, where `χ(α^∨)` is an `hₐ`-eigenvalue, and apply `sl2_hAction_eigenvalue_isInt`. This is
the load-bearing use of the engine. -/
theorem weight_apply_coroot_isInt {M : Type u} [AddCommGroup M] [Module K M] [LieRingModule L M]
    [LieModule K L M] [FiniteDimensional K M] (χ : Weight K H M) {α : Weight K H L}
    (hα : α.IsNonZero) : ∃ n : ℤ, χ (LieAlgebra.IsKilling.coroot α) = (n : K) := sorry

/-! ### Layer 3: highest weight vectors, Verma modules, and `L(λ)` -/

/-- **A highest weight vector** of weight `λ` (relative to the positive system `b`): nonzero, an
`H`-eigenvector of weight `λ`, killed by every positive root space. For a single positive root this is
`IsSl2Triple.HasPrimitiveVectorWith`. -/
def IsHighestWeightVector (b : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H)
    {M : Type u} [AddCommGroup M] [Module K M] [LieRingModule L M] [LieModule K L M] (v : M) :
    Prop := sorry

/-- **The Verma module** `M(λ) = U(L) ⊗_{U(b)} K_λ`, the universal highest weight module. Presented
here as an opaque carrier with its `L`-module structure; its universal property, its freeness over
`U(n⁻)`, and its weight multiplicities (the Kostant partition function) are the content to prove. -/
def vermaModule (b : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    Type u := sorry

noncomputable instance (b : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    AddCommGroup (vermaModule b lam) := sorry
noncomputable instance (b : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    Module K (vermaModule b lam) := sorry
noncomputable instance (b : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    LieRingModule L (vermaModule b lam) := sorry
noncomputable instance (b : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    LieModule K L (vermaModule b lam) := sorry

/-- The canonical highest weight vector of the Verma module `M(λ)`. -/
theorem exists_isHighestWeightVector_vermaModule (b : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) :
    ∃ v : vermaModule b lam, IsHighestWeightVector b lam v := sorry

/-- **The irreducible quotient** `L(λ)`: the unique irreducible quotient of `M(λ)`, obtained by
quotienting by the unique maximal submodule. -/
def irreducibleQuotient (b : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    Type u := sorry

noncomputable instance (b : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    AddCommGroup (irreducibleQuotient b lam) := sorry
noncomputable instance (b : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    Module K (irreducibleQuotient b lam) := sorry
noncomputable instance (b : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    LieRingModule L (irreducibleQuotient b lam) := sorry
noncomputable instance (b : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    LieModule K L (irreducibleQuotient b lam) := sorry

/-- `L(λ)` is irreducible. -/
theorem isIrreducible_irreducibleQuotient (b : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) :
    LieModule.IsIrreducible K L (irreducibleQuotient b lam) := sorry

/-- **The classification of irreducible highest weight modules.** `L(λ) ≅ L(μ)` iff `λ = μ`. -/
theorem irreducibleQuotient_nonempty_equiv_iff (b : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam mu : Module.Dual K H) :
    Nonempty (irreducibleQuotient b lam ≃ₗ⁅K,L⁆ irreducibleQuotient b mu) ↔ lam = mu := sorry

/-! ### Layer 4: the classification of finite-dimensional irreducibles -/

/-- **Dominant integral weights.** `λ` is dominant integral when `⟨λ, αᵢ^∨⟩` is a natural number for
every simple root `αᵢ` (indexed by `b.support`). -/
def IsDominantIntegral (b : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    Prop :=
  ∀ i ∈ b.support, ∃ n : ℕ, lam ((LieAlgebra.IsKilling.rootSystem H).coroot i) = (n : K)

/-- **Every finite-dimensional irreducible is an `L(λ)` with `λ` dominant integral.** It has a
highest weight vector, and restricting to each simple `sl₂` forces the highest weight to be dominant
integral (Layer 0). -/
theorem exists_isDominantIntegral_isHighestWeightVector_of_irreducible
    (b : (LieAlgebra.IsKilling.rootSystem H).Base) {M : Type u} [AddCommGroup M]
    [Module K M] [LieRingModule L M] [LieModule K L M] [FiniteDimensional K M]
    [LieModule.IsIrreducible K L M] :
    ∃ (lam : Module.Dual K H) (v : M), IsHighestWeightVector b lam v ∧ IsDominantIntegral b lam :=
  sorry

/-- **`L(λ)` is finite-dimensional exactly when `λ` is dominant integral.** The hard direction uses
that `fᵢ^{⟨λ,αᵢ^∨⟩+1}` kills the highest weight vector in `L(λ)` (the `sl₂`-finiteness along `αᵢ`). -/
theorem finiteDimensional_irreducibleQuotient_iff (b : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) :
    FiniteDimensional K (irreducibleQuotient b lam) ↔ IsDominantIntegral b lam := sorry

/-- **The classification theorem.** A finite-dimensional irreducible module has a unique dominant
integral highest weight; combined with `finiteDimensional_irreducibleQuotient_iff` and
`irreducibleQuotient_nonempty_equiv_iff`, `λ ↦ L(λ)` is a bijection from dominant integral weights to
isomorphism classes of finite-dimensional irreducibles. -/
theorem existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible
    (b : (LieAlgebra.IsKilling.rootSystem H).Base)
    {M : Type u} [AddCommGroup M] [Module K M] [LieRingModule L M] [LieModule K L M]
    [FiniteDimensional K M] [LieModule.IsIrreducible K L M] :
    ∃! lam : Module.Dual K H, IsDominantIntegral b lam ∧ ∃ v : M, IsHighestWeightVector b lam v :=
  sorry

/-! ### Layer 5: the Casimir element and Weyl's complete reducibility -/

/-- **The Casimir element** of `U(L)`, built from a basis of `L` and its Killing-dual basis; central,
and acting on `L(λ)` by `⟨λ+ρ, λ+ρ⟩ - ⟨ρ, ρ⟩`. -/
noncomputable def casimirElement : UniversalEnvelopingAlgebra K L := sorry

/-- The Casimir element is central in `U(L)`. -/
theorem casimirElement_mem_center :
    (casimirElement : UniversalEnvelopingAlgebra K L) ∈
      Subalgebra.center K (UniversalEnvelopingAlgebra K L) := sorry

/-- **Weyl's complete reducibility theorem.** Every finite-dimensional module over a
Killing-semisimple Lie algebra in characteristic zero is a direct sum of irreducibles: every
submodule has a complement. Proved via the Casimir element; the `sl₂` case is its rank-one instance. -/
theorem weyl_complete_reducibility {M : Type u} [AddCommGroup M] [Module K M] [LieRingModule L M]
    [LieModule K L M] [FiniteDimensional K M] (N : LieSubmodule K L M) :
    ∃ N' : LieSubmodule K L M, IsCompl N N' := sorry

/-! ### Layer 6: the Weyl character, dimension, and Kostant formulas -/

/-- **The formal character** of a finite-dimensional module: `μ ↦ dim Mμ`, an element of the integral
group algebra of the weight lattice. Additive on short exact sequences, multiplicative on tensor
products, and Weyl-invariant. -/
noncomputable def formalCharacter {M : Type u} [AddCommGroup M] [Module K M] [LieRingModule L M]
    [LieModule K L M] [FiniteDimensional K M] : AddMonoidAlgebra ℤ (Module.Dual K H) := sorry

/-- **`ρ`**, the half-sum of the positive roots (relative to `b`), a weight in `Module.Dual K H`. -/
noncomputable def weylVector (b : (LieAlgebra.IsKilling.rootSystem H).Base) : Module.Dual K H :=
  sorry

/-- The integer pairing `⟨λ, αᵢ^∨⟩ ∈ ℤ` of an integral weight against a coroot (well-defined by
`weight_apply_coroot_isInt`); indexed by the roots `H.root`. -/
noncomputable def coweightPairing (lam : Module.Dual K H) (i : H.root) : ℤ := sorry

/-- **The Weyl denominator** `Δ = ∑_{w ∈ W} sgn(w) e^{w(ρ)} = ∏_{α>0}(e^{α/2} - e^{-α/2})`. -/
noncomputable def weylDenominator (b : (LieAlgebra.IsKilling.rootSystem H).Base) :
    AddMonoidAlgebra ℤ (Module.Dual K H) := sorry

/-- **The Weyl numerator** `∑_{w ∈ W} sgn(w) e^{w(λ+ρ)}` for a dominant integral weight `λ`. -/
noncomputable def weylNumerator (b : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) : AddMonoidAlgebra ℤ (Module.Dual K H) := sorry

/-- **The Weyl character formula**: `ch L(λ) · Δ = ∑_{w ∈ W} sgn(w) e^{w(λ+ρ)}`. -/
theorem weyl_character_formula (b : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) (hlam : IsDominantIntegral b lam)
    [FiniteDimensional K (irreducibleQuotient b lam)] :
    (formalCharacter (M := irreducibleQuotient b lam)) * weylDenominator b
      = weylNumerator b lam := sorry

/-- **The Weyl dimension formula**: `dim L(λ) = ∏_{α>0} ⟨λ+ρ, α^∨⟩ / ⟨ρ, α^∨⟩`, an identity in `ℚ`
(the product is a positive integer). The product is over the positive roots (`Base.IsPos`). -/
theorem weyl_dimension_formula (b : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) (hlam : IsDominantIntegral b lam) :
    (Module.finrank K (irreducibleQuotient b lam) : ℚ)
      = ∏ i ∈ Finset.univ.filter (fun i => b.IsPos i),
          (coweightPairing (lam + weylVector b) i : ℚ) / (coweightPairing (weylVector b) i : ℚ) :=
  sorry

/-- **The Kostant partition function** `P(ν)` for a base `b`: the number of ways to write `ν` as a sum
of positive roots with multiplicity. -/
noncomputable def kostantPartition (b : (LieAlgebra.IsKilling.rootSystem H).Base)
    (nu : Module.Dual K H) : ℕ := sorry

/-- The Weyl-alternating sum `∑_{w ∈ W} sgn(w) P(w(λ+ρ) - (μ+ρ))` that Kostant's formula equates with
a weight multiplicity. Named so the multiplicity statement is expressible before the Weyl-group action
on weights (`../RootSystems/README.md`) is fully in place. -/
noncomputable def kostantMultiplicity (b : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam mu : Module.Dual K H) : ℤ := sorry

/-- **Kostant's multiplicity formula**: the multiplicity of the weight `μ` in `L(λ)` is
`∑_{w ∈ W} sgn(w) P(w(λ+ρ) - (μ+ρ))`, the weight-by-weight refinement of the character formula. -/
theorem kostant_multiplicity_formula (b : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) (hlam : IsDominantIntegral b lam)
    [FiniteDimensional K (irreducibleQuotient b lam)] (mu : Module.Dual K H) :
    (formalCharacter (M := irreducibleQuotient b lam)) mu = kostantMultiplicity b lam mu := sorry

/-! ### Layer 7: the center of `U(L)`, Harish-Chandra, Freudenthal, and Serre's relations

The center `Z(U(L)) = Subalgebra.center K (UniversalEnvelopingAlgebra K L)` is the commutative algebra
in which `casimirElement` lives; its central characters `χ_λ`, the Harish-Chandra isomorphism
`Z(U(L)) ≅ S(H)^{W·}`, the linkage principle, Freudenthal's recursion, and the Serre presentation of
`L` from its Cartan matrix are the content. -/

/-- **The central character** `χ_λ : Z(U(L)) →ₐ[K] K`: the scalar by which the center acts on any
highest weight module of weight `λ` (in particular on `L(λ)`). Generalizes the Casimir eigenvalue. -/
noncomputable def centralCharacter (lam : Module.Dual K H) :
    Subalgebra.center K (UniversalEnvelopingAlgebra K L) →ₐ[K] K := sorry

/-- **The dot action** `w · λ = w(λ+ρ) - ρ` of the Weyl group on weights, the shift under which the
Harish-Chandra invariants and the linkage principle are stated. -/
noncomputable def dotAction (b : (LieAlgebra.IsKilling.rootSystem H).Base)
    (w : (LieAlgebra.IsKilling.rootSystem H).weylGroup) (lam : Module.Dual K H) :
    Module.Dual K H := sorry

/-- **The dot-invariants** `S(H)^{W·}` in the symmetric algebra of the Cartan, the target of the
Harish-Chandra isomorphism. -/
noncomputable def dotInvariants (b : (LieAlgebra.IsKilling.rootSystem H).Base) :
    Subalgebra K (SymmetricAlgebra K H) := sorry

/-- **The Harish-Chandra isomorphism** `Z(U(L)) ≃ₐ[K] S(H)^{W·}`: the ρ-shifted projection of the
center onto the `U(H) = S(H)` factor of the triangular decomposition is an algebra isomorphism onto
the dot-invariants. -/
noncomputable def harishChandraIso (b : (LieAlgebra.IsKilling.rootSystem H).Base) :
    Subalgebra.center K (UniversalEnvelopingAlgebra K L) ≃ₐ[K] dotInvariants b := sorry

/-- **The linkage principle**: `χ_λ = χ_μ` iff `μ ∈ W·λ` (dot action). The constraint behind
Verma-module homomorphisms and the block decomposition of category `O`. -/
theorem harishChandra_linkage (b : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam mu : Module.Dual K H) :
    centralCharacter lam = centralCharacter mu ↔
      ∃ w : (LieAlgebra.IsKilling.rootSystem H).weylGroup, mu = dotAction b w lam := sorry

/-- The `W`-invariant symmetric form `⟨·,·⟩` on weights (from the Killing form via `cartanEquivDual`),
the form appearing in the Casimir eigenvalue, Freudenthal, and the Weyl formulas. -/
noncomputable def invForm (lam mu : Module.Dual K H) : K := sorry

/-- The Freudenthal double sum `2 Σ_{α>0} Σ_{j≥1} mult_{μ+jα}(L(λ)) · ⟨μ+jα, α⟩`, packaged as an
opaque target so the recursion is expressible before the positive-root sum machinery is in place. -/
noncomputable def freudenthalRHS (b : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam mu : Module.Dual K H) : K := sorry

/-- **Freudenthal's multiplicity formula**: the recursion
`(⟨λ+ρ,λ+ρ⟩ - ⟨μ+ρ,μ+ρ⟩) · mult_μ = 2 Σ_{α>0} Σ_{j≥1} mult_{μ+jα} ⟨μ+jα,α⟩` computing weight
multiplicities of `L(λ)` downward from `λ`, complementing Kostant's closed form. -/
theorem freudenthal_multiplicity_formula (b : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) (hlam : IsDominantIntegral b lam)
    [FiniteDimensional K (irreducibleQuotient b lam)] (mu : Module.Dual K H) :
    (invForm (lam + weylVector b) (lam + weylVector b)
        - invForm (mu + weylVector b) (mu + weylVector b))
      * ((formalCharacter (M := irreducibleQuotient b lam)) mu : K)
      = 2 * freudenthalRHS b lam mu := sorry

/-- **The Serre presentation** of `L`. Mathlib already builds `Matrix.ToLieAlgebra K CM`, the quotient
of the free Lie algebra by the Serre relations of a Cartan matrix `CM`
(`Mathlib/Algebra/Lie/SerreConstruction.lean`). The theorem is that the Serre construction on
`b.cartanMatrix` recovers `L`: the Chevalley generators attached to the simple roots satisfy the Serre
relations, and the induced map is a Lie-algebra isomorphism. This gives `L` from its root system and
identifies Mathlib's `Matrix.ToLieAlgebra` with the concrete Killing algebra (cf.
`../RootSystems/README.md`). -/
theorem serre_presentation_equiv (b : (LieAlgebra.IsKilling.rootSystem H).Base) :
    Nonempty (Matrix.ToLieAlgebra K b.cartanMatrix ≃ₗ⁅K⁆ L) := sorry

end General

/-! ## Layer 8: the exceptional Lie algebras, explicitly

Mathlib names `LieAlgebra.e₆`, `e₇`, `e₈`, `f₄`, `g₂` as `Matrix.ToLieAlgebra` quotients but proves
nothing about them, and has **no octonions**. This section builds the octonions `𝕆` and the Albert
algebra `H₃(𝕆)` (both absent from Mathlib), their derivation Lie algebras `G₂ = Der(𝕆)` and
`F₄ = Der(H₃(𝕆))`, and pins the dimensions of the magic-square algebras, identifying each with the
Serre-construction object via `serre_presentation_equiv`. -/

section Exceptional

variable (K : Type) [Field K] [CharZero K]

/-- **The octonions** `𝕆`, the Cayley algebra, built by Cayley-Dickson doubling. Absent from Mathlib,
so building this `8`-dimensional non-associative alternative composition algebra is itself a target.
Presented as an opaque carrier with its module and (non-associative, unital) multiplication. -/
def Octonion (K : Type) : Type := sorry

noncomputable instance : AddCommGroup (Octonion K) := sorry
noncomputable instance : Module K (Octonion K) := sorry
noncomputable instance : Mul (Octonion K) := sorry
noncomputable instance : One (Octonion K) := sorry

/-- `𝕆` is `8`-dimensional. -/
theorem finrank_octonion : Module.finrank K (Octonion K) = 8 := sorry

/-- **The derivation Lie algebra** `Der(A)` of a (possibly non-associative) `K`-algebra `A`: the maps
`D` with `D (x * y) = D x * y + x * D y`, a Lie algebra under commutator. For a Lie algebra this is
Mathlib's `LieDerivation`; here it is stated for a non-associative algebra `A` with a bare `Mul`. -/
def derivationLieAlgebra (A : Type u) [AddCommGroup A] [Module K A] [Mul A] : Type u := sorry

noncomputable instance (A : Type u) [AddCommGroup A] [Module K A] [Mul A] :
    LieRing (derivationLieAlgebra K A) := sorry
noncomputable instance (A : Type u) [AddCommGroup A] [Module K A] [Mul A] :
    LieAlgebra K (derivationLieAlgebra K A) := sorry

/-- **`G₂ = Der(𝕆)`** is `14`-dimensional. Its `7`-dimensional fundamental representation is the
imaginary octonions `Im 𝕆`. -/
theorem finrank_derivationOctonion : Module.finrank K (derivationLieAlgebra K (Octonion K)) = 14 :=
  sorry

/-- `Der(𝕆)` is the split simple Lie algebra of type `G₂`: it is isomorphic to Mathlib's
`LieAlgebra.g₂`, the Serre construction on `CartanMatrix.G₂`. -/
theorem derivationOctonion_equiv_g2 :
    Nonempty (derivationLieAlgebra K (Octonion K) ≃ₗ⁅K⁆ LieAlgebra.g₂ (R := K)) := sorry

/-- **The Albert algebra** `J = H₃(𝕆)` of `3×3` Hermitian octonionic matrices under the symmetrized
product `x ∘ y = ½(xy + yx)`, a `27`-dimensional exceptional Jordan algebra. Absent from Mathlib.
Presented with a commutative multiplication (`CommMagma`). -/
def AlbertAlgebra (K : Type) : Type := sorry

noncomputable instance : AddCommGroup (AlbertAlgebra K) := sorry
noncomputable instance : Module K (AlbertAlgebra K) := sorry
noncomputable instance : CommMagma (AlbertAlgebra K) := sorry

/-- `H₃(𝕆)` is `27`-dimensional. -/
theorem finrank_albertAlgebra : Module.finrank K (AlbertAlgebra K) = 27 := sorry

/-- `H₃(𝕆)` satisfies the (commutative) Jordan identity (`Mathlib.Algebra.Jordan.Basic`). -/
theorem isCommJordan_albertAlgebra : IsCommJordan (AlbertAlgebra K) := sorry

/-- **`F₄ = Der(H₃(𝕆))`** is `52`-dimensional. Its `26`-dimensional fundamental representation is the
trace-zero part `J₀ ⊂ H₃(𝕆)`. -/
theorem finrank_derivationAlbert :
    Module.finrank K (derivationLieAlgebra K (AlbertAlgebra K)) = 52 := sorry

/-- `Der(H₃(𝕆))` is the split simple Lie algebra of type `F₄`: isomorphic to Mathlib's
`LieAlgebra.f₄`. -/
theorem derivationAlbert_equiv_f4 :
    Nonempty (derivationLieAlgebra K (AlbertAlgebra K) ≃ₗ⁅K⁆ LieAlgebra.f₄ (R := K)) := sorry

/-- A magic-square summand: `⋀³(K⁹)` is `84`-dimensional, the input to the `ℤ/3`-grading
`𝔢₈ = 𝔰𝔩₉ ⊕ ⋀³(K⁹) ⊕ ⋀³(K⁹)^*` of dimension `248 = 80 + 84 + 84`. -/
theorem finrank_exteriorPower_three_nine :
    Module.finrank K (⋀[K]^3 (Fin 9 → K)) = 84 := sorry

/-- **`E₈`** (Mathlib's `LieAlgebra.e₈`, the Freudenthal-Tits magic-square algebra) is
`248`-dimensional; the adjoint `248` is its smallest representation. -/
theorem finrank_e8 : Module.finrank K (LieAlgebra.e₈ (R := K)) = 248 := sorry

/-- **`E₆`** is `78`-dimensional, with its `27`-dimensional representation `H₃(𝕆)`; **`E₇`** is
`133`-dimensional, with its `56`-dimensional representation. -/
theorem finrank_e6_e7 :
    Module.finrank K (LieAlgebra.e₆ (R := K)) = 78 ∧
      Module.finrank K (LieAlgebra.e₇ (R := K)) = 133 := sorry

end Exceptional

end TauCetiRoadmap.RepresentationTheory.LieHighestWeight
