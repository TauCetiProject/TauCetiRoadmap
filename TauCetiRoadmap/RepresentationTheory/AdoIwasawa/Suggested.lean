import Mathlib

/-!
# Ado–Iwasawa: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.

Mathlib has the universal enveloping algebra and its universal property, Lie derivations,
`LieAlgebra.radical`, Engel's theorem, Lie's theorem (with a triangularizability hypothesis), and
the generalized Krull intersection theorem `Ideal.mem_iInf_smul_pow_eq_bot_iff`, which Layer 7
applies as it stands. It has **no nilradical** in the sense used here (the largest nilpotent ideal
-- `LieAlgebra.maxNilpotentIdeal` is a different, in general smaller, ideal), no concrete PBW
basis, no injectivity theorem for the canonical map into the enveloping algebra, no lift of Lie
derivations to that algebra, no Ado theorem, and no positive-characteristic central
`p`-polynomial construction. See `README.md` for the full dependency plan.
-/

namespace TauCetiRoadmap.RepresentationTheory.AdoIwasawa

open scoped Polynomial

attribute [local instance 100] LieRing.ofAssociativeRing

universe u

variable (K : Type u) [Field K]
variable (L : Type u) [LieRing L] [LieAlgebra K L]

/-! ## Layer 0: the nilradical, and finite associative and enveloping targets -/

/-- The **nilradical** of `L`: the largest ideal that is nilpotent *as a Lie algebra*.

Mathlib has no such declaration, and this is deliberately **not**
`LieAlgebra.maxNilpotentIdeal K L`, which is the largest ideal on which `L` acts nilpotently.
The two differ already for the two-dimensional nonabelian algebra; see `README.md`. -/
def nilradical : LieIdeal K L :=
  sSup { I : LieIdeal K L | LieRing.IsNilpotent I }

/-- Mathlib's `maxNilpotentIdeal` is contained in the nilradical, and the containment is strict
in general. This is the lemma that keeps the two notions from being confused. -/
theorem maxNilpotentIdeal_le_nilradical :
    LieAlgebra.maxNilpotentIdeal K L ≤ nilradical K L := sorry

/-- Elements of the nilradical are `ad`-nilpotent, so Hochschild's pointwise condition implies
the nilrepresentation condition. -/
theorem isNilpotent_ad_of_mem_nilradical [FiniteDimensional K L] {x : L}
    (hx : x ∈ nilradical K L) : IsNilpotent (LieAlgebra.ad K L x) := sorry

/-- In characteristic zero every derivation maps the solvable radical into the nilradical. This is
the theorem from which derivation-invariance of the nilradical and `[L, radical L] ≤ nilradical L`
are derived; no characteristic-free version is asserted. -/
theorem lieDerivation_radical_le_nilradical [CharZero K] [FiniteDimensional K L]
    (D : LieDerivation K L L) {x : L} (hx : x ∈ LieAlgebra.radical K L) :
    D x ∈ nilradical K L := sorry

/-- The radical criterion used in Hochschild's characteristic-zero assembly. -/
theorem mem_nilradical_of_mem_radical_of_isNilpotent_ad [CharZero K]
    [FiniteDimensional K L] {x : L} (hx : x ∈ LieAlgebra.radical K L)
    (hnil : IsNilpotent (LieAlgebra.ad K L x)) : x ∈ nilradical K L := sorry

/-- The internal form of Levi decomposition. The definitive roadmap packages the complement as the
external `LieAlgebra.SemiDirectSum` equivalence consumed by Layer 4. -/
theorem exists_leviComplement [CharZero K] [FiniteDimensional K L] :
    ∃ S : LieSubalgebra K L,
      IsCompl (LieAlgebra.radical K L).toSubmodule S.toSubmodule := sorry

/-- A faithful embedding in a finite-dimensional associative algebra gives a faithful
finite-dimensional representation by left multiplication. -/
theorem ado_of_finiteAssociativeEmbedding {A : Type u} [Ring A] [Algebra K A]
    [FiniteDimensional K A] (f : L →ₗ⁅K⁆ A) (hf : Function.Injective f) :
    ∃ (V : Type u) (_ : AddCommGroup V) (_ : Module K V) (_ : FiniteDimensional K V)
      (ρ : L →ₗ⁅K⁆ Module.End K V), Function.Injective ρ := sorry

/-- The finite-target reduction through the universal enveloping algebra. -/
theorem ado_of_finiteEnvelopingTarget {A : Type u} [Ring A] [Algebra K A]
    [FiniteDimensional K A]
    (q : UniversalEnvelopingAlgebra K L →ₐ[K] A)
    (hq : Function.Injective
      (fun x : L ↦ q (UniversalEnvelopingAlgebra.ι K x))) :
    ∃ (V : Type u) (_ : AddCommGroup V) (_ : Module K V) (_ : FiniteDimensional K V)
      (ρ : L →ₗ⁅K⁆ Module.End K V), Function.Injective ρ := sorry

/-- A faithful finite-dimensional representation and a finite-dimensional associative target
of `U(L)` separating `L` are equivalent. -/
theorem faithfulRepresentation_iff_finiteEnvelopingTarget :
    (∃ (V : Type u) (_ : AddCommGroup V) (_ : Module K V) (_ : FiniteDimensional K V)
        (ρ : L →ₗ⁅K⁆ Module.End K V), Function.Injective ρ) ↔
      ∃ (A : Type u) (_ : Ring A) (_ : Algebra K A) (_ : FiniteDimensional K A)
        (q : UniversalEnvelopingAlgebra K L →ₐ[K] A),
        Function.Injective
          (fun x : L ↦ q (UniversalEnvelopingAlgebra.ι K x)) := sorry

/-! ## Layers 1–3: PBW consequences, weighted nilpotent quotients, and derivations -/

/-- The canonical Lie map into the enveloping algebra is injective. This is a concrete PBW
consequence shared with `../LieHighestWeight`. -/
theorem ι_injective :
    Function.Injective (UniversalEnvelopingAlgebra.ι K (L := L)) := sorry

/-- The underlying linear map of the associative derivation extending a Lie derivation. The definitive
roadmap also requires packaging this in a reusable noncommutative derivation API; Mathlib's current
`Derivation` type is restricted to commutative algebras. -/
noncomputable def envelopingDerivation (D : LieDerivation K L L) :
    UniversalEnvelopingAlgebra K L →ₗ[K] UniversalEnvelopingAlgebra K L := sorry

/-- The extension satisfies the associative Leibniz rule. -/
theorem envelopingDerivation_mul (D : LieDerivation K L L)
    (a b : UniversalEnvelopingAlgebra K L) :
    envelopingDerivation K L D (a * b) =
      envelopingDerivation K L D a * b + a * envelopingDerivation K L D b := sorry

@[simp]
theorem envelopingDerivation_ι (D : LieDerivation K L L) (x : L) :
    envelopingDerivation K L D (UniversalEnvelopingAlgebra.ι K x) =
      UniversalEnvelopingAlgebra.ι K (D x) := sorry

/-- The packaged output of the stable-cofinite-ideal construction. The roadmap decomposes its proof
through the nilradical-generated ideal `B`, the power `J = B^m`, range containment for lifted
derivations, PBW finiteness, and preservation of nilpotence modulo `J`. -/
theorem exists_derivationStable_cofiniteIdeal [CharZero K] [FiniteDimensional K L]
    (I : Ideal (UniversalEnvelopingAlgebra K L)) [I.IsTwoSided]
    (hI : FiniteDimensional K (UniversalEnvelopingAlgebra K L ⧸ I))
    (hnil : ∀ x : L, x ∈ nilradical K L →
      ∃ n : ℕ, (UniversalEnvelopingAlgebra.ι K x) ^ n ∈ I) :
    ∃ J : Ideal (UniversalEnvelopingAlgebra K L),
      J ≤ I ∧ J.IsTwoSided ∧
      FiniteDimensional K (UniversalEnvelopingAlgebra K L ⧸ J) ∧
      (∀ x : L, x ∈ nilradical K L →
        ∃ n : ℕ, (UniversalEnvelopingAlgebra.ι K x) ^ n ∈ J) ∧
      ∀ (D : LieDerivation K L L) {a : UniversalEnvelopingAlgebra K L},
        a ∈ J → envelopingDerivation K L D a ∈ J := sorry

/-- The characteristic-free Birkhoff checkpoint, obtained from a lower-central-series-weighted
PBW truncation: a finite-dimensional nilpotent Lie algebra has a faithful finite-dimensional
representation in which every element acts nilpotently. -/
theorem exists_faithful_nilpotentRepresentation [FiniteDimensional K L]
    [LieRing.IsNilpotent L] :
    ∃ (V : Type u) (_ : AddCommGroup V) (_ : Module K V) (_ : FiniteDimensional K V)
      (ρ : L →ₗ⁅K⁆ Module.End K V),
      Function.Injective ρ ∧ ∀ x : L, IsNilpotent (ρ x) := sorry

/-! ## Layers 5–8: the two characteristic tracks -/

/-- Ado's theorem in characteristic zero, obtained from the derivation-stable extension
construction and Levi decomposition. -/
theorem adoCharZero [CharZero K] [FiniteDimensional K L] :
    ∃ (V : Type u) (_ : AddCommGroup V) (_ : Module K V) (_ : FiniteDimensional K V)
      (ρ : L →ₗ⁅K⁆ Module.End K V), Function.Injective ρ := sorry

/-- Hochschild's strengthening in characteristic zero. This, not `adoCharZero`, is what Layer 9
dispatches on, and it is a separate argument on top of Ado rather than a corollary of it. -/
theorem exists_faithful_preserving_ad_nilpotence_charZero [CharZero K] [FiniteDimensional K L] :
    ∃ (V : Type u) (_ : AddCommGroup V) (_ : Module K V) (_ : FiniteDimensional K V)
      (ρ : L →ₗ⁅K⁆ Module.End K V),
      Function.Injective ρ ∧
        ∀ x : L, IsNilpotent (LieAlgebra.ad K L x) → IsNilpotent (ρ x) := sorry

/-- The load-bearing positive-characteristic construction: every `x` has a monic linearized
`p`-polynomial with zero constant term that is central in `U(L)`. The displayed indexing gives
the leading term exponent `p^e` and lower terms `p^i` for `i : Fin e`; it does not assert that
`e` is minimal. Every exponent is at least `p^0 = 1`, so the element also lies in the
augmentation ideal, which is what Layer 7 needs of it. -/
theorem exists_pCentralPolynomial (p : ℕ) [Fact p.Prime] [CharP K p]
    [FiniteDimensional K L] (x : L) :
    ∃ (e : ℕ) (a : Fin e → K),
      (UniversalEnvelopingAlgebra.ι K x) ^ (p ^ e) +
          ∑ i : Fin e, a i • (UniversalEnvelopingAlgebra.ι K x) ^ (p ^ (i : ℕ)) ∈
        Subalgebra.center K (UniversalEnvelopingAlgebra K L) := sorry

/-- Hochschild's strengthening in characteristic `p`, from the central ideal and Krull
intersection. Here it is the primary theorem and `adoCharP` is its corollary. -/
theorem exists_faithful_preserving_ad_nilpotence_charP (p : ℕ) [Fact p.Prime] [CharP K p]
    [FiniteDimensional K L] :
    ∃ (V : Type u) (_ : AddCommGroup V) (_ : Module K V) (_ : FiniteDimensional K V)
      (ρ : L →ₗ⁅K⁆ Module.End K V),
      Function.Injective ρ ∧
        ∀ x : L, IsNilpotent (LieAlgebra.ad K L x) → IsNilpotent (ρ x) := sorry

/-- The positive-characteristic Ado theorem from the central ideal and Krull intersection. -/
theorem adoCharP (p : ℕ) [Fact p.Prime] [CharP K p] [FiniteDimensional K L] :
    ∃ (V : Type u) (_ : AddCommGroup V) (_ : Module K V) (_ : FiniteDimensional K V)
      (ρ : L →ₗ⁅K⁆ Module.End K V), Function.Injective ρ := sorry

/-! ## Layer 9: the arbitrary-field summit -/

/-- Hochschild's strengthening of Ado–Iwasawa: the faithful representation can preserve
nilpotence detected by the adjoint representation. -/
theorem exists_faithful_preserving_ad_nilpotence [FiniteDimensional K L] :
    ∃ (V : Type u) (_ : AddCommGroup V) (_ : Module K V) (_ : FiniteDimensional K V)
      (ρ : L →ₗ⁅K⁆ Module.End K V),
      Function.Injective ρ ∧
        ∀ x : L, IsNilpotent (LieAlgebra.ad K L x) → IsNilpotent (ρ x) := sorry

/-- **Ado–Iwasawa.** Every finite-dimensional Lie algebra over an arbitrary field admits
a faithful finite-dimensional representation. -/
theorem adoIwasawa [FiniteDimensional K L] :
    ∃ (V : Type u) (_ : AddCommGroup V) (_ : Module K V) (_ : FiniteDimensional K V)
      (ρ : L →ₗ⁅K⁆ Module.End K V), Function.Injective ρ := sorry

/-- The matrix form of the summit, and the shape the Lie-groups roadmap consumes at `K = ℝ`:
every finite-dimensional Lie algebra embeds in some `𝔤𝔩ₙ`. -/
theorem adoIwasawa_matrix [FiniteDimensional K L] :
    ∃ (n : ℕ) (ρ : L →ₗ⁅K⁆ Matrix (Fin n) (Fin n) K), Function.Injective ρ := sorry

end TauCetiRoadmap.RepresentationTheory.AdoIwasawa
