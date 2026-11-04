import Mathlib
import Mathlib.RingTheory.TensorProduct.Basic
import TauCeti.Algebra.Lie.HighestWeight.CentralCharacter.DotOrbit
import TauCeti.LinearAlgebra.SymmetricAlgebra.AdjointAction
import TauCeti.LinearAlgebra.SymmetricAlgebra.Homogeneous
import TauCeti.LinearAlgebra.SymmetricAlgebra.Grading
import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Homogeneous
import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Basic
import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Embedding
import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Injective
import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Domain
import TauCeti.Algebra.Lie.Sl2.Weyl.Automorphism
import TauCeti.Algebra.Lie.GeneralLinear.Radical
import TauCeti.Algebra.Lie.Presentation.Serre.Killing
import TauCeti.Algebra.Lie.Derivation.Basic
import TauCeti.Algebra.Octonion.Basic
import TauCeti.Algebra.Octonion.Derivation
import TauCeti.LinearAlgebra.SymmetricAlgebra.Functoriality
import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Basis
import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Functoriality
import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Finite
import TauCeti.Algebra.Lie.HighestWeight.Weyl.Character
import TauCeti.Algebra.Lie.HighestWeight.Weyl.Dimension
import TauCeti.Algebra.Lie.HighestWeight.KostantMultiplicity
import TauCeti.Algebra.Lie.HighestWeight.Weight.Verma
import TauCeti.Algebra.Lie.HighestWeight.CompleteReducibility
import TauCeti.Algebra.Lie.HighestWeight.FiniteDimensional
import TauCeti.Algebra.Lie.HighestWeight.Existence
import TauCeti.Algebra.Lie.HighestWeight.Isotypic
import TauCeti.Algebra.Lie.UniversalEnveloping.Multiplicity
import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.Noetherian.Opposite
import TauCeti.Algebra.Lie.UniversalEnveloping.PBW.LeadingTerm

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
reducibility, no Weyl character/dimension/Kostant formulas, no isotypic-decomposition interface
for Lie modules (the ring-level `isotypicComponent` of `RingTheory/SimpleModule/Isotypic.lean` is
consumed through the enveloping-algebra dictionary, not duplicated), and no highest-weight theory
for the reductive `gl_n`** (see `README.md` for the map).

The design follows the layers of `README.md`: **Layer 0** the `sl₂` engine (the classification of
`V(n)`), which the later reductions literally call; **Layer 1-2** the root-space decomposition, the
generalized weight-space decomposition and its refinement to honest weight spaces
(`isSemisimple_toEnd_cartan`), and the integrality of weights (the load-bearing `sl₂` reduction);
**Layer 3** Verma modules and `L(λ)`; **Layer 4** the dominant-integral classification; **Layer 5** the
invariant form, the Casimir element, and Weyl's complete reducibility; **Layer 6** the Weyl character
and dimension formulas, Kostant's multiplicity formula, and the decomposition toolkit (isotypic
components and multiplicities via the enveloping-algebra dictionary, the generated copy of `L(λ)`,
the single-weight isotypic criterion, tensor multiplicities and the minuscule Pieri rule); **Layer 7**
the center of `U(L)`, Harish-Chandra, Freudenthal, and the Serre presentation; **Layer 8** the
exceptional Lie algebras via split octonions and the split Albert algebra; **Layer 9** reductive Lie
algebras (Mathlib's `LieAlgebra.HasCentralRadical`) and the concrete highest-weight theory of `gl_n`,
with the named carrier `glIrreducible`, the trace-form Casimir, and the dual-standard Pieri rule.
`README.md` remains the definitive document.
-/

namespace TauCetiRoadmap.RepresentationTheory.LieHighestWeight

-- Mathlib deliberately keeps the commutator Lie structure on associative rings local.
-- The concrete `gl_n` targets below use it for square matrices.
attribute [local instance 100] LieRing.ofAssociativeRing

open scoped Classical DirectSum
open LieModule LieAlgebra Module

universe u v

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

include t in
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
reducibility for `sl₂` (every finite-dimensional module is `⨁ V(nᵢ)`) follows here from the
elementary weight-string/complement argument, before the general Casimir theorem. -/
theorem sl2_exists_irreducible (htop : t.toLieSubalgebra K = ⊤) (n : ℕ) :
    ∃ (V : Type u) (_ : AddCommGroup V) (_ : Module K V) (_ : LieRingModule L V) (_ : LieModule K L V)
      (v : V), FiniteDimensional K V ∧ LieModule.IsIrreducible K L V ∧
        t.HasPrimitiveVectorWith v (n : K) := sorry

end Sl2

/-! ## The concrete PBW development (arbitrary field)

`README.md` owns the shared concrete PBW development. It drops both the
characteristic-zero and algebraically-closed conventions: every target
below is stated over an arbitrary field, with no characteristic and no algebraic-closure hypothesis,
because [Ado-Iwasawa](../AdoIwasawa/README.md) consumes them over `𝔽₂`. They are pinned here, in the
supplier, so that the two roadmaps agree on a Lean signature rather than on prose. -/

section PBW

variable (K : Type u) [Field K] (L : Type u) [LieRing L] [LieAlgebra K L]

/-- The **PBW filtration** on `U(L)`: `pbwFiltration K L n` is the `K`-submodule spanned by the
products of at most `n` elements of the image of `L`. -/
abbrev pbwFiltration (n : ℕ) : Submodule K (UniversalEnvelopingAlgebra K L) :=
  TauCeti.UniversalEnvelopingAlgebra.pbwFiltration K L n

/-- The stage strictly below `pbwFiltration K L n`, in the shape Mathlib's `IsFiltration` expects. -/
abbrev pbwFiltrationLT : ℕ → Submodule K (UniversalEnvelopingAlgebra K L) :=
  TauCeti.UniversalEnvelopingAlgebra.pbwFiltrationPrevious K L

/-- **Multiplicativity.** The PBW filtration makes `U(L)` a filtered algebra. -/
theorem isRingFiltration_pbwFiltration :
    IsRingFiltration (pbwFiltration K L) (pbwFiltrationLT K L) := inferInstance

/-- The PBW filtration is exhaustive. -/
theorem iSup_pbwFiltration : ⨆ n, pbwFiltration K L n = ⊤ :=
  TauCeti.UniversalEnvelopingAlgebra.iSup_pbwFiltration_eq_top K L

/-- The `n`-th associated graded piece of the PBW filtration. -/
abbrev pbwGraded (n : ℕ) : Type u :=
  TauCeti.UniversalEnvelopingAlgebra.PBWGradedPiece K L n

/-- The **ordered PBW monomial** attached to a multi-exponent: the product of the powers
`ι (b i) ^ m i`, taken in increasing order of `i`.

⚠ Every statement below has to be about *this* element. A basis merely indexed by `κ →₀ ℕ` says
nothing: in `U(L) = K[X]` for the one-dimensional abelian `L`, the vectors `2 ^ m * X ^ m` also
form a basis indexed by `ℕ`, and a consumer cannot recover the intended normalization from the
type. -/
noncomputable def pbwMonomial {κ : Type u} [LinearOrder κ] (b : Basis κ K L) (m : κ →₀ ℕ) :
    UniversalEnvelopingAlgebra K L :=
  ((m.support.sort (· ≤ ·)).map fun i =>
    UniversalEnvelopingAlgebra.ι K (b i) ^ m i).prod

@[simp] theorem pbwMonomial_zero {κ : Type u} [LinearOrder κ] (b : Basis κ K L) :
    pbwMonomial K L b 0 = 1 := by
  simpa only [pbwMonomial, ← b.pbwBasis_eq_prod_pow] using b.pbwBasis_zero

theorem pbwMonomial_single {κ : Type u} [LinearOrder κ] (b : Basis κ K L) (i : κ) (n : ℕ) :
    pbwMonomial K L b (Finsupp.single i n) = UniversalEnvelopingAlgebra.ι K (b i) ^ n := by
  exact (b.pbwBasis_eq_prod_pow (Finsupp.single i n)).symm.trans (b.pbwBasis_single i n)

/-- A monomial of total degree `n` lies in the `n`-th filtration stage; this is what lets it have
a class in `grₙ U(L)`. -/
theorem pbwMonomial_mem_pbwFiltration {κ : Type u} [LinearOrder κ] (b : Basis κ K L)
    (m : κ →₀ ℕ) {n : ℕ} (hn : (m.sum fun _ k => k) = n) :
    pbwMonomial K L b m ∈ pbwFiltration K L n := by
  rw [pbwMonomial, ← b.pbwBasis_eq_prod_pow, b.pbwBasis_apply]
  have hw := TauCeti.UniversalEnvelopingAlgebra.pbwMonomial_mem_pbwFiltration K L b
    (m.toMultiset.sort (· ≤ ·))
  have hs : m.sum (fun _ => id) = m.sum (fun _ k => k) := by rfl
  rw [Multiset.length_sort, Finsupp.card_toMultiset, hs, hn] at hw
  exact hw

/-- The class of a degree-`n` ordered monomial in `grₙ U(L)`. -/
noncomputable def pbwGradedMonomial {κ : Type u} [LinearOrder κ] (b : Basis κ K L) {n : ℕ}
    (m : {m : κ →₀ ℕ // (m.sum fun _ k => k) = n}) : pbwGraded K L n :=
  Submodule.Quotient.mk
    ⟨pbwMonomial K L b m.1, pbwMonomial_mem_pbwFiltration K L b m.1 m.2⟩

/-- **Filtered-to-graded.** The symmetric algebra computes the associated graded of the PBW
filtration: for a linearly ordered basis of `L`, the classes of the degree-`n` ordered monomials
are a `K`-basis of `grₙ U(L)`.

This is stated as a `def` with the value equation `basisPbwGraded_apply` beside it, rather than as
a `Nonempty` existence statement: the graded vector-space dimensions are a strictly weaker fact
than the canonical multiplication and the symmetric-algebra comparison, so an existence statement
would not supply what weighted truncation, monic-relation reduction and functoriality consume. -/
noncomputable def basisPbwGraded :
    ∀ {κ : Type u} [LinearOrder κ] (b : Basis κ K L) (n : ℕ),
      Basis {m : κ →₀ ℕ // (m.sum fun _ k => k) = n} K (pbwGraded K L n) := sorry

theorem basisPbwGraded_apply {κ : Type u} [LinearOrder κ] (b : Basis κ K L) (n : ℕ)
    (m : {m : κ →₀ ℕ // (m.sum fun _ k => k) = n}) :
    basisPbwGraded K L b n m = pbwGradedMonomial K L b m := sorry

/-- **Poincaré-Birkhoff-Witt.** For a linearly ordered basis of `L`, the ordered monomials form a
`K`-basis of `U(L)`. -/
noncomputable def pbwBasis {κ : Type u} [LinearOrder κ] (b : Basis κ K L) :
    Basis (κ →₀ ℕ) K (UniversalEnvelopingAlgebra K L) := b.pbwBasis

/-- The value equation without which `pbwBasis` is only an abstract indexed basis. -/
theorem pbwBasis_apply {κ : Type u} [LinearOrder κ] (b : Basis κ K L) (m : κ →₀ ℕ) :
    pbwBasis K L b m = pbwMonomial K L b m := b.pbwBasis_eq_prod_pow m

/-- Acceptance test: for the one-dimensional abelian Lie algebra, `U(L)` is the polynomial algebra
on the image of the chosen generator, and the PBW monomials are its ordinary monomials -- not any
other scaling of them. -/
theorem exists_polynomialAlgEquiv_of_finrank_one [IsLieAbelian L]
    (b : Basis PUnit.{u + 1} K L) :
    ∃ e : Polynomial K ≃ₐ[K] UniversalEnvelopingAlgebra K L,
      e Polynomial.X = UniversalEnvelopingAlgebra.ι K (b PUnit.unit) ∧
        ∀ n : ℕ, e (Polynomial.X ^ n) =
          pbwMonomial K L b (Finsupp.single PUnit.unit n) := sorry

/-- **Injectivity** of the canonical Lie map into the enveloping algebra. Consumed by
[Ado-Iwasawa](../AdoIwasawa/README.md) over an arbitrary field. -/
theorem ι_injective : Function.Injective (UniversalEnvelopingAlgebra.ι K (L := L)) :=
  TauCeti.UniversalEnvelopingAlgebra.ι_injective K L

/-- `U(L)` is a **domain**, by transfer from the associated graded symmetric algebra. -/
theorem isDomain_universalEnvelopingAlgebra : IsDomain (UniversalEnvelopingAlgebra K L) := by
  infer_instance

/-- For finite-dimensional `L`, `U(L)` is left and right **Noetherian**, again by filtered-to-graded
transfer. -/
theorem isNoetherianRing_universalEnvelopingAlgebra [FiniteDimensional K L] :
    IsNoetherianRing (UniversalEnvelopingAlgebra K L) := inferInstance

theorem isNoetherianRing_universalEnvelopingAlgebra_op [FiniteDimensional K L] :
    IsNoetherianRing (UniversalEnvelopingAlgebra K L)ᵐᵒᵖ := inferInstance

/-- **Functoriality.** The enveloping-algebra map induced by a Lie map respects the PBW filtration.
The ordered-monomial-span statements for subalgebras, surjections and quotients, and direct sums are
derived from this together with `pbwBasis`. -/
theorem map_pbwFiltration_le {L' : Type u} [LieRing L'] [LieAlgebra K L'] (f : L →ₗ⁅K⁆ L') (n : ℕ) :
    (pbwFiltration K L n).map
        (UniversalEnvelopingAlgebra.lift K
          ((UniversalEnvelopingAlgebra.ι K).comp f)).toLinearMap ≤
      pbwFiltration K L' n := by
  simpa only [TauCeti.UniversalEnvelopingAlgebra.map] using
    TauCeti.UniversalEnvelopingAlgebra.map_pbwFiltration_le K f n

/-- **Central-subalgebra adapter to native PBW.Finite.** Package the central subalgebra as
commutative scalars S := R.comap(center.val), a subalgebra of the commutative center,
with the canonical S→R comparison preserving the original module action; reindex the finite basis and
convert these monic equations to native IsIntegral, then consume native bounded-spanning
and moduleFinite_of_isIntegral_of_span_eq_top. If every member of a finite ordered basis of `L`
satisfies a monic relation over a central subalgebra `R` of `U(L)`, then `U(L)` is a finite
`R`-module, spanned by the bounded ordered PBW monomials. This is exactly what the
positive-characteristic [Ado-Iwasawa](../AdoIwasawa/README.md) construction consumes from its
central `p`-polynomials. -/
theorem module_finite_of_central_monic_relations {κ : Type u} [Fintype κ] [LinearOrder κ]
    (b : Basis κ K L) (R : Subalgebra K (UniversalEnvelopingAlgebra K L))
    (_hR : R ≤ Subalgebra.center K (UniversalEnvelopingAlgebra K L))
    (_hmonic : ∀ i : κ, ∃ (d : ℕ) (c : Fin d → R), 0 < d ∧
      (UniversalEnvelopingAlgebra.ι K (b i)) ^ d +
          ∑ j : Fin d, (c j : UniversalEnvelopingAlgebra K L) *
            (UniversalEnvelopingAlgebra.ι K (b i)) ^ (j : ℕ) = 0) :
    Module.Finite R (UniversalEnvelopingAlgebra K L) := sorry

end PBW

/-! ### Concrete rank-one Cartan and Killing instances used by the worked HC example -/
section SlTwoCartan
variable (K : Type*) [Field K] [CharZero K] [IsAlgClosed K]

noncomputable def slTwoDiagonalCartan (K : Type*) [Field K] [CharZero K] : LieSubalgebra K (SpecialLinear.sl (Fin 2) K) := sorry

omit [IsAlgClosed K] in
theorem mem_slTwoDiagonalCartan_iff (x : SpecialLinear.sl (Fin 2) K) :
    x ∈ slTwoDiagonalCartan K ↔ ∃ a : K,
      x = a • SpecialLinear.singleSubSingle (0 : Fin 2) 1 (1 : K) := sorry

noncomputable instance slTwoDiagonalCartan_isCartan (K : Type*) [Field K] [CharZero K] :
    (slTwoDiagonalCartan K).IsCartanSubalgebra := sorry
noncomputable def slTwoPositiveBase :
    (LieAlgebra.IsKilling.rootSystem (slTwoDiagonalCartan K)).Base := sorry

theorem slTwoPositiveBase_positive_generator :
    ∃ i ∈ (slTwoPositiveBase K).support,
      SpecialLinear.single (0 : Fin 2) 1 zero_ne_one (1 : K) ∈
        rootSpace (slTwoDiagonalCartan K)
          ((LieAlgebra.IsKilling.rootSystem (slTwoDiagonalCartan K)).root i) := sorry
end SlTwoCartan

/-! ## Layers 1-6: the general theory

Fix a Killing-semisimple `L` over an algebraically closed field of characteristic zero, a Cartan
subalgebra `H`, and a base `base` (positive/simple system) of the Mathlib root system
`LieAlgebra.IsKilling.rootSystem H`. Roots, weights, root spaces, coroots, and the Weyl group are all
Mathlib's; the root and weight lattices and the Weyl-group action are the province of
`../RootSystems/README.md`. -/

section General

variable {K : Type*} [Field K] [charZeroK : CharZero K] [algClosedK : IsAlgClosed K]
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
theorem isTriangularizable_of_finiteDimensional {M : Type*} [AddCommGroup M] [Module K M]
    [LieRingModule L M] [LieModule K L M] [FiniteDimensional K M] :
    IsTriangularizable K H M := inferInstance

/-- **Diagonalizability of the Cartan action (honest weight spaces).** For a finite-dimensional module
over a Killing-semisimple `L`, every `x : H` acts by a **semisimple** endomorphism, so the generalized
weight spaces of `isTriangularizable_of_finiteDimensional` are genuine simultaneous eigenspaces and the
formal character counts honest weight multiplicities. This rests on the abstract Jordan decomposition
(each `x : H` is `ad`-semisimple in `L`, and semisimplicity transfers to every finite-dimensional
representation), so it is **independent of complete reducibility** (Layer 5), avoiding circularity. -/
theorem isSemisimple_toEnd_cartan {M : Type*} [AddCommGroup M] [Module K M]
    [LieRingModule L M] [LieModule K L M] [FiniteDimensional K M] (x : H) :
    (toEnd K H M x).IsSemisimple := TauCeti.isSemisimple_toEnd_cartan x

/-- **Integrality of weights (the `sl₂` reduction).** For every weight `χ` of a finite-dimensional
module `M` and every root `α`, the value `χ(α^∨)` is an integer. **Proof:** restrict `M` to the `sl₂`
triple of `α`, where `χ(α^∨)` is an `hₐ`-eigenvalue, and apply `sl2_hAction_eigenvalue_isInt`. This is
the load-bearing use of the engine. -/
theorem weight_apply_coroot_isInt {M : Type*} [AddCommGroup M] [Module K M] [LieRingModule L M]
    [LieModule K L M] [FiniteDimensional K M] (χ : Weight K H M) {α : Weight K H L}
    (hα : α.IsNonZero) : ∃ n : ℤ, χ (LieAlgebra.IsKilling.coroot α) = (n : K) :=
  TauCeti.exists_int_apply_coroot χ α

/-! ### Layer 3: highest weight vectors, Verma modules, and `L(λ)`

The root-system datum is always the `base`; the subalgebras it determines get their own names, so the
Borel is never also called `base`. `positiveNilradical base = n⁺ = ⨁_{α>0} Lα`, its opposite
`negativeNilradical base = n⁻`, and `borelSubalgebra base = H ⊕ n⁺`. -/

/-- **The positive nilradical** `n⁺ = ⨁_{α>0} Lα` determined by the positive system `base`. -/
noncomputable abbrev positiveNilradical (base : (LieAlgebra.IsKilling.rootSystem H).Base) : LieSubalgebra K L :=
  TauCeti.positiveNilradical H base

/-- **The negative nilradical** `n⁻ = ⨁_{α<0} Lα`. -/
noncomputable abbrev negativeNilradical (base : (LieAlgebra.IsKilling.rootSystem H).Base) : LieSubalgebra K L :=
  TauCeti.negativeNilradical H base

/-- **The Borel subalgebra** `𝔟 = H ⊕ n⁺`. Named separately from `base` so the Verma tensor product
`U(L) ⊗_{U(𝔟)} K_λ` never overloads the letter of the root-system base. -/
noncomputable abbrev borelSubalgebra (base : (LieAlgebra.IsKilling.rootSystem H).Base) : LieSubalgebra K L :=
  TauCeti.borelSubalgebra H base

/-- **A highest weight vector** of weight `λ` (relative to the positive system `base`): nonzero, an
`H`-eigenvector of weight `λ`, killed by every positive root space. For a single positive root this is
`IsSl2Triple.HasPrimitiveVectorWith`. -/
abbrev IsHighestWeightVector (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H)
    {M : Type*} [AddCommGroup M] [Module K M] [LieRingModule L M] [LieModule K L M] (v : M) :
    Prop := TauCeti.IsHighestWeightVector base lam v

/-- **The Verma module** `M(λ) = U(L) ⊗_{U(𝔟)} K_λ` for the Borel `𝔟 = borelSubalgebra base`, the
universal highest weight module. This is the native `TauCeti.VermaModule` carrier with its native `L`-module structure; its
native universal property and `universalEnvelopingEquivVermaModule` give its freeness over
`U(n⁻) = U(negativeNilradical base)`; its weight multiplicities (the Kostant partition function
`kostantPartition base` below) are computed by native `finrank_weightSpace_vermaModule`. -/
abbrev vermaModule (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    Type _ := TauCeti.VermaModule base lam

/-- The canonical highest weight vector of the Verma module `M(λ)` (the class of `1 ⊗ 1`), named so
the universal property below can be stated against it. -/
noncomputable def vermaHighestWeightVector (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) : vermaModule base lam := TauCeti.vermaGenerator base lam

theorem isHighestWeightVector_vermaHighestWeightVector
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    IsHighestWeightVector base lam (vermaHighestWeightVector base lam) :=
  TauCeti.isHighestWeightVector_vermaGenerator base lam

/-- Native exact-generator universal property, including the zero vector and zero homomorphism. -/
theorem vermaModule_universal (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) {M : Type*} [AddCommGroup M] [Module K M] [LieRingModule L M]
    [LieModule K L M] (v : M)
    (hcartan : ∀ x : H, ⁅(x : L), v⁆ = lam x • v)
    (hpos : ∀ x ∈ positiveNilradical base, ⁅x, v⁆ = 0) :
    ∃! φ : vermaModule base lam →ₗ⁅K,L⁆ M,
      φ (vermaHighestWeightVector base lam) = v :=
  TauCeti.existsUnique_lieModuleHom_apply_vermaGenerator base lam v hcartan hpos

/-- **The irreducible quotient** `L(λ)`: the unique irreducible quotient of `M(λ)`, obtained by
quotienting by the unique maximal submodule. -/
abbrev irreducibleQuotient (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    Type _ := TauCeti.irreducibleQuotient base lam

/-- `L(λ)` is irreducible. -/
theorem isIrreducible_irreducibleQuotient (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) :
    LieModule.IsIrreducible K L (irreducibleQuotient base lam) :=
  TauCeti.isIrreducible_irreducibleQuotient base lam

/-- `L(λ)` **is a highest weight module of weight `λ`** — without this pin, any family of pairwise
non-isomorphic irreducibles would discharge the `irreducibleQuotient` targets; this is the
anti-vacuity companion of `isIrreducible_irreducibleQuotient` and
`irreducibleQuotient_nonempty_equiv_iff`. -/
theorem exists_isHighestWeightVector_irreducibleQuotient
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    ∃ v : irreducibleQuotient base lam, IsHighestWeightVector base lam v :=
  ⟨TauCeti.irreducibleQuotientGenerator base lam,
    TauCeti.isHighestWeightVector_irreducibleQuotientGenerator base lam⟩

/-- **The classification of irreducible highest weight modules.** `L(λ) ≅ L(μ)` iff `λ = μ`. -/
theorem irreducibleQuotient_nonempty_equiv_iff (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam mu : Module.Dual K H) :
    Nonempty (irreducibleQuotient base lam ≃ₗ⁅K,L⁆ irreducibleQuotient base mu) ↔ lam = mu :=
  TauCeti.nonempty_lieModuleEquiv_iff_eq_of_isHighestWeightVector
    (TauCeti.isHighestWeightVector_irreducibleQuotientGenerator base lam)
    (TauCeti.isHighestWeightVector_irreducibleQuotientGenerator base mu)

/-! ### Layer 4: the classification of finite-dimensional irreducibles -/

/-- **Dominant integral weights.** `λ` is dominant integral when `⟨λ, αᵢ^∨⟩` is a natural number for
every simple root `αᵢ` (indexed by `base.support`). -/
abbrev IsDominantIntegral (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) :
    Prop := TauCeti.IsDominantIntegral base lam

/-- **Every finite-dimensional irreducible is an `L(λ)` with `λ` dominant integral.** It has a
highest weight vector, and restricting to each simple `sl₂` forces the highest weight to be dominant
integral (Layer 0). -/
theorem exists_isDominantIntegral_isHighestWeightVector_of_irreducible
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) {M : Type*} [AddCommGroup M]
    [Module K M] [LieRingModule L M] [LieModule K L M] [FiniteDimensional K M]
    [LieModule.IsIrreducible K L M] :
    ∃ (lam : Module.Dual K H) (v : M), IsHighestWeightVector base lam v ∧ IsDominantIntegral base lam :=
  TauCeti.exists_isHighestWeightVector_and_isDominantIntegral_of_irreducible base

/-- **`L(λ)` is finite-dimensional exactly when `λ` is dominant integral.** The hard direction
(dominant integral `⟹` finite-dimensional) is a real theorem, not a corollary: `fᵢ^{⟨λ,αᵢ^∨⟩+1}` kills
the highest weight vector, so each simple `fᵢ` acts locally nilpotently on `L(λ)`; local nilpotence
propagates from the simple directions to every root direction (making `L(λ)` the maximal integrable
quotient of `M(λ)`); the weight support is then Weyl-stable and bounded inside the convex hull of the
Weyl orbit of `λ`, hence finite; and each weight space is finite-dimensional by the PBW / Kostant
partition bound. See `README.md` Layer 4 for these named sub-milestones. -/
theorem finiteDimensional_irreducibleQuotient_iff (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) :
    FiniteDimensional K (irreducibleQuotient base lam) ↔ IsDominantIntegral base lam :=
  TauCeti.finiteDimensional_iff_isDominantIntegral_of_isHighestWeightVector
    (TauCeti.isHighestWeightVector_irreducibleQuotientGenerator base lam)

/-- **The classification theorem.** A finite-dimensional irreducible module has a unique dominant
integral highest weight; combined with `finiteDimensional_irreducibleQuotient_iff` and
`irreducibleQuotient_nonempty_equiv_iff`, `λ ↦ L(λ)` is a bijection from dominant integral weights to
isomorphism classes of finite-dimensional irreducibles. -/
theorem existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible
    (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    {M : Type*} [AddCommGroup M] [Module K M] [LieRingModule L M] [LieModule K L M]
    [FiniteDimensional K M] [LieModule.IsIrreducible K L M] :
    ∃! lam : Module.Dual K H, IsDominantIntegral base lam ∧ ∃ v : M, IsHighestWeightVector base lam v :=
  TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible base

/-! ### Layer 5: the Casimir element and Weyl's complete reducibility -/

/-- **`ρ`**, the half-sum of the positive roots (relative to `base`), a weight in `Module.Dual K H`.
Introduced here because the Casimir eigenvalue and the invariant form on weights below both depend on
it. -/
noncomputable abbrev weylVector (base : (LieAlgebra.IsKilling.rootSystem H).Base) : Module.Dual K H :=
  TauCeti.weylVector (LieAlgebra.IsKilling.rootSystem H) base

/-- **The `W`-invariant symmetric form `⟨·,·⟩` on weights**, transported from the Killing form on `H`
via `cartanEquivDual`. This is the form appearing in the Casimir eigenvalue, the Weyl formulas, and
Freudenthal's recursion; pinning it (and its normalization against coroots, next) is a prerequisite of
`casimirElement`, not an afterthought. -/
noncomputable abbrev invForm (lam mu : Module.Dual K H) : K := TauCeti.invForm lam mu

/-- **Normalization of the invariant form against coroots**: `⟨λ, α^∨⟩ ⟨α, α⟩ = 2 ⟨λ, α⟩`, i.e.
`α^∨` pairs as `2α / ⟨α, α⟩`. This is the compatibility of `invForm` with the root/coroot API of
`LieAlgebra.IsKilling.rootSystem` that makes the Casimir scalar `⟨λ+ρ, λ+ρ⟩ - ⟨ρ, ρ⟩` agree with the
coroot pairings. -/
theorem invForm_coroot (lam : Module.Dual K H) (i : H.root) :
    lam ((LieAlgebra.IsKilling.rootSystem H).coroot i)
        * invForm ((LieAlgebra.IsKilling.rootSystem H).root i)
            ((LieAlgebra.IsKilling.rootSystem H).root i)
      = 2 * invForm lam ((LieAlgebra.IsKilling.rootSystem H).root i) :=
  TauCeti.invForm_coroot lam i

/-- **The Casimir element** of `U(L)`, built from a basis of `L` and its Killing-dual basis; central,
and acting on `L(λ)` by the scalar `invForm (λ+ρ) (λ+ρ) - invForm ρ ρ` (with `ρ = weylVector base`),
well-defined by `invForm_coroot`. -/
noncomputable abbrev casimirElement : UniversalEnvelopingAlgebra K L := TauCeti.casimirElement K L

/-- The Casimir element is central in `U(L)`. -/
theorem casimirElement_mem_center :
    (casimirElement : UniversalEnvelopingAlgebra K L) ∈
      Subalgebra.center K (UniversalEnvelopingAlgebra K L) :=
  TauCeti.casimirElement_mem_center K L

/-- **The Casimir eigenvalue on a highest weight module:** on a
module generated by a highest weight vector of weight `λ`, `casimirElement` acts by the scalar
`invForm (λ+ρ) (λ+ρ) - invForm ρ ρ` (with `ρ = weylVector base`). The `U(L)`-action is through
`UniversalEnvelopingAlgebra.lift K (toEnd K L M)`. Cyclicity, not irreducibility, is the correct
hypothesis: the scalar statement holds for every highest weight module, which is what Layer 7's
central-character theory and the Layer 6 decomposition toolkit consume. -/
theorem casimir_smul_of_isHighestWeightVector (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    {M : Type*} [AddCommGroup M] [Module K M] [LieRingModule L M] [LieModule K L M]
    {lam : Module.Dual K H} {v : M} (hv : IsHighestWeightVector base lam v)
    (hgen : LieSubmodule.lieSpan K L {v} = ⊤) (m : M) :
    UniversalEnvelopingAlgebra.lift K (toEnd K L M) casimirElement m
      = (invForm (lam + weylVector base) (lam + weylVector base)
          - invForm (weylVector base) (weylVector base)) • m :=
  TauCeti.casimir_smul_of_isHighestWeightVector_of_lieSpan_eq_top hv hgen m

/-- **Weyl's complete reducibility theorem.** Every finite-dimensional module over a
Killing-semisimple Lie algebra in characteristic zero is a direct sum of irreducibles: every
submodule has a complement. Proved via the Casimir element; the `sl₂` case is its rank-one instance.
The native theorem has no algebraic-closure or split-Cartan hypothesis. -/
theorem weyl_complete_reducibility {M : Type*} [AddCommGroup M] [Module K M] [LieRingModule L M]
    [LieModule K L M] [FiniteDimensional K M] (N : LieSubmodule K L M) :
    ∃ N' : LieSubmodule K L M, IsCompl N N' := TauCeti.exists_isCompl_of_isKilling N

/-! ### Layer 6: the Weyl character, dimension, and Kostant formulas -/

/-- **The formal character** of a finite-dimensional module: `μ ↦ dim Mμ` (honest weight
multiplicities, by `isSemisimple_toEnd_cartan`), an element of the integral group algebra of the weight
lattice. Additive on short exact sequences, multiplicative on tensor products, and Weyl-invariant. -/
noncomputable abbrev formalCharacter {M : Type*} [AddCommGroup M] [Module K M] [LieRingModule L M]
    [LieModule K L M] [FiniteDimensional K M] : AddMonoidAlgebra ℤ (Module.Dual K H) :=
  TauCeti.formalCharacter K H M
-- The carrier is the group algebra of the whole dual, a faithful over-embedding of the README's
-- `ℤ[X]` (the weight lattice `X` group algebra): all characters land in the lattice part.

theorem formalCharacter_coeff {M : Type*} [AddCommGroup M] [Module K M]
    [LieRingModule L M] [LieModule K L M] [FiniteDimensional K M]
    (mu : Module.Dual K H) :
    (formalCharacter (H := H) (M := M)).coeff mu =
      (Module.finrank K (LieModule.weightSpace M mu) : ℤ) :=
  TauCeti.formalCharacter_coeff_eq_finrank_weightSpace mu

/-- The finite set of distinct weights in a Weyl orbit, without stabilizer multiplicities. -/
noncomputable def weylWeightOrbit (lam : Module.Dual K H) : Finset (Module.Dual K H) := by
  letI : Finite (LieAlgebra.IsKilling.rootSystem H).weylGroup :=
    RootPairing.finite_weylGroup (LieAlgebra.IsKilling.rootSystem H)
  exact (Set.finite_range (fun w : (LieAlgebra.IsKilling.rootSystem H).weylGroup => w • lam)).toFinset

theorem mem_weylWeightOrbit_iff (lam mu : Module.Dual K H) :
    mu ∈ weylWeightOrbit lam ↔ ∃ w : (LieAlgebra.IsKilling.rootSystem H).weylGroup,
      w • lam = mu := by
  simp [weylWeightOrbit]

noncomputable def weightOrbitSum (lam : Module.Dual K H) :
    AddMonoidAlgebra ℤ (Module.Dual K H) :=
  ∑ mu ∈ weylWeightOrbit lam, AddMonoidAlgebra.single mu (1 : ℤ)

/-- Dominant weights below λ by a nonnegative integral combination of simple roots. -/
def dominantWeightBelow (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam mu : Module.Dual K H) : Prop :=
  IsDominantIntegral base mu ∧ ∃ c : H.root →₀ ℕ,
    (∀ i ∈ c.support, i ∈ base.support) ∧
      lam - mu = c.sum (fun i n => (n : K) • (LieAlgebra.IsKilling.rootSystem H).root i)

theorem finite_dominantWeightBelow (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) (hlam : IsDominantIntegral base lam) :
    Set.Finite {mu | dominantWeightBelow base lam mu} := sorry

theorem formalCharacter_eq_orbitSum_add_lower
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H)
    (hlam : IsDominantIntegral base lam) [FiniteDimensional K (irreducibleQuotient base lam)] :
    ∃ c : Module.Dual K H →₀ ℕ,
      (∀ mu ∈ c.support, dominantWeightBelow base lam mu ∧ mu ≠ lam) ∧
      formalCharacter (M := irreducibleQuotient base lam) = weightOrbitSum lam +
        c.sum (fun mu n => (n : ℤ) • weightOrbitSum mu) := sorry

/-- Polynomial density of the dominant integral cone, not an analytic density assertion. -/
theorem polynomial_eq_zero_of_dominantIntegral
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) (p : SymmetricAlgebra K H)
    (hp : ∀ lam : Module.Dual K H, IsDominantIntegral base lam →
      SymmetricAlgebra.lift lam p = 0) : p = 0 := sorry

/-- **Multiplicativity of the formal character** (coverage: the representation-ring interface): on
tensor products, `ch (M ⊗ N) = ch M · ch N`. Together with additivity on short exact sequences this
makes `formalCharacter` the character homomorphism from the Grothendieck **ring** of
finite-dimensional `L`-modules into `ℤ[X]` — the multiplicative structure the family index promises
(the finite-group representation ring itself is pinned in `../CharacterTheory`); Racah-Speiser and
Littlewood-Richardson tensor decompositions are computations in its image. -/
theorem formalCharacter_tensor {M N : Type*} [AddCommGroup M] [Module K M] [LieRingModule L M]
    [LieModule K L M] [FiniteDimensional K M] [AddCommGroup N] [Module K N] [LieRingModule L N]
    [LieModule K L N] [FiniteDimensional K N] :
    formalCharacter (K := K) (L := L) (H := H) (M := TensorProduct K M N)
      = formalCharacter (M := M) * formalCharacter (M := N) :=
  TauCeti.formalCharacter_tensor (K := K) (L := H) (M := M) (N := N)

/-- The integer pairing `⟨λ, αᵢ^∨⟩ ∈ ℤ` of an integral weight against a coroot (well-defined by
`weight_apply_coroot_isInt`); indexed by the roots `H.root`. Total on `Module.Dual K H` for
signature convenience, but **meaningful only on the integral weight lattice** (junk elsewhere); its
uses below are at `λ + ρ` and `ρ` with `λ` dominant integral, and any new consumer must carry the
integrality hypothesis or take the actual integral-weight submodule constructed in Layers 1–2 of this roadmap as its domain. -/
noncomputable abbrev coweightPairing (lam : Module.Dual K H) (i : H.root) : ℤ := TauCeti.coweightPairing lam i

/-- **The Weyl denominator**, stated in the *integral* group algebra where it actually lives:
`Δ = ∏_{α>0} (1 - e^{-α})`. The symmetric form `∏_{α>0}(e^{α/2} - e^{-α/2})` differs from this by the
factor `e^{ρ}` and needs half-weights `α/2 ∉ X`; the `∏(1 - e^{-α})` form has all exponents in the
weight lattice `X` and is the one used here. -/
noncomputable abbrev weylDenominator (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    AddMonoidAlgebra ℤ (Module.Dual K H) :=
  TauCeti.weylDenominator (LieAlgebra.IsKilling.rootSystem H) base

/-- **The Weyl numerator** `∑_{w ∈ W} sgn(w) e^{w(λ+ρ) - ρ}` for a dominant integral weight `λ`, the
`ρ`-shifted numerator matching the `∏(1 - e^{-α})` denominator; every exponent lies in the weight
lattice. -/
noncomputable abbrev weylNumerator (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) : AddMonoidAlgebra ℤ (Module.Dual K H) := by
  letI : Finite (LieAlgebra.IsKilling.rootSystem H).weylGroup :=
    RootPairing.finite_weylGroup (LieAlgebra.IsKilling.rootSystem H)
  letI := Fintype.ofFinite (LieAlgebra.IsKilling.rootSystem H).weylGroup
  exact TauCeti.weylNumerator (LieAlgebra.IsKilling.rootSystem H) base lam

/-- **The Weyl character formula** in the integral group algebra:
`ch L(λ) · ∏_{α>0}(1 - e^{-α}) = ∑_{w ∈ W} sgn(w) e^{w(λ+ρ) - ρ}`. -/
theorem weyl_character_formula (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) (hlam : IsDominantIntegral base lam)
    [FiniteDimensional K (irreducibleQuotient base lam)] :
    (formalCharacter (M := irreducibleQuotient base lam)) * weylDenominator base
      = weylNumerator base lam := by
  letI : Finite (LieAlgebra.IsKilling.rootSystem H).weylGroup :=
    RootPairing.finite_weylGroup (LieAlgebra.IsKilling.rootSystem H)
  letI := Fintype.ofFinite (LieAlgebra.IsKilling.rootSystem H).weylGroup
  exact TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator
    (TauCeti.isHighestWeightVector_irreducibleQuotientGenerator base lam)
    (TauCeti.lieSpan_irreducibleQuotientGenerator_eq_top base lam)

/-- **The Weyl dimension formula**: `dim L(λ) = ∏_{α>0} ⟨λ+ρ, α^∨⟩ / ⟨ρ, α^∨⟩`, an identity in `ℚ`
(the product is a positive integer). The product is over the positive roots (`Base.IsPos`). -/
theorem weyl_dimension_formula (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) (hlam : IsDominantIntegral base lam) :
    (Module.finrank K (irreducibleQuotient base lam) : ℚ)
      = ∏ i ∈ Finset.univ.filter (fun i => base.IsPos i),
          (coweightPairing (lam + weylVector base) i : ℚ) / (coweightPairing (weylVector base) i : ℚ) :=
  by
    letI := TauCeti.finiteDimensional_irreducibleQuotient_of_isDominantIntegral hlam
    letI : Finite (LieAlgebra.IsKilling.rootSystem H).weylGroup :=
      RootPairing.finite_weylGroup (LieAlgebra.IsKilling.rootSystem H)
    letI := Fintype.ofFinite (LieAlgebra.IsKilling.rootSystem H).weylGroup
    simpa only [TauCeti.posRootsFinset_eq_filter] using
      TauCeti.finrank_eq_prod_coweightPairing_div
        (TauCeti.isHighestWeightVector_irreducibleQuotientGenerator base lam)
        (TauCeti.lieSpan_irreducibleQuotientGenerator_eq_top base lam)

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
          IsDominantIntegral base (-(RootPairing.Equiv.weightEquiv w mu))) ∧
        -(RootPairing.Equiv.weightEquiv w lam) = lam := sorry

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
noncomputable abbrev kostantPartition (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (nu : Module.Dual K H) : ℕ :=
  TauCeti.kostantPartition (LieAlgebra.IsKilling.rootSystem H) base nu

/-- The Weyl-alternating sum `∑_{w ∈ W} sgn(w) P(w(λ+ρ) - (μ+ρ))` that Kostant's formula equates with
a weight multiplicity, specialized from the native root-system function with the chosen base. -/
noncomputable abbrev kostantMultiplicity (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam mu : Module.Dual K H) : ℤ := by
  letI : Finite (LieAlgebra.IsKilling.rootSystem H).weylGroup :=
    RootPairing.finite_weylGroup (LieAlgebra.IsKilling.rootSystem H)
  letI := Fintype.ofFinite (LieAlgebra.IsKilling.rootSystem H).weylGroup
  exact (LieAlgebra.IsKilling.rootSystem H).kostantMultiplicity base lam mu

/-- **Kostant's multiplicity formula**: the multiplicity of the weight `μ` in `L(λ)` is
`∑_{w ∈ W} sgn(w) P(w(λ+ρ) - (μ+ρ))`, the weight-by-weight refinement of the character formula. -/
theorem kostant_multiplicity_formula (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) (hlam : IsDominantIntegral base lam)
    [FiniteDimensional K (irreducibleQuotient base lam)] (mu : Module.Dual K H) :
    (formalCharacter (M := irreducibleQuotient base lam)).coeff mu =
      kostantMultiplicity base lam mu := by
  letI : Finite (LieAlgebra.IsKilling.rootSystem H).weylGroup :=
    RootPairing.finite_weylGroup (LieAlgebra.IsKilling.rootSystem H)
  letI := Fintype.ofFinite (LieAlgebra.IsKilling.rootSystem H).weylGroup
  exact TauCeti.formalCharacter_coeff_eq_kostantMultiplicity
    (TauCeti.isHighestWeightVector_irreducibleQuotientGenerator base lam)
    (TauCeti.lieSpan_irreducibleQuotientGenerator_eq_top base lam) mu

/-! #### The decomposition toolkit

Complete reducibility (Layer 5) makes "decompose `M` into irreducibles" well-posed; the targets
below package it as a callable interface: multiplicities, isotypic components, the generated copy of
`L(λ)`, the single-weight isotypic criterion, and tensor multiplicities with the minuscule Pieri
rule. Mathlib already has the isotypic vocabulary for modules over a ring (`IsIsotypicOfType`,
`IsIsotypic`, `isotypicComponent` in `RingTheory/SimpleModule/Isotypic.lean`, consumed also by
`../SemisimpleAlgebras`); the enveloping-algebra dictionary below is the route from that machinery to
Lie modules, so the Lie-level notions here consume it rather than duplicate it. -/

/-- **The enveloping-algebra module structure** on a Lie module, through
`UniversalEnvelopingAlgebra.lift K (toEnd K L M)`. A def, not an instance (a global instance would
compete with restriction-of-scalars paths); the dictionary below and Mathlib's ring-level isotypic
machinery are consumed through it. -/
@[reducible]
noncomputable def ueaModule {M : Type*} [AddCommGroup M] [Module K M] [LieRingModule L M]
    [LieModule K L M] : Module (UniversalEnvelopingAlgebra K L) M :=
  TauCeti.UniversalEnvelopingAlgebra.asModule K L M

/-- **The enveloping-algebra dictionary**: for a `U(L)`-module structure on `M` compatible with the
`K`-structure and the Lie action (`ι x • m = ⁅x, m⁆`, e.g. `ueaModule`), the Lie submodules of `M`
are exactly the `U(L)`-submodules, as an order isomorphism. This is the route from
`RingTheory/SimpleModule/Isotypic.lean` (and the rest of the ring-level module theory) to Lie
modules. -/
noncomputable def lieSubmoduleOrderIsoUEA {M : Type*} [AddCommGroup M] [Module K M]
    [LieRingModule L M] [LieModule K L M] [Module (UniversalEnvelopingAlgebra K L) M]
    [IsScalarTower K (UniversalEnvelopingAlgebra K L) M]
    (hcompat : ∀ (x : L) (m : M), UniversalEnvelopingAlgebra.ι K x • m = ⁅x, m⁆) :
    LieSubmodule K L M ≃o Submodule (UniversalEnvelopingAlgebra K L) M :=
  TauCeti.UniversalEnvelopingAlgebra.lieSubmoduleOrderIso hcompat

/-- **The multiplicity of `L(λ)` in `M`**: the finrank of the space of Lie module homomorphisms
`L(λ) →ₗ⁅K,L⁆ M`. By `weyl_complete_reducibility` and Schur's lemma this counts the
`L(λ)`-summands in any decomposition of a finite-dimensional `M`, and it can be read off
`formalCharacter M` by Weyl-alternating inversion; the `Hom` definition is the one that makes
uniqueness automatic. Real body, no `sorry`. -/
noncomputable abbrev isotypicMultiplicity (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) (M : Type*) [AddCommGroup M] [Module K M] [LieRingModule L M]
    [LieModule K L M] : ℕ :=
  LieModule.isotypicMultiplicity K L M (irreducibleQuotient base lam)

/-- **The `λ`-isotypic component**: the sum of all Lie submodules isomorphic to `L(λ)`. The body
mirrors Mathlib's ring-level `isotypicComponent`; the agreement under the enveloping-algebra
dictionary is the companion target `lieSubmoduleOrderIsoUEA_isotypicComponent` below, so the two are
one notion, not parallel developments. Real body. -/
noncomputable abbrev isotypicComponent (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) (M : Type*) [AddCommGroup M] [Module K M] [LieRingModule L M]
    [LieModule K L M] : LieSubmodule K L M :=
  LieModule.isotypicComponent K L M (irreducibleQuotient base lam)

/-- **The dictionary agreement**: under `lieSubmoduleOrderIsoUEA`, the Lie-level
`isotypicComponent` is Mathlib's ring-level `isotypicComponent` of the `U(L)`-module `M` at the
simple module `L(λ)`. This pin is what makes `isotypicComponent` a consumer of
`RingTheory/SimpleModule/Isotypic.lean` rather than a duplicate of it. -/
theorem lieSubmoduleOrderIsoUEA_isotypicComponent
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H) {M : Type*}
    [AddCommGroup M] [Module K M] [LieRingModule L M] [LieModule K L M]
    [Module (UniversalEnvelopingAlgebra K L) M]
    [IsScalarTower K (UniversalEnvelopingAlgebra K L) M]
    (hM : ∀ (x : L) (m : M), UniversalEnvelopingAlgebra.ι K x • m = ⁅x, m⁆)
    [Module (UniversalEnvelopingAlgebra K L) (irreducibleQuotient base lam)]
    [IsScalarTower K (UniversalEnvelopingAlgebra K L) (irreducibleQuotient base lam)]
    (hQ : ∀ (x : L) (v : irreducibleQuotient base lam),
      UniversalEnvelopingAlgebra.ι K x • v = ⁅x, v⁆) :
    lieSubmoduleOrderIsoUEA hM (isotypicComponent base lam M)
      = _root_.isotypicComponent (UniversalEnvelopingAlgebra K L) M
          (irreducibleQuotient base lam) :=
  LieModule.lieSubmoduleOrderIso_isotypicComponent hM (irreducibleQuotient base lam) hQ

/-- The isotypic component has the expected dimension: multiplicity times `dim L(λ)`. This is the
uniqueness-of-multiplicities statement in finrank form. -/
theorem finrank_isotypicComponent (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) (hlam : IsDominantIntegral base lam) {M : Type*} [AddCommGroup M]
    [Module K M] [LieRingModule L M] [LieModule K L M] [FiniteDimensional K M] :
    Module.finrank K (isotypicComponent base lam M)
      = isotypicMultiplicity base lam M * Module.finrank K (irreducibleQuotient base lam) := by
  letI : FiniteDimensional K (irreducibleQuotient base lam) :=
    (finiteDimensional_irreducibleQuotient_iff base lam).mpr hlam
  exact LieModule.finrank_isotypicComponent (irreducibleQuotient base lam)

/-- **The packaged isotypic decomposition** `M ≃ₗ⁅K,L⁆ ⨁_λ L(λ)^{m_λ}`, indexed by the sigma type
of a dominant integral weight and a copy counter; only finitely many multiplicities are nonzero, so
the direct sum is essentially finite. -/
theorem isotypic_decomposition_equiv (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    {M : Type*} [AddCommGroup M] [Module K M] [LieRingModule L M] [LieModule K L M]
    [FiniteDimensional K M] :
    Nonempty (M ≃ₗ⁅K,L⁆
      ⨁ q : Σ lam : {l : Module.Dual K H // IsDominantIntegral base l},
              Fin (isotypicMultiplicity base lam.1 M),
        irreducibleQuotient base q.1.1) := sorry

/-- **A highest weight vector generates a copy of `L(λ)`.** In a finite-dimensional (hence, by
Layer 5, completely reducible) module, the Lie submodule generated by a highest weight vector of
weight `λ` is isomorphic to `L(λ)`. Finite-dimensionality is essential: in a general module a
highest weight vector generates a quotient of the Verma module `M(λ)`, not necessarily `L(λ)`.
In particular `dim L(λ) ≤ dim M` whenever a finite-dimensional `M` has a highest weight vector of
weight `λ`, the universality substitute the motivating applications hand-roll. -/
theorem lieSpan_equiv_irreducibleQuotient_of_isHighestWeightVector
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) {M : Type*} [AddCommGroup M] [Module K M]
    [LieRingModule L M] [LieModule K L M] [FiniteDimensional K M] {lam : Module.Dual K H} {v : M}
    (hv : IsHighestWeightVector base lam v) :
    Nonempty ((LieSubmodule.lieSpan K L {v} : LieSubmodule K L M)
      ≃ₗ⁅K,L⁆ irreducibleQuotient base lam) :=
  TauCeti.lieSpan_equiv_irreducibleQuotient_of_isHighestWeightVector hv

/-- **The single-weight isotypic criterion**: if every highest weight vector of a
finite-dimensional `M` has weight `λ`, then `M` is `L(λ)`-isotypic. This is the lemma a
Fock-space-style decomposition consumes verbatim: exhibit the highest weight vectors, check they
all have one weight, conclude `M ≅ L(λ)^{⊕ m}`. -/
theorem isotypicComponent_eq_top_of_forall_isHighestWeightVector
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) {M : Type*} [AddCommGroup M] [Module K M]
    [LieRingModule L M] [LieModule K L M] [FiniteDimensional K M] (lam : Module.Dual K H)
    (h : ∀ (mu : Module.Dual K H) (v : M), IsHighestWeightVector base mu v → mu = lam) :
    isotypicComponent base lam M = ⊤ :=
  TauCeti.isotypicComponent_eq_top_of_forall_isHighestWeightVector h

/-- **Tensor multiplicities** `c^ν_{λμ}`: the multiplicity of `L(ν)` in `L(λ) ⊗ L(μ)` (the Lie
module structure on the tensor product is Mathlib's `TensorProduct` Lie module instance). Real
body; the character identity `ch L(λ) · ch L(μ) = Σ_ν c^ν_{λμ} ch L(ν)` (via
`formalCharacter_tensor` and `isotypic_decomposition_equiv`) and the Racah-Speiser closed form are
the content to prove about it. -/
noncomputable def tensorMultiplicity (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam mu nu : Module.Dual K H) : ℕ :=
  isotypicMultiplicity base nu
    (TensorProduct K (irreducibleQuotient base lam) (irreducibleQuotient base mu))

/-- **Minuscule weights**: `μ` is dominant integral and every weight of `L(μ)` is Weyl-conjugate
to `μ`. Real body (weights read off `genWeightSpace`, honest eigenspaces by
`isSemisimple_toEnd_cartan`); the Weyl-conjugacy device is the one already used by
`exists_invariantForm_iff_neg_longest_smul_eq`. -/
def IsMinuscule (base : (LieAlgebra.IsKilling.rootSystem H).Base) (mu : Module.Dual K H) : Prop :=
  IsDominantIntegral base mu ∧
    ∀ nu : Module.Dual K H, genWeightSpace (irreducibleQuotient base mu) ⇑nu ≠ ⊥ →
      ∃ w ∈ (LieAlgebra.IsKilling.rootSystem H).weylGroup,
        RootPairing.Equiv.weightEquiv w mu = nu

/-- **The minuscule Pieri rule**: for dominant integral `λ` and minuscule `μ`,
`L(λ) ⊗ L(μ) ≅ ⨁_{τ weight of L(μ), λ+τ dominant} L(λ+τ)`, multiplicity one. Stated
multiplicity-by-multiplicity: for **dominant integral** `ν` the tensor multiplicity is `1` exactly
when `ν - λ` is a weight of `L(μ)`, else `0`. The dominance of `ν` is essential (for `sl₂` with
`λ = 0`, `μ = ω`, `ν = -ω`, the weight condition holds but `L(0) ⊗ L(ω) = L(ω)`). For `gl_n` this
specializes to the classical Pieri rule for the standard module and its dual (Layer 9). -/
theorem minuscule_pieri (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    {lam mu : Module.Dual K H} (hlam : IsDominantIntegral base lam) (hmu : IsMinuscule base mu)
    (nu : Module.Dual K H) (hnu : IsDominantIntegral base nu) :
    tensorMultiplicity base lam mu nu
      = if genWeightSpace (irreducibleQuotient base mu) ⇑(nu - lam) ≠ ⊥ then 1 else 0 := sorry

/-! ### Layer 7: the center of `U(L)`, Harish-Chandra, Freudenthal, and Serre's relations

The center `Z(U(L)) = Subalgebra.center K (UniversalEnvelopingAlgebra K L)` is the commutative algebra
in which `casimirElement` lives; its central characters `χ_λ`, the Harish-Chandra isomorphism
`Z(U(L)) ≅ S(H)^{W·}`, the linkage principle, Freudenthal's recursion, and the Serre presentation of
`L` from its Cartan matrix are the content. -/

/-- **The central character** `χ_λ : Z(U(L)) →ₐ[K] K`: the scalar by which the center acts on the
highest weight module of weight `λ`. It is defined through the action of the center on the
one-dimensional top weight line of the Verma module `M(λ)` (which the center preserves), so its
construction depends on the Layer 3 Verma/highest-weight machinery, not on Schur's lemma alone. -/
noncomputable abbrev centralCharacter (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) :
    Subalgebra.center K (UniversalEnvelopingAlgebra K L) →ₐ[K] K :=
  TauCeti.vermaCentralCharacter base lam

theorem centralCharacter_casimirElement (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) :
    centralCharacter base lam ⟨casimirElement, TauCeti.casimirElement_mem_center K L⟩ =
      TauCeti.casimirScalar base lam := TauCeti.vermaCentralCharacter_casimirElement base lam

/-- **The dot action** `w · λ = w(λ+ρ) - ρ` of the Weyl group on weights: the ordinary linear Weyl
action conjugated by translation by `ρ`. This is **affine**, not the linear Weyl action, so it is the
one under which the Harish-Chandra invariants and the orbit statement are taken. -/
noncomputable abbrev dotAction (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (w : (LieAlgebra.IsKilling.rootSystem H).weylGroup) (lam : Module.Dual K H) :
    Module.Dual K H := TauCeti.dotAction (LieAlgebra.IsKilling.rootSystem H) base w lam

/-- Polynomial evaluation at a weight, using the native symmetric-algebra universal property. -/
noncomputable def weightEvaluation (lam : Module.Dual K H) :
    SymmetricAlgebra K H →ₐ[K] K := SymmetricAlgebra.lift lam

/-- Translation characterized by `ev_λ(τ_μ p) = ev_(λ+μ)(p)`.
The implementation also supplies the generator formula, composition, inverse, and filtration API. -/
noncomputable def weightTranslation :
    (mu : Module.Dual K H) → SymmetricAlgebra K H ≃ₐ[K] SymmetricAlgebra K H := sorry

theorem weightTranslation_evaluation (mu lam : Module.Dual K H)
    (p : SymmetricAlgebra K H) :
    weightEvaluation lam (weightTranslation mu p) = weightEvaluation (lam + mu) p := sorry

/-- The raw center-restricted triangular PBW projection `(ε₋ ⊗ id ⊗ ε₊) ∘ PBW⁻¹`.
No weight translation occurs; its image is the dot-invariant subalgebra. -/
noncomputable abbrev hcProjection (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    Subalgebra.center K (UniversalEnvelopingAlgebra K L) →ₐ[K] SymmetricAlgebra K H :=
  TauCeti.hcProjection base

/-- Dot invariants: `ev_(w·λ)(p) = ev_λ(p)` for every Weyl element and weight. -/
noncomputable abbrev dotInvariants (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    Subalgebra K (SymmetricAlgebra K H) := TauCeti.dotInvariants base

theorem mem_dotInvariants_iff (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (p : SymmetricAlgebra K H) :
    p ∈ dotInvariants base ↔ ∀ w lam,
      weightEvaluation (dotAction base w lam) p = weightEvaluation lam p := Iff.rfl

/-- Ordinary Weyl invariants for the native root-system Weyl action. -/
noncomputable def linearInvariants :
    Subalgebra K (SymmetricAlgebra K H) where
  carrier := {p | ∀ (w : (LieAlgebra.IsKilling.rootSystem H).weylGroup)
    (lam : Module.Dual K H), weightEvaluation (w • lam) p = weightEvaluation lam p}
  mul_mem' hp hq := by
    intro w lam
    simp only [map_mul, hp w lam, hq w lam]
  add_mem' hp hq := by
    intro w lam
    simp only [map_add, hp w lam, hq w lam]
  algebraMap_mem' r := by intro w lam; simp
  zero_mem' := by intro w lam; simp
  one_mem' := by intro w lam; simp

theorem mem_linearInvariants_iff
    (p : SymmetricAlgebra K H) :
    p ∈ linearInvariants (K := K) (H := H) ↔ ∀ (w : (LieAlgebra.IsKilling.rootSystem H).weylGroup)
      (lam : Module.Dual K H), weightEvaluation (w • lam) p = weightEvaluation lam p := Iff.rfl

/-- The linear projection is the raw projection followed by translation by `−ρ`. -/
noncomputable def hcProjectionLinear (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    Subalgebra.center K (UniversalEnvelopingAlgebra K L) →ₐ[K] SymmetricAlgebra K H :=
  (weightTranslation (-weylVector base)).toAlgHom.comp (hcProjection base)

theorem hcProjectionLinear_evaluation (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (z : Subalgebra.center K (UniversalEnvelopingAlgebra K L)) (lam : Module.Dual K H) :
    weightEvaluation lam (hcProjectionLinear base z)
      = weightEvaluation (lam - weylVector base) (hcProjection base z) := by
  simpa [hcProjectionLinear, sub_eq_add_neg] using
    weightTranslation_evaluation (-weylVector base) lam (hcProjection base z)

/-- Degree at most n on the actual native homogeneous symmetric-algebra pieces. -/
def symmetricDegreeLE (n : ℕ) : Submodule K (SymmetricAlgebra K H) :=
  ⨆ k ≤ n, TauCeti.SymmetricAlgebra.homogeneousSubmodule K H k

theorem weightTranslation_mem_degreeLE (mu : Module.Dual K H) (n : ℕ)
    (p : SymmetricAlgebra K H) (hp : p ∈ symmetricDegreeLE n) :
    weightTranslation mu p ∈ symmetricDegreeLE n := sorry

theorem hcProjection_mem_degreeLE (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (n : ℕ) (z : Subalgebra.center K (UniversalEnvelopingAlgebra K L))
    (hz : (z : UniversalEnvelopingAlgebra K L) ∈
      TauCeti.UniversalEnvelopingAlgebra.pbwFiltration K L n) :
    hcProjection base z ∈ symmetricDegreeLE n := sorry

theorem hcProjectionLinear_mem_degreeLE (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (n : ℕ) (z : Subalgebra.center K (UniversalEnvelopingAlgebra K L))
    (hz : (z : UniversalEnvelopingAlgebra K L) ∈
      TauCeti.UniversalEnvelopingAlgebra.pbwFiltration K L n) :
    hcProjectionLinear base z ∈ symmetricDegreeLE n := sorry

section GenericInvariantSymbols

omit [IsAlgClosed K] [LieAlgebra.IsKilling K L] [FiniteDimensional K L]

/-- Lie invariants in native S(L), with the native adjoint-derivation action. -/
noncomputable def lieInvariantSymmetricAlgebra : Subalgebra K (SymmetricAlgebra K L) where
  carrier := {p | ∀ x : L, ⁅x, p⁆ = 0}
  mul_mem' hp hq := by
    intro x
    simp only [TauCeti.SymmetricAlgebra.lie_eq_adjointDerivation] at hp hq ⊢
    rw [Derivation.leibniz, hp x, hq x]
    simp
  add_mem' hp hq := by intro x; rw [lie_add, hp x, hq x]; simp
  algebraMap_mem' r := by
    intro x
    simp [TauCeti.SymmetricAlgebra.lie_eq_adjointDerivation]
  zero_mem' := by intro x; simp
  one_mem' := by
    intro x
    simp [TauCeti.SymmetricAlgebra.lie_eq_adjointDerivation]

theorem lieInvariantSymmetricAlgebra_toSubmodule :
    lieInvariantSymmetricAlgebra.toSubmodule =
      (LieModule.maxTrivSubmodule K L (SymmetricAlgebra K L)).toSubmodule := by
  rfl

/-- The actual center filtration is the comap of the native PBW filtration. -/
def centerPBWFiltration (n : ℕ) :
    Submodule K (Subalgebra.center K (UniversalEnvelopingAlgebra K L)) :=
  (TauCeti.UniversalEnvelopingAlgebra.pbwFiltration K L n).comap
    (Subalgebra.center K (UniversalEnvelopingAlgebra K L)).val.toLinearMap

def centerPBWFiltrationPrevious : ℕ →
    Submodule K (Subalgebra.center K (UniversalEnvelopingAlgebra K L))
  | 0 => ⊥
  | n + 1 => centerPBWFiltration (K := K) (L := L) n

abbrev centerPBWGradedPiece (n : ℕ) :=
  centerPBWFiltration (K := K) (L := L) n ⧸
    Submodule.comap (centerPBWFiltration (K := K) (L := L) n).subtype (centerPBWFiltrationPrevious (K := K) (L := L) n)

noncomputable def homogeneousLieInvariant (n : ℕ) : Submodule K (SymmetricAlgebra K L) :=
  lieInvariantSymmetricAlgebra.toSubmodule ⊓ TauCeti.SymmetricAlgebra.homogeneousSubmodule K L n

noncomputable def centerPBWGradedToPBWGraded (n : ℕ) :
    centerPBWGradedPiece (K := K) (L := L) n →ₗ[K]
      TauCeti.UniversalEnvelopingAlgebra.PBWGradedPiece K L n := sorry

theorem centerPBWGradedToPBWGraded_mk (n : ℕ)
    (z : Subalgebra.center K (UniversalEnvelopingAlgebra K L)) (hz : z ∈ centerPBWFiltration (K := K) (L := L) n) :
    centerPBWGradedToPBWGraded (K := K) (L := L) n (Submodule.Quotient.mk ⟨z, hz⟩) =
      Submodule.Quotient.mk (⟨(z : UniversalEnvelopingAlgebra K L), hz⟩ :
        TauCeti.UniversalEnvelopingAlgebra.pbwFiltration K L n) := sorry

/-- Degreewise center symbol equivalence, with its actual native PBW-symbol equation. -/
noncomputable def centerPBWGradedInvariantIso
    {K : Type*} [Field K] [CharZero K] {L : Type u} [LieRing L] [LieAlgebra K L] (n : ℕ) :
    centerPBWGradedPiece (K := K) (L := L) n ≃ₗ[K] homogeneousLieInvariant (K := K) (L := L) n := sorry

theorem centerPBWGradedInvariantIso_symbol (n : ℕ)
    (z : centerPBWGradedPiece (K := K) (L := L) n) :
    centerPBWGradedToPBWGraded (K := K) (L := L) n z =
      TauCeti.UniversalEnvelopingAlgebra.pbwHomogeneousComponentMap K L n
        ⟨(centerPBWGradedInvariantIso (K := K) (L := L) n z).val, (centerPBWGradedInvariantIso (K := K) (L := L) n z).property.2⟩ := sorry

noncomputable def centerPBWGradedMul (i j : ℕ) :
    centerPBWGradedPiece (K := K) (L := L) i →ₗ[K]
      centerPBWGradedPiece (K := K) (L := L) j →ₗ[K] centerPBWGradedPiece (K := K) (L := L) (i+j) := sorry

theorem centerPBWGradedMul_mk (i j : ℕ)
    (x y : Subalgebra.center K (UniversalEnvelopingAlgebra K L))
    (hx : x ∈ centerPBWFiltration (K := K) (L := L) i) (hy : y ∈ centerPBWFiltration (K := K) (L := L) j) :
    ∃ hxy : x*y ∈ centerPBWFiltration (K := K) (L := L) (i+j),
      centerPBWGradedMul i j (Submodule.Quotient.mk ⟨x,hx⟩) (Submodule.Quotient.mk ⟨y,hy⟩) =
        Submodule.Quotient.mk ⟨x*y,hxy⟩ := sorry

theorem centerPBWGradedInvariantIso_mul (i j : ℕ)
    (x : centerPBWGradedPiece (K := K) (L := L) i)
    (y : centerPBWGradedPiece (K := K) (L := L) j) :
    (centerPBWGradedInvariantIso (K := K) (L := L) (i+j) (centerPBWGradedMul i j x y) : SymmetricAlgebra K L) =
      (centerPBWGradedInvariantIso (K := K) (L := L) i x : SymmetricAlgebra K L) *
        (centerPBWGradedInvariantIso (K := K) (L := L) j y : SymmetricAlgebra K L) := sorry

end GenericInvariantSymbols

/-- Native finite exp(ad x), with the rational scalar restriction supplied canonically. -/
noncomputable def nilpotentInnerLieAutomorphism (x : L)
    (hx : IsNilpotent (LieAlgebra.ad K L x)) : L ≃ₗ⁅K⁆ L := by
  letI : LieAlgebra ℚ L := TauCeti.ratLieAlgebra K L
  exact TauCeti.expAd x hx

theorem nilpotentInnerLieAutomorphism_symm (x : L)
    (hx : IsNilpotent (LieAlgebra.ad K L x)) :
    (nilpotentInnerLieAutomorphism x hx).symm =
      nilpotentInnerLieAutomorphism (-x) (by simpa only [map_neg] using hx.neg) := sorry

/-- Inner automorphisms as a subgroup of the native module-automorphism group. -/
noncomputable def intLieAlgebra : Subgroup (LinearMap.GeneralLinearGroup K L) :=
  Subgroup.closure {g | ∃ (x : L) (hx : IsNilpotent (LieAlgebra.ad K L x)),
    g = LinearMap.GeneralLinearGroup.ofLinearEquiv
      (nilpotentInnerLieAutomorphism x hx).toLinearEquiv}

theorem intLieAlgebra_preserves_lie (g : intLieAlgebra (K := K) (L := L)) (x y : L) :
    g.val.toLinearEquiv ⁅x, y⁆ = ⁅g.val.toLinearEquiv x, g.val.toLinearEquiv y⁆ := sorry

noncomputable def intLieAlgebraLieEquiv (g : intLieAlgebra (K := K) (L := L)) :
    L ≃ₗ⁅K⁆ L where
  toFun := g.val.toLinearEquiv
  map_add' := g.val.toLinearEquiv.map_add
  map_smul' := g.val.toLinearEquiv.map_smul
  map_lie' := fun {x y} => intLieAlgebra_preserves_lie g x y
  invFun := g.val.toLinearEquiv.symm
  left_inv := g.val.toLinearEquiv.symm_apply_apply
  right_inv := g.val.toLinearEquiv.apply_symm_apply

section GenericPolynomialDominance

omit [IsAlgClosed K]

/-- Algebraic Jacobian differential of a polynomial tuple, on ordinary coordinate vector spaces. -/
noncomputable def polynomialDifferential {m n : ℕ}
    (F : Fin n → MvPolynomial (Fin m) K) (a : Fin m → K) :
    (Fin m → K) →ₗ[K] (Fin n → K) :=
  Matrix.toLin' (fun i j => MvPolynomial.eval a (MvPolynomial.pderiv j (F i)))

/-- Surjective differential at one point makes polynomial pullback injective in characteristic zero.
Induct on the order of derivatives of p at F(a); lower derivatives remove the higher chain-rule
terms, and Taylor coefficients determine p. No image-open or constructibility theorem is used. -/
theorem polynomial_eq_zero_of_surjective_polynomialDifferential {m n : ℕ}
    (F : Fin n → MvPolynomial (Fin m) K) (a : Fin m → K)
    (hsurj : Function.Surjective (polynomialDifferential F a))
    (p : MvPolynomial (Fin n) K)
    (hp : ∀ x : Fin m → K, MvPolynomial.eval (fun i => MvPolynomial.eval x (F i)) p = 0) :
    p = 0 := sorry

/-- Square polynomial dominance gives a principal open in the image over an algebraically closed
field. After injectivity and equality of transcendence degrees, localize a nonzero target
polynomial to make source coordinates integral; use finite integral lying-over and the weak
Nullstellensatz. This is a separate Cartan-conjugacy precursor, not used for Chevalley injectivity. -/
theorem polynomialMap_image_contains_principalOpen_of_jacobian_surjective
    [IsAlgClosed K] {n : ℕ}
    (F : Fin n → MvPolynomial (Fin n) K) (a : Fin n → K)
    (hsurj : Function.Surjective (polynomialDifferential F a)) :
    ∃ q : MvPolynomial (Fin n) K, q ≠ 0 ∧ ∀ y : Fin n → K,
      MvPolynomial.eval y q ≠ 0 → ∃ x : Fin n → K,
        (fun i => MvPolynomial.eval x (F i)) = y := sorry

end GenericPolynomialDominance

/-- Coordinate evaluation for polynomial functions, using Mathlib's symmetric-algebra equivalence. -/
theorem symmetricPolynomialCoordinates_evaluation
    {K : Type*} [Field K] {V : Type u} [AddCommGroup V] [Module K V]
    {n : ℕ} (b : Basis (Fin n) K V) (x : V)
    (p : SymmetricAlgebra K (Module.Dual K V)) :
    SymmetricAlgebra.lift (Module.Dual.eval K V x) p =
      MvPolynomial.eval (b.equivFun x)
        (SymmetricAlgebra.equivMvPolynomial b.dualBasis p) := by
  have h : SymmetricAlgebra.lift (Module.Dual.eval K V x) =
      (MvPolynomial.aeval (b.equivFun x)).comp
        (SymmetricAlgebra.equivMvPolynomial b.dualBasis).toAlgHom := by
    apply SymmetricAlgebra.algHom_ext
    apply b.dualBasis.ext
    intro i
    simp
  exact DFunLike.congr_fun h p

/-- Polarization over a characteristic-zero field: powers of a polynomially dense set span
an entire homogeneous symmetric power. Finite-dimensionality supplies perfect degreewise duality. -/
theorem span_pow_eq_homogeneous_of_polynomial_vanishing
    {K : Type*} [Field K] [CharZero K] {V : Type u} [AddCommGroup V] [Module K V]
    [FiniteDimensional K V] (S : Set V)
    (hS : ∀ p : SymmetricAlgebra K (Module.Dual K V),
      (∀ v ∈ S, SymmetricAlgebra.lift (Module.Dual.eval K V v) p = 0) → p = 0) (n : ℕ) :
    Submodule.span K {p : SymmetricAlgebra K V | ∃ v ∈ S, p = SymmetricAlgebra.ι K V v ^ n} =
      TauCeti.SymmetricAlgebra.homogeneousSubmodule K V n := sorry

/-- Root-exponential polynomial coordinates: one scalar per root space and coordinates on H.
The image lies in Int(L)·H; at (0,h) with all α(h) nonzero the differential is onto, by the
Cartan/root-space direct sum. The finite exponentials are the native expAd truncations. -/
theorem exists_rootExponentialPolynomialParametrization {n : ℕ}
    (b : Basis (Fin n) K L) :
    ∃ F : Fin n → MvPolynomial (Fin n) K,
      (∀ a : Fin n → K, ∃ (g : intLieAlgebra (K := K) (L := L)) (h : H),
        b.equivFun.symm (fun i => MvPolynomial.eval a (F i)) = g.val.toLinearEquiv (h : L)) ∧
      ∃ a : Fin n → K, Function.Surjective (polynomialDifferential F a) := sorry

/-- The native root-triple Weyl automorphism restricts to y ↦ y−α(y)h on the Cartan. -/
theorem weylAut_cartan_apply {h : H} {e f : L}
    (t : IsSl2Triple (h : L) e f) (he : IsNilpotent (LieAlgebra.ad K L e))
    (hf : IsNilpotent (LieAlgebra.ad K L f)) (alpha : Module.Dual K H)
    (hE : ∀ y : H, ⁅(y : L), e⁆ = alpha y • e)
    (hF : ∀ y : H, ⁅(y : L), f⁆ = -(alpha y • f)) (y : H) :
    letI : LieAlgebra ℚ L := TauCeti.ratLieAlgebra K L
    TauCeti.weylAut t he hf (y : L) = ((y - alpha y • h : H) : L) := by
  letI : LieAlgebra ℚ L := TauCeti.ratLieAlgebra K L
  exact TauCeti.weylAut_apply_of_lie_eq_smul he hf t (hE y) (hF y)

theorem cartanSubalgebra_intLieAlgebra_conjugate (H1 H2 : LieSubalgebra K L)
    [H1.IsCartanSubalgebra] [H2.IsCartanSubalgebra] :
    ∃ g : intLieAlgebra (K := K) (L := L), H1.map (intLieAlgebraLieEquiv g).toLieHom = H2 := sorry

theorem intLieAlgebra_fixes_invariant (g : intLieAlgebra (K := K) (L := L))
    (p : lieInvariantSymmetricAlgebra (K := K) (L := L)) :
    SymmetricAlgebra.map K g.val.toLinearEquiv.toLinearMap (p : SymmetricAlgebra K L)
      = (p : SymmetricAlgebra K L) := sorry

/-- Polynomial-form statement of density of the inner-Cartan orbit in L. -/
theorem polynomial_eq_zero_of_intCartan
    (p : SymmetricAlgebra K (Module.Dual K L))
    (hp : ∀ (g : intLieAlgebra (K := K) (L := L)) (h : H),
      SymmetricAlgebra.lift (Module.Dual.eval K L (g.val.toLinearEquiv (h : L))) p = 0) :
    p = 0 := sorry

/-- Nondegenerate Killing identification; its normalization is pinned on every pair. -/
noncomputable def killingDuality : L ≃ₗ[K] Module.Dual K L :=
  (killingForm K L).toDual (LieAlgebra.IsKilling.killingForm_nondegenerate K L)

theorem killingDuality_apply (x y : L) :
    killingDuality x y = killingForm K L x y := rfl

noncomputable def killingSymmetricEquiv :
    SymmetricAlgebra K L ≃ₐ[K] SymmetricAlgebra K (Module.Dual K L) :=
  SymmetricAlgebra.mapEquiv K killingDuality

theorem killingSymmetricEquiv_coe :
    killingSymmetricEquiv.toAlgHom = SymmetricAlgebra.map K (killingDuality (K := K) (L := L)).toLinearMap :=
  SymmetricAlgebra.mapEquiv_toAlgHom K killingDuality

/-- Symmetric-algebra restriction along the Killing-orthogonal projection L→H. -/
noncomputable def lieCartanRestriction : SymmetricAlgebra K L →ₐ[K] SymmetricAlgebra K H :=
  SymmetricAlgebra.map K
    ((LieAlgebra.IsKilling.cartanEquivDual H).symm.toLinearMap.comp
      (H.subtype.dualMap.comp killingDuality.toLinearMap))

theorem lieCartanRestriction_ι_cartan (h : H) :
    lieCartanRestriction (SymmetricAlgebra.ι K L (h : L)) = SymmetricAlgebra.ι K H h := sorry

theorem lieCartanRestriction_ι_root (chi : H → K) (hchi : chi ≠ 0)
    (x : L) (hx : x ∈ rootSpace H chi) :
    lieCartanRestriction (H := H) (SymmetricAlgebra.ι K L x) = 0 := sorry

theorem lieCartanRestriction_mem_homogeneous (n : ℕ) (p : SymmetricAlgebra K L)
    (hp : p ∈ TauCeti.SymmetricAlgebra.homogeneousSubmodule K L n) :
    lieCartanRestriction p ∈ TauCeti.SymmetricAlgebra.homogeneousSubmodule K H n := sorry

section GenericCoadjoint

omit [IsAlgClosed K] [LieAlgebra.IsKilling K L] [FiniteDimensional K L]

/-- Canonical coadjoint representation: negative transpose of ad, pinned on every dual vector. -/
noncomputable def coadjointRepresentation : L →ₗ⁅K⁆ Module.End K (Module.Dual K L) :=
  LieModule.toEnd K L (Module.Dual K L)

theorem coadjointRepresentation_apply (x : L) (phi : Module.Dual K L) :
    coadjointRepresentation x phi = -phi.comp (LieAlgebra.ad K L x) := by
  ext y
  rfl

/-- Reuse the native extension of an endomorphism to a symmetric-algebra derivation. -/
noncomputable def coadjointDerivation :
    L →ₗ⁅K⁆ Derivation K (SymmetricAlgebra K (Module.Dual K L))
      (SymmetricAlgebra K (Module.Dual K L)) :=
  (SymmetricAlgebra.derivationOfEnd K (Module.Dual K L)).comp coadjointRepresentation

theorem coadjointDerivation_ι (x : L) (phi : Module.Dual K L) :
    coadjointDerivation x (SymmetricAlgebra.ι K (Module.Dual K L) phi) =
      SymmetricAlgebra.ι K (Module.Dual K L) (-phi.comp (LieAlgebra.ad K L x)) := by
  simp only [coadjointDerivation, LieHom.comp_apply, SymmetricAlgebra.derivationOfEnd_ι,
    coadjointRepresentation_apply]

end GenericCoadjoint

theorem killingSymmetricEquiv_lie (x : L) (p : SymmetricAlgebra K L) :
    killingSymmetricEquiv ⁅x, p⁆ = coadjointDerivation x (killingSymmetricEquiv p) := sorry

theorem killingSymmetricEquiv_intLieAlgebra (g : intLieAlgebra (K := K) (L := L))
    (p : SymmetricAlgebra K L) :
    killingSymmetricEquiv (SymmetricAlgebra.map K g.val.toLinearEquiv.toLinearMap p) =
      SymmetricAlgebra.map K g.val.toLinearEquiv.symm.toLinearMap.dualMap
        (killingSymmetricEquiv p) := sorry

theorem polynomial_evaluation_intLieAlgebra (g : intLieAlgebra (K := K) (L := L))
    (y : L) (q : SymmetricAlgebra K (Module.Dual K L)) :
    SymmetricAlgebra.lift (Module.Dual.eval K L (g.val.toLinearEquiv y)) q =
      SymmetricAlgebra.lift (Module.Dual.eval K L y)
        (SymmetricAlgebra.map K g.val.toLinearEquiv.toLinearMap.dualMap q) := sorry

theorem lieInvariantSymmetricAlgebra_homogeneous_component
    (p : lieInvariantSymmetricAlgebra (K := K) (L := L)) (n : ℕ) :
    (DirectSum.decompose (TauCeti.SymmetricAlgebra.homogeneousSubmodule K L)
      (p : SymmetricAlgebra K L) n : SymmetricAlgebra K L) ∈
        lieInvariantSymmetricAlgebra (K := K) (L := L) := sorry

theorem cartanEquivDual_weylGroup
    (w : (LieAlgebra.IsKilling.rootSystem H).weylGroup) (h : H) :
    LieAlgebra.IsKilling.cartanEquivDual H ((RootPairing.Equiv.coweightEquiv w.val).symm h) =
      w • LieAlgebra.IsKilling.cartanEquivDual H h := sorry

theorem lieCartanRestriction_ι_evaluation (lam : Module.Dual K H) (x : L) :
    weightEvaluation lam (lieCartanRestriction (SymmetricAlgebra.ι K L x)) =
      TauCeti.killingExtend lam x := sorry

/-- Restriction of polynomial functions commutes with Killing transport and the native Cartan duality. -/
theorem killingSymmetricEquiv_cartan_restriction (p : SymmetricAlgebra K L) :
    (SymmetricAlgebra.map K H.subtype.dualMap) (killingSymmetricEquiv p) =
      (SymmetricAlgebra.map K (LieAlgebra.IsKilling.cartanEquivDual H).toLinearMap)
        (lieCartanRestriction p) := sorry

noncomputable def tracePowerPolynomial :
    ∀ (M : Type*) [AddCommGroup M] [Module K M] [LieRingModule L M]
      [LieModule K L M] [FiniteDimensional K M] (n : ℕ),
      SymmetricAlgebra K (Module.Dual K L) := sorry

theorem tracePowerPolynomial_evaluation {M : Type*} [AddCommGroup M] [Module K M]
    [LieRingModule L M] [LieModule K L M] [FiniteDimensional K M] (n : ℕ) (x : L) :
    SymmetricAlgebra.lift (Module.Dual.eval K L x) (tracePowerPolynomial (M := M) n) =
      LinearMap.trace K M ((toEnd K L M x) ^ n) := sorry

theorem tracePowerPolynomial_invariant {M : Type*} [AddCommGroup M] [Module K M]
    [LieRingModule L M] [LieModule K L M] [FiniteDimensional K M] (n : ℕ) :
    killingSymmetricEquiv.symm (tracePowerPolynomial (M := M) n) ∈
      lieInvariantSymmetricAlgebra (K := K) (L := L) := sorry

theorem tracePowerPolynomial_cartan {M : Type*} [AddCommGroup M] [Module K M]
    [LieRingModule L M] [LieModule K L M] [FiniteDimensional K M] (n : ℕ) (h : H) :
    SymmetricAlgebra.lift (Module.Dual.eval K L (h : L)) (tracePowerPolynomial (M := M) n) =
      (formalCharacter (K := K) (H := H) (M := M)).coeff.sum (fun mu a => (a : K) * (mu h) ^ n) := sorry

/-- Restriction of the degree-n trace polynomial of the actual finite highest-weight quotient. -/
noncomputable def highestWeightTracePowerRestriction
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H)
    (hlam : IsDominantIntegral base lam) (n : ℕ) : SymmetricAlgebra K H := by
  letI : FiniteDimensional K (irreducibleQuotient base lam) :=
    (finiteDimensional_irreducibleQuotient_iff base lam).mpr hlam
  exact lieCartanRestriction
    (killingSymmetricEquiv.symm (tracePowerPolynomial (M := irreducibleQuotient base lam) n))

/-- Highest-weight trace restrictions span each homogeneous ordinary Weyl-invariant piece. -/
theorem span_tracePowerRestriction_eq_linearInvariants_homogeneous
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) (n : ℕ) :
    Submodule.span K {p : SymmetricAlgebra K H | ∃ (lam : Module.Dual K H)
      (hlam : IsDominantIntegral base lam), p = highestWeightTracePowerRestriction base lam hlam n} =
      (linearInvariants (K := K) (H := H)).toSubmodule ⊓
        TauCeti.SymmetricAlgebra.homogeneousSubmodule K H n := sorry

/-- Ordinary invariants are graded; degree induction takes place here rather than in dot invariants. -/
theorem linearInvariants_homogeneous_component (p : linearInvariants (K := K) (H := H)) (n : ℕ) :
    (DirectSum.decompose (TauCeti.SymmetricAlgebra.homogeneousSubmodule K H)
      (p : SymmetricAlgebra K H) n : SymmetricAlgebra K H) ∈
      linearInvariants (K := K) (H := H) := sorry

/-- Lie-algebra Chevalley restriction, constructed from highest-weight traces
and root-exponential polynomial dominance before HC bijectivity. -/
noncomputable def lieChevalleyRestrictionIso
    {K : Type*} [Field K] [CharZero K] [IsAlgClosed K]
    {L : Type u} [LieRing L] [LieAlgebra K L] [LieAlgebra.IsKilling K L]
    [FiniteDimensional K L] {H : LieSubalgebra K L} [H.IsCartanSubalgebra]
    [IsTriangularizable K H L] :
    lieInvariantSymmetricAlgebra (K := K) (L := L) ≃ₐ[K] linearInvariants (K := K) (H := H) := sorry

theorem lieChevalleyRestrictionIso_coe
    (p : lieInvariantSymmetricAlgebra (K := K) (L := L)) :
    (lieChevalleyRestrictionIso (H := H) p : SymmetricAlgebra K H)
      = lieCartanRestriction (p : SymmetricAlgebra K L) := sorry

theorem lieChevalleyRestrictionIso_mem_homogeneous_iff
    (n : ℕ)
    (p : lieInvariantSymmetricAlgebra (K := K) (L := L)) :
    (lieChevalleyRestrictionIso (H := H) p : SymmetricAlgebra K H) ∈
        TauCeti.SymmetricAlgebra.homogeneousSubmodule K H n ↔
      (p : SymmetricAlgebra K L) ∈ TauCeti.SymmetricAlgebra.homogeneousSubmodule K L n := sorry

section GenericSymmetrization

omit [IsAlgClosed K] [LieAlgebra.IsKilling K L] [FiniteDimensional K L]

/-- Equivariant PBW symmetrization is linear, not multiplicative. -/
noncomputable def pbwSymmetrization
    {K : Type*} [Field K] [CharZero K] {L : Type u} [LieRing L] [LieAlgebra K L] :
    SymmetricAlgebra K L ≃ₗ[K] UniversalEnvelopingAlgebra K L := sorry

theorem pbwSymmetrization_product (l : List L) :
    pbwSymmetrization ((l.map (SymmetricAlgebra.ι K L)).prod) =
      ((l.length.factorial : K)⁻¹) •
        ∑ sigma : Equiv.Perm (Fin l.length),
          (List.ofFn (fun i => UniversalEnvelopingAlgebra.ι K (l.get (sigma i)))).prod := sorry

theorem pbwSymmetrization_lie (x : L) (p : SymmetricAlgebra K L) :
    pbwSymmetrization ⁅x, p⁆ =
      UniversalEnvelopingAlgebra.ι K x * pbwSymmetrization p
        - pbwSymmetrization p * UniversalEnvelopingAlgebra.ι K x := sorry

theorem pbwSymmetrization_mem_pbwFiltration (n : ℕ) (p : SymmetricAlgebra K L)
    (hp : p ∈ TauCeti.SymmetricAlgebra.homogeneousSubmodule K L n) :
    pbwSymmetrization p ∈ TauCeti.UniversalEnvelopingAlgebra.pbwFiltration K L n := sorry

theorem pbwSymmetrization_symm_mem_degreeLE (n : ℕ)
    (z : UniversalEnvelopingAlgebra K L) (hz : z ∈ TauCeti.UniversalEnvelopingAlgebra.pbwFiltration K L n) :
    pbwSymmetrization.symm z ∈
      ⨆ k ≤ n, TauCeti.SymmetricAlgebra.homogeneousSubmodule K L k := sorry

theorem pbwSymmetrization_symbol (n : ℕ) (p : SymmetricAlgebra K L)
    (hp : p ∈ TauCeti.SymmetricAlgebra.homogeneousSubmodule K L n) :
    (Submodule.Quotient.mk
      (⟨pbwSymmetrization p, pbwSymmetrization_mem_pbwFiltration n p hp⟩ :
        TauCeti.UniversalEnvelopingAlgebra.pbwFiltration K L n) :
      TauCeti.UniversalEnvelopingAlgebra.PBWGradedPiece K L n) =
      TauCeti.UniversalEnvelopingAlgebra.pbwHomogeneousComponentMap K L n ⟨p, hp⟩ := sorry

theorem pbwSymmetrization_mem_center_iff (p : SymmetricAlgebra K L) :
    pbwSymmetrization p ∈ Subalgebra.center K (UniversalEnvelopingAlgebra K L) ↔
      p ∈ lieInvariantSymmetricAlgebra (K := K) (L := L) := sorry

noncomputable def pbwSymmetrizationCenter
    (p : lieInvariantSymmetricAlgebra (K := K) (L := L)) :
    Subalgebra.center K (UniversalEnvelopingAlgebra K L) :=
  ⟨pbwSymmetrization (p : SymmetricAlgebra K L),
    (pbwSymmetrization_mem_center_iff _).mpr p.property⟩

end GenericSymmetrization

/-- On homogeneous invariant input, degree-zero comparison is exact and
positive-degree discrepancy has strictly lower degree. -/
theorem hcProjection_pbwSymmetrization_sub_mem_degreeLE
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) (n : ℕ)
    (p : lieInvariantSymmetricAlgebra (K := K) (L := L))
    (hp : (p : SymmetricAlgebra K L) ∈ TauCeti.SymmetricAlgebra.homogeneousSubmodule K L n) :
    (n = 0 → hcProjection base (pbwSymmetrizationCenter p) = lieCartanRestriction p) ∧
      (0 < n → hcProjection base (pbwSymmetrizationCenter p) - lieCartanRestriction p ∈
        symmetricDegreeLE (n - 1)) := sorry

theorem weightTranslation_lower_degree (mu : Module.Dual K H) (n : ℕ)
    (p : SymmetricAlgebra K H)
    (hp : p ∈ TauCeti.SymmetricAlgebra.homogeneousSubmodule K H n) :
    (n = 0 → weightTranslation mu p = p) ∧
      (0 < n → weightTranslation mu p - p ∈ symmetricDegreeLE (n - 1)) := sorry

noncomputable def weightTranslationDotLinearIso
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    dotInvariants base ≃ₐ[K] linearInvariants (K := K) (H := H) := sorry

theorem weightTranslationDotLinearIso_coe
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) (p : dotInvariants base) :
    (weightTranslationDotLinearIso base p : SymmetricAlgebra K H) =
      weightTranslation (-weylVector base) (p : SymmetricAlgebra K H) := sorry

/-- The native inclusion of raw HC into the dot invariants. -/
noncomputable def hcProjectionToDotInvariants
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    Subalgebra.center K (UniversalEnvelopingAlgebra K L) →ₐ[K] dotInvariants base :=
  (hcProjection base).codRestrict (dotInvariants base)
    (fun z => TauCeti.hcProjection_mem_dotInvariants (b := base) z)

/-- Bijectivity follows from the preceding Lie Chevalley/center-symbol proof. -/
theorem hcProjectionToDotInvariants_bijective
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    Function.Bijective (hcProjectionToDotInvariants base) := sorry

/-- Corestriction of the raw map, with forward PBW/degree-filtration preservation. -/
noncomputable def harishChandraIso (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    Subalgebra.center K (UniversalEnvelopingAlgebra K L) ≃ₐ[K] dotInvariants base :=
  AlgEquiv.ofBijective (hcProjectionToDotInvariants base)
    (hcProjectionToDotInvariants_bijective base)

theorem harishChandraIso_coe (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (z : Subalgebra.center K (UniversalEnvelopingAlgebra K L)) :
    (harishChandraIso base z : SymmetricAlgebra K H) = hcProjection base z := rfl

/-- Corestriction of the linear map, with forward PBW/degree-filtration preservation. -/
noncomputable def harishChandraLinearIso (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    Subalgebra.center K (UniversalEnvelopingAlgebra K L) ≃ₐ[K] linearInvariants (K := K) (H := H) :=
  (harishChandraIso base).trans (weightTranslationDotLinearIso base)

theorem harishChandraLinearIso_coe (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (z : Subalgebra.center K (UniversalEnvelopingAlgebra K L)) :
    (harishChandraLinearIso base z : SymmetricAlgebra K H) = hcProjectionLinear base z := by
  simpa [harishChandraLinearIso, hcProjectionLinear, harishChandraIso_coe] using
    weightTranslationDotLinearIso_coe base (harishChandraIso base z)

theorem harishChandraIso_symm_mem_pbwFiltration
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) (n : ℕ) (p : dotInvariants base)
    (hp : (p : SymmetricAlgebra K H) ∈ symmetricDegreeLE n) :
    ((harishChandraIso base).symm p : UniversalEnvelopingAlgebra K L) ∈
      TauCeti.UniversalEnvelopingAlgebra.pbwFiltration K L n := sorry

theorem harishChandraLinearIso_symm_mem_pbwFiltration
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) (n : ℕ) (p : linearInvariants (K := K) (H := H))
    (hp : (p : SymmetricAlgebra K H) ∈ symmetricDegreeLE n) :
    ((harishChandraLinearIso base).symm p : UniversalEnvelopingAlgebra K L) ∈
      TauCeti.UniversalEnvelopingAlgebra.pbwFiltration K L n := sorry

/-- Evaluation agrees with the independently constructed Verma top-line central character. -/
theorem centralCharacter_eq_hcProjection (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) (z : Subalgebra.center K (UniversalEnvelopingAlgebra K L)) :
    centralCharacter base lam z = weightEvaluation lam (hcProjection base z) :=
  (TauCeti.lift_hcProjection base lam z).symm

theorem centralCharacter_eq_hcProjectionLinear
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam : Module.Dual K H)
    (z : Subalgebra.center K (UniversalEnvelopingAlgebra K L)) :
    centralCharacter base lam z
      = weightEvaluation (lam + weylVector base) (hcProjectionLinear base z) := by
  rw [hcProjectionLinear_evaluation]
  simpa using centralCharacter_eq_hcProjection base lam z

/-- A finite linear Weyl action is separated by its invariant polynomials in characteristic zero.
Separate two finite disjoint orbits by polynomial interpolation, then average over W. -/
theorem linearInvariants_separate_orbits (lam mu : Module.Dual K H) :
    (∀ p : linearInvariants (K := K) (H := H), weightEvaluation lam p = weightEvaluation mu p) ↔
      ∃ w : (LieAlgebra.IsKilling.rootSystem H).weylGroup, mu = w • lam := sorry

/-- **Central characters and the dot orbit**: `χ_λ = χ_μ` iff `μ ∈ W · λ` (dot action). This is the
central-character/orbit theorem behind Verma-module homomorphisms. The full **linkage principle** of
category `O` (composition factors, the integral Weyl group, and the order constraints of the block
decomposition) is a strictly stronger, separate development stated on its own. -/
theorem centralCharacter_eq_iff_dotOrbit (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam mu : Module.Dual K H) :
    centralCharacter base lam = centralCharacter base mu ↔
      ∃ w : (LieAlgebra.IsKilling.rootSystem H).weylGroup, mu = dotAction base w lam := sorry

/-- Transfer dominant-integral weights to the rational root-system form, apply its ordered
chamber theorem, then extend scalars back. This is independent of HC and does not order K. -/
theorem dominantIntegral_eq_of_dotAction_eq
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) {lam mu : Module.Dual K H}
    (hlam : IsDominantIntegral base lam) (hmu : IsDominantIntegral base mu)
    (w : (LieAlgebra.IsKilling.rootSystem H).weylGroup)
    (hw : dotAction base w lam = mu) : lam = mu := sorry

/-- **Central characters separate the dominant integral weights**: on dominant integral weights,
`λ ↦ χ_λ` is injective (from `centralCharacter_eq_iff_dotOrbit`: `λ+ρ` and `μ+ρ` are strictly
dominant in the ordered rational form of the root system; apply the chamber theorem there,
then scalar extension to K, without an order on algebraically closed K). A single Casimir
eigenvalue does not separate distinct dominant weights in general; the full center does, which is
why the isotypic separation below is routed through `centralCharacter`. -/
theorem centralCharacter_injOn_isDominantIntegral
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) {lam mu : Module.Dual K H}
    (hlam : IsDominantIntegral base lam) (hmu : IsDominantIntegral base mu)
    (h : centralCharacter base lam = centralCharacter base mu) : lam = mu := sorry

/-- **The center acts on the `λ`-isotypic component by `χ_λ`**: the eigenspace-of-the-center
refinement of the Layer 6 isotypic decomposition. Combined with
`centralCharacter_injOn_isDominantIntegral`, distinct isotypic components of a finite-dimensional
module are separated by a central element. -/
theorem center_smul_isotypicComponent (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) {M : Type*} [AddCommGroup M] [Module K M] [LieRingModule L M]
    [LieModule K L M] [FiniteDimensional K M]
    (z : Subalgebra.center K (UniversalEnvelopingAlgebra K L)) {m : M}
    (hm : m ∈ isotypicComponent base lam M) :
    UniversalEnvelopingAlgebra.lift K (toEnd K L M) (z : UniversalEnvelopingAlgebra K L) m
      = centralCharacter base lam z • m := sorry

/-- **Freudenthal's base case**: the top weight `λ` of `L(λ)` has multiplicity one. The recursion below
is anchored here and computes the lower multiplicities. -/
theorem freudenthal_top_mult (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) (hlam : IsDominantIntegral base lam)
    [FiniteDimensional K (irreducibleQuotient base lam)] :
    (formalCharacter (M := irreducibleQuotient base lam)).coeff lam = 1 :=
  TauCeti.formalCharacter_coeff_eq_one_of_isHighestWeightVector_of_lieSpan_eq_top
    (TauCeti.isHighestWeightVector_irreducibleQuotientGenerator base lam)
    (TauCeti.lieSpan_irreducibleQuotientGenerator_eq_top base lam)

/-- The Freudenthal double sum `Σ_{α>0} Σ_{j≥1} mult_{μ+jα}(L(λ)) · ⟨μ+jα, α⟩`. The inner sum over
`j ≥ 1` is finite because `μ + j • α` leaves the (finite) weight set for large `j`, so it ranges over a
finite `Finset`; given by the native positive-root/weight-string sum. -/
noncomputable def freudenthalRHS (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam mu : Module.Dual K H) [FiniteDimensional K (irreducibleQuotient base lam)] : K :=
  ∑ i ∈ TauCeti.posRootsFinset (LieAlgebra.IsKilling.rootSystem H) base,
    ∑ j ∈ (TauCeti.weightString (irreducibleQuotient base lam)
      (Weight.coe_toLinear_ne_zero_iff.mpr (H.isNonZero_coe_root i)) mu).erase 0,
      (Module.finrank K (LieModule.genWeightSpace (irreducibleQuotient base lam)
        ((mu + j • (i.1 : Module.Dual K H) : Module.Dual K H) : H → K)) : K) *
        invForm (mu + j • (i.1 : Module.Dual K H)) (i.1 : Module.Dual K H)

/-- **Freudenthal's multiplicity formula**: the recursion
`(⟨λ+ρ,λ+ρ⟩ - ⟨μ+ρ,μ+ρ⟩) · mult_μ = 2 Σ_{α>0} Σ_{j≥1} mult_{μ+jα} ⟨μ+jα,α⟩`, anchored at
`freudenthal_top_mult`. For an actual weight `μ ≠ λ` of `L(λ)` the Casimir denominator
`invForm (λ+ρ) (λ+ρ) - invForm (μ+ρ) (μ+ρ)` is nonzero, so the identity solves for `mult_μ` downward
from `λ`, complementing Kostant's closed form. -/
theorem freudenthal_multiplicity_formula (base : (LieAlgebra.IsKilling.rootSystem H).Base)
    (lam : Module.Dual K H) (hlam : IsDominantIntegral base lam)
    [FiniteDimensional K (irreducibleQuotient base lam)] (mu : Module.Dual K H) :
    (invForm (lam + weylVector base) (lam + weylVector base)
        - invForm (mu + weylVector base) (mu + weylVector base))
      * (((formalCharacter (M := irreducibleQuotient base lam)).coeff mu : ℤ) : K)
      = 2 * freudenthalRHS base lam mu := by
  simpa only [formalCharacter, TauCeti.formalCharacter_coeff, Int.cast_natCast, freudenthalRHS] using
    TauCeti.freudenthal_multiplicity_formula
      (TauCeti.isHighestWeightVector_irreducibleQuotientGenerator base lam)
      (TauCeti.lieSpan_irreducibleQuotientGenerator_eq_top base lam) mu

/-- Callable Freudenthal step at a non-top actual weight; native Casimir separation proves
that the displayed denominator is nonzero. -/
theorem coeff_formalCharacter_eq_freudenthalRHS_div
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) (lam mu : Module.Dual K H)
    (hlam : IsDominantIntegral base lam) [FiniteDimensional K (irreducibleQuotient base lam)]
    (hmu : LieModule.genWeightSpace (irreducibleQuotient base lam) (mu : H → K) ≠ ⊥)
    (hne : mu ≠ lam) :
    (((formalCharacter (M := irreducibleQuotient base lam)).coeff mu : ℤ) : K) =
      2 * freudenthalRHS base lam mu /
        (invForm (lam + weylVector base) (lam + weylVector base) -
          invForm (mu + weylVector base) (mu + weylVector base)) := sorry

omit algClosedK in
/-- All-root sl₂ normalization over a characteristic-zero split Killing field. This helper
retains its all-root carrier; the actual Serre presentation uses the normalized simple-root
family on `base.support` below. -/
theorem exists_chevalleySystem (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    ∃ e f : H.root → L,
      (∀ i, e i ≠ 0) ∧ (∀ i, f i ≠ 0) ∧
      (∀ i : H.root, e i ∈ LieAlgebra.rootSpace H (i.1 : H → K)) ∧
      (∀ i : H.root, f i ∈ LieAlgebra.rootSpace H (-(i.1 : H → K))) ∧
      (∀ i : H.root, ⁅e i, f i⁆ = (LieAlgebra.IsKilling.coroot i.1 : L)) ∧
      ∀ i j : H.root, ⁅(LieAlgebra.IsKilling.coroot i.1 : L), e j⁆
          = (j.1 : H → K) (LieAlgebra.IsKilling.coroot i.1) • e j := sorry

omit algClosedK in
/-- Native normalized simple-root Serre data, including generation, without algebraic closure. -/
theorem exists_simpleRoot_serreSystem (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    ∃ e f : ↥base.support → L,
      TauCeti.IsSerreSystem K base.cartanMatrix.transpose
        (fun i ↦ (((LieAlgebra.IsKilling.rootSystem H).coroot i : H) : L)) e f ∧
      LieSubalgebra.lieSpan K L (Set.range e ∪ Set.range f) = ⊤ := by
  exact TauCeti.exists_isSerreSystem_of_base base

omit algClosedK in
/-- The remaining split-field presentation target: injectivity of the ACTUAL normalized lift.
The coroot family is fixed, and the raising/lowering families generate `L`. The native module
already supplies these data and surjectivity, not this kernel theorem. -/
theorem serreLift_injective_of_base [LieAlgebra.IsSimple K L]
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) {e f : ↥base.support → L}
    (hS : TauCeti.IsSerreSystem K base.cartanMatrix.transpose
      (fun i ↦ (((LieAlgebra.IsKilling.rootSystem H).coroot i : H) : L)) e f)
    (hspan : LieSubalgebra.lieSpan K L (Set.range e ∪ Set.range f) = ⊤) :
    Function.Injective (TauCeti.serreLift hS) := sorry

omit algClosedK in
/-- Split-field Serre presentation for simple `L`. Construct this equivalence from the SAME
normalized `TauCeti.serreLift`: native `serreLift_surjective` plus
`serreLift_injective_of_base`, retaining `serreLift_serreH/E/F` as its generator equations.
The matrix is `base.cartanMatrix.transpose`: `A i j=αᵢ(hⱼ)`, while
`⁅hᵢ,eⱼ⁆=A j i • eⱼ`. Keep the nonsymmetric B₃/C₃ comparison and assemble reducible
Killing-semisimple systems from their simple components, including the empty system. -/
theorem serre_presentation_equiv [LieAlgebra.IsSimple K L]
    (base : (LieAlgebra.IsKilling.rootSystem H).Base) :
    Nonempty (Matrix.ToLieAlgebra K base.cartanMatrix.transpose ≃ₗ⁅K⁆ L) := sorry

end General

/-! ## Layer 8: the exceptional Lie algebras, explicitly

Mathlib names `LieAlgebra.e₆`, `e₇`, `e₈`, `f₄`, `g₂` as `Matrix.ToLieAlgebra` quotients.
The split identifications here use Layer7's split-field normalized presentation over every
characteristic-zero `K`. First construct each concrete model's split Cartan/root-space and
transposed Cartan-matrix comparison. The native `TauCeti.Octonion`, `TauCeti.AlbertAlgebra`
and integral `TauCeti.E7Minuscule` interfaces are consumed through the explicit model comparisons
owned in the README. The illustrative doubling/Albert/Freudenthal carriers below must be
intertwined with those native products/generator actions; the samples do not claim native
implementation is absent. The compact division forms over `ℝ` remain a separate real-form
track and are compared with split forms only after the stated scalar extension. -/

section Exceptional

variable (K : Type) [Field K] [CharZero K]

/-- **The split octonions** `𝕆`, the split Cayley algebra over `K`, built by Cayley-Dickson doubling of
the split quaternions: an `8`-dimensional non-associative alternative composition algebra. This is the
**split** form (the one whose derivations are the split `LieAlgebra.g₂`); the compact division
octonions are a distinct `K = ℝ` real form. Absent from Mathlib, so building it is itself a target. The
multiplication is `K`-bilinear and unital (hence `NonAssocRing` — which packages the unit — with the
two scalar towers, not a bare `Mul` or a separate `One`). -/
def Octonion : Type → Type := sorry

noncomputable instance :
    ∀ (K : Type) [Field K] [CharZero K], NonAssocRing (Octonion K) := sorry
noncomputable instance : Module K (Octonion K) := sorry
noncomputable instance : SMulCommClass K (Octonion K) (Octonion K) := sorry
noncomputable instance : IsScalarTower K (Octonion K) (Octonion K) := sorry

/-- `𝕆` is `8`-dimensional. -/
theorem finrank_octonion : Module.finrank K (Octonion K) = 8 := sorry

/-- **Octonion conjugation** `x ↦ x̄`, a `K`-linear map fixing `1` and negating the imaginary part. -/
noncomputable def octonionConj : Octonion K →ₗ[K] Octonion K := sorry

/-- **The octonion norm** `N(x)`, the composition-algebra norm form, given here as its underlying
map to `K` (with `N(x) • 1 = x * octonionConj x`). -/
noncomputable def octonionNorm :
    ∀ (K : Type) [Field K] [CharZero K], Octonion K → K := sorry

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

/- **The derivation Lie algebra** `Der(A)` of a non-unital non-associative `K`-algebra `A`: the
`K`-linear maps `D` with `D (x * y) = D x * y + x * D y`, a Lie algebra under commutator. The
multiplication must be `K`-bilinear (the `NonUnitalNonAssocSemiring` together with the two scalar
towers), which `[Mul A]` alone does not supply; for a Lie algebra `A` this specializes to Mathlib's
`LieDerivation`. -/
/-- Additive inverses are forced by the existing K-module: -x = (-1 : K) • x.
This dictionary preserves the supplied zero, addition, natural scalar multiplication and
multiplication, so the original semiring-plus-field-module input scope is retained. -/
abbrev derivationNonAssocRing (A : Type u) [NonUnitalNonAssocSemiring A] [Module K A] :
    NonUnitalNonAssocRing A :=
  { (inferInstance : NonUnitalNonAssocSemiring A),
    (Module.addCommMonoidToAddCommGroup K : AddCommGroup A) with }

/-- The actual native Leibniz subalgebra, using the canonical additive inverse dictionary above. -/
abbrev derivationLieAlgebra (A : Type u) [NonUnitalNonAssocSemiring A] [Module K A]
    [SMulCommClass K A A] [IsScalarTower K A A] : Type u := by
  letI := derivationNonAssocRing K A
  exact ↥(TauCeti.derivationLieAlgebra K A)

noncomputable instance (A : Type u) [NonUnitalNonAssocSemiring A] [Module K A]
    [SMulCommClass K A A] [IsScalarTower K A A] : LieRing (derivationLieAlgebra K A) := by
  letI := derivationNonAssocRing K A
  change LieRing ↥(TauCeti.derivationLieAlgebra K A)
  infer_instance
noncomputable instance (A : Type u) [NonUnitalNonAssocSemiring A] [Module K A]
    [SMulCommClass K A A] [IsScalarTower K A A] : LieAlgebra K (derivationLieAlgebra K A) := by
  letI := derivationNonAssocRing K A
  change LieAlgebra K ↥(TauCeti.derivationLieAlgebra K A)
  infer_instance

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
def AlbertAlgebra : Type → Type := sorry

noncomputable instance :
    ∀ (K : Type) [Field K] [CharZero K],
      NonUnitalNonAssocCommRing (AlbertAlgebra K) := sorry
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

/-! ## Compact division-octonion input for late compact `G₂`

This is a new concrete carrier, distinct from the split Zorn algebra `Octonion ℝ` above.
The generic pair carrier uses the native `WithLp 2` coordinate transport, so the additive,
module, and Euclidean norm structures all come from the ordered pair model. -/
/-- A distinct ordered-pair Cayley--Dickson carrier. It is a wrapper, not an abbreviation
of the associative product on `Quaternion ℝ × Quaternion ℝ`; its only underlying comparison is
the Euclidean `WithLp 2` pair equivalence below. -/
structure _root_.TauCeti.CayleyDickson (A : Type*) [NormedAddCommGroup A]
    [NormedSpace ℝ A] where
  fst : A
  snd : A

abbrev _root_.TauCeti.DivisionOctonionReal :=
  _root_.TauCeti.CayleyDickson (Quaternion ℝ)

namespace CompactDivisionOctonion

/-- Local name for the concrete root-namespace Cayley carrier, not an autoimplicit type. -/
abbrev DivisionOctonionReal := _root_.TauCeti.DivisionOctonionReal

open scoped TensorProduct

/-- The explicit coordinate bijection to the Euclidean pair model. -/
def euclideanEquiv : DivisionOctonionReal ≃ WithLp 2 (Quaternion ℝ × Quaternion ℝ) where
  toFun x := WithLp.toLp 2 (x.fst, x.snd)
  invFun x := ⟨(WithLp.ofLp x).1, (WithLp.ofLp x).2⟩
  left_inv x := by cases x; rfl
  right_inv x := rfl

/-- The Euclidean normed additive group is transported from precisely the pair model. -/
noncomputable instance : NormedAddCommGroup DivisionOctonionReal :=
  euclideanEquiv.normedAddCommGroup

def euclideanAddEquiv : DivisionOctonionReal ≃+
    WithLp 2 (Quaternion ℝ × Quaternion ℝ) := euclideanEquiv.addEquiv

/-- Real scalar multiplication is the additive-equivalence transport, and the normed-space
instance is induced from the same coordinate equivalence. -/
noncomputable instance : Module ℝ DivisionOctonionReal := euclideanAddEquiv.module ℝ
noncomputable instance : NormedSpace ℝ DivisionOctonionReal :=
  euclideanAddEquiv.normedSpace ℝ

noncomputable def euclideanLinearEquiv : DivisionOctonionReal ≃ₗ[ℝ]
    WithLp 2 (Quaternion ℝ × Quaternion ℝ) := euclideanAddEquiv.linearEquiv ℝ

noncomputable instance : FiniteDimensional ℝ DivisionOctonionReal :=
  FiniteDimensional.of_injective euclideanLinearEquiv.toLinearMap
    euclideanLinearEquiv.injective

/-- The linear coordinates used by every operation below. -/
noncomputable def pairCoordinates : DivisionOctonionReal ≃ₗ[ℝ]
    (Quaternion ℝ × Quaternion ℝ) :=
  euclideanLinearEquiv.trans (WithLp.linearEquiv 2 ℝ (Quaternion ℝ × Quaternion ℝ))

/-- The pinned Cayley-Dickson multiplication on the distinct pair carrier. -/
noncomputable def mulPair (x y : DivisionOctonionReal) : DivisionOctonionReal :=
  ⟨x.fst * y.fst - Star.star y.snd * x.snd,
   y.snd * x.fst + x.snd * Star.star y.fst⟩

/-- One explicit nonassociative-ring structure. Its additive parent is exactly the transferred
Euclidean `AddCommGroup`, and its unit, multiplication and casts are the displayed coordinate
operations; only their algebraic law proofs are admitted. -/
noncomputable instance : NonAssocRing DivisionOctonionReal where
  __ := (inferInstance : AddCommGroup DivisionOctonionReal)
  one := ⟨1, 0⟩
  mul := mulPair
  natCast n := ⟨(n : Quaternion ℝ), 0⟩
  intCast n := ⟨(n : Quaternion ℝ), 0⟩
  natCast_zero := by sorry
  natCast_succ := by sorry
  intCast_ofNat := by sorry
  intCast_negSucc := by sorry
  left_distrib := by sorry
  right_distrib := by sorry
  zero_mul := by sorry
  mul_zero := by sorry
  one_mul := by sorry
  mul_one := by sorry

/-- The two compatibility laws which make the actual Cayley product real-bilinear for the
native derivation and tensor-product APIs. -/
noncomputable instance : SMulCommClass ℝ DivisionOctonionReal DivisionOctonionReal where
  smul_comm := by sorry
noncomputable instance : IsScalarTower ℝ DivisionOctonionReal DivisionOctonionReal where
  smul_assoc := by sorry

/-- Cayley conjugation is the intended positive-real involution. It is installed as the actual
`Star` operation; it is not an automatically inherited pointwise star on the coordinate pair. -/
noncomputable def positiveConjugation (x : DivisionOctonionReal) : DivisionOctonionReal :=
  ⟨Star.star x.fst, -x.snd⟩
noncomputable instance : Star DivisionOctonionReal := ⟨positiveConjugation⟩

/-- Ordered pair coordinates are genuinely the displayed ℍ×ℍ coordinates. -/
theorem pairCoordinates_fst_snd (x : DivisionOctonionReal) :
    pairCoordinates x = (x.fst, x.snd) := rfl

theorem pairCoordinates_add (x y : DivisionOctonionReal) :
    pairCoordinates (x + y) = pairCoordinates x + pairCoordinates y := rfl

theorem pairCoordinates_smul (r : ℝ) (x : DivisionOctonionReal) :
    pairCoordinates (r • x) = r • pairCoordinates x := rfl

theorem pairCoordinates_one : pairCoordinates (1 : DivisionOctonionReal) = (1, 0) := rfl

theorem pairCoordinates_mul (x y : DivisionOctonionReal) :
    pairCoordinates (x * y) =
      ((pairCoordinates x).1 * (pairCoordinates y).1 -
          Star.star (pairCoordinates y).2 * (pairCoordinates x).2,
       (pairCoordinates y).2 * (pairCoordinates x).1 +
          (pairCoordinates x).2 * Star.star (pairCoordinates y).1) := rfl

theorem pairCoordinates_conjugation (x : DivisionOctonionReal) :
    pairCoordinates (Star.star x) =
      (Star.star (pairCoordinates x).1, -(pairCoordinates x).2) := rfl

/-- Quaternion-doubling conjugation and the explicitly installed positive `Star.star`. -/
noncomputable def star (x : DivisionOctonionReal) : DivisionOctonionReal := Star.star x

/-- Scalar trace, with the convention `T(x)=x+x̄`. -/
noncomputable def trace : DivisionOctonionReal →ₗ[ℝ] ℝ :=
  (2 : ℝ) • ((QuaternionAlgebra.reₗ (-1 : ℝ) 0 (-1)).comp
    ((LinearMap.fst ℝ (Quaternion ℝ) (Quaternion ℝ)).comp pairCoordinates.toLinearMap))

/-- Positive composition norm square on the actual real carrier. -/
noncomputable def normSq (x : DivisionOctonionReal) : ℝ :=
  Quaternion.normSq x.fst + Quaternion.normSq x.snd

theorem normSq_eq_norm_sq (x : DivisionOctonionReal) : normSq x = ‖x‖ ^ 2 := sorry

theorem trace_star (x : DivisionOctonionReal) :
    x + Star.star x = trace x • (1 : DivisionOctonionReal) := sorry
theorem normSq_pos {x : DivisionOctonionReal} (hx : x ≠ 0) : 0 < normSq x := sorry
theorem normSq_mul (x y : DivisionOctonionReal) : normSq (x * y) = normSq x * normSq y := sorry
theorem left_alternative (x y : DivisionOctonionReal) : x * x * y = x * (x * y) := sorry
theorem right_alternative (x y : DivisionOctonionReal) : y * x * x = (y * x) * x := sorry
theorem flexible (x y : DivisionOctonionReal) : x * (y * x) = (x * y) * x := sorry
theorem moufang_left (x y z : DivisionOctonionReal) : x * (y * (x * z)) = ((x * y) * x) * z := sorry
theorem moufang_middle (x y z : DivisionOctonionReal) : (x * y) * (z * x) = x * ((y * z) * x) := sorry
theorem star_involutive (x : DivisionOctonionReal) : Star.star (Star.star x) = x := sorry
theorem star_mul (x y : DivisionOctonionReal) : Star.star (x * y) = Star.star y * Star.star x := sorry
theorem mul_star (x : DivisionOctonionReal) : x * Star.star x = normSq x • (1 : DivisionOctonionReal) := sorry
theorem star_mul_cancel (x : DivisionOctonionReal) (hx : x ≠ 0) :
    ((normSq x)⁻¹ • Star.star x) * x = 1 := sorry

theorem derivation_apply_one (D : TauCeti.derivationLieAlgebra ℝ DivisionOctonionReal) :
    (D : Module.End ℝ DivisionOctonionReal) 1 = 0 := sorry

/-- Candidate subspaces closed under the actual Cayley product and conjugation, containing the
unit and both generators. Their intersection is the concrete algebra generated by `a,b`. -/
def generatedSubspaceFamily (a b : DivisionOctonionReal) : Set (Submodule ℝ DivisionOctonionReal) :=
  {S | (1 : DivisionOctonionReal) ∈ S ∧ a ∈ S ∧ b ∈ S ∧
    (∀ x ∈ S, ∀ y ∈ S, x * y ∈ S) ∧ (∀ x ∈ S, Star.star x ∈ S)}

noncomputable def twoGeneratedSubalgebra (a b : DivisionOctonionReal) :
    Submodule ℝ DivisionOctonionReal := sInf (generatedSubspaceFamily a b)

theorem twoGeneratedSubalgebra_associative (a b : DivisionOctonionReal)
    {x y z : DivisionOctonionReal}
    (hx : x ∈ twoGeneratedSubalgebra a b)
    (hy : y ∈ twoGeneratedSubalgebra a b)
    (hz : z ∈ twoGeneratedSubalgebra a b) :
    (x * y) * z = x * (y * z) := sorry

/-- A smaller coordinate lemma, separate from the full generated-subalgebra Artin target. -/
theorem span_three_vectors_associative (a b : DivisionOctonionReal)
    {x y z : DivisionOctonionReal}
    (hx : x ∈ Submodule.span ℝ ({1, a, b} : Set DivisionOctonionReal))
    (hy : y ∈ Submodule.span ℝ ({1, a, b} : Set DivisionOctonionReal))
    (hz : z ∈ Submodule.span ℝ ({1, a, b} : Set DivisionOctonionReal)) :
    (x * y) * z = x * (y * z) := sorry

theorem smooth_mul : ContDiff ℝ ⊤ (fun p : DivisionOctonionReal × DivisionOctonionReal => p.1 * p.2) := sorry
theorem smooth_star : ContDiff ℝ ⊤ (fun x : DivisionOctonionReal => Star.star x) := sorry
theorem smooth_inverse_on_nonzero :
    ContDiffOn ℝ ⊤ (fun x : DivisionOctonionReal => (normSq x)⁻¹ • Star.star x)
      {x | x ≠ 0} := sorry

/-- The trace-zero imaginary subspace. -/
noncomputable def imaginary : Submodule ℝ DivisionOctonionReal := trace.ker

/-- The induced inner product on imaginary octonions. This definition retains both arguments. -/
noncomputable def inner (v w : imaginary) : ℝ :=
  -((pairCoordinates (v.1 * w.1)).1.re)

/-- The seven-dimensional cross product, defined by the commutator. The trace-zero proof is
separate, but the value itself depends on both input vectors. -/
noncomputable def cross (v w : imaginary) : imaginary :=
  ⟨(1 / 2 : ℝ) • (v.1 * w.1 - w.1 * v.1), by sorry⟩

/-- The imaginary part of the algebra associator `(uv)w-u(vw)`. -/
noncomputable def associator (u v w : imaginary) : imaginary :=
  ⟨(u.1 * v.1) * w.1 - u.1 * (v.1 * w.1), by sorry⟩

theorem finrank_imaginary : Module.finrank ℝ imaginary = 7 := sorry
theorem imaginary_product (v w : imaginary) :
    v.1 * w.1 = -(inner v w) • (1 : DivisionOctonionReal) + (cross v w).1 := sorry
/-- The valid repeated-variable cross identity in dimension seven. The unrestricted three-vector
identity is the associator formula below, not the three-dimensional vector triple product. -/
theorem cross_repeated (u v : imaginary) :
    cross u (cross u v) = inner u v • u - inner u u • v := sorry
/-- The sign convention is `associator u v w = (uv)w-u(vw)`. -/
theorem cross_associator_identity (u v w : imaginary) :
    cross (cross u v) w - cross u (cross v w) =
      associator u v w + inner u v • w - inner v w • u := sorry

/-- The complex-linear extension of the positive real conjugation. Its scalar coefficients are
fixed: on a pure tensor it sends `z ⊗ x` to `z ⊗ Star.star x`. This differs from the default
`Star.star` on a tensor product, which conjugates the complex scalar. -/
noncomputable def complexifiedConjugation :
    ℂ ⊗[ℝ] DivisionOctonionReal →ₗ[ℂ] ℂ ⊗[ℝ] DivisionOctonionReal := sorry

theorem complexifiedConjugation_tmul (z : ℂ) (x : DivisionOctonionReal) :
    complexifiedConjugation (z ⊗ₜ[ℝ] x) = z ⊗ₜ[ℝ] Star.star x := sorry

/-- Complex-linear extension of the real Cayley product to the native tensor-product carrier.
`Mathlib.RingTheory.TensorProduct.Basic` supplies its multiplication and `1 = 1 ⊗ₜ 1`; do not
replace those instances by arbitrary binders. -/
noncomputable def complexificationMap : ℂ ⊗[ℝ] DivisionOctonionReal →ₗ[ℂ]
    TauCeti.Octonion ℂ := sorry

theorem tensor_tmul_mul (z : ℂ) (x y : DivisionOctonionReal) :
    (z ⊗ₜ[ℝ] x) * ((1 : ℂ) ⊗ₜ[ℝ] y) = z ⊗ₜ[ℝ] (x * y) := by
  simp [Algebra.TensorProduct.tmul_mul_tmul]

theorem complexificationMap_one : complexificationMap (1 : ℂ ⊗[ℝ] DivisionOctonionReal) = 1 := sorry
theorem complexificationMap_mul
    (x y : ℂ ⊗[ℝ] DivisionOctonionReal) :
    complexificationMap (x * y) = complexificationMap x * complexificationMap y := sorry

theorem complexificationMap_bijective : Function.Bijective complexificationMap := sorry

/-- Apply the native multiplicative-linear-equivalence congruence to the preceding actual
complexified product map. -/
noncomputable def splitDerivationTransport :
    TauCeti.derivationLieAlgebra ℂ (ℂ ⊗[ℝ] DivisionOctonionReal) ≃ₗ⁅ℂ⁆
      TauCeti.derivationLieAlgebra ℂ (TauCeti.Octonion ℂ) :=
  TauCeti.derivationLieAlgebraCongr
    (LinearEquiv.ofBijective complexificationMap complexificationMap_bijective)
    complexificationMap_mul

/-- The actual complexified derivation Lie algebra is transported by the native
multiplicative-linear-equivalence congruence, after proving the Leibniz-kernel base-change map. -/
theorem complexified_derivations_equiv_split :
    Nonempty ((ℂ ⊗[ℝ] TauCeti.derivationLieAlgebra ℝ DivisionOctonionReal) ≃ₗ⁅ℂ⁆
      TauCeti.derivationLieAlgebra ℂ (TauCeti.Octonion ℂ)) := sorry

/-- Native Leibniz derivations of the constructed nonassociative algebra. -/
noncomputable abbrev derivations := TauCeti.derivationLieAlgebra ℝ DivisionOctonionReal

/-- Exponentiating any native derivation gives a smooth multiplicative curve by uniqueness
for the linear ODE in the associative endomorphism algebra. -/
theorem derivation_integrates_to_aut_curve (D : derivations) :
    ∃ c : ℝ → (DivisionOctonionReal →L[ℝ] DivisionOctonionReal),
      ContDiff ℝ ⊤ c ∧ c 0 = 1 ∧
      (∀ t, Function.Bijective (c t)) ∧
      (∀ t x y, c t (x * y) = c t x * c t y) ∧ (∀ t, c t 1 = 1) ∧
      HasDerivAt c
        (LinearMap.toContinuousLinearMap (D : Module.End ℝ DivisionOctonionReal)) 0 := sorry

end CompactDivisionOctonion

/-! ## Layer 9: reductive Lie algebras and `gl_n`

Independent of Layer 8, and deliberately outside the `section General` blanket: `gl_n` has
degenerate Killing form, so nothing here assumes `LieAlgebra.IsKilling`. Reductivity is Mathlib's
`LieAlgebra.HasCentralRadical` (`radical = center`, the characteristic-zero reductivity criterion),
taken as an unbundled hypothesis; `IsAlgClosed` appears per-theorem exactly where it is needed. The
concrete `gl_n` is `Matrix (Fin n) (Fin n) K` with the `LieRing.ofAssociativeRing` bracket (Mathlib
names no separate carrier); its pinned invariant form is the **trace form of the standard
representation** (`⟨X, Y⟩ = tr (X * Y)`), not the Killing form, and the trace-form Casimir scalar
below is meaningless without that convention. The dictionary to the abstract theory of Layers 1-7
is the restriction to `sl (Fin n) K`, pinned by the transfer targets, not left as prose. -/

section Reductive

variable {K : Type v} [Field K] [CharZero K]
variable {L : Type u} [LieRing L] [LieAlgebra K L] [FiniteDimensional K L]

/-- **The structure of reductive Lie algebras** (char 0, finite-dimensional): the radical is central
(Mathlib's `LieAlgebra.HasCentralRadical`) iff `L` is the direct sum of its centre and its derived
ideal, with the derived ideal semisimple. Both conjuncts are required: `sl₂ ⋉ K²` (the semidirect
product with the standard module) has trivial centre and derived ideal everything, so the
`IsCompl` half alone is satisfied by a non-reductive algebra. -/
theorem hasCentralRadical_iff_isCompl_center_derivedSeries :
    LieAlgebra.HasCentralRadical K L ↔
      IsCompl (LieAlgebra.center K L) (LieAlgebra.derivedSeries K L 1) ∧
        LieAlgebra.IsSemisimple K (LieAlgebra.derivedSeries K L 1) := sorry

/-- The centre of `gl_n` is the scalar matrices. -/
theorem center_matrix_toSubmodule (n : ℕ) :
    (LieAlgebra.center K (Matrix (Fin n) (Fin n) K)).toSubmodule
      = Submodule.span K {(1 : Matrix (Fin n) (Fin n) K)} := sorry

/-- The derived ideal of `gl_n` is `sl_n` (the trace-zero matrices,
`LieAlgebra.SpecialLinear.sl`). -/
theorem derivedSeries_one_matrix_toSubmodule (n : ℕ) :
    (LieAlgebra.derivedSeries K (Matrix (Fin n) (Fin n) K) 1).toSubmodule
      = (LieAlgebra.SpecialLinear.sl (Fin n) K).toSubmodule := sorry

/-- `gl_n` is reductive: `gl_n = K·1 ⊕ sl_n`. -/
theorem hasCentralRadical_matrix (n : ℕ) :
    LieAlgebra.HasCentralRadical K (Matrix (Fin n) (Fin n) K) := sorry

/-- **The centre acts by scalars on an irreducible** (algebraically closed `K`): the central
weight, an element of `Module.Dual K (center K L)` with **no integrality constraint** - this is the
non-integral central direction the group-level `DominantWeight n` of `../ClassicalGroups` does not
see. Needs no reductivity hypothesis. -/
theorem exists_centralWeight_of_isIrreducible [IsAlgClosed K] {M : Type u} [AddCommGroup M]
    [Module K M] [LieRingModule L M] [LieModule K L M] [FiniteDimensional K M]
    [LieModule.IsIrreducible K L M] :
    ∃ xi : Module.Dual K (LieAlgebra.center K L),
      ∀ (z : LieAlgebra.center K L) (m : M), ⁅(z : L), m⁆ = xi z • m := sorry

/-- **The semisimple part acts irreducibly**: a finite-dimensional irreducible over a reductive `L`
restricts to an irreducible module over the derived ideal. `IsAlgClosed` is essential (over `ℝ`,
a one-dimensional abelian `L` acting on `ℝ²` by rotation is irreducible with zero derived ideal);
it is what makes the centre act by scalars, so that derived-ideal submodules are `L`-submodules.
With `exists_centralWeight_of_isIrreducible` this classifies the irreducibles of a reductive
algebra as (irreducible of `[L,L]`) × (central weight). -/
theorem isIrreducible_restrict_derivedSeries [IsAlgClosed K]
    (hred : LieAlgebra.HasCentralRadical K L) {M : Type u} [AddCommGroup M] [Module K M]
    [LieRingModule L M] [LieModule K L M] [FiniteDimensional K M]
    [LieModule.IsIrreducible K L M] :
    LieModule.IsIrreducible K (LieAlgebra.derivedSeries K L 1) M := sorry

/-- **Complete reducibility over a reductive algebra**, with the correct extra hypothesis: every
central element acts semisimply. Without it the statement already fails for the abelian `L = K`
acting on `K²` by a nilpotent Jordan block. -/
theorem reductive_complete_reducibility (hred : LieAlgebra.HasCentralRadical K L) {M : Type u}
    [AddCommGroup M] [Module K M] [LieRingModule L M] [LieModule K L M] [FiniteDimensional K M]
    (hc : ∀ z : LieAlgebra.center K L, (toEnd K L M (z : L)).IsSemisimple)
    (N : LieSubmodule K L M) : ∃ N' : LieSubmodule K L M, IsCompl N N' := sorry

/-- **The diagonal Cartan of `gl_n`**, pinned by `mem_diagonalCartan_iff`: the concrete instance of
"the Cartan of a reductive `L` is centre ⊕ (Cartan of `[L,L]`)". -/
def diagonalCartan (n : ℕ) : LieSubalgebra K (Matrix (Fin n) (Fin n) K) := sorry

theorem mem_diagonalCartan_iff (n : ℕ) (A : Matrix (Fin n) (Fin n) K) :
    A ∈ diagonalCartan (K := K) n ↔ ∀ i j, i ≠ j → A i j = 0 := sorry

instance (n : ℕ) : (diagonalCartan (K := K) n).IsCartanSubalgebra := sorry

/-- **Weights of `gl_n` are `n`-tuples**: the linear equivalence sending `μ : Fin n → K` to the
functional `A ↦ Σᵢ μ i * A i i` on the diagonal Cartan, pinned by `glWeightEquiv_apply`. -/
noncomputable def glWeightEquiv (n : ℕ) :
    (Fin n → K) ≃ₗ[K] Module.Dual K (diagonalCartan (K := K) n) := sorry

theorem glWeightEquiv_apply (n : ℕ) (mu : Fin n → K) (A : diagonalCartan (K := K) n) :
    glWeightEquiv n mu A = ∑ i, mu i * (A : Matrix (Fin n) (Fin n) K) i i := sorry

/-- **Dominance for `gl_n` is a condition on differences**: consecutive differences are natural
numbers; the entries themselves are arbitrary in `K` (the non-integral central direction). The
staircase `ν = (N - 1/2, …, 1/2)` is dominant with no integer entry. Real body. -/
def IsGlDominantIntegral {n : ℕ} (mu : Fin n → K) : Prop :=
  ∀ i j : Fin n, (i : ℕ) + 1 = (j : ℕ) → ∃ k : ℕ, mu i - mu j = (k : K)

/-- **Highest weight vectors for `gl_n`**, against the matrix-unit positive system
(`Matrix.single i j 1` with `i < j` the raising operators): nonzero, a simultaneous eigenvector of
the diagonal `E_ii` with eigenvalues `μ i`, killed by the strict upper triangle. Real body; this is
the concrete form of `IsHighestWeightVector` for a Lie algebra with no `IsKilling.rootSystem`. -/
def IsGlHighestWeightVector {n : ℕ} (mu : Fin n → K) {M : Type u} [AddCommGroup M] [Module K M]
    [LieRingModule (Matrix (Fin n) (Fin n) K) M] [LieModule K (Matrix (Fin n) (Fin n) K) M]
    (v : M) : Prop :=
  v ≠ 0 ∧ (∀ i : Fin n, ⁅(Matrix.single i i 1 : Matrix (Fin n) (Fin n) K), v⁆ = mu i • v) ∧
    ∀ i j : Fin n, i < j → ⁅(Matrix.single i j 1 : Matrix (Fin n) (Fin n) K), v⁆ = 0

/-- **Every finite-dimensional `gl_n`-irreducible has a dominant highest weight** (algebraically
closed `K`; the entries need not be integral, only the consecutive differences). -/
theorem gl_exists_isGlHighestWeightVector_of_irreducible [IsAlgClosed K] {n : ℕ} {M : Type u}
    [AddCommGroup M] [Module K M] [LieRingModule (Matrix (Fin n) (Fin n) K) M]
    [LieModule K (Matrix (Fin n) (Fin n) K) M] [FiniteDimensional K M]
    [LieModule.IsIrreducible K (Matrix (Fin n) (Fin n) K) M] :
    ∃ (mu : Fin n → K) (v : M), IsGlHighestWeightVector mu v ∧ IsGlDominantIntegral mu := sorry

/-- **Highest weight determines the `gl_n`-irreducible**: split data, so no algebraic closure is
needed for the uniqueness direction. -/
theorem gl_equiv_of_isGlHighestWeightVector {n : ℕ} {M M' : Type u}
    [AddCommGroup M] [Module K M] [LieRingModule (Matrix (Fin n) (Fin n) K) M]
    [LieModule K (Matrix (Fin n) (Fin n) K) M] [FiniteDimensional K M]
    [LieModule.IsIrreducible K (Matrix (Fin n) (Fin n) K) M]
    [AddCommGroup M'] [Module K M'] [LieRingModule (Matrix (Fin n) (Fin n) K) M']
    [LieModule K (Matrix (Fin n) (Fin n) K) M'] [FiniteDimensional K M']
    [LieModule.IsIrreducible K (Matrix (Fin n) (Fin n) K) M'] {mu : Fin n → K} {v : M} {v' : M'}
    (hv : IsGlHighestWeightVector mu v) (hv' : IsGlHighestWeightVector mu v') :
    Nonempty (M ≃ₗ⁅K, Matrix (Fin n) (Fin n) K⁆ M') := sorry

/-- **The named carrier `L(μ)` for `gl_n`**: the finite-dimensional irreducible of highest weight
`μ`, as a chosen carrier rather than an existential, so that the Pieri and isotypic statements
below are canonically statable. Total in `μ` for signature convenience; the structural pins
(`isIrreducible_glIrreducible`, `finiteDimensional_glIrreducible`,
`exists_isGlHighestWeightVector_glIrreducible`) carry the dominance hypothesis, and the carrier is
junk off the dominant set (the `coweightPairing` precedent). -/
def glIrreducible :
    ∀ {K : Type v} [Field K] [CharZero K] (n : ℕ) (mu : Fin n → K), Type v := sorry

noncomputable instance (n : ℕ) (mu : Fin n → K) : AddCommGroup (glIrreducible n mu) := sorry
noncomputable instance (n : ℕ) (mu : Fin n → K) : Module K (glIrreducible n mu) := sorry
noncomputable instance (n : ℕ) (mu : Fin n → K) :
    LieRingModule (Matrix (Fin n) (Fin n) K) (glIrreducible n mu) := sorry
noncomputable instance (n : ℕ) (mu : Fin n → K) :
    LieModule K (Matrix (Fin n) (Fin n) K) (glIrreducible n mu) := sorry

theorem isIrreducible_glIrreducible [IsAlgClosed K] {n : ℕ} (mu : Fin n → K)
    (hmu : IsGlDominantIntegral mu) :
    LieModule.IsIrreducible K (Matrix (Fin n) (Fin n) K) (glIrreducible n mu) := sorry

theorem finiteDimensional_glIrreducible [IsAlgClosed K] {n : ℕ} (mu : Fin n → K)
    (hmu : IsGlDominantIntegral mu) : FiniteDimensional K (glIrreducible n mu) := sorry

/-- `glIrreducible n μ` has a highest weight vector of weight `μ` - the anti-vacuity pin tying the
carrier to its name (the `exists_isHighestWeightVector_irreducibleQuotient` precedent). -/
theorem exists_isGlHighestWeightVector_glIrreducible [IsAlgClosed K] {n : ℕ} (mu : Fin n → K)
    (hmu : IsGlDominantIntegral mu) :
    ∃ v : glIrreducible n mu, IsGlHighestWeightVector mu v := sorry

/-- **The `gl_n` universality substitute**: an irreducible with a highest weight vector of weight
`μ` has minimal dimension among finite-dimensional modules with a **cyclic** highest weight vector
of weight `μ` (this is the stronger cyclic special case; in finite dimension, an arbitrary highest-weight vector generates a finite-dimensional submodule with the same central character, and its simple quotient gives the same dimension lower bound).
Follows from the Layer 6 toolkit read through the transfer targets below, but pinned in this
concrete form because it is the statement applications consume directly. -/
theorem gl_finrank_le_of_isGlHighestWeightVector {n : ℕ} {M M' : Type u}
    [AddCommGroup M] [Module K M] [LieRingModule (Matrix (Fin n) (Fin n) K) M]
    [LieModule K (Matrix (Fin n) (Fin n) K) M] [FiniteDimensional K M]
    [LieModule.IsIrreducible K (Matrix (Fin n) (Fin n) K) M]
    [AddCommGroup M'] [Module K M'] [LieRingModule (Matrix (Fin n) (Fin n) K) M']
    [LieModule K (Matrix (Fin n) (Fin n) K) M'] [FiniteDimensional K M']
    {mu : Fin n → K} {v : M} {v' : M'}
    (hv : IsGlHighestWeightVector mu v) (hv' : IsGlHighestWeightVector mu v')
    (hgen : LieSubmodule.lieSpan K (Matrix (Fin n) (Fin n) K) {v'} = ⊤) :
    Module.finrank K M ≤ Module.finrank K M' := sorry

/-- **The `sl_n` restriction is irreducible**: the first half of the pinned `sl ↔ gl` transfer.
The restriction of `glIrreducible n μ` to `sl (Fin n) K` is irreducible (the centre acts by the
scalar `Σᵢ μ i`, so `sl`-submodules are `gl`-submodules). -/
theorem isIrreducible_glIrreducible_restrict_sl [IsAlgClosed K] {n : ℕ} (mu : Fin n → K)
    (hmu : IsGlDominantIntegral mu) :
    LieModule.IsIrreducible K (LieAlgebra.SpecialLinear.sl (Fin n) K) (glIrreducible n mu) := sorry

/-- **The `gl` upgrade of an `sl`-equivalence**: the second half of the transfer. If the identity
matrix acts by the same scalar `c` on both modules, an `sl_n`-equivalence upgrades to a
`gl_n`-equivalence (`gl_n` is spanned by `sl_n` and `1`; no irreducibility needed). This is the
theorem that transfers an `sl_n` decomposition, e.g. the Layer 6 minuscule Pieri rule, back to
`gl_n` when the central scalars match. -/
theorem gl_equiv_of_sl_equiv_of_central_scalar {n : ℕ} {M M' : Type u}
    [AddCommGroup M] [Module K M] [LieRingModule (Matrix (Fin n) (Fin n) K) M]
    [LieModule K (Matrix (Fin n) (Fin n) K) M]
    [AddCommGroup M'] [Module K M'] [LieRingModule (Matrix (Fin n) (Fin n) K) M']
    [LieModule K (Matrix (Fin n) (Fin n) K) M'] (c : K)
    (hM : ∀ m : M, ⁅(1 : Matrix (Fin n) (Fin n) K), m⁆ = c • m)
    (hM' : ∀ m : M', ⁅(1 : Matrix (Fin n) (Fin n) K), m⁆ = c • m)
    (e : Nonempty (M ≃ₗ⁅K, LieAlgebra.SpecialLinear.sl (Fin n) K⁆ M')) :
    Nonempty (M ≃ₗ⁅K, Matrix (Fin n) (Fin n) K⁆ M') := sorry

/-- **The dual-standard Pieri rule for `gl_n`**: `V* ⊗ L(μ) ≅ ⨁_t L(μ - ε_t)`, the sum over the
`t` with `μ - ε_t` still dominant, multiplicity one. The standard module is `Fin n → K` with
Mathlib's `LieRingModule (Matrix (Fin n) (Fin n) K) (Fin n → K)` instance, its dual carries
`Module.Dual.instLieRingModule`, and `ε_t = Pi.single t 1`. This is the `gl_n` face of the Layer 6
minuscule Pieri rule (the dual standard module is minuscule), transferred through the `sl ↔ gl`
targets above; for the staircase weight every summand survives, which is the uniform decomposition
the motivating CAR application reads off. The companion rule for `V ⊗ L(μ)` (weights `μ + ε_t`) is
the mirror statement and is not separately pinned. -/
theorem gl_dual_standard_pieri [IsAlgClosed K] {n : ℕ} (mu : Fin n → K)
    (hmu : IsGlDominantIntegral mu) :
    Nonempty (TensorProduct K (Module.Dual K (Fin n → K)) (glIrreducible n mu)
        ≃ₗ⁅K, Matrix (Fin n) (Fin n) K⁆
      ⨁ t : {t : Fin n // IsGlDominantIntegral (mu - Pi.single t 1)},
        glIrreducible n (mu - Pi.single (t : Fin n) 1)) := sorry

/-- **The single-weight isotypic criterion for `gl_n`** (what a Fock-space-style decomposition
consumes; the Layer 6 semisimple-level criterion does not apply to `gl_n` directly, so the
statement is pinned here at the `gl` level too): if every highest weight vector of a nontrivial
finite-dimensional `M` has weight `μ`, and `n > 0` with the identity matrix acting semisimply,
then `M` is a direct sum of copies of one irreducible with a highest weight vector of weight `μ`.
The identity spans the centre, so `reductive_complete_reducibility` applies; each simple summand
has a highest weight vector and is the unique irreducible of weight `μ`. The nonzero nilpotent
Jordan action of `gl₁` shows why the central hypothesis cannot be omitted. -/
theorem gl_isotypic_of_forall_isGlHighestWeightVector [IsAlgClosed K] {n : ℕ} {M : Type u}
    [AddCommGroup M] [Module K M] [LieRingModule (Matrix (Fin n) (Fin n) K) M]
    [LieModule K (Matrix (Fin n) (Fin n) K) M] [FiniteDimensional K M] [Nontrivial M]
    (hn : 0 < n)
    (hc : (toEnd K (Matrix (Fin n) (Fin n) K) M
      (1 : Matrix (Fin n) (Fin n) K)).IsSemisimple)
    (mu : Fin n → K)
    (h : ∀ (nu : Fin n → K) (v : M), IsGlHighestWeightVector nu v → nu = mu) :
    ∃ (S : LieSubmodule K (Matrix (Fin n) (Fin n) K) M) (m : ℕ),
      LieModule.IsIrreducible K (Matrix (Fin n) (Fin n) K) S ∧
      (∃ v : S, IsGlHighestWeightVector mu (v : M)) ∧
      Nonempty (M ≃ₗ⁅K, Matrix (Fin n) (Fin n) K⁆ ⨁ _ : Fin m, S) := sorry

/-- **The `gl_n` Casimir** `Σ_{i,j} E_ij E_ji` in `U(gl_n)`, built from the matrix-unit basis and
its dual basis under the **trace form of the standard representation** (`⟨X, Y⟩ = tr (X * Y)`; the
Killing form is degenerate on `gl_n`, so the trace form is this layer's pinned invariant-form
convention, and the eigenvalue below is specific to it). -/
noncomputable def glCasimir (n : ℕ) :
    UniversalEnvelopingAlgebra K (Matrix (Fin n) (Fin n) K) := sorry

theorem glCasimir_mem_center (n : ℕ) :
    glCasimir (K := K) n
      ∈ Subalgebra.center K (UniversalEnvelopingAlgebra K (Matrix (Fin n) (Fin n) K)) := sorry

/-- **The `gl_n` Casimir scalar**: on a module generated by a highest weight vector of weight `μ`,
`glCasimir` acts by `Σᵢ μ i * (μ i + n - 1 - 2 i)` (`i : Fin n` zero-based, arithmetic in `K`).
Cyclicity, not irreducibility, is the hypothesis, matching
`casimir_smul_of_isHighestWeightVector`. For the staircase `ν` the scalars of the lowered weights
`ν - ε_t` are pairwise distinct, so on a module whose constituents have highest weights among the
`ν - ε_t` this one operator already separates the summands. -/
theorem glCasimir_smul_of_isGlHighestWeightVector {n : ℕ} {M : Type u} [AddCommGroup M]
    [Module K M] [LieRingModule (Matrix (Fin n) (Fin n) K) M]
    [LieModule K (Matrix (Fin n) (Fin n) K) M] {mu : Fin n → K} {v : M}
    (hv : IsGlHighestWeightVector mu v)
    (hgen : LieSubmodule.lieSpan K (Matrix (Fin n) (Fin n) K) {v} = ⊤) (m : M) :
    UniversalEnvelopingAlgebra.lift K (toEnd K (Matrix (Fin n) (Fin n) K) M) (glCasimir n) m
      = (∑ i : Fin n, mu i * (mu i + (n : K) - 1 - 2 * ((i : ℕ) : K))) • m := sorry

end Reductive

/-! ## Layer 10: affine alcoves and affine diagram automorphisms

These targets consume RootSystems' finite root geometry and the integral-weight lattice built in
Layers 1–2. The compact-period comparison is a later LieGroups consumer. -/

namespace AffineCenter

open scoped TensorProduct

/-- The integral-weight carrier is the actual `ℤ`-submodule of the ambient Cartan dual cut out by
integer evaluation on every coroot. It is not the whole `K`-dual. -/
def integralWeightLattice {K H ι : Type*} [Field K] [CharZero K]
    [AddCommGroup H] [Module K H] (coroot : ι → H) :
    Submodule ℤ (Module.Dual K H) where
  carrier := {weight | ∀ i, ∃ n : ℤ, weight (coroot i) = (n : K)}
  zero_mem' := by intro i; exact ⟨0, by simp⟩
  add_mem' := by
    intro weight μ hweight hμ i
    obtain ⟨m, hm⟩ := hweight i
    obtain ⟨n, hn⟩ := hμ i
    exact ⟨m + n, by simp [hm, hn]⟩
  smul_mem' := by
    intro z weight hweight i
    obtain ⟨n, hn⟩ := hweight i
    exact ⟨z * n, by simp [hn]⟩

@[simp] theorem mem_integralWeightLattice_iff {K H ι : Type*} [Field K] [CharZero K]
    [AddCommGroup H] [Module K H] (coroot : ι → H) (weight : Module.Dual K H) :
    weight ∈ integralWeightLattice coroot ↔ ∀ i, ∃ n : ℤ, weight (coroot i) = (n : K) := Iff.rfl

variable {ι X Y : Type*}
  [AddCommGroup X] [AddCommGroup Y]
  (D : RootDatum ι X Y)

/-- The finite-free integral root datum together with its actual rational scalar extension.
The root and coroot equations keep the native index set and both lattice maps visible. The
root-system hypotheses live over ℚ: integral `IsRootSystem` would assert integral spanning and
would collapse nontrivial root/coroot lattice quotients. -/
structure RationalizedAffineDatum where
  /-- Actual finite root-index and lattice witnesses, not implicitly captured section variables.
  Install the needed projections locally with `letI := A.finiteCharacter`, etc. -/
  rootIndexFintype : Fintype ι
  rootIndexDecidableEq : DecidableEq ι
  finiteCharacter : Module.Finite ℤ X
  freeCharacter : Module.Free ℤ X
  finiteCocharacter : Module.Finite ℤ Y
  freeCocharacter : Module.Free ℤ Y
  rationalPairing : RootPairing ι ℚ (ℚ ⊗[ℤ] X) (ℚ ⊗[ℤ] Y)
  root_eq : ∀ i, rationalPairing.root i = (1 : ℚ) ⊗ₜ[ℤ] D.root i
  coroot_eq : ∀ i, rationalPairing.coroot i = (1 : ℚ) ⊗ₜ[ℤ] D.coroot i
  pairing_eq : ∀ i j,
    rationalPairing.toLinearMap ((1 : ℚ) ⊗ₜ[ℤ] D.root i)
      ((1 : ℚ) ⊗ₜ[ℤ] D.coroot j) = (D.toLinearMap (D.root i) (D.coroot j) : ℚ)
  rootSpanQ : Submodule.span ℚ (Set.range rationalPairing.root) = ⊤
  corootSpanQ : Submodule.span ℚ (Set.range rationalPairing.coroot) = ⊤
  isRootSystemQ : rationalPairing.IsRootSystem
  isCrystallographicQ : rationalPairing.IsCrystallographic
  isReducedQ : rationalPairing.IsReduced
  isIrreducibleQ : rationalPairing.IsIrreducible

attribute [instance] RationalizedAffineDatum.isRootSystemQ
attribute [instance] RationalizedAffineDatum.isCrystallographicQ
attribute [instance] RationalizedAffineDatum.isReducedQ
attribute [instance] RationalizedAffineDatum.isIrreducibleQ

/-- The actual root lattice inside the character lattice of the supplied integral root datum. -/
noncomputable def rootLattice : Submodule ℤ X :=
  Submodule.span ℤ (Set.range D.root)

/-- The coweight lattice is the integral dual of the actual root lattice. -/
noncomputable abbrev coweightLattice := Module.Dual ℤ (rootLattice D)

/-- Restrict the actual integral root-datum pairing to the actual root lattice. -/
noncomputable def cocharacterToCoweight : Y →ₗ[ℤ] coweightLattice D where
  toFun y := (D.toLinearMap.flip y).comp (rootLattice D).subtype
  map_add' y z := by ext q; simp
  map_smul' n y := by ext q; simp

/-- A root coroot, restricted from the supplied integral root datum. -/
noncomputable def corootFunctional (i : ι) : coweightLattice D :=
  cocharacterToCoweight D (D.coroot i)

/-- The coroot lattice is the span of the actual restricted coroot functionals. -/
noncomputable def corootLattice : Submodule ℤ (coweightLattice D) :=
  Submodule.span ℤ (Set.range (corootFunctional D))

/-- Semisimple rational spanning makes restriction injective after rationalization; finite-freeness
then reflects zero back to the original cocharacter lattice. No integral root-span equality is
assumed. -/
theorem cocharacterToCoweight_injective (A : RationalizedAffineDatum D) :
    Function.Injective (cocharacterToCoweight D) := sorry

/-- Finite rational coroot index transfers to the actual finite-free integral lattices. -/
theorem corootLattice_finite_index (A : RationalizedAffineDatum D) :
    Finite (coweightLattice D ⧸ corootLattice D) := sorry

/-- The real affine space is compared with `Hom_ℤ(Q, ℝ)` by scalar extension from the actual
integral dual `Hom_ℤ(Q, ℤ)`. -/
noncomputable abbrev affineSpace := ℝ ⊗[ℤ] coweightLattice D

/-- The selected highest long positive root, using the rationalized finite root system and the
actual indexed roots. The native finite-type datum indexes all roots by `Fin t.numRoots`. -/
noncomputable def highestLongRoot :
    (A : RationalizedAffineDatum D) → (b : A.rationalPairing.Base) →
      {i : ι // b.IsPos i} := sorry

/-- The open fundamental alcove defined by positive simple-root evaluations and highest-long-root
value below one. -/
noncomputable def fundamentalAlcove :
    (A : RationalizedAffineDatum D) → (b : A.rationalPairing.Base) →
      Set (affineSpace D) := sorry

/-- The untwisted affine Cartan matrix on one affine node and the finite simple nodes. -/
noncomputable def affineCartanMatrix :
    (A : RationalizedAffineDatum D) → (b : A.rationalPairing.Base) →
      Matrix (Option b.support) (Option b.support) ℤ := sorry

/-- The actual affine-diagram automorphisms preserve every oriented Cartan integer. -/
noncomputable def affineDiagramAutomorphisms :
    (A : RationalizedAffineDatum D) → (b : A.rationalPairing.Base) →
      Subgroup (Equiv.Perm (Option b.support)) := sorry

/-! The README's remaining named targets define `W_aff = Q∨ ⋊ W`, `W_ext = P∨ ⋊ W`, the actual
alcove stabilizer `Ω`, and the based automorphism group `Γ`, then construct the actual action maps
and prove `Ω ≃* P∨/Q∨` and `Ω ⋊ Γ ≃* affineDiagramAutomorphisms`. These carriers use the integral
root datum, its actual lattices and the rationalized finite root pairing above; they consume the
supplied finite Weyl group rather than adding a second root-system API. -/
end AffineCenter

end TauCetiRoadmap.RepresentationTheory.LieHighestWeight


/- Concrete PBW Rees carrier and generators. Further fibre and Poisson comparison
   targets belong to the definitive specification. -/
namespace TauCetiRoadmap.RepresentationTheory.LieHighestWeight.PBWRees

open Polynomial

universe u v
variable (R : Type u) (L : Type v) [CommRing R] [LieRing L] [LieAlgebra R L]

local notation "U" => UniversalEnvelopingAlgebra R L
local notation "F" => TauCeti.UniversalEnvelopingAlgebra.pbwFiltration R L

/-- The increasing PBW Rees algebra, with actual coefficient conditions. -/
def algebra : Subalgebra R (Polynomial U) where
  carrier := {p | ∀ n, p.coeff n ∈ F n}
  zero_mem' := by simp
  one_mem' := by
    intro n
    by_cases hn : n = 0
    · subst n
      simpa using TauCeti.UniversalEnvelopingAlgebra.one_mem_pbwFiltration R L 0
    · simp [Polynomial.coeff_one, hn]
  add_mem' := by
    intro p q hp hq n
    simpa using (F n).add_mem (hp n) (hq n)
  mul_mem' := by
    intro p q hp hq n
    rw [Polynomial.coeff_mul]
    apply Submodule.sum_mem
    intro ij hij
    have hsum : ij.1 + ij.2 = n := Finset.HasAntidiagonal.mem_antidiagonal.mp hij
    simpa [hsum] using
      TauCeti.UniversalEnvelopingAlgebra.mul_mem_pbwFiltration R L (hp ij.1) (hq ij.2)
  algebraMap_mem' := by
    intro r n
    change (Polynomial.C (algebraMap R U r)).coeff n ∈ F n
    by_cases hn : n = 0
    · subst n
      rw [Polynomial.coeff_C_zero]
      exact TauCeti.UniversalEnvelopingAlgebra.algebraMap_mem_pbwFiltration R L r 0
    · rw [Polynomial.coeff_C, ite_eq_right hn]
      exact (F n).zero_mem

/-- The central deformation parameter; its ambient value is the polynomial X. -/
noncomputable def hbar : algebra R L :=
  ⟨Polynomial.X, by
    intro n
    by_cases hn : n = 1
    · subst n
      simpa using TauCeti.UniversalEnvelopingAlgebra.one_mem_pbwFiltration R L 1
    · rw [Polynomial.coeff_X_of_ne_one hn]
      exact (F n).zero_mem⟩

/-- A degree-one Rees lift of the canonical Lie generator. -/
noncomputable def generator (x : L) : algebra R L :=
  ⟨Polynomial.monomial 1 (UniversalEnvelopingAlgebra.ι R x), by
    intro n
    by_cases hn : n = 1
    · subst n
      simpa using TauCeti.UniversalEnvelopingAlgebra.ι_mem_pbwFiltration_one R L x
    · simp [Polynomial.coeff_monomial, Ne.symm hn]⟩

@[simp] theorem hbar_val : (hbar R L).val = Polynomial.X := rfl
@[simp] theorem generator_val (x : L) :
    (generator R L x).val = Polynomial.monomial 1 (UniversalEnvelopingAlgebra.ι R x) := rfl

theorem hbar_central (a : algebra R L) : hbar R L * a = a * hbar R L := by
  apply Subtype.ext
  exact Polynomial.X_mul



/-- Parameter multiplication is injective over every commutative coefficient ring. -/
theorem hbar_mul_injective :
    Function.Injective (fun a : algebra R L => hbar R L * a) := by
  intro p q hpq
  apply Subtype.ext
  apply Polynomial.ext
  intro n
  have hc := congrArg (fun a : algebra R L => a.val.coeff (n + 1)) hpq
  change (Polynomial.X * p.val).coeff (n + 1) =
    (Polynomial.X * q.val).coeff (n + 1) at hc
  simpa only [Polynomial.coeff_X_mul] using hc


@[simp] theorem generator_add (x y : L) :
    generator R L (x + y) = generator R L x + generator R L y := by
  apply Subtype.ext
  change Polynomial.monomial 1 (UniversalEnvelopingAlgebra.ι R (x + y)) = _
  simp [map_add]

@[simp] theorem generator_smul (r : R) (x : L) :
    generator R L (r • x) = r • generator R L x := by
  apply Subtype.ext
  change Polynomial.monomial 1 (UniversalEnvelopingAlgebra.ι R (r • x)) =
    r • Polynomial.monomial 1 (UniversalEnvelopingAlgebra.ι R x)
  rw [map_smul, Polynomial.smul_monomial]

/-- Rees generators are linear; their commutators have one parameter factor. -/
noncomputable def generatorLinearMap : L →ₗ[R] algebra R L where
  toFun := generator R L
  map_add' := generator_add R L
  map_smul' := generator_smul R L

theorem generator_commutator (x y : L) :
    generator R L x * generator R L y - generator R L y * generator R L x =
      hbar R L * generator R L ⁅x, y⁆ := by
  apply Subtype.ext
  change Polynomial.monomial 1 (UniversalEnvelopingAlgebra.ι R x) *
      Polynomial.monomial 1 (UniversalEnvelopingAlgebra.ι R y) -
      Polynomial.monomial 1 (UniversalEnvelopingAlgebra.ι R y) *
      Polynomial.monomial 1 (UniversalEnvelopingAlgebra.ι R x) =
      Polynomial.X * Polynomial.monomial 1 (UniversalEnvelopingAlgebra.ι R ⁅x, y⁆)
  rw [Polynomial.X, Polynomial.monomial_mul_monomial,
    Polynomial.monomial_mul_monomial, Polynomial.monomial_mul_monomial,
    ← map_sub]
  congr 1
  simpa using TauCeti.UniversalEnvelopingAlgebra.mul_sub_mul_eq_map_ι_lie
    (AlgHom.id R U) x y

end TauCetiRoadmap.RepresentationTheory.LieHighestWeight.PBWRees

/-! The independent integral type-A polynomial/Haar precursor is prototyped in
`TypeAHaarTargets.lean`; its finite lattice and denominator-cleared interfaces
do not assume the group-character identity they are intended to prove. -/
