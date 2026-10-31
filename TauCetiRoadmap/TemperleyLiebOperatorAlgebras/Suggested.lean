/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Algebra.TemperleyLieb.MarkovTrace
import TauCeti.Algebra.MonoidAlgebra.Twisted.Basic

/-!
# Temperley–Lieb operator algebras: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions those statements need; every definition has a real body on a native carrier.

Statable at the pins:

* Layer 1's finite realisations of the tower: the Potts–Fortuin–Kasteleyn identity of 1.6
  (`pottsPartition_eq_fkPartition`); the identification of the Jones quotient at `δ = √3`
  with the inversion-fixed subalgebra of the cubic quantum torus
  (1.8, `exists_cubicFixedModel`), and the finiteness of the Gaussian braid image (1.8,
  `finite_gaussianBraid_closure`). The cubic identification is stated as the existence of the
  comparison map with its generator values, its surjectivity, the trace identity and the kernel
  `R_m = {x : ∀ y, T_m(x y) = 0}`; the map is unique by `TemperleyLieb.hom_ext`, and the trace
  radical is written out because Subfactors 3.2's `R_m` is not at the pins. The cubic quantum torus
  is Tau Ceti's `twistedMonoidAlgebra` for the factor set `cubicFactor`, whose cocycle identity is
  proved here (`cubicFactor_isFactorSet`) so that the carrier exists without any admission.
* Layer 2's positivity theorem at negative loop parameters (`markovTrace_neg_one_pow_nonneg_iff`):
  for `δ < 0` the signed closure forms `(-1)^n T_n(x† x)` are nonnegative at every level exactly
  when `|δ|` is a Jones loop parameter. It is stated on Tau Ceti's presentation
  `TauCeti.TemperleyLieb ℂ δ n` with its Markov trace, for an arbitrary conjugate-linear star fixing
  the generators, which Subfactors 3.1 constructs and proves unique. The positive-parameter theorem
  itself, `markovTrace_nonneg_iff`, is Subfactors 3.2's headline and is not restated here.

Not statable at the pins:

* 1.5's comparison of the Powers product state with the trace-GNS representation of `B_δ`: it needs
  VonNeumannAlgebras V2's incomplete tensor products and Subfactors 3.3's `B_δ`, neither at the
  pins. Its finite identity `T_m = δ^m φ_m ∘ spinRep` is a 1.5 target and a rewriting of Tau
  Ceti's `markovTrace_apply`, not a headline.
* 1.6's loop and six-vertex identities `Z_FK = δ^|V_G| Z_ice`: no evaluation of medial networks
  and no incidence-subdivision adapter for `BipartiteRibbonGraph` exist at the pins.
* The adjoint, inclusion and block compatibilities of 1.7 and 1.8: no analytic adjoint exists on
  `TauCeti.TemperleyLieb`, on `CliffordAlgebra` or on the twisted monoid algebra at the pins
  (Subfactors 3.1 and SpinGeometry G1 construct them), and the block decompositions need
  SpinRepresentations Layer 1 and the path model of Subfactors 3.3.
* Layer 1's comparisons 1.1–1.4 (the analytic adjoint against the vertical reflection of diagrams,
  the Hermitian cell forms against the bilinear cell forms, the trace radical against the
  negligible ideal, the path model against the block idempotents): they need the diagram category,
  cell modules, Jones–Wenzl projections and negligible ideal of TemperleyLieb Layers 3–7, none of
  which exist at the pins.
* Layer 2's Bratteli-diagram presentation of the Jones tower: it needs Subfactors 3.3's
  C*-inductive limit `B_δ` and CStarClassification CL2's Bratteli diagrams, neither at the pins.
* Layer 3's unitary Temperley–Lieb category and its C*-tensor and unitary-duality axioms: they
  need the diagram category and CategoricalOperatorAlgebras CA1a and CA2a.
* Layer 4's affine classification and affine Gram determinant: no affine diagram category or
  algebra exists at the pins.
-/

noncomputable section

open scoped ComplexOrder

namespace TauCetiRoadmap.TemperleyLiebOperatorAlgebras

open TauCeti TauCeti.TemperleyLieb

/-! ## Layer 1: Hermitian structure on the diagram side -/

section PottsFortuinKasteleyn

variable {V E R : Type*} [CommSemiring R]

/-- **The Potts partition function** `Z_Potts(G; q, v)` of a graph `G` (Mathlib's `Graph V E`, loops
and parallel edges allowed) with finite vertex and edge sets, `q` colours and edge weights `v`: the
sum over the colourings `σ` of the vertices by `Fin q` of the product over the edges `e` of
`1 + v_e` when the two ends of `e` receive the same colour and `1` otherwise. The condition "the
ends of `e` have the same colour" is quantified over all pairs linked by `e`, so a loop always
contributes `1 + v_e`. For `q = 0` and at least one vertex the sum is empty (1.6). -/
def pottsPartition (G : Graph V E) [Fintype G.vertexSet] [Fintype G.edgeSet] (q : ℕ)
    (v : G.edgeSet → R) : R := by
  classical
  exact ∑ σ : G.vertexSet → Fin q, ∏ e : G.edgeSet,
    (1 + if ∀ u w : G.vertexSet, G.IsLink e u w → σ u = σ w then v e else 0)

/-- **The Fortuin–Kasteleyn (random-cluster) partition function** `Z_FK(G; Q, v)`: the sum over
the edge subsets `A ⊆ E_G` of `Q^k(A) Π_(e ∈ A) v_e`, where `k(A)` is the number of connected
components of the spanning restriction `G.restrict A` (every vertex kept, isolated vertices
counted), computed as `Nat.card` of the connected components of its simple graph; passing to the
simple graph is used for connectivity only (1.6, GraphConnectivityAndFlows 1.1). -/
def fkPartition (G : Graph V E) [Fintype G.vertexSet] [Fintype G.edgeSet] (Q : R)
    (v : G.edgeSet → R) : R := by
  classical
  exact ∑ A : Finset G.edgeSet,
    Q ^ Nat.card
        (G.restrict (Subtype.val '' (A : Set G.edgeSet))).toSimpleGraph.ConnectedComponent *
      ∏ e ∈ A, v e

/-- **The Potts–Fortuin–Kasteleyn identity.** For every graph `G` with finite vertex and edge
sets, every number of colours `q : ℕ` (including `q = 0`) and all weights `v` in a commutative
semiring, `Z_Potts(G; q, v) = Z_FK(G; q, v)`: expand the product over edge subsets and count the
colourings constant on the components of each `G.restrict A` (1.6; Fortuin–Kasteleyn). -/
theorem pottsPartition_eq_fkPartition (G : Graph V E) [Fintype G.vertexSet] [Fintype G.edgeSet]
    (q : ℕ) (v : G.edgeSet → R) :
    pottsPartition G q v = fkPartition G (q : R) v := by
  sorry

end PottsFortuinKasteleyn

/- The finite algebraic even-Clifford model is supplied by GeometricTopology.
This roadmap constructs its analytic-adjoint and positive-quotient comparisons. -/

section CubicQuantumTorus

/-- The chain form `B(a, b) = Σ_(j < N−1) (a_j b_(j+1) − a_(j+1) b_j)` on `V_N = Fin N → ZMod 3`,
alternating and biadditive; its radical is zero for even `N` and spanned by `(1, 0, 1, 0, …, 1)`
for odd `N` (1.8). -/
def chainForm (N : ℕ) (a b : Fin N → ZMod 3) : ZMod 3 :=
  ∑ i : Fin N, ∑ j : Fin N, if (i : ℕ) + 1 = j then a i * b j - b i * a j else 0

/-- `ω = exp(2πi/3)`, as a unit of `ℂ` (1.8). -/
def cubeRootOfUnity : ℂˣ :=
  Units.mk0 (Complex.exp (2 * Real.pi / 3 * Complex.I)) (Complex.exp_ne_zero _)

/-- `ω^x` for an exponent `x : ZMod 3`, read through `ZMod.val`; additive in `x` because
`ω³ = 1` (1.8). -/
def cubeRootPow (x : ZMod 3) : ℂˣ := cubeRootOfUnity ^ x.val

/-- The factor set `α(a, b) = ω^(2 B(a, b))` of the cubic quantum torus, exponents read in
`ZMod 3`; `α(a, b)/α(b, a) = ω^(B(a,b))`, so `U_j U_(j+1) = ω U_(j+1) U_j` (1.8). -/
def cubicFactor (N : ℕ) (a b : Multiplicative (Fin N → ZMod 3)) : ℂˣ :=
  cubeRootPow (2 * chainForm N a.toAdd b.toAdd)

/-- `cubicFactor N` is a normalised factor set: the cocycle identity follows from the
biadditivity of `chainForm` and `ω³ = 1`, and the normalisations from `B(0, b) = B(a, 0) = 0`
(1.8). -/
instance cubicFactor_isFactorSet (N : ℕ) : IsFactorSet (cubicFactor N) := by
  have h3 : cubeRootOfUnity ^ 3 = 1 := by
    ext
    simp only [Units.val_pow_eq_pow_val, cubeRootOfUnity, Units.val_mk0, Units.val_one]
    rw [← Complex.exp_nat_mul]
    convert Complex.exp_two_pi_mul_I using 2
    push_cast
    ring
  have hadd : ∀ x y : ZMod 3, cubeRootPow (x + y) = cubeRootPow x * cubeRootPow y := by
    intro x y
    simp only [cubeRootPow, ZMod.val_add]
    rw [← pow_add, ← pow_eq_pow_mod _ h3]
  have hleft : ∀ a b c : Fin N → ZMod 3,
      chainForm N (a + b) c = chainForm N a c + chainForm N b c := by
    intro a b c
    unfold chainForm
    rw [← Finset.sum_add_distrib]
    refine Finset.sum_congr rfl fun i _ ↦ ?_
    rw [← Finset.sum_add_distrib]
    refine Finset.sum_congr rfl fun j _ ↦ ?_
    simp only [Pi.add_apply]
    split_ifs <;> ring
  have hright : ∀ a b c : Fin N → ZMod 3,
      chainForm N a (b + c) = chainForm N a b + chainForm N a c := by
    intro a b c
    unfold chainForm
    rw [← Finset.sum_add_distrib]
    refine Finset.sum_congr rfl fun i _ ↦ ?_
    rw [← Finset.sum_add_distrib]
    refine Finset.sum_congr rfl fun j _ ↦ ?_
    simp only [Pi.add_apply]
    split_ifs <;> ring
  refine ⟨fun g h j ↦ ?_, fun g ↦ ?_, fun g ↦ ?_⟩
  · simp only [cubicFactor, toAdd_mul, ← hadd]
    congr 1
    rw [hleft, hright]
    ring
  · simp [cubicFactor, chainForm, cubeRootPow]
  · simp [cubicFactor, chainForm, cubeRootPow]

/-- **The cubic quantum torus** `G_N`: Tau Ceti's twisted monoid algebra of `(ZMod 3)^N` for the
factor set `cubicFactor N`, of dimension `3^N`, with basis `W(a)` and `W(a) W(b) = α(a, b) W(a+b)`
(1.8). -/
abbrev CubicTorus (N : ℕ) :=
  twistedMonoidAlgebra ℂ (Multiplicative (Fin N → ZMod 3)) (cubicFactor N)

/-- The basis element `W(a) = TwistedMonoidAlgebra.of a` of `G_N` (1.8). -/
def weyl (N : ℕ) (a : Multiplicative (Fin N → ZMod 3)) : CubicTorus N :=
  TwistedMonoidAlgebra.of a

/-- The scalar coefficient `s_N(x)`: the coefficient of `W(0) = 1` in the basis of `G_N`. It is a
faithful normalised trace, `s_N(x† x) = Σ_a |x_a|²` (1.8). -/
def cubicScalarCoefficient (N : ℕ) (x : CubicTorus N) : ℂ :=
  (TwistedMonoidAlgebra.basis ℂ (Multiplicative (Fin N → ZMod 3)) (cubicFactor N)).repr x 1

/-- The inversion `θ_N : W(a) ↦ W(−a)`, a complex-linear algebra endomorphism of `G_N` (an
involution, hence an automorphism) by `TwistedMonoidAlgebra.lift`, since
`α(−a, −b) = α(a, b)` (1.8). -/
def cubicInversion (N : ℕ) : CubicTorus N →ₐ[ℂ] CubicTorus N :=
  TwistedMonoidAlgebra.lift (fun a ↦ weyl N a⁻¹)
    ((congrArg (TwistedMonoidAlgebra.of (α := cubicFactor N))
      (inv_one : (1 : Multiplicative (Fin N → ZMod 3))⁻¹ = 1)).trans
        TwistedMonoidAlgebra.of_one) fun g h ↦ by
    have hneg : ∀ a b : Fin N → ZMod 3, chainForm N (-a) (-b) = chainForm N a b := by
      intro a b
      unfold chainForm
      refine Finset.sum_congr rfl fun i _ ↦ Finset.sum_congr rfl fun j _ ↦ ?_
      split_ifs
      · exact congrArg₂ _ (neg_mul_neg _ _) (neg_mul_neg _ _)
      · rfl
    have hfactor : cubicFactor N g⁻¹ h⁻¹ = cubicFactor N g h := by
      rw [cubicFactor, cubicFactor, toAdd_inv, toAdd_inv, hneg]
    simp only [weyl]
    rw [TwistedMonoidAlgebra.of_mul_of, hfactor]
    exact congrArg (fun x ↦ (cubicFactor N g h : ℂ) • TwistedMonoidAlgebra.of x) (mul_inv g h).symm

/-- **The inversion-fixed subalgebra** `C_N = {x ∈ G_N : θ_N x = x}`, with basis `1` and
`W(a) + W(−a)` over the pairs `{a, −a}` with `a ≠ 0`, of dimension `(3^N + 1)/2` (1.8). -/
def cubicFixed (N : ℕ) : Subalgebra ℂ (CubicTorus N) :=
  AlgHom.equalizer (cubicInversion N) (AlgHom.id ℂ (CubicTorus N))

/-- The site unitaries `U_j = W(e_j)`: `U_j³ = 1`, `U_j U_(j+1) = ω U_(j+1) U_j`, commuting at
distance at least two (1.8). -/
def cubicSite (N : ℕ) (j : Fin N) : CubicTorus N :=
  weyl N (Multiplicative.ofAdd (Pi.single j 1))

/-- The projections `p_j = (1 + U_j + U_j²)/3`, fixed by `θ_N`, with `p_j p_(j±1) p_j = p_j/3`;
`E_j = √3 p_j` are the Temperley–Lieb generators at `δ = √3` (1.8). -/
def cubicProjection (N : ℕ) (j : Fin N) : CubicTorus N :=
  (3 : ℂ)⁻¹ • (1 + cubicSite N j + cubicSite N j ^ 2)

/-- **The Jones quotient at `δ = √3` is the inversion-fixed cubic quantum torus** (Jones, printed
p. 107). Let `q` be a unit with `√3 = −(q + q⁻¹)`. There is an algebra map
`F_m : TL_m(√3) → C_(m−1)` with `F_m(e_j) = √3 p_j` (unique by `TemperleyLieb.hom_ext`), which is
surjective, satisfies `T_m(x) = (√3)^m s_(m−1)(F_m x)` for every `x`, and whose kernel is the
trace radical `R_m = {x : ∀ y, T_m(x y) = 0}`; so `F_m` induces `Q_m ≅ C_(m−1)`, of dimension
`(3^(m−1) + 1)/2`. At `m = 0` the index `m − 1` is `0` and both sides are `ℂ`. The compatibility
with the analytic adjoint and with the strand inclusions is a 1.8 target not statable at the
pins. -/
theorem exists_cubicFixedModel (m : ℕ) (q : ℂˣ)
    (hq : (Real.sqrt 3 : ℂ) = -((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ))) :
    ∃ F : TemperleyLieb ℂ (Real.sqrt 3 : ℂ) m →ₐ[ℂ] cubicFixed (m - 1),
      (∀ j : Fin (m - 1),
        (F (e (Real.sqrt 3 : ℂ) j) : CubicTorus (m - 1)) =
          (Real.sqrt 3 : ℂ) • cubicProjection (m - 1) j) ∧
      Function.Surjective F ∧
      (∀ x, markovTrace q hq x =
        (Real.sqrt 3 : ℂ) ^ m * cubicScalarCoefficient (m - 1) (F x)) ∧
      (∀ x, F x = 0 ↔ ∀ y, markovTrace q hq (x * y) = 0) := by
  sorry

/-- `u = exp(πi/6)`, Jones's square root of `t = ζ = exp(πi/3)` (1.8). -/
def twelfthRootOfUnity : ℂ := Complex.exp (((Real.pi / 6 : ℝ) : ℂ) * Complex.I)

/-- The Gaussian braid generators `g_j = u((1 + ζ) p_j − 1)`, `ζ = u²`: unitaries of `C_N` with
eigenvalues `i` on `p_j` and `−u` on `1 − p_j`, so `g_j³ = −i` and `g_j^12 = 1`; they satisfy the
braid relations and `F_m(jonesUnit a j) = (−a/u) g_j` for `a² = −u⁻¹` (1.8). -/
def gaussianBraidGenerator (N : ℕ) (j : Fin N) : CubicTorus N :=
  twelfthRootOfUnity • ((1 + twelfthRootOfUnity ^ 2) • cubicProjection N j - 1)

/-- **The Gaussian braid image is finite** (Jones, printed p. 107; Galindo–Rowell,
Proposition 3.6). The `g_j` are units of `G_N`, and the subgroup they generate, the image of
`BraidGroup (N+1)` under `F_(N+1) ∘ jones a`, is finite: conjugation by the `g_j` permutes the
finite Heisenberg group `{ω^c W(a)}`, which spans `G_N`, and the kernel of that action is central
with a bounded order on every simple block (1.8). -/
theorem finite_gaussianBraid_closure (N : ℕ) :
    ∃ g : Fin N → (CubicTorus N)ˣ,
      (∀ j, (g j : CubicTorus N) = gaussianBraidGenerator N j) ∧
        Finite (Subgroup.closure (Set.range g)) := by
  sorry

end CubicQuantumTorus

/-! ## Layer 2: Sign isomorphism and negative loop parameters -/

/-- **Positivity at negative loop parameters.** Let `δ < 0` be real and let `q` be a unit with
`δ = -(q + q⁻¹)`, the sign convention of `TauCeti.TemperleyLieb.markovTrace`. Give each
`TL_n(ℂ, δ)` a conjugate-linear star-ring structure fixing the generators (Subfactors 3.1
constructs it and proves it unique). Then the signed closure forms `(-1)^n T_n(x† x)` are real
and nonnegative for every `n` and every `x` exactly when `|δ| = -δ` lies in the Jones loop
parameters `{2cos(π/m) : m ≥ 3} ∪ [2,∞)`. The sign isomorphism `TL_n(δ) ≅ TL_n(-δ)`,
`e_i ↦ -e_i`, carries `T_n^δ` to `(-1)^n T_n^(-δ)`, and the theorem then reduces to Subfactors
3.2's `markovTrace_nonneg_iff` at the parameter `-δ > 0`. The sign of the trace is Penneys,
*Unitary Quantum Symmetries Lite*, Chapter 4, Facts 4.4.14 (TB6), printed p. 155. -/
theorem markovTrace_neg_one_pow_nonneg_iff {δ : ℝ} (hδ : δ < 0) (q : ℂˣ)
    (hq : (δ : ℂ) = -((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ)))
    [∀ n, StarRing (TemperleyLieb ℂ (δ : ℂ) n)] [∀ n, StarModule ℂ (TemperleyLieb ℂ (δ : ℂ) n)]
    (he : ∀ (n : ℕ) (i : Fin (n - 1)), star (e (δ : ℂ) i) = e (δ : ℂ) i) :
    (∀ (n : ℕ) (x : TemperleyLieb ℂ (δ : ℂ) n),
        0 ≤ (-1 : ℂ) ^ n * markovTrace q hq (star x * x)) ↔
      (∃ m : ℕ, 3 ≤ m ∧ -δ = 2 * Real.cos (Real.pi / m)) ∨ 2 ≤ -δ := by
  sorry

end TauCetiRoadmap.TemperleyLiebOperatorAlgebras

end
