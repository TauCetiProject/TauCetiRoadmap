module

public import Mathlib
public import TauCeti.RepresentationTheory.CharacterTable.VirtualCharacter
public import TauCeti.RepresentationTheory.Induction.ClassFunction

/-!
# The odd order theorem: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, together with the
few definitions needed to state them, and nothing else.

Stated here: the odd order theorem `isSolvable_of_odd_natCard` with its two equivalent forms
`not_isMinimalOddSimple` and `even_natCard_of_nonabelian_simple` (Layers 0 and 6); the existence
of the Dade isometry `exists_dadeExtension` and its agreement with ordinary induction when every
complement is trivial, `isDadeExtension_eq_indClassFunction` (Layer 2, the reusable export); and
the Appendix C comparison `appendixC_prime_le` (Layer 5).

Not statable at the pins, so not stated: the five-type theorem and the supporting-pair alternative
(Peterfalvi (8.8)) and the type-I Frobenius theorem (12.7), which need the carriers `H(M)`, the
Fitting subgroup, `σ(M)` and its Hall core (no Hall subgroups, `π`-cores or Fitting subgroup exist
at the pins; LocalFiniteGroupTheory L1–L2 supply them); the exclusion of the all-type-I case
(12.17), for the same reason; the coherence theorems (5.6), (6.3) and (6.8), whose hypotheses are
an induced family `S(H₁)` of irreducibles with kernel conditions and a subcoherence datum (5.2),
both Layer 2 constructions; Thompson transitivity (Bender–Glauberman 7.6), which needs `SCN₃(P)`
and `O_{p'}`; and the proper-subgroup `p`-length theorem (Bender–Glauberman 10.6), which needs
`p`-length. Each is a README target with its hypotheses.
-/

@[expose] public section

namespace TauCetiRoadmap.OddOrderTheorem

/-! ## Layers 0 and 6: minimal odd simple groups and the odd order theorem -/

variable (G : Type*) [Group G]

/-- A **minimal odd simple group**: a nonabelian simple group of odd order all of whose proper
subgroups are solvable. The conjunction is the standing hypothesis of Peterfalvi Part I §8 and of
Bender–Glauberman Chapter II; none of the local conclusions to be proved is a field. Finiteness is
not a separate field: `Odd (Nat.card G)` already forces `G` finite. -/
structure IsMinimalOddSimple : Prop where
  odd : Odd (Nat.card G)
  simple : IsSimpleGroup G
  nonabelian : ¬ IsMulCommutative G
  proper_solvable : ∀ H : Subgroup G, H ≠ ⊤ → Group.IsSolvable H

/-- There is no minimal odd simple group (Peterfalvi §14, the final contradiction; math-comp
`no_minSimple_odd_group`). -/
theorem not_isMinimalOddSimple [Finite G] : ¬ IsMinimalOddSimple G := sorry

/-- **The odd order theorem** (Feit–Thompson): a finite group of odd order is solvable. -/
theorem isSolvable_of_odd_natCard [Finite G] (hG : Odd (Nat.card G)) :
    Group.IsSolvable G := sorry

/-- A finite nonabelian simple group has even order. -/
theorem even_natCard_of_nonabelian_simple [Finite G] [IsSimpleGroup G]
    (hG : ¬ IsMulCommutative G) : Even (Nat.card G) := sorry

/-! ## Layer 2: Dade isometries -/

section Dade

variable {G}
open scoped Pointwise

/-- **Dade data** for a subgroup `L` and a subset `A ⊆ L \ {1}` (Peterfalvi Definition (2.2);
Feit–Thompson Definition 9.1, "tamely imbedded"): `A` is `L`-invariant, `L` controls `G`-fusion
in `A`, and for each `a ∈ A` the complement `H a` is a normal subgroup of `C_G(a)` with
`C_G(a) = H a ⋊ C_L(a)` and `|H a|` prime to `|C_L(b)|` for every `b ∈ A`. -/
structure DadeDatum (L : Subgroup G) (A : Set G) (H : G → Subgroup G) : Prop where
  subset : A ⊆ (L : Set G) \ {1}
  invariant : ∀ a ∈ A, ∀ l ∈ L, l * a * l⁻¹ ∈ A
  fusion : ∀ a ∈ A, ∀ b ∈ A, IsConj a b → ∃ l ∈ L, l * a * l⁻¹ = b
  centralizer : ∀ a ∈ A, H a ≤ Subgroup.centralizer {a}
  normal : ∀ a ∈ A, ((H a).subgroupOf (Subgroup.centralizer {a})).Normal
  disjoint : ∀ a ∈ A, H a ⊓ (L ⊓ Subgroup.centralizer {a}) = ⊥
  product : ∀ a ∈ A,
    (H a : Set G) * ((L ⊓ Subgroup.centralizer {a} : Subgroup G) : Set G) =
      (Subgroup.centralizer {a} : Set G)
  coprime : ∀ a ∈ A, ∀ b ∈ A,
    Nat.Coprime (Nat.card (H a))
      (Nat.card ↥(L ⊓ Subgroup.centralizer {b} : Subgroup G))

/-- `CF(L, A)`: the class functions of `L` vanishing outside `A`, as a submodule of the native
`TauCeti.ClassFunction ℂ L`. -/
def supportedClassFunctions (L : Subgroup G) (A : Set G) :
    Submodule ℂ (TauCeti.ClassFunction ℂ L) where
  carrier := {f | ∀ x : L, (x : G) ∉ A → f.val x = 0}
  zero_mem' := by intro x _; rfl
  add_mem' := by
    intro f h hf hh x hx
    change f.val x + h.val x = 0
    rw [hf x hx, hh x hx, add_zero]
  smul_mem' := by
    intro c f hf x hx
    change c * f.val x = 0
    rw [hf x hx, mul_zero]

/-- `T` is **the Dade isometry** of the data `(L, A, H)` (Peterfalvi Definition (2.5) and (2.6)):
it preserves the normalized Hermitian pairing, it takes the value `f a` on every conjugate of
`a * u` with `a ∈ A` and `u ∈ H a`, and it carries virtual characters to virtual characters.
The first two clauses determine `T`: the Dade map itself satisfies them, and a map agreeing with
it on the Dade support and of the same norm vanishes off that support. -/
def IsDadeExtension [Fintype G] (L : Subgroup G) [Fintype L] (A : Set G) (H : G → Subgroup G)
    (T : supportedClassFunctions L A →ₗ[ℂ] TauCeti.ClassFunction ℂ G) : Prop :=
  (∀ f h : supportedClassFunctions L A,
      (Nat.card G : ℂ)⁻¹ * ∑ g : G, (T f).val g * starRingEnd ℂ ((T h).val g) =
        (Nat.card L : ℂ)⁻¹ * ∑ l : L, f.val.val l * starRingEnd ℂ (h.val.val l)) ∧
  (∀ (f : supportedClassFunctions L A) (a : L), (a : G) ∈ A → ∀ u ∈ H a, ∀ g : G,
      (T f).val (g⁻¹ * (a * u) * g) = f.val.val a) ∧
  (∀ f : supportedClassFunctions L A, (f.val : L → ℂ) ∈ TauCeti.virtualCharacters ℂ L →
      (T f : G → ℂ) ∈ TauCeti.virtualCharacters ℂ G)

/-- **The Dade isometry exists** (Peterfalvi Definition (2.5), (2.6)(a) and (2.6)(b)). -/
theorem exists_dadeExtension [Fintype G] (L : Subgroup G) [Fintype L]
    (A : Set G) (H : G → Subgroup G) (hD : DadeDatum L A H) :
    ∃ T : supportedClassFunctions L A →ₗ[ℂ] TauCeti.ClassFunction ℂ G,
      IsDadeExtension L A H T := sorry

/-- **The Dade isometry is ordinary induction when every complement is trivial** (Peterfalvi
(2.3) and the supplement to (2.6)(a); Isaacs, Lemma 7.7): under Dade data with `H a = ⊥` for all
`a ∈ A`, the Dade isometry agrees on `CF(L, A)` with the native `Subgroup.indClassFunction L`
(and a nonempty such `A` is a trivial-intersection set with normalizer `L`). This is the export
the Brauer–Suzuki argument consumes. -/
theorem isDadeExtension_eq_indClassFunction [Fintype G] (L : Subgroup G) [Fintype L]
    (A : Set G) (H : G → Subgroup G) (hD : DadeDatum L A H) (hH : ∀ a ∈ A, H a = ⊥)
    (T : supportedClassFunctions L A →ₗ[ℂ] TauCeti.ClassFunction ℂ G)
    (hT : IsDadeExtension L A H T) (f : supportedClassFunctions L A) :
    T f = Subgroup.indClassFunction L f.val := sorry

end Dade

/-! ## Layer 5: the Appendix C comparison -/

/-- **Bender–Glauberman, Appendix C, Theorem C.** Let `p`, `q` be primes, `F` a field of order
`p ^ q`, and suppose `(p ^ q − 1)/(p − 1)` is prime to `p − 1`. Inside a finite group `G`, let `P`
be a copy of `(F, +)` and `U` a copy of the norm-one subgroup `rootsOfUnity ((p ^ q − 1)/(p − 1)) F`
of `Fˣ`, with `P ⊓ U = ⊥` and `U` acting on `P` by conjugation as multiplication of scalars. Let
`Q` be an abelian subgroup of order prime to `p`, normalized by the prime-field line `P₀ ⊆ P`, and
let `y ∈ Q` conjugate `P₀` into the normalizer of `U`. Then `p ≤ q`. -/
theorem appendixC_prime_le [Finite G] {F : Type*} [Field F] [Finite F] {p q : ℕ}
    [CharP F p] [Algebra (ZMod p) F]
    (hp : p.Prime) (hq : q.Prime) (hcard : Nat.card F = p ^ q)
    (hcop : Nat.Coprime ((p ^ q - 1) / (p - 1)) (p - 1))
    (P U Q : Subgroup G) (Pe : Multiplicative F ≃* P)
    (Ue : rootsOfUnity ((p ^ q - 1) / (p - 1)) F ≃* U)
    (hPU : P ⊓ U = ⊥)
    (hact : ∀ (z : F) (w : rootsOfUnity ((p ^ q - 1) / (p - 1)) F),
      (Ue w : G)⁻¹ * (Pe (Multiplicative.ofAdd z) : G) * (Ue w : G) =
        (Pe (Multiplicative.ofAdd (z * ((w : Fˣ) : F))) : G))
    (hQab : ∀ x ∈ Q, ∀ z ∈ Q, x * z = z * x)
    (hQp : Nat.Coprime (Nat.card Q) p)
    (hQnorm : ∀ r : ZMod p,
      (Pe (Multiplicative.ofAdd (algebraMap (ZMod p) F r)) : G) ∈
        Subgroup.normalizer (Q : Set G))
    (y : Q) (hUnorm : ∀ r : ZMod p,
      (y : G)⁻¹ * (Pe (Multiplicative.ofAdd (algebraMap (ZMod p) F r)) : G) * (y : G) ∈
        Subgroup.normalizer (U : Set G)) : p ≤ q := sorry

end TauCetiRoadmap.OddOrderTheorem
