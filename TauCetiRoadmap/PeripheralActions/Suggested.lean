import Mathlib
import TauCetiRoadmap.ProfiniteArithmetic.Suggested
import TauCeti.Topology.Algebra.Group.Profinite.Free.ProP
import TauCeti.Topology.Algebra.Group.Generation
import TauCetiRoadmap.BelyiMaps.Suggested
import TauCeti.NumberTheory.Padics.PrincipalUnits

set_option autoImplicit false

/-!
# Peripheral actions on free pro-`p` groups: target signatures

**This file is not the roadmap and it is not exhaustive.** The definitive specification is
`README.md`. These declarations pin central names and useful Lean forms; proving every item here
does not by itself complete a layer. `sorry` is allowed in this human-owned roadmap library: these
are goals, not proofs.

The carrier is an abstract profinite group `F` with a marked topological isomorphism
`e : F ≃ₜ* TauCeti.freeProP p (Fin r)` to Tau Ceti's standard free pro-`p` group; the basis is
`basis p e i := e.symm (TauCeti.freeProP.of i)` and the cusp is the inverse of the ordered product
of the basis. Pro-`p` groups, free pro-`p` groups and topological finite generation are Tau Ceti's
(`TauCeti.IsProP`, `TauCeti.freeProP`, `TauCeti.IsTopologicallyFinitelyGenerated`), used directly.
Powers are `ProfiniteArithmetic.padicPow`, automorphisms are `ProfiniteArithmetic.ContinuousAut`,
and the central-series arguments use `ProfiniteArithmetic.closedLowerCentralSeries`. No arithmetic
object appears.
-/

namespace TauCetiRoadmap.PeripheralActions

open TauCetiRoadmap.ProfiniteArithmetic

universe u

section Setup

variable (p : ℕ) [Fact p.Prime] {r : ℕ} {F : Type u} [Group F] [TopologicalSpace F]
  [IsTopologicalGroup F] [CompactSpace F] [TotallyDisconnectedSpace F]

/-! ## Layer 0: peripheral systems -/

/-- **Layer 0.** The basis of `F` transported from the standard model along the marked
isomorphism. -/
noncomputable def basis (e : F ≃ₜ* TauCeti.freeProP p (Fin r)) : Fin r → F :=
  fun i => e.symm (TauCeti.freeProP.of i)

/-- **Layer 0.** The cusp: the inverse of the ordered product of the basis. `List.prod`, not a
`Finset` product, because `F` is not commutative. -/
def cusp (x : Fin r → F) : F := ((List.ofFn x).prod)⁻¹

omit [TopologicalSpace F] [IsTopologicalGroup F] [CompactSpace F] [TotallyDisconnectedSpace F] in
/-- **Layer 0.** The defining relation of the peripheral system. -/
theorem prod_mul_cusp (x : Fin r → F) : (List.ofFn x).prod * cusp x = 1 :=
  mul_inv_cancel _

/-- **Layer 0.** The peripheral tuple `x_0, …, x_{r-1}, cusp x`. -/
def peripheralTuple (x : Fin r → F) : Fin (r + 1) → F :=
  Fin.snoc x (cusp x)

/-- **Layer 0, the predicate.** `φ` is peripheral of exponent `u`: it carries every element of the
peripheral tuple to a conjugate of its `u`-th power. Stated with `IsConj`, so that it is closed
under composition and inversion (Layer 3); the constructive theorems of Layers 2 and 4 supply
conjugators explicitly. -/
def IsPeripheralAut (hF : TauCeti.IsProP p F) (x : Fin r → F) (u : ℤ_[p]ˣ) (φ : ContinuousAut F) :
    Prop :=
  ∀ i : Fin (r + 1),
    IsConj (padicPow p hF (peripheralTuple x i) (u : ℤ_[p])) (φ (peripheralTuple x i))

/-- **Layer 0.** Inner automorphisms are peripheral of exponent one. -/
theorem isPeripheralAut_conj (hF : TauCeti.IsProP p F) (x : Fin r → F) (g : F) :
    IsPeripheralAut p hF x 1 (ContinuousAut.conj F g) :=
  sorry

/-- **Layer 0.** The exponent of a peripheral automorphism of a free pro-`p` group of positive
rank is determined: it is the scalar by which `φ` acts on the topological abelianization. -/
theorem exponent_unique (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin r))
    (hr : 0 < r)
    {u v : ℤ_[p]ˣ} {φ : ContinuousAut F} (hu : IsPeripheralAut p hF (basis p e) u φ)
    (hv : IsPeripheralAut p hF (basis p e) v φ) : u = v :=
  sorry

/-- **Layer 0, nearby false statement.** The diagonal power map `x_i ↦ x_i ^[p] u` is an
automorphism that is peripheral on the basis, but for `r = 3` and a unit `u ≠ 1` it is not
peripheral on the cusp: its value `x_0^u x_1^u x_2^u` on `x_0 x_1 x_2` is not conjugate to
`(x_0 x_1 x_2) ^[p] u`, already modulo `γ_2(F)`. ⚠ The rank-two analogue is false: at `u = -1`
the diagonal map is the inversion of `exists_inversion_two`, which is peripheral. -/
theorem not_isConj_diagonalPow (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin 3))
    (u : ℤ_[p]ˣ)
    (hu : u ≠ 1) :
    ¬ IsConj (padicPow p hF (basis p e 0 * basis p e 1 * basis p e 2) u)
        (padicPow p hF (basis p e 0) u * padicPow p hF (basis p e 1) u *
          padicPow p hF (basis p e 2) u) :=
  sorry

/-! ## Layer 1: the peripheral product identity -/

/-- **Layer 1.2.** The defect `Ψ (c, d)`: the left-hand side of the peripheral product identity
for the conjugators `c` on the basis and `d` on the cusp. -/
noncomputable def peripheralDefect (hF : TauCeti.IsProP p F) (x : Fin r → F) (u : ℤ_[p]ˣ)
    (c : Fin r → F) (d : F) : F :=
  (List.ofFn fun i => (c i)⁻¹ * padicPow p hF (x i) u * c i).prod *
    (d⁻¹ * padicPow p hF (cusp x) u * d)

/-- **Layer 1.2.** The defect is continuous in the conjugators. -/
theorem continuous_peripheralDefect (hF : TauCeti.IsProP p F) (x : Fin r → F) (u : ℤ_[p]ˣ) :
    Continuous (fun cd : (Fin r → F) × F => peripheralDefect p hF x u cd.1 cd.2) :=
  sorry

/-- **Layer 1.2.** The level sets `S n := {(c, d) | Ψ (c, d) ∈ γ_n(F)}`. -/
def peripheralLevel (hF : TauCeti.IsProP p F) (x : Fin r → F) (u : ℤ_[p]ˣ) (n : ℕ) :
    Set ((Fin r → F) × F) :=
  {cd | peripheralDefect p hF x u cd.1 cd.2 ∈ closedLowerCentralSeries F n}

theorem isClosed_peripheralLevel (hF : TauCeti.IsProP p F) (x : Fin r → F) (u : ℤ_[p]ˣ) (n : ℕ) :
    IsClosed (peripheralLevel p hF x u n) :=
  sorry

theorem peripheralLevel_antitone (hF : TauCeti.IsProP p F) (x : Fin r → F) (u : ℤ_[p]ˣ) :
    Antitone (peripheralLevel p hF x u) :=
  sorry

/-- **Layer 1.2, level one.** Every pair lies in `S 1`: the defect dies in the topological
abelianization because `z̄ = -(x̄_0 + ⋯ + x̄_{r-1})`. -/
theorem peripheralLevel_one_eq_univ (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin r))
    (u : ℤ_[p]ˣ) : peripheralLevel p hF (basis p e) u 1 = Set.univ :=
  sorry

/-- **Layer 1.3, the correction step.** A solution modulo `γ_n(F)` lifts to a solution modulo
`γ_{n+1}(F)` by modifying the conjugators by elements of `γ_{n-1}(F)`, leaving `c 0` untouched.
⚠ The unit hypothesis on `u` is used here and only here. -/
theorem exists_mem_peripheralLevel_succ (hF : TauCeti.IsProP p F)
    (e : F ≃ₜ* TauCeti.freeProP p (Fin r))
    (u : ℤ_[p]ˣ) (n : ℕ) (hn : 1 ≤ n) (c : Fin r → F) (d : F)
    (h : (c, d) ∈ peripheralLevel p hF (basis p e) u n) :
    ∃ (c' : Fin r → F) (d' : F),
      (∀ i, c' i ∈ closedLowerCentralSeries F (n - 1)) ∧
      d' ∈ closedLowerCentralSeries F (n - 1) ∧
      (∀ h0 : 0 < r, c' ⟨0, h0⟩ = 1) ∧
      ((fun i => c i * c' i), d * d') ∈ peripheralLevel p hF (basis p e) u (n + 1) :=
  sorry

/-- **Layer 1.4, the peripheral product identity.** For every unit `u` there are conjugators
`c` on the basis, with `c 0 = 1`, and `d` on the cusp, with
`∏_i (c i)⁻¹ (x_i ^[p] u) (c i) · d⁻¹ (z ^[p] u) d = 1`. -/
theorem exists_peripheral_identity (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin r))
    (u : ℤ_[p]ˣ) :
    ∃ (c : Fin r → F) (d : F), (∀ h0 : 0 < r, c ⟨0, h0⟩ = 1) ∧
      peripheralDefect p hF (basis p e) u c d = 1 :=
  sorry

/-- **Layer 1.4, nearby false statement.** For `p = 2`, `r = 2` and the non-unit exponent `2`
the identity is unsolvable already modulo `γ_2(F)`. -/
theorem not_exists_peripheral_identity_two (hF : TauCeti.IsProP 2 F)
    (e : F ≃ₜ* TauCeti.freeProP 2 (Fin 2)) :
    ¬ ∃ (c d : F),
      padicPow 2 hF (basis 2 e 0) 2 * (c⁻¹ * padicPow 2 hF (basis 2 e 1) 2 * c)
        * (d⁻¹ * padicPow 2 hF (cusp (basis 2 e)) 2 * d) ∈ closedLowerCentralSeries F 2 :=
  sorry

/-! ## Layer 2: the peripheral-power theorem -/

/-- **Layer 2, the peripheral-power theorem.** For every unit `u` there is a continuous
automorphism carrying `x_0` to `x_0 ^[p] u` on the nose, every other basis element to a conjugate
of its `u`-th power, and the cusp to a conjugate of its `u`-th power, with all conjugators
displayed. -/
theorem exists_peripheralAut (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin r))
    (u : ℤ_[p]ˣ) :
    ∃ (φ : ContinuousAut F) (c : Fin r → F) (d : F),
      (∀ h0 : 0 < r, c ⟨0, h0⟩ = 1) ∧
      (∀ i, φ (basis p e i) = (c i)⁻¹ * padicPow p hF (basis p e i) u * c i) ∧
      φ (cusp (basis p e)) = d⁻¹ * padicPow p hF (cusp (basis p e)) u * d :=
  sorry

/-- **Layer 2.** The existence statement in predicate form. -/
theorem exists_isPeripheralAut (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin r))
    (u : ℤ_[p]ˣ) : ∃ φ : ContinuousAut F, IsPeripheralAut p hF (basis p e) u φ :=
  sorry

/-- **Layer 2.2, the automorphism criterion.** A continuous endomorphism of `F` sending each
basis element to a conjugate of a unit power of itself is an automorphism, by the Burnside
surjectivity criterion and the Hopf property. -/
theorem exists_continuousAut_of_conj_pow (hF : TauCeti.IsProP p F)
    (e : F ≃ₜ* TauCeti.freeProP p (Fin r))
    (u : ℤ_[p]ˣ) (c : Fin r → F) :
    ∃ φ : ContinuousAut F, ∀ i, φ (basis p e i) = (c i)⁻¹ * padicPow p hF (basis p e i) u * c i :=
  sorry

/-! ## Layer 3: the group of peripheral automorphisms -/

/-- **Layer 3.1.** Peripheral automorphisms are closed under composition, with exponents
multiplying. -/
theorem IsPeripheralAut.mul (hF : TauCeti.IsProP p F) (x : Fin r → F) {u v : ℤ_[p]ˣ}
    {φ ψ : ContinuousAut F} (hφ : IsPeripheralAut p hF x u φ) (hψ : IsPeripheralAut p hF x v ψ) :
    IsPeripheralAut p hF x (u * v) (φ * ψ) :=
  sorry

/-- **Layer 3.1.** Peripheral automorphisms are closed under inversion, with the inverse
exponent. -/
theorem IsPeripheralAut.inv (hF : TauCeti.IsProP p F) (x : Fin r → F) {u : ℤ_[p]ˣ}
    {φ : ContinuousAut F} (hφ : IsPeripheralAut p hF x u φ) :
    IsPeripheralAut p hF x u⁻¹ φ⁻¹ :=
  sorry

/-- **Layer 3.1.** The subgroup of all peripheral automorphisms. -/
def peripheralAut (hF : TauCeti.IsProP p F) (x : Fin r → F) : Subgroup (ContinuousAut F) where
  carrier := {φ | ∃ u : ℤ_[p]ˣ, IsPeripheralAut p hF x u φ}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- **Layer 3.1.** The exponent character, well defined for positive rank. -/
noncomputable def exponent (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin r))
    (hr : 0 < r) :
    peripheralAut p hF (basis p e) →* ℤ_[p]ˣ :=
  sorry

theorem isPeripheralAut_exponent (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin r))
    (hr : 0 < r)
    (φ : peripheralAut p hF (basis p e)) :
    IsPeripheralAut p hF (basis p e) (exponent p hF e hr φ) φ :=
  sorry

/-- **Layer 3.1.** The exponent is surjective: Layer 2. -/
theorem exponent_surjective (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin r))
    (hr : 0 < r) :
    Function.Surjective (exponent p hF e hr) :=
  sorry

/-- **Layer 3.1.** The inner automorphisms lie in the kernel of the exponent. -/
theorem conj_mem_peripheralAut (hF : TauCeti.IsProP p F) (x : Fin r → F) (g : F) :
    ContinuousAut.conj F g ∈ peripheralAut p hF x :=
  sorry

/-- **Layer 3.2, the graph.** The pairs `(φ, u)` with `IsPeripheralAut x u φ` form a closed subset
of `ContinuousAut F × ℤ_pˣ`. For each element `y` of the peripheral tuple, the condition
`IsConj (y ^[p] u) (φ y)` pulls back ProfiniteArithmetic's closed conjugacy relation
`isClosed_isConj_pair` along the continuous map `(φ, u) ↦ (y ^[p] u, φ y)` (`continuous_padicPow`,
`ContinuousAut.continuous_eval`), whose two coordinates both vary; the graph is the intersection
of these `r + 1` closed sets. -/
theorem isClosed_peripheralGraph (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin r)) :
    IsClosed {q : ContinuousAut F × ℤ_[p]ˣ | IsPeripheralAut p hF (basis p e) q.2 q.1} := by
  -- `F` is topologically finitely generated: Tau Ceti's theorem for the standard model,
  -- transported along `e`.
  have hfg : TauCeti.IsTopologicallyFinitelyGenerated F :=
    (TauCeti.isTopologicallyFinitelyGenerated_congr e).2
      (TauCeti.isTopologicallyFinitelyGenerated_freeProP p (Fin r))
  simp only [IsPeripheralAut, Set.ofPred_forall]
  refine isClosed_iInter fun i => ?_
  have hpow : Continuous fun q : ContinuousAut F × ℤ_[p]ˣ =>
      padicPow p hF (peripheralTuple (basis p e) i) (q.2 : ℤ_[p]) :=
    (continuous_padicPow p hF).comp
      (continuous_const.prodMk (Units.continuous_val.comp continuous_snd))
  have heval : Continuous fun q : ContinuousAut F × ℤ_[p]ˣ => q.1 (peripheralTuple (basis p e) i) :=
    (ContinuousAut.continuous_eval F hfg).comp (continuous_fst.prodMk continuous_const)
  exact (isClosed_isConj_pair F).preimage (hpow.prodMk heval)

/-- **Layer 3.2.** The peripheral automorphisms form a closed subgroup for the congruence
topology of ProfiniteArithmetic: the projection of the closed graph along the compact factor
`ℤ_pˣ`. -/
theorem isClosed_peripheralAut (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin r)) :
    IsClosed ((peripheralAut p hF (basis p e) : Set (ContinuousAut F))) :=
  sorry

/-- **Layer 3.2.** The exponent is continuous. The graph of `isClosed_peripheralGraph` is compact,
and for `r > 0` its projection to `peripheralAut` is a continuous bijection (`exponent_unique`) onto
a Hausdorff space, hence a homeomorphism; the exponent is the second projection composed with its
inverse. -/
theorem continuous_exponent (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin r))
    (hr : 0 < r) :
    Continuous (exponent p hF e hr) :=
  sorry

/-- **Layer 3.3, the reflection.** The automorphism with
`x_i ↦ (x_0 ⋯ x_{i-1}) x_i⁻¹ (x_0 ⋯ x_{i-1})⁻¹`, an involution carrying the ordered product of the
basis to its inverse. -/
noncomputable def reflect (hF : TauCeti.IsProP p F)
    (e : F ≃ₜ* TauCeti.freeProP p (Fin r)) : ContinuousAut F :=
  sorry

theorem reflect_basis (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin r)) (i : Fin r) :
    reflect p hF e (basis p e i)
      = (List.ofFn fun j : Fin i => basis p e (Fin.castLE i.2.le j)).prod * (basis p e i)⁻¹ *
          ((List.ofFn fun j : Fin i => basis p e (Fin.castLE i.2.le j)).prod)⁻¹ :=
  sorry

theorem reflect_cusp (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin r)) :
    reflect p hF e (cusp (basis p e)) = (cusp (basis p e))⁻¹ :=
  sorry

theorem reflect_mul_reflect (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin r)) :
    reflect p hF e * reflect p hF e = 1 :=
  sorry

/-- **Layer 3.3.** The reflection is peripheral of exponent `-1`. -/
theorem isPeripheralAut_reflect (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin r)) :
    IsPeripheralAut p hF (basis p e) (-1) (reflect p hF e) :=
  sorry

/-- **Layer 3.3, rank two.** Inverting both generators is peripheral of exponent `-1`, with cusp
conjugator `x_0`. -/
theorem exists_inversion_two (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin 2)) :
    ∃ φ : ContinuousAut F, φ (basis p e 0) = (basis p e 0)⁻¹ ∧ φ (basis p e 1) = (basis p e 1)⁻¹ ∧
      φ (cusp (basis p e)) = (basis p e 0)⁻¹ * (cusp (basis p e))⁻¹ * basis p e 0 :=
  sorry

/-- **Layer 3.3, nearby false statement.** For `r = 3`, inverting every generator is not
peripheral: it carries the cusp to `(x_0⁻¹ x_1⁻¹ x_2⁻¹)⁻¹ = x_2 x_1 x_0`, which is not conjugate to
`(cusp)⁻¹ = x_0 x_1 x_2`, already modulo `γ_2(F)`. -/
theorem not_isConj_inversion_three (hF : TauCeti.IsProP p F)
    (e : F ≃ₜ* TauCeti.freeProP p (Fin 3)) :
    ¬ IsConj ((cusp (basis p e))⁻¹)
        ((basis p e 0)⁻¹ * (basis p e 1)⁻¹ * (basis p e 2)⁻¹)⁻¹ :=
  sorry

/-- **Layer 3.4.** Peripheral up to a permutation `σ` of the peripheral tuple. -/
def IsPeripheralPermAut (hF : TauCeti.IsProP p F) (x : Fin r → F) (σ : Equiv.Perm (Fin (r + 1)))
    (u : ℤ_[p]ˣ) (φ : ContinuousAut F) : Prop :=
  ∀ i : Fin (r + 1),
    IsConj (padicPow p hF (peripheralTuple x (σ i)) (u : ℤ_[p])) (φ (peripheralTuple x i))

/-- **Layer 3.4.** The automorphisms that are peripheral up to a permutation of the peripheral
tuple form a subgroup: the permutations compose and the exponents multiply. -/
def peripheralPermAut (hF : TauCeti.IsProP p F) (x : Fin r → F) : Subgroup (ContinuousAut F) where
  carrier := {φ | ∃ (σ : Equiv.Perm (Fin (r + 1))) (u : ℤ_[p]ˣ), IsPeripheralPermAut p hF x σ u φ}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- **Layer 3.4, uniqueness in rank at least two.** The permutation and the exponent of a
permutation-peripheral automorphism are determined when `r ≥ 2`: in `gr_0(F) ≅ ℤ_p ^ r` any two
distinct classes among `x̄_1, …, x̄_r, z̄` are `ℤ_p`-independent. -/
theorem IsPeripheralPermAut.unique (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin r))
    (hr : 2 ≤ r)
    {σ σ' : Equiv.Perm (Fin (r + 1))} {u u' : ℤ_[p]ˣ} {φ : ContinuousAut F}
    (h : IsPeripheralPermAut p hF (basis p e) σ u φ)
    (h' : IsPeripheralPermAut p hF (basis p e) σ' u' φ) : σ = σ' ∧ u = u' :=
  sorry

/-- **Layer 3.4, nearby false statement.** In rank one the permutation and the exponent are not
determined: the peripheral tuple is `(x, x⁻¹)`, and the automorphism `x ↦ x ^[p] u` is
permutation-peripheral both for `(1, u)` and for `(swap 0 1, -u)`. So `permData` needs `r ≥ 2`. -/
theorem exists_isPeripheralPermAut_swap_rank_one (hF : TauCeti.IsProP p F)
    (e : F ≃ₜ* TauCeti.freeProP p (Fin 1)) (u : ℤ_[p]ˣ) :
    ∃ φ : ContinuousAut F, IsPeripheralPermAut p hF (basis p e) 1 u φ ∧
      IsPeripheralPermAut p hF (basis p e) (Equiv.swap 0 1) (-u) φ :=
  sorry

/-- **Layer 3.4.** For `r ≥ 2`, the permutation and the exponent of a permutation-peripheral
automorphism, as a homomorphism, pinned by `isPeripheralPermAut_permData` together with
`IsPeripheralPermAut.unique`. -/
noncomputable def permData (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin r))
    (_hr : 2 ≤ r) :
    peripheralPermAut p hF (basis p e) →* Equiv.Perm (Fin (r + 1)) × ℤ_[p]ˣ :=
  sorry

theorem isPeripheralPermAut_permData (hF : TauCeti.IsProP p F)
    (e : F ≃ₜ* TauCeti.freeProP p (Fin r))
    (hr : 2 ≤ r) (φ : peripheralPermAut p hF (basis p e)) :
    IsPeripheralPermAut p hF (basis p e) (permData p hF e hr φ).1 (permData p hF e hr φ).2 φ :=
  sorry

/-- **Layer 3.4, rank two.** The swap of the two generators permutes the first two peripheral
classes and conjugates the cusp by `x_0`. -/
theorem exists_swap_two (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin 2)) :
    ∃ φ : ContinuousAut F, φ (basis p e 0) = basis p e 1 ∧ φ (basis p e 1) = basis p e 0 ∧
      φ (cusp (basis p e)) = (basis p e 0)⁻¹ * cusp (basis p e) * basis p e 0 ∧
      IsPeripheralPermAut p hF (basis p e) (Equiv.swap 0 1) 1 φ :=
  sorry

/-- **Layer 3.4, rank two.** The rotation `x_0 ↦ x_1 ↦ cusp ↦ x_0` is peripheral for the
three-cycle, exactly. -/
theorem exists_rotation_two (hF : TauCeti.IsProP p F) (e : F ≃ₜ* TauCeti.freeProP p (Fin 2)) :
    ∃ φ : ContinuousAut F, φ (basis p e 0) = basis p e 1 ∧ φ (basis p e 1) = cusp (basis p e) ∧
      φ (cusp (basis p e)) = basis p e 0 :=
  sorry

/-- **Layer 3.5, the `ℤ_p`-parameterization of the principal units.** Let `k ≥ 1`, with `k ≥ 2`
when `p = 2`, and let `w` be a principal unit of exact level `k`: in `U^(k)` but not in
`U^(k+1)`, where `U^(k)` is Tau Ceti's `TauCeti.unitsPrincipal p k`. Then `l ↦ w ^[p] l` is a
topological isomorphism `Multiplicative ℤ_[p] ≃ₜ* U^(k)`. It is defined because `U^(k)` is pro-`p`
(`TauCeti.isProP_unitsPrincipal`) and onto because `w` topologically generates `U^(k)`
(`TauCeti.topologicalClosure_zpowers_eq_unitsPrincipal`). It is injective because a nonzero
exponent is `p ^ j * v` with `v` a unit (`PadicInt.unitCoeff`, `PadicInt.unitCoeff_spec`, with
`j` the valuation), and `w ^ p ^ j` lies in `U^(k+j)` but not in `U^(k+j+1)`
(`TauCeti.pow_pow_mem_unitsPrincipal`, `TauCeti.pow_pow_notMem_unitsPrincipal`), so it is not `1`,
while unit powers are injective. A continuous bijection from a compact group onto a Hausdorff one,
it is a homeomorphism. The unit `1 + p ^ k` has exact level `k`. -/
noncomputable def principalUnitsEquiv (k : ℕ) (_hk : 0 < k) (_hk₂ : p = 2 → 2 ≤ k) (w : ℤ_[p]ˣ)
    (_hw : w ∈ TauCeti.unitsPrincipal p k) (_hw' : w ∉ TauCeti.unitsPrincipal p (k + 1)) :
    Multiplicative ℤ_[p] ≃ₜ* TauCeti.unitsPrincipal p k :=
  sorry

/-- **Layer 3.5.** The parameterization sends `ofAdd 1` to `w`. This pins it, a continuous
homomorphism out of `Multiplicative ℤ_[p]` being determined by that value. -/
theorem principalUnitsEquiv_ofAdd_one (k : ℕ) (hk : 0 < k) (hk₂ : p = 2 → 2 ≤ k) (w : ℤ_[p]ˣ)
    (hw : w ∈ TauCeti.unitsPrincipal p k) (hw' : w ∉ TauCeti.unitsPrincipal p (k + 1)) :
    principalUnitsEquiv p k hk hk₂ w hw hw' (Multiplicative.ofAdd 1) = ⟨w, hw⟩ :=
  sorry

/-- **Layer 3.5, the section over the principal units.** With `k = 1` for odd `p` and `k = 2`
for `p = 2`, the exponent has a continuous homomorphic section over Tau Ceti's
`U^(k) = TauCeti.unitsPrincipal p k`. It is built inside the pro-`p` closed procyclic subgroup
generated by the `p`-part of one peripheral automorphism of exponent `w`, a unit of exact level
`k`, and composed with the inverse of `principalUnitsEquiv`. ⚠ No section over all of `ℤ_pˣ` is
claimed. -/
theorem exists_section_principalUnits (hF : TauCeti.IsProP p F)
    (e : F ≃ₜ* TauCeti.freeProP p (Fin r))
    (hr : 0 < r) :
    ∃ s : TauCeti.unitsPrincipal p (if p = 2 then 2 else 1) →* peripheralAut p hF (basis p e),
      Continuous s ∧ ∀ v, exponent p hF e hr (s v) = v :=
  sorry

end Setup

/-! ## Layer 4: the dyadic instance -/

section Dyadic

variable {F : Type u} [Group F] [TopologicalSpace F] [IsTopologicalGroup F] [CompactSpace F]
  [TotallyDisconnectedSpace F]

/-- **Layer 4.** `P`, the first generator. -/
noncomputable def periphP (e : F ≃ₜ* TauCeti.freeProP 2 (Fin 2)) : F := basis 2 e 0

/-- **Layer 4.** `T`, the second generator. -/
noncomputable def periphT (e : F ≃ₜ* TauCeti.freeProP 2 (Fin 2)) : F := basis 2 e 1

/-- **Layer 4.** `C := (P * T)⁻¹`, so that `P * T * C = 1`; it is the cusp of the basis. -/
noncomputable def periphC (e : F ≃ₜ* TauCeti.freeProP 2 (Fin 2)) : F := (periphP e * periphT e)⁻¹

omit [IsTopologicalGroup F] [CompactSpace F] [TotallyDisconnectedSpace F] in
theorem periphC_eq_cusp (e : F ≃ₜ* TauCeti.freeProP 2 (Fin 2)) : periphC e = cusp (basis 2 e) := by
  simp [periphC, periphP, periphT, cusp, List.ofFn_succ]

omit [IsTopologicalGroup F] [CompactSpace F] [TotallyDisconnectedSpace F] in
theorem periphP_mul_periphT_mul_periphC (e : F ≃ₜ* TauCeti.freeProP 2 (Fin 2)) :
    periphP e * periphT e * periphC e = 1 := by
  simp [periphC]

/-- **Layer 4, the dyadic peripheral-power theorem in consumer shape.** For every `u ∈ ℤ₂ˣ` an
automorphism and three conjugators, one for each of `P`, `T`, `C`, with `cP = 1`. -/
theorem exists_peripheralPowerAutomorphism_two (hF : TauCeti.IsProP 2 F)
    (e : F ≃ₜ* TauCeti.freeProP 2 (Fin 2))
    (u : ℤ_[2]ˣ) :
    ∃ (φ : ContinuousAut F) (cP cT cC : F), cP = 1 ∧
      φ (periphP e) = cP⁻¹ * padicPow 2 hF (periphP e) u * cP ∧
      φ (periphT e) = cT⁻¹ * padicPow 2 hF (periphT e) u * cT ∧
      φ (periphC e) = cC⁻¹ * padicPow 2 hF (periphC e) u * cC :=
  sorry

/-- **Layer 4, the identity form.** The statement consumed by the `G_{ℚ_2}` formalization: three
conjugators whose conjugates of the `u`-th powers multiply to `1`. -/
theorem exists_peripheral_identity_two (hF : TauCeti.IsProP 2 F)
    (e : F ≃ₜ* TauCeti.freeProP 2 (Fin 2))
    (u : ℤ_[2]ˣ) :
    ∃ cP cT cC : F,
      (cP⁻¹ * padicPow 2 hF (periphP e) u * cP) * (cT⁻¹ * padicPow 2 hF (periphT e) u * cT) *
        (cC⁻¹ * padicPow 2 hF (periphC e) u * cC) = 1 :=
  sorry

/-- **Layer 4, the opposite convention.** The third element `(T * P)⁻¹ = P⁻¹ * C * P` of the
BelyiMaps convention, with the conjugator computed by `conjugation_transfer`. -/
theorem exists_peripheralPowerAutomorphism_two' (hF : TauCeti.IsProP 2 F)
    (e : F ≃ₜ* TauCeti.freeProP 2 (Fin 2)) (u : ℤ_[2]ˣ) :
    ∃ (φ : ContinuousAut F) (cP cT cC' : F),
      φ (periphP e) = cP⁻¹ * padicPow 2 hF (periphP e) u * cP ∧
      φ (periphT e) = cT⁻¹ * padicPow 2 hF (periphT e) u * cT ∧
      φ ((periphT e * periphP e)⁻¹)
        = cC'⁻¹ * padicPow 2 hF ((periphT e * periphP e)⁻¹) u * cC' :=
  sorry

/-- **Layer 4.** The change of convention is the word identity of BelyiMaps, consumed by name. -/
example (e : F ≃ₜ* TauCeti.freeProP 2 (Fin 2)) :
    (periphP e * periphT e)⁻¹ = periphP e * ((periphT e * periphP e)⁻¹) * (periphP e)⁻¹ :=
  TauCetiRoadmap.BelyiMaps.opposite_third_peripheral (periphP e) (periphT e)

/-- **Layer 4, the dyadic section.** A continuous homomorphic section of the exponent over
`1 + 4ℤ₂`, Tau Ceti's `TauCeti.unitsPrincipal 2 2` (which implements ProfiniteProPGroups'
`unitsPrincipal 2`); Layer 3.5 at `p = 2`, with generator `5 = 1 + 2 ^ 2`. -/
theorem exists_section_unitsPrincipal_two (hF : TauCeti.IsProP 2 F)
    (e : F ≃ₜ* TauCeti.freeProP 2 (Fin 2)) :
    ∃ s : TauCeti.unitsPrincipal 2 2 →* peripheralAut 2 hF (basis 2 e),
      Continuous s ∧ ∀ v, exponent 2 hF e (by norm_num) (s v) = v :=
  sorry

end Dyadic

end TauCetiRoadmap.PeripheralActions
