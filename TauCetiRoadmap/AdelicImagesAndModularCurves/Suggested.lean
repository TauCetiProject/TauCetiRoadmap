module

import Mathlib
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Ring
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.ZMod
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Component
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Units
import TauCeti.Algebra.Module.Torsion.TateModule
import TauCeti.AlgebraicGeometry.EllipticCurve.TateModule.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Basic
import TauCeti.NumberTheory.ModularForms.CongruenceSubgroups.Basic
import TauCeti.LinearAlgebra.Matrix.SpecialLinearGroup.Basic

/-!
# Adelic Galois images and modular curves `X_H`: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. This file states what can be stated over Mathlib and the pinned Tau Ceti: the
carrier `GL₂(Ẑ)` with its reductions and the inverse-limit property, open subgroups with their
level, index, `±H`, `Γ₀(N)`, `Γ_H` and genus data, Serre's lifting theorem, the commutator
subgroup of `GL₂(Ẑ)`, twists and Gassmann invariance, the rank of the adelic Tate module, the size
of an isogeny class, Mazur's torsion theorem with the realisation of all fifteen groups, the
class-size corollary of Kenku's theorem, and the order of `GSp₄(𝔽_ℓ)`. The coset invariants of a
finite-index subgroup of `PSL₂(ℤ)` (cusp widths, elliptic counts, the integral genus formula and
its Riemann-surface comparison) are the noncongruence roadmap's and are not restated; the
definitions `nu2`, `nu3`, `Cusps` and `genus` below read them on `Γ_{±H}` only to state the twist
and Gassmann invariance theorems. `sorry` is permitted for proofs in
this human-owned repository: these are targets, not implementations.

**Targets not stated here, and the carrier each one lacks at the pin.** The finite-group
definitions of Layers 0–2 left to `README.md` (the Cartan subgroups of composite level and of an
imaginary quadratic order, rational cusps and cusp orbits, the entanglement index, the subgroups
`S_χ`, agreeable closures, isogeny orbits) are definitions over the carriers used below, specified
with their Checks in `README.md`. The arithmetic and moduli headlines need carriers that do not
exist at the pin:
- the adelic representation `ρ_E`, its image as a conjugacy class, its level, index and
  non-maximal primes, Serre curves and division fields (Layer 3) need a continuous Galois action
  on `adelicTateModule`, assembled from Tau Ceti's `tateModuleGaloisRepresentation` over all `ℓ`,
  with a frame identifying it with `GL₂(Ẑ)`; the image then lands in Tau Ceti's
  `ClosedSubgroupConjClasses`;
- the open image theorems of Layer 4 owned here (surjectivity onto `GL₂(ℤ_ℓ)` for almost all `ℓ`,
  adelic openness, the adelic CM counterpart; the `ℓ`-adic openness is the noncommutative Iwasawa
  roadmap's) need, besides `ρ_E`, the geometric endomorphism ring of an elliptic curve (the
  non-CM hypothesis `GeometricEnd E = ℤ` of the elliptic-curves roadmap) and the action of an
  imaginary quadratic order on `T̂E`;
- every statement about the curve `X_H` (its cusps and points, CM points, isolated points, fibre
  products, twists, local points; Layer 5) needs the coarse modular curve `X_H` of the second
  modular-curves roadmap, and the Jacobian statements need the Jacobian of a curve over `ℚ` and
  isogenies of abelian varieties;
- the isogeny matrix, graph, class degree, isogeny degrees and the dictionary with `X₀(N)` (Layer
  6) need the predicate "cyclic isogeny of degree `n` over the base field" and `X₀(N)`; the steps
  of Mazur's chain need the rational points of the curves `X₁(N)` and `X₀(N)`;
- the mod-`ℓ` images of abelian surfaces and their types (Layer 7) need the Jacobian of a
  genus-two curve with its `ℓ`-torsion and Weil pairing;
- Mitchell's classification of the maximal subgroups of `PSp₄(𝔽_ℓ)` (Layer 7.3) needs the
  projective symplectic group and the subgroups it lists (the stabilisers of the polar-space
  configurations, the twisted-cubic image of `SL₂(𝔽_ℓ)`, the normalisers of extraspecial `2^{1+4}`),
  none of which has a carrier at the pin; stating it would be a long ad hoc encoding of the list.

**The carrier.** The profinite integers are Tau Ceti's `TauCeti.zHat` in its additive
presentation `ẑ := Additive TauCeti.zHat` (at `Type`), with the ring structure of
`TauCeti.Topology.Algebra.Group.Profinite.ZHat.Ring`; `GL₂(Ẑ)` is Mathlib's `GL (Fin 2) ẑ` with
the topology of units of the topological ring of matrices. There is no second carrier: `GL₂(Ẑ)`
is not defined as an inverse limit, and that it is one is the pair of theorems `red_ext`
(uniqueness of a compatible lift) and `exists_red_eq` (existence). Open subgroups are Mathlib's
`OpenSubgroup` (`README.md`, Pinned conventions 1).

**Conventions visible in the signatures.** Reductions are indexed by `ℕ+` (convention 1); the
level is `sInf` of the positive `N` with `Γ(N) ≤ H` (convention 3); `±H` is Mathlib's
`Subgroup.adjoinNegOne` (convention 4); `Γ_H` is the preimage of `H` under
`SpecialLinearGroup.mapGL`, and every genus-type invariant is read on `Γ_{±H}` (conventions 5–6);
the genus is a rational number by definition and a natural number by the noncongruence roadmap's
integral genus formula (Layer 1.2); `GSp₄` is defined by `g J gᵀ = ν J` with Mathlib's `Matrix.J`
(convention 14).

**Exceptions to "every proof is `sorry`".** The instances, `continuous_red`, and the openness and
subgroup fields of the definitions are proved.

**Conditional route.** `mazur_torsion` is a theorem; the roadmap's proof of it rests at one step
(the level `25`, `README.md` 6.4) on the declared supplier gap `gap:nebentypus-rank-zero`.
-/

namespace TauCetiRoadmap.AdelicImagesAndModularCurves

open Matrix TauCeti
open scoped MatrixGroups Pointwise


/-- The additive presentation of Tau Ceti's profinite integers, the ring `ẑ` of the
profinite-arithmetic roadmap's Layer 0 (`README.md`, Pinned conventions 1). Notation, not a type;
the ascription fixes the universe at `0`. -/
scoped notation "ẑ" => (Additive TauCeti.zHat : Type)

/-! ## Layer 0: the profinite group `GL₂(Ẑ)` and its open subgroups -/

/-- **Layer 0.1.** `GL₂(Ẑ)` is Mathlib's general linear group over the ring `ẑ`, with the units
topology (`README.md`, Layer 0, 0.1). An abbreviation so that every Mathlib instance on
`GL (Fin 2) ẑ` is found. -/
abbrev GL2Zhat : Type := GL (Fin 2) ẑ

/-- **Layer 0.1.** `GL₂(Ẑ)` is compact: units of the compact Hausdorff ring of matrices. -/
instance : CompactSpace GL2Zhat :=
  haveI : CompactSpace (Matrix (Fin 2) (Fin 2) ẑ) :=
    inferInstanceAs (CompactSpace (Fin 2 → Fin 2 → ẑ))
  inferInstance

/-- **Layer 0.1.** `GL₂(Ẑ)` is totally disconnected: `Units.val` is a continuous injection into
the totally disconnected ring of matrices. -/
instance : TotallyDisconnectedSpace GL2Zhat := by
  have : TotallyDisconnectedSpace (Matrix (Fin 2) (Fin 2) ẑ) :=
    inferInstanceAs (TotallyDisconnectedSpace (Fin 2 → Fin 2 → ẑ))
  rw [totallyDisconnectedSpace_iff]
  exact isTotallyDisconnected_of_image Units.continuous_val.continuousOn Units.val_injective
    (isTotallyDisconnected_of_totallyDisconnectedSpace _)

/-- **Layer 0.1.** The reduction `red n : GL₂(Ẑ) →* GL₂(ℤ/n)`, `GL.map` of Tau Ceti's
`zHat.toZMod n` (`README.md`, 0.1). -/
noncomputable def red (n : ℕ+) : GL2Zhat →* GL (Fin 2) (ZMod n) :=
  GeneralLinearGroup.map (TauCeti.zHat.toZMod n)

/-- **Layer 0.1.** Every reduction is continuous (discrete finite target). -/
theorem continuous_red (n : ℕ+) : Continuous (red n) :=
  Continuous.units_map _ (by exact continuous_id.matrix_map (zHat.continuous_toZMod n))

/-- **Layer 0.1.** Every reduction is surjective. -/
theorem red_surjective (n : ℕ+) : Function.Surjective (red n) := sorry

/-- **Layer 0.1, the inverse-limit property: uniqueness.** Two elements with the same image under
every reduction are equal. -/
theorem red_ext {g h : GL2Zhat} (H : ∀ n : ℕ+, red n g = red n h) : g = h := sorry

/-- **Layer 0.1, the inverse-limit property: existence.** A family of elements of the `GL₂(ℤ/n)`
compatible under the reductions `ℤ/m → ℤ/n` for `n ∣ m` is the family of reductions of one element
of `GL₂(Ẑ)`. With `red_ext` this is `GL₂(Ẑ) ≅ lim GL₂(ℤ/n)` as a theorem about the carrier. -/
theorem exists_red_eq (x : ∀ n : ℕ+, GL (Fin 2) (ZMod n))
    (hx : ∀ (m n : ℕ+) (h : (n : ℕ) ∣ m),
      GeneralLinearGroup.map (ZMod.castHom h (ZMod n)) (x m) = x n) :
    ∃ g : GL2Zhat, ∀ n : ℕ+, red n g = x n := sorry

/-- **Layer 0.1.** The principal congruence subgroup `Γ(n) := ker (red n)`, open. -/
noncomputable def Gamma (n : ℕ+) : OpenSubgroup GL2Zhat :=
  { (red n).ker with
    isOpen' := (isOpen_discrete ({1} : Set (GL (Fin 2) (ZMod n)))).preimage (continuous_red n) }

/-- **Layer 0.1.** The `Γ(n)` form a neighbourhood basis of the identity: every open subgroup
contains some `Γ(n)`. -/
theorem exists_Gamma_le (H : OpenSubgroup GL2Zhat) : ∃ n : ℕ+, (Gamma n).1 ≤ H.1 := sorry

/-- **Layer 0.1.** Order of `GL₂(ℤ/N)` in the form the LMFDB displays:
`φ(N) · N · (N / ∏_{p ∣ N} p)² · ∏_{p ∣ N} (p² − 1)`. -/
theorem card_GL2_zmod (N : ℕ) [NeZero N] :
    Nat.card (GL (Fin 2) (ZMod N)) =
      Nat.totient N * N * (N / ∏ p ∈ N.primeFactors, p) ^ 2 *
        ∏ p ∈ N.primeFactors, (p ^ 2 - 1) := sorry

/-- **Layer 0.2.** The level of an open subgroup: the least `N ≥ 1` with `Γ(N) ≤ H`
(`README.md`, Pinned conventions 3). -/
noncomputable def level (H : OpenSubgroup GL2Zhat) : ℕ :=
  sInf {N : ℕ | ∃ h : 0 < N, (Gamma ⟨N, h⟩).1 ≤ H.1}

/-- **Layer 0.2.** `Γ(N) ≤ H` iff the level divides `N` (the `SL(2, ℤ)` antitonicity in the level
is Tau Ceti's `CongruenceSubgroup.Gamma_le_Gamma_of_dvd`). -/
theorem Gamma_le_iff (H : OpenSubgroup GL2Zhat) (N : ℕ+) :
    (Gamma N).1 ≤ H.1 ↔ level H ∣ N := sorry

/-- **Layer 0.2.** The index of an open subgroup is finite: `GL₂(Ẑ)` is compact. -/
instance (H : OpenSubgroup GL2Zhat) : H.1.FiniteIndex :=
  haveI := Subgroup.quotient_finite_of_isOpen H.1 H.isOpen
  Subgroup.finiteIndex_of_finite_quotient

/-- **Layer 0.2.** `±H`, Mathlib's `Subgroup.adjoinNegOne` (`README.md`, Pinned conventions 4);
open because it contains the open `H`. -/
noncomputable def pm (H : OpenSubgroup GL2Zhat) : OpenSubgroup GL2Zhat :=
  { H.1.adjoinNegOne with isOpen' := Subgroup.isOpen_mono H.1.le_adjoinNegOne H.isOpen }

/-- **Layer 0.2.** Surjective determinant (`README.md`, 0.2, `IsFullDet`). -/
def IsFullDet (H : OpenSubgroup GL2Zhat) : Prop :=
  H.1.map (GeneralLinearGroup.det : GL2Zhat →* ẑˣ) = ⊤

/-- **Layer 0.2.** The level is conjugation invariant (as are the index, `−I ∈ H` and full
determinant, `README.md` 0.2); stated for an open subgroup `H'` given as the conjugate of `H`, so
that no openness proof sits in the statement. -/
theorem level_conj (H H' : OpenSubgroup GL2Zhat) (g : GL2Zhat) (h : H'.1 = MulAut.conj g • H.1) :
    level H' = level H := sorry

/-- **Layer 0.3.** The standard open subgroup `Γ₀(N)`: the preimage under `red N` of the upper
triangular matrices (`README.md`, 0.3); open because it contains `Γ(N)`. -/
noncomputable def Gamma0Zhat (N : ℕ+) : OpenSubgroup GL2Zhat :=
  let G : Subgroup GL2Zhat :=
    { carrier := {g | zHat.toZMod N ((g : Matrix (Fin 2) (Fin 2) ẑ) 1 0) = 0}
      one_mem' := by simp
      mul_mem' := fun hg hh => by simp_all [Matrix.mul_apply, Fin.sum_univ_two]
      inv_mem' := fun hg => by
        simp_all [Matrix.coe_units_inv, Matrix.inv_def, Matrix.adjugate_fin_two] }
  { G with
    isOpen' := Subgroup.isOpen_mono (H₂ := G) (fun g hg => by
      show zHat.toZMod N ((g : Matrix (Fin 2) (Fin 2) ẑ) 1 0) = 0
      simpa [red] using congrArg (fun x : GL (Fin 2) (ZMod N) =>
        (x : Matrix (Fin 2) (Fin 2) (ZMod N)) 1 0) (MonoidHom.mem_ker.mp hg)) (Gamma N).isOpen }

/-- **Layer 0.3.** `Γ₀(N)` has surjective determinant. -/
theorem isFullDet_Gamma0Zhat (N : ℕ+) : IsFullDet (Gamma0Zhat N) := sorry

/-- **Layer 0.4.** `Γ_H := H.comap (mapGL ẑ)`, the congruence subgroup of `SL(2, ℤ)` attached to
`H` (`README.md`, Pinned conventions 5). -/
noncomputable def congruenceSubgroup (H : OpenSubgroup GL2Zhat) : Subgroup SL(2, ℤ) :=
  H.1.comap (SpecialLinearGroup.mapGL ẑ)

/-- **Layer 0.4.** `Γ_H` is a congruence subgroup in Mathlib's sense. -/
theorem isCongruenceSubgroup_congruenceSubgroup (H : OpenSubgroup GL2Zhat) :
    CongruenceSubgroup.IsCongruenceSubgroup (congruenceSubgroup H) := sorry

/-- **Layer 0.4.** The comparison with Mathlib: `Γ_{Γ₀(N)} = Gamma0 N`. -/
theorem congruenceSubgroup_gamma0 (N : ℕ+) :
    congruenceSubgroup (Gamma0Zhat N) = CongruenceSubgroup.Gamma0 N := sorry

/-- **Layer 0.4.** The `PSL₂`-index of `H`: the index of `Γ_{±H}` in `SL(2, ℤ)`
(`README.md`, Pinned conventions 5). -/
noncomputable def pslIndex (H : OpenSubgroup GL2Zhat) : ℕ := (congruenceSubgroup (pm H)).index

/-- **Layer 0.4.** Strong approximation: for full determinant the `PSL₂`-index is the projective
index. -/
theorem pslIndex_eq_index_pm (H : OpenSubgroup GL2Zhat) (hH : IsFullDet H) :
    pslIndex H = (pm H).1.index := sorry

/-- **Layer 0.4.** The density of `SL₂(ℤ)` in `SL₂(Ẑ)`: the closure of the image of `SL(2, ℤ)`
is the kernel of the determinant. -/
theorem closure_range_mapGL :
    closure ((SpecialLinearGroup.mapGL ẑ : SL(2, ℤ) →* GL2Zhat).range : Set GL2Zhat) =
      ((GeneralLinearGroup.det : GL2Zhat →* ẑˣ).ker : Set GL2Zhat) := sorry

/-! ## Layer 1: cusps, elliptic points and the genus -/

/-- **Layer 1.1.** `ν₂(H)`: the cosets of `Γ_{±H}` fixed by `S = [[0, −1], [1, 0]]` (Mathlib's
`ModularGroup.S`; `S⁻¹ = [[0, 1], [−1, 0]]` of convention 6 has the same fixed points). Read on
Mathlib's left coset space `SL(2, ℤ) ⧸ Γ_{±H}`, which `g ↦ g⁻¹` and reduction mod any multiple of
the level identify with the right coset space `Γ̄_H \ SL₂(ℤ/N)` of `README.md`, Pinned
conventions 6. -/
noncomputable def nu2 (H : OpenSubgroup GL2Zhat) : ℕ :=
  Nat.card (MulAction.fixedBy (SL(2, ℤ) ⧸ congruenceSubgroup (pm H)) ModularGroup.S)

/-- **Layer 1.1.** `ν₃(H)`: the cosets fixed by `R = [[0, 1], [−1, −1]]`. -/
noncomputable def nu3 (H : OpenSubgroup GL2Zhat) : ℕ :=
  Nat.card (MulAction.fixedBy (M := SL(2, ℤ)) (SL(2, ℤ) ⧸ congruenceSubgroup (pm H))
    ⟨!![0, 1; -1, -1], by simp [Matrix.det_fin_two_of]⟩)

/-- **Layer 1.1.** The cusps of `H`: the `⟨T⟩`-orbits on the coset space (`README.md`, 1.1). -/
def Cusps (H : OpenSubgroup GL2Zhat) : Type :=
  MulAction.orbitRel.Quotient (Subgroup.zpowers ModularGroup.T)
    (SL(2, ℤ) ⧸ congruenceSubgroup (pm H))

/-- **Layer 1.1.** Finitely many cusps: `Γ_{±H}` has finite index. -/
noncomputable instance (H : OpenSubgroup GL2Zhat) : Fintype (Cusps H) := by
  haveI : (congruenceSubgroup (pm H)).FiniteIndex := by
    unfold congruenceSubgroup; infer_instance
  haveI : Finite (SL(2, ℤ) ⧸ congruenceSubgroup (pm H)) := Subgroup.finite_quotient_of_finiteIndex
  haveI : Finite (Cusps H) := Quotient.finite _
  exact Fintype.ofFinite _

/-- **Layer 1.2.** The genus, a rational number by definition (`README.md`, Pinned conventions 6).
It equals the noncongruence roadmap's genus of the image of `Γ_{±H}` in `PSL₂(ℤ)`, a natural number
(that roadmap's §2.3), which is not restated here. -/
noncomputable def genus (H : OpenSubgroup GL2Zhat) : ℚ :=
  1 + (pslIndex H : ℚ) / 12 - (nu2 H : ℚ) / 4 - (nu3 H : ℚ) / 3 - (Fintype.card (Cusps H) : ℚ) / 2

/-! ## Layer 2: Serre's lifting theorem, the commutator subgroup, twists, Gassmann equivalence -/

section Lifting

variable (ℓ : ℕ) [Fact ℓ.Prime]

/-- **Layer 2.2 (Serre's lifting theorem).** For a prime `ℓ ≥ 5`, a closed subgroup of `SL₂(ℤ_ℓ)`
whose reduction modulo `ℓ` is all of `SL₂(𝔽_ℓ)` is all of `SL₂(ℤ_ℓ)` (`README.md`, 2.2). -/
theorem eq_top_of_isClosed_of_map_eq_top (hℓ : 5 ≤ ℓ) (H : Subgroup SL(2, ℤ_[ℓ]))
    (hH : IsClosed (H : Set SL(2, ℤ_[ℓ])))
    (hmap : H.map (SpecialLinearGroup.map (PadicInt.toZMod (p := ℓ))) = ⊤) : H = ⊤ := sorry

/-- **Layer 2.2, the `GL₂` form.** For a prime `ℓ ≥ 5`, a closed subgroup `H ≤ GL₂(ℤ_ℓ)` whose
reduction contains `SL₂(𝔽_ℓ)` contains `SL₂(ℤ_ℓ)`, hence is the full preimage of its determinant
image: `H` is open exactly when `det H` is, and `H = GL₂(ℤ_ℓ)` exactly when `det H = ℤ_ℓˣ`. -/
theorem eq_comap_map_det_of_isClosed (hℓ : 5 ≤ ℓ) (H : Subgroup (GL (Fin 2) ℤ_[ℓ]))
    (hH : IsClosed (H : Set (GL (Fin 2) ℤ_[ℓ])))
    (hsl : (SpecialLinearGroup.toGL : SL(2, ZMod ℓ) →* GL (Fin 2) (ZMod ℓ)).range ≤
      H.map (GeneralLinearGroup.map (PadicInt.toZMod (p := ℓ)))) :
    H = (H.map GeneralLinearGroup.det).comap GeneralLinearGroup.det := sorry

end Lifting

/-- **Layer 2.4.** The (abstract) commutator subgroup of `GL₂(Ẑ)` is the kernel of
`(det, ε ∘ red 2)`, where the sign `ε` of `GL₂(𝔽₂) ≅ S₃` takes the value `1` exactly on the `x`
with `x ^ 3 = 1`, the identity and the two elements of order three. In particular it is closed, and
`(det, ε ∘ red 2) : GL₂(Ẑ) → ẑˣ × {±1}` is the abelianisation (`README.md`, 2.4). -/
theorem mem_commutator_iff (g : GL2Zhat) :
    g ∈ commutator GL2Zhat ↔ GeneralLinearGroup.det g = 1 ∧ red 2 g ^ 3 = 1 := sorry

/-- **Layer 2.6.** Twists: equal intersections with `SL₂(Ẑ)` (`README.md`, 2.6). -/
def IsTwist (H₁ H₂ : OpenSubgroup GL2Zhat) : Prop :=
  H₁.1 ⊓ (GeneralLinearGroup.det : GL2Zhat →* ẑˣ).ker =
    H₂.1 ⊓ (GeneralLinearGroup.det : GL2Zhat →* ẑˣ).ker

/-- **Layer 2.6.** Twists have the same genus. -/
theorem genus_eq_of_isTwist {H₁ H₂ : OpenSubgroup GL2Zhat} (h : IsTwist H₁ H₂) :
    genus H₁ = genus H₂ := sorry

/-- **Layer 2.8.** Gassmann-equivalent open subgroups have the same level, index and genus. The
hypothesis is `FiniteGroupInvariants` 7.3's `Subgroup.AlmostConjugateOfFiniteIndex H₁.1 H₂.1`
unfolded (every `γ` fixes equally many cosets of `H₁` and of `H₂`), since that roadmap's file cannot be
imported; Tau Ceti main's `Subgroup.AlmostConjugate` is its finite-group form. No Gassmann
predicate is declared here. -/
theorem level_index_genus_of_almostConjugate {H₁ H₂ : OpenSubgroup GL2Zhat}
    (h : ∀ γ : GL2Zhat, Nat.card (MulAction.fixedBy (GL2Zhat ⧸ H₁.1) γ) =
      Nat.card (MulAction.fixedBy (GL2Zhat ⧸ H₂.1) γ)) :
    level H₁ = level H₂ ∧ H₁.1.index = H₂.1.index ∧ genus H₁ = genus H₂ := sorry

/-! ## Layer 3: the adelic Tate module -/

section Arithmetic

variable {F : Type} [Field F] [CharZero F] (K : Type) [Field K] [DecidableEq K] [IsSepClosed K]
  [Algebra F K]

/-- **Layer 3.1.** The adelic Tate module: the product over all primes of Tau Ceti's `ℓ`-adic
Tate modules of `E` over `K` (`README.md`, Pinned conventions 9). This is the carrier of
ArithmeticGaloisRepresentations §6.1's adelic action for `A = E`, which owns it; that roadmap's
file cannot be imported, so this local copy exists only to state `finrank_adelicTateModule`. The
carrier makes sense over any field; the rank statement assumes characteristic zero and `K`
separably closed. -/
abbrev adelicTateModule (E : WeierstrassCurve F) [E.IsElliptic] : Type :=
  ∀ ℓ : Nat.Primes, TateModule ℓ (E.baseChange K).toAffine.Point

/-- **Layer 3.1.** The `ẑ`-module structure: componentwise over `∏_ℓ ℤ_ℓ`, then through
`zHat.ringEquivPiPadicInt`. -/
noncomputable instance (E : WeierstrassCurve F) [E.IsElliptic] :
    Module ẑ (adelicTateModule K E) :=
  Module.compHom _ (zHat.ringEquivPiPadicInt : ẑ →+* ∀ ℓ : Nat.Primes, ℤ_[ℓ])

/-- **Layer 3.1.** The adelic Tate module is free of rank two over `ẑ`. -/
theorem finrank_adelicTateModule (E : WeierstrassCurve F) [E.IsElliptic] :
    Module.finrank ẑ (adelicTateModule K E) = 2 := sorry

end Arithmetic

/-! ## Layer 6: isogeny classes, Mazur and Kenku over `ℚ` -/

section Isogeny

variable {F : Type} [Field F]

/-- **Layer 6.2.** The size of the isogeny class over `F`: the number of `F`-isomorphism classes
(Weierstrass models up to a change of variables over `F`) of elliptic curves `E'` admitting an
isogeny `E → E'`; finite over a number field (Faltings), `0` by `Nat.card` otherwise. -/
noncomputable def isogenyClassSize (E : WeierstrassCurve.Affine F) : ℕ :=
  Nat.card (Quot fun E₁ E₂ :
      {E' : WeierstrassCurve F // E'.IsElliptic ∧ Nonempty (Isogeny E E'.toAffine)} =>
    ∃ C : WeierstrassCurve.VariableChange F, C • E₁.1 = E₂.1)

end Isogeny

/-- **Layer 6.4 (Mazur's torsion theorem).** The torsion subgroup of `E(ℚ)` is isomorphic to
`ℤ/n` with `1 ≤ n ≤ 10` or `n = 12`, or to `ℤ/2 × ℤ/2n` with `1 ≤ n ≤ 4` (Mazur 1977, Theorem (8),
p. 35). The roadmap's route uses the declared supplier gap `gap:nebentypus-rank-zero` at the level
`25` only. -/
theorem mazur_torsion (E : WeierstrassCurve ℚ) [E.IsElliptic] :
    (∃ n ∈ ({1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12} : Finset ℕ),
      Nonempty (AddCommGroup.torsion E.toAffine.Point ≃+ ZMod n)) ∨
    ∃ n ∈ ({1, 2, 3, 4} : Finset ℕ),
      Nonempty (AddCommGroup.torsion E.toAffine.Point ≃+ ZMod 2 × ZMod (2 * n)) := sorry

/-- **Layer 6.4.** Each of Mazur's fifteen groups is the torsion subgroup of `E(ℚ)` for some
elliptic curve `E/ℚ`. -/
theorem mazur_torsion_exists :
    (∀ n ∈ ({1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12} : Finset ℕ), ∃ E : WeierstrassCurve ℚ,
      E.IsElliptic ∧ Nonempty (AddCommGroup.torsion E.toAffine.Point ≃+ ZMod n)) ∧
    ∀ n ∈ ({1, 2, 3, 4} : Finset ℕ), ∃ E : WeierstrassCurve ℚ,
      E.IsElliptic ∧ Nonempty (AddCommGroup.torsion E.toAffine.Point ≃+ ZMod 2 × ZMod (2 * n)) :=
  sorry

/-- **Layer 6.5, a corollary of Kenku's theorem.** An isogeny class over `ℚ` has at most eight
curves, and its size is one of `1, 2, 3, 4, 6, 8`. Mazur's and Kenku's isogeny theorems are
EllipticCurveModularityPartII §§5.0a–5.0b (`prime_isogeny_degrees`, `cyclic_isogeny_degrees`),
consumed and not restated here. -/
theorem kenku_isogenyClassSize (E : WeierstrassCurve ℚ) [E.IsElliptic] :
    isogenyClassSize E.toAffine ∈ ({1, 2, 3, 4, 6, 8} : Finset ℕ) := sorry

/-! ## Layer 7: `GSp₄` -/

section GSp4

variable (R : Type*) [CommRing R]

/-- **Layer 7.1 (convention 14).** `GSp₄(R) = {g : g J gᵀ = ν J for some ν ∈ Rˣ}` with Mathlib's
`Matrix.J (Fin 2) R`, a subgroup of `GL (Fin 2 ⊕ Fin 2) R`. This is the rank-four case of
ArithmeticGaloisRepresentations §7.3's `SimilitudeGroup.GSp` (Gram matrix `−Matrix.J`, the same
group since `g (−J) gᵀ = ν (−J)` iff `g J gᵀ = ν J`), which owns the group, its multiplier and their
laws; that roadmap's file cannot be imported, so this local carrier exists only to state
`card_GSp4_zmod` and is not a second owner. -/
noncomputable def GSp4 : Subgroup (GL (Fin 2 ⊕ Fin 2) R) where
  carrier := {g | ∃ ν : Rˣ, (g : Matrix _ _ R) * Matrix.J (Fin 2) R * (g : Matrix _ _ R)ᵀ =
    (ν : R) • Matrix.J (Fin 2) R}
  one_mem' := ⟨1, by simp⟩
  mul_mem' := by
    rintro g h ⟨ν, hν⟩ ⟨μ, hμ⟩
    refine ⟨ν * μ, ?_⟩
    calc ((g * h : GL _ R) : Matrix _ _ R) * Matrix.J (Fin 2) R * ((g * h : GL _ R) : Matrix _ _ R)ᵀ
        = (g : Matrix _ _ R) * ((h : Matrix _ _ R) * Matrix.J (Fin 2) R * (h : Matrix _ _ R)ᵀ) *
          (g : Matrix _ _ R)ᵀ := by simp [Matrix.transpose_mul, Matrix.mul_assoc]
      _ = ((ν * μ : Rˣ) : R) • Matrix.J (Fin 2) R := by
          rw [hμ, Matrix.mul_smul, Matrix.smul_mul, hν, smul_smul, mul_comm (μ : R)]; rfl
  inv_mem' := by
    rintro g ⟨ν, hν⟩
    refine ⟨ν⁻¹, ?_⟩
    have h1 : (g⁻¹ : GL (Fin 2 ⊕ Fin 2) R).val * (g : Matrix _ _ R) = 1 := by
      rw [← Units.val_mul, inv_mul_cancel, Units.val_one]
    have h2 : (ν : R) • ((g⁻¹ : GL (Fin 2 ⊕ Fin 2) R).val * Matrix.J (Fin 2) R *
        (g⁻¹ : GL (Fin 2 ⊕ Fin 2) R).valᵀ) = Matrix.J (Fin 2) R := by
      calc _ = (g⁻¹ : GL (Fin 2 ⊕ Fin 2) R).val * ((g : Matrix _ _ R) * Matrix.J (Fin 2) R *
              (g : Matrix _ _ R)ᵀ) * (g⁻¹ : GL (Fin 2 ⊕ Fin 2) R).valᵀ := by
            rw [hν, Matrix.mul_smul, Matrix.smul_mul]
        _ = ((g⁻¹ : GL (Fin 2 ⊕ Fin 2) R).val * (g : Matrix _ _ R)) * Matrix.J (Fin 2) R *
              ((g⁻¹ : GL (Fin 2 ⊕ Fin 2) R).val * (g : Matrix _ _ R))ᵀ := by
            simp only [Matrix.transpose_mul, Matrix.mul_assoc]
        _ = _ := by rw [h1]; simp
    calc _ = ((ν⁻¹ : Rˣ) : R) • ((ν : R) • ((g⁻¹ : GL (Fin 2 ⊕ Fin 2) R).val *
          Matrix.J (Fin 2) R * (g⁻¹ : GL (Fin 2 ⊕ Fin 2) R).valᵀ)) := by
          rw [smul_smul, ← Units.val_mul, inv_mul_cancel, Units.val_one, one_smul]
      _ = _ := by rw [h2]

/-- **Layer 7.1.** `|GSp₄(𝔽_ℓ)| = (ℓ − 1) ℓ⁴ (ℓ² − 1)(ℓ⁴ − 1)`. -/
theorem card_GSp4_zmod (ℓ : ℕ) [Fact ℓ.Prime] :
    Nat.card (GSp4 (ZMod ℓ)) = (ℓ - 1) * ℓ ^ 4 * (ℓ ^ 2 - 1) * (ℓ ^ 4 - 1) := sorry

end GSp4

end TauCetiRoadmap.AdelicImagesAndModularCurves
