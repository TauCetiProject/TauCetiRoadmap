module

import Mathlib
import TauCeti.Algebra.Octonion.Basic
import TauCeti.NumberTheory.ClassFieldTheory.WeilGroup.Topology

/-!
# The local Langlands correspondence for G₂: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib and
Tau Ceti, the headline theorems of the roadmap that are statable at the pins, each with `sorry`.

Statable and stated here:

* Griess's conjugacy theorem for `G₂` (README §0.0), on the native model of `G₂(ℂ)` as the group
  of multiplicative invertible linear maps of the complex split octonions `TauCeti.Octonion ℂ`:
  two homomorphisms from a group into it whose octonion representations are completely reducible
  and isomorphic are conjugate by one automorphism;
* the unacceptability of `Spin₇(ℂ)` (README §0.8): there are two homomorphisms from a finite
  group to `Spin₇(ℂ)` that are conjugate element by element but not by one element;
* its local form on the Weil group of every nonarchimedean local field of characteristic zero
  (README §0.8; Chenevier–Gan, Proposition 8.3), stated on `TauCeti.ClassFieldTheory.WeilGroup`
  with its Weil topology: the two parameters of the README are trivial on `SL₂(ℂ)` and of finite
  image on `W_F`, so they are homomorphisms of `W_F` with open kernel and finite image. With the
  finite-group form, this is the reason the PGSp₆ correspondence of Layer 10 takes values in weak
  parameter classes.

Not statable at the pins, with what each lacks:

* the local Langlands correspondence for split `G₂` (README §7.1: a surjective finite-to-one map
  `Irr(G₂(F)) → Φ(G₂)` with the discrete, tempered and Langlands-quotient properties, the two
  theta diagrams, the two characterizations and the enhanced fibres): Tau Ceti has the local
  Weil group `W_F` of a nonarchimedean local field (`TauCeti.ClassFieldTheory.WeilGroup`, with
  its degree `weilDegree`), but neither library has Weil–Deligne or `L`-parameters valued in
  `G₂(ℂ)` (continuity on `W_F`, semisimple Frobenius image, algebraicity on `SL₂(ℂ)`, with the
  automorphism group of the octonions as a linear algebraic group), the category of smooth
  representations of `G₂(F)`, or the group `G₂(F)` of a `p`-adic field as a topological group;
* the generic supercuspidal correspondence (README §7.2): the same carriers, and genericity
  (Whittaker functionals) for `G₂(F)`;
* the characterization by `G₂ × GL_r` gamma factors (README §§3.12–3.13): local gamma factors of
  smooth representations and of Weil–Deligne representations;
* detection of the discrete parameters coming from `PGL₃` by a pole at `s = 0` of the standard
  `L`-factor, with component groups `μ₃` and `S₃` (README §0.2), and spin detection: a discrete
  `Spin₇`-valued parameter whose spin `L`-factor has a pole at `s = 0` comes from a unique
  diamond discrete `G₂`-valued parameter, with `S_φ` the component group of its `Spin₇`-image
  modulo the centre (README §0.3): the parameters above with their discreteness (Levi subgroups
  of the complex dual groups), the `L`-factors of Weil–Deligne representations, the component
  groups of centralizers of parameters, and the inclusions `SL₃(ℂ) → G₂(ℂ) → Spin₇(ℂ)`;
* standard injectivity and quadratic-twist rigidity for `G₂`-valued parameters (README
  §§0.4–0.5): the parameters above, and the embedding `G₂(ℂ) → Spin₇(ℂ)` as the stabilizer of a
  nonisotropic spinor (Mathlib has `spinGroup`, and Tau Ceti has the octonions, the vector map
  `CliffordAlgebra.spinToSpecialOrthogonal` and the spin representation `TauCeti.spinRep`, but
  no homomorphism from the octonion automorphism group to `spinGroup` and no invariant quadratic
  form on the spinors); their group-theoretic core is the Griess theorem stated here;
* Chenevier's local factorization criterion and `G₂`-valued Galois lift (README §§0.9–0.10):
  cuspidal automorphic representations of `GL₇` over a number field, their Satake parameters
  and their `ℓ`-adic Galois representations;
* the globalization theorems with a quaternion period, with Whittaker models and with
  spin-regular real weights (README §§1.4–1.7): the adelic quotients `G(k) \ G(𝔸_k)` with their
  `L²` spaces, automorphic and cuspidal representations, period and Whittaker functionals on
  them, the Fell topology on unitary duals of `p`-adic and real groups, and smooth discrete
  series of `G₂` and `PGSp₆` over local fields;
* the local and global spin transfer from generic representations of `PGSp₆` to `GL₈` through
  triality and its comparison of spin gamma factors (README §§2.2–2.5): smooth representations of
  `PGSp₆(F)`, `PGSO₈(F)` and `GL₈(F)`, the classical similitude theta correspondence, Arthur's
  correspondence for `SO₈`, the Langlands–Shahidi spin factor and the Rankin–Selberg factors;
* the Kret–Shin parameters of generic discrete series of `PGSp₆` and of discrete heart
  representations (README §§5.1–5.3, 8.2): `Spin₇`-valued Weil–Deligne parameters, automorphic
  representations of `PGSp₆` and the `GSpin₇`-valued Galois representations attached to them;
* the exceptional spin identity for generic discrete series (README §5.6), the identification of
  each diamond discrete fibre with a distinguished one of Xu's packets (README §6.6) and the
  partial enhanced `PGSp₆` correspondence on diamond orbits (README §7.3): smooth representations
  of `G₂(F)`, `PGSp₆(F)` and `GL₈(F)`, the classical and exceptional theta correspondences and
  Xu's packets;
* the weak local Langlands correspondence for `PGSp₆` (README §10.1) and the description of its
  fibres as unions of Xu packets (README §10.9): the same carriers and the Spin₇-valued
  parameters of `W_F × SL₂(ℂ)`;
* the all-places global–local compatibility (README §3.15): automorphic representations of `G₂`
  over a number field and the Galois representations attached to them.
-/

namespace TauCetiRoadmap.LocalLanglandsCorrespondenceForG2

/-! ## Layer 0: Parameters of G₂ and Spin₇ -/

/-- The complex group `G₂(ℂ)` as the automorphism group of the complex split octonions: the
invertible `ℂ`-linear maps `g` of `TauCeti.Octonion ℂ` with `g (x * y) = g x * g y` for all `x`
and `y`. Such a map fixes the unit and preserves the trace-zero part, on which it acts by the
seven-dimensional representation `v`. -/
def octonionAut : Subgroup (TauCeti.Octonion ℂ ≃ₗ[ℂ] TauCeti.Octonion ℂ) where
  carrier := {g | ∀ x y, g (x * y) = g x * g y}
  one_mem' := fun _ _ => rfl
  mul_mem' := by
    intro a b ha hb x y
    change a (b (x * y)) = a (b x) * a (b y)
    rw [hb, ha]
  inv_mem' := by
    intro a ha x y
    apply a.injective
    change a (a.symm (x * y)) = a (a.symm x * a.symm y)
    rw [ha, LinearEquiv.apply_symm_apply, LinearEquiv.apply_symm_apply,
      LinearEquiv.apply_symm_apply]

/-- The eight-dimensional representation of a group `Γ` on the complex octonions through a
homomorphism `ρ : Γ → G₂(ℂ)`: the direct sum of the trivial line spanned by the unit and the
seven-dimensional representation `v ∘ ρ`. -/
def octonionRep {Γ : Type*} [Group Γ] (ρ : Γ →* octonionAut) :
    Representation ℂ Γ (TauCeti.Octonion ℂ) where
  toFun γ := (ρ γ).val.toLinearMap
  map_one' := by
    rw [map_one]
    rfl
  map_mul' := by
    intro a b
    rw [map_mul]
    rfl

/-- **Griess's conjugacy theorem for `G₂`** (Griess, *Basic conjugacy theorems for G₂*,
Theorem 1, as used in Chenevier, proof of Theorem 6.4, and Harris–Khare–Thorne, proof of
Lemma 4.6). Let `ρ, ρ' : Γ → G₂(ℂ)` be homomorphisms from a group whose octonion representations
are completely reducible. If the two representations are isomorphic, then `ρ'` is the conjugate
of `ρ` by one element of `G₂(ℂ)`. Since both representations contain the trivial line spanned by
the unit, this is the statement for the seven-dimensional representations `v ∘ ρ` and `v ∘ ρ'`. -/
theorem griess_conjugacy {Γ : Type*} [Group Γ] (ρ ρ' : Γ →* octonionAut)
    (hρ : Representation.IsSemisimpleRepresentation (octonionRep ρ))
    (hρ' : Representation.IsSemisimpleRepresentation (octonionRep ρ'))
    (h : ∃ e : TauCeti.Octonion ℂ ≃ₗ[ℂ] TauCeti.Octonion ℂ,
      ∀ γ x, e ((ρ γ).val x) = (ρ' γ).val (e x)) :
    ∃ g : octonionAut, ∀ γ, ρ' γ = g * ρ γ * g⁻¹ := by
  sorry

/-- The standard nondegenerate quadratic form `x₁² + ⋯ + x₇²` on `ℂ⁷`. Its spin group
`spinGroup sumSquaresSeven` is the complex group `Spin₇(ℂ)`, the dual group of `PGSp₆`. -/
noncomputable abbrev sumSquaresSeven : QuadraticForm ℂ (Fin 7 → ℂ) :=
  QuadraticMap.weightedSumSquares ℂ (fun _ : Fin 7 => (1 : ℂ))

/-- **`Spin₇` is unacceptable** (Chenevier–Gan, *Spin(7) is unacceptable*, Example 1 and
Corollary 4.8). There are a finite group `Γ` and two group homomorphisms `r r' : Γ → Spin₇(ℂ)`
such that `r γ` and `r' γ` are conjugate in `Spin₇(ℂ)` for every `γ`, while no single element of
`Spin₇(ℂ)` conjugates `r` to `r'`. The source proves it for the compact form; conjugacy of
compact-valued homomorphisms under the complexification implies conjugacy under the compact form,
and element conjugacy passes from the compact form to `Spin₇(ℂ)`. -/
theorem spin7_not_acceptable :
    ∃ (Γ : Type) (_ : Group Γ) (_ : Finite Γ) (r r' : Γ →* spinGroup sumSquaresSeven),
      (∀ γ, IsConj (r γ) (r' γ)) ∧
        ¬ ∃ g : spinGroup sumSquaresSeven, ∀ γ, r' γ = g * r γ * g⁻¹ := by
  sorry

/-- **`Spin₇` is unacceptable on the Weil group of every `p`-adic field** (Chenevier–Gan,
*Spin(7) is unacceptable*, Proposition 8.3 and its proof). For a nonarchimedean local field `K` of
characteristic zero there are a homomorphism `r : W_K → Spin₇(ℂ)` with open kernel and finite image
and a character `η` of `W_K` with open kernel and values in the centre `{±1}` of `Spin₇(ℂ)` such that
`r w` and `η w * r w` are conjugate in `Spin₇(ℂ)` for every `w`, while no single element of
`Spin₇(ℂ)` conjugates `r` to `η · r`. Extended trivially to `SL₂(ℂ)`, `r` and `η · r` are two
`Spin₇`-valued parameters of `W_K × SL₂(ℂ)` with one weak class and two conjugacy classes. The
source works in the compact form; a finite subgroup of `Spin₇(ℂ)` is conjugate into it, element
conjugacy passes to `Spin₇(ℂ)`, and non-conjugacy passes by the polar decomposition of README §0.8. -/
theorem spin7_not_acceptable_weilGroup (K : Type*) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] [CharZero K] :
    ∃ r η : TauCeti.ClassFieldTheory.WeilGroup K →* spinGroup sumSquaresSeven,
      IsOpen (r.ker : Set (TauCeti.ClassFieldTheory.WeilGroup K)) ∧ Finite r.range ∧
        IsOpen (η.ker : Set (TauCeti.ClassFieldTheory.WeilGroup K)) ∧
        (∀ w, η w ∈ Subgroup.center (spinGroup sumSquaresSeven) ∧ η w * η w = 1) ∧
        (∀ w, IsConj (r w) (η w * r w)) ∧
        ¬ ∃ g : spinGroup sumSquaresSeven, ∀ w, η w * r w = g * r w * g⁻¹ := by
  sorry

end TauCetiRoadmap.LocalLanglandsCorrespondenceForG2
