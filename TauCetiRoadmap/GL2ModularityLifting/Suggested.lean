import Mathlib
import TauCeti.NumberTheory.NumberField.Global.Approximation.Weak
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.UpperTriangular.Solvable
import TauCeti.NumberTheory.Multiquadratic.Prime.Discriminant.Basic
import TauCeti.NumberTheory.Multiquadratic.Cyclotomic.GaussSum

/-!
# GL₂ modularity lifting: representative target signatures

These signatures are suggested forms, not an exhaustive checklist. `README.md` is the definitive
specification. This file records the light definitions and the
statements that can already be made against the pinned Mathlib and Tau Ceti APIs. It is not an
exhaustive list of the targets of any layer: the Hecke algebras of definite quaternionic forms,
the deformation rings, the patched modules and every lifting theorem need carriers (Galois
representations of number fields with their local conditions, Hilbert modular forms, local
deformation rings) that the pinned libraries do not contain, so they are README targets only.

Design choices.
* The patching radius of Layer 3 is the natural-number expression `s · m · p ^ (m · (h + j))`
  of Kisin's patching datum; the cutoff ideals themselves belong to the patching algebra.
* Oddness is a condition on the characteristic-zero determinant. Over a domain `R` with a ring
  map to a field `k` of characteristic different from two it can be read on the reduction
  (`odd_det_of_odd_reduction`); in characteristic two it cannot, and the examples of Layer 6 pin
  this.
* The signed prime `p* = (-1) ^ ((p - 1) / 2) * p` is Tau Ceti's
  `TauCeti.Multiquadratic.oddPrimeDiscriminant`, used only for odd primes `p`; Tau Ceti already
  proves `p* ≡ 1 (mod 4)` and that a primitive `p`-th root of unity yields a square root of `p*`.
* Hodge–Tate weights are normalised by `HT(ε) = 1`; distinct weights `a < b` normalise to
  `{0, k − 1}` with `k = b − a + 1` (`normalizedWeight`).
* The avoidance variant (§3.4a) patches modules over the fixed ambient rings A and A′
  without a domain hypothesis; component geometry is used there, before any action quotient.
* `RankTwoFamily` is the Hodge-forgetting rank-two view of the supplied
  `AutomorphicSystemData`, with a common-good-Frobenius predicate and separate de Rham and
  Weil–Deligne conditions.
* Pan's good components (Layer 10) are stated on concrete data: a family of subsets of a point
  space, the potentially nice points and the seed points. Pan's extension components are the
  minimal primes of the source of a ring map that lie in the image of the target spectrum, for
  the whole target spectrum.
-/

namespace TauCetiRoadmap.GL2ModularityLifting

/-! ## Layer 1: Minimal deformation-to-Hecke maps

The minimal-level data, the deformation-to-Hecke map and the framed objects need the definite
quaternionic Hecke algebras and the global deformation rings; they are README targets. The
square classes prescribed in the allowable base changes of §1.8 use weak approximation. -/

#check @TauCeti.GlobalNumberFields.weakApproximation_denseRange

/-! ## Layer 3: Arithmetic patching -/

/-- The patching radius `r_m = s · m · p ^ (m · (h + j))` of the level-`m` patching datum
(§3.1; Kisin's patching datum, with `s` the rank of the patched module and `h + j` the number of
patching variables). -/
def patchingRadius (s m p hj : ℕ) : ℕ := s * m * p ^ (m * hj)

/-- The radius grows with the level: the transition from level `m + 1` to level `m` is a
reduction, so the level-`m + 1` radius dominates. -/
theorem patchingRadius_mono_level (s p hj : ℕ) (hp : 1 ≤ p) (m : ℕ) :
    patchingRadius s m p hj ≤ patchingRadius s (m + 1) p hj := by
  sorry

/-- The worked value of §3.1: `s = 1`, `p = 3`, `m = 2`, `h + j = 1` give `r_m = 18`. -/
example : patchingRadius 1 2 3 1 = 18 := by decide

/-- With no patching variables the radius is `s · m`, not `0` or `s`. -/
example : patchingRadius 2 3 5 0 = 6 := by decide

/-- The rank enters linearly: doubling `s` doubles the radius. -/
example : patchingRadius 2 2 3 1 = 2 * patchingRadius 1 2 3 1 := by decide

/-! ## Layer 6: Dyadic lifting and Hypothesis (H)

In characteristic two the residual determinant cannot detect oddness: both `1` and
`diag(1, −1)` reduce to the identity, and the even lift `−1` reduces to it as well. -/

/-- `diag(1, −1)` is odd in characteristic zero. -/
example : Matrix.det !![(1 : ℤ), 0; 0, -1] = -1 := by
  simp [Matrix.det_fin_two]

/-- The same matrix reduces to a determinant-one matrix modulo two. -/
example : Matrix.det !![(1 : ZMod 2), 0; 0, -1] = 1 := by
  norm_num [Matrix.det_fin_two]
  decide

/-- The even lift `−1` has determinant `1` but the same reduction as an odd lift. -/
example : Matrix.det (-1 : Matrix (Fin 2) (Fin 2) ℤ) = 1 := by
  simp [Matrix.det_fin_two]

/-- An odd integral involution can reduce to a nonidentity unipotent involution modulo two. -/
example :
    let c : Matrix (Fin 2) (Fin 2) ℤ := !![1, 1; 0, -1]
    c * c = 1 ∧ c.det = -1 ∧
      c.map (Int.castRingHom (ZMod 2)) = !![1, 1; 0, 1] ∧
      c.map (Int.castRingHom (ZMod 2)) ≠ 1 := by
  decide

/-! ## Layer 7: Statement table and normalisations over ℚ

The signed prime `p*` of the residual hypothesis over `ℚ(√p*)` is Tau Ceti's
`oddPrimeDiscriminant`; the examples pin its sign convention. -/

#check @TauCeti.Multiquadratic.oddPrimeDiscriminant_mod_four_eq_one
#check @TauCeti.Multiquadratic.exists_mem_sq_eq_oddPrimeDiscriminant

/-- `3* = −3`, so the residual hypothesis at `p = 3` is over `ℚ(√−3) = ℚ(ζ₃)`. -/
example : TauCeti.Multiquadratic.oddPrimeDiscriminant 3 = -3 := by decide

/-- `5* = 5`: the sign is not always negative. -/
example : TauCeti.Multiquadratic.oddPrimeDiscriminant 5 = 5 := by decide

/-- At `p = 2` the definition gives `−2`, not `(−1)^0 · 2 = 2`; it is used only for odd `p`. -/
example : TauCeti.Multiquadratic.oddPrimeDiscriminant 2 = -2 := by decide

/-- The normalised weight `k = b − a + 1` of a representation with Hodge–Tate weights `a < b`
(§7.6): twisting by `ε^{−a}` moves the weights to `{0, k − 1}`. -/
def normalizedWeight (a b : ℤ) : ℤ := b - a + 1

/-- Twisting by a power of the cyclotomic character shifts both weights and leaves `k` fixed. -/
theorem normalizedWeight_shift (a b n : ℤ) :
    normalizedWeight (a + n) (b + n) = normalizedWeight a b := by
  sorry

/-- Distinct weights give `k ≥ 2`. -/
theorem two_le_normalizedWeight {a b : ℤ} (h : a < b) : 2 ≤ normalizedWeight a b := by
  sorry

example : normalizedWeight 3 7 = 5 := by norm_num [normalizedWeight]
/-- The weights `{3+n, 7+n}` normalize to weight five for every common shift. -/
example (n : ℤ) : normalizedWeight (3 + n) (7 + n) = 5 := by
  rw [normalizedWeight_shift]
  norm_num [normalizedWeight]
example : normalizedWeight 0 1 = 2 := by norm_num [normalizedWeight]
/-- The crystalline twist with weights `{6,7}` in §8.6 normalizes to weight two;
its unnormalized weights do not give an exact classical newform attachment. -/
example : normalizedWeight 6 7 = 2 := by norm_num [normalizedWeight]
/-- Equal weights (a weight-one form) give `k = 1`, outside the lifting theorems. -/
example : normalizedWeight 4 4 = 1 := by norm_num [normalizedWeight]

/-- The oddness bridge of §7.10: over a domain, an involution whose reduction to a field of
characteristic different from two has determinant `−1` has determinant `−1`. -/
theorem odd_det_of_odd_reduction {R k : Type*} [CommRing R] [IsDomain R] [Field k]
    (φ : R →+* k) (c : Matrix (Fin 2) (Fin 2) R) (hc : c * c = 1)
    (hres : (c.map φ).det = -1) (h2 : (2 : k) ≠ 0) : c.det = -1 := by
  sorry

/-- At odd residue characteristic the two signs stay distinct. -/
example : (-1 : ZMod 3) ≠ 1 := by decide

/-- Over a product ring an involution can have mixed determinant signs, with odd reduction
under the first projection modulo three (§7.10). -/
example :
    let c : Matrix (Fin 2) (Fin 2) (ℤ × ℤ) := !![(1, 1), 0; 0, (-1, 1)]
    c * c = 1 ∧ c.det = (-1, 1) ∧ c.det ≠ -1 ∧
      (c.map ((Int.castRingHom (ZMod 3)).comp (RingHom.fst ℤ ℤ))).det = -1 := by
  decide

/-- Rank-two twisting by a scalar `a` multiplies the determinant by `a ^ 2`. -/
example {R : Type*} [CommRing R] (a : R) (M : Matrix (Fin 2) (Fin 2) R) :
    (a • M).det = a ^ 2 * M.det := by
  rw [Matrix.det_smul, Fintype.card_fin]

/-! Nonsolvable residual image is used through solvability of the Borel subgroup of `GL₂`. -/

#check @TauCeti.UpperTriangularGroup.instIsSolvable

/-! ## Layer 10: Pan's residually reducible theorem -/

/-- Over `𝔽₃[[X]]`, a nonconstant unipotent has order three and identity reduction
(§10.1); finite image does not force the constant residual lift. -/
example :
    let U : Matrix (Fin 2) (Fin 2) (PowerSeries (ZMod 3)) :=
      !![1, PowerSeries.X; 0, 1]
    U ^ 3 = 1 ∧ U ≠ 1 ∧ U.map PowerSeries.constantCoeff = 1 := by
  dsimp
  refine ⟨?_, ?_, ?_⟩
  · have h3 : (3 : ZMod 3) = 0 := by decide
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [pow_succ, Matrix.mul_apply, Fin.sum_univ_two]
    ring_nf
    simp [h3]
  · intro h
    have hx : (PowerSeries.X : PowerSeries (ZMod 3)) = 0 := by
      simpa using congrArg (fun M : Matrix (Fin 2) (Fin 2) (PowerSeries (ZMod 3)) =>
        M 0 1) h
    exact PowerSeries.X_ne_zero hx
  · ext i j
    fin_cases i <;> fin_cases j <;> simp [Matrix.map_apply]

section GoodComponents

variable {I X : Type*}

/-- Pan's good components (Definition 7.4.1): component `i` is good when a finite chain of
components, each sharing a potentially nice point with the next, joins `i` to a component
containing a potentially nice seed point. `components` lists the irreducible components as
subsets of the point space, `nice` the potentially nice points and `seed` the closure of the
ordinary arithmetic points (§10.3). -/
def panGoodComponent (components : I → Set X) (nice seed : Set X) (i : I) : Prop :=
  ∃ j : I, (∃ x ∈ nice, x ∈ seed ∧ x ∈ components j) ∧
    Relation.ReflTransGen
      (fun a b : I => ∃ x ∈ nice, x ∈ components a ∧ x ∈ components b) j i

/-- A component containing a potentially nice seed point is good. -/
theorem panGoodComponent_seed (components : I → Set X) (nice seed : Set X) (i : I) (x : X)
    (hn : x ∈ nice) (hs : x ∈ seed) (hc : x ∈ components i) :
    panGoodComponent components nice seed i := by
  sorry

/-- Goodness passes along a shared potentially nice point. -/
theorem panGoodComponent_step (components : I → Set X) (nice seed : Set X) {i j : I}
    (hi : panGoodComponent components nice seed i) (x : X) (hn : x ∈ nice)
    (hxi : x ∈ components i) (hxj : x ∈ components j) :
    panGoodComponent components nice seed j := by
  sorry

/-- Enlarging the potentially nice points or the seed preserves goodness. -/
theorem panGoodComponent_mono (components : I → Set X) {nice nice' seed seed' : Set X}
    (hn : nice ⊆ nice') (hs : seed ⊆ seed') {i : I}
    (hi : panGoodComponent components nice seed i) :
    panGoodComponent components nice' seed' i := by
  sorry

/-- A single component consisting of a potentially nice seed point is good. -/
example : panGoodComponent (fun _ : Unit => ({()} : Set Unit)) {()} {()} () :=
  panGoodComponent_seed _ _ _ () () (by simp) (by simp) (by simp)

/-- With no seed points no component is good. -/
example (components : I → Set X) (nice : Set X) (i : I) :
    ¬ panGoodComponent components nice ∅ i := by
  rintro ⟨j, ⟨x, -, hx, -⟩, -⟩
  exact hx

/-- Components `{0}`, `{0, 1}`, `{1, 2}` with nice points `{0, 1}` and seed `{0}` are all good;
the third is reached from the second through the nice point `1`. -/
example : ∀ i : Fin 3,
    panGoodComponent
      (fun j : Fin 3 => if j = 0 then ({0} : Set ℕ) else if j = 1 then {0, 1} else {1, 2})
      {0, 1} {0} i := by
  intro i
  fin_cases i
  · exact ⟨0, ⟨0, by simp, by simp, by simp⟩, Relation.ReflTransGen.refl⟩
  · exact ⟨1, ⟨0, by simp, by simp, by simp⟩, Relation.ReflTransGen.refl⟩
  · exact ⟨1, ⟨0, by simp, by simp, by simp⟩,
      Relation.ReflTransGen.single ⟨1, by simp, by simp, by simp⟩⟩

/-- A shared point that is not potentially nice does not propagate goodness: `{0, 1}` and
`{1, 2}` meet only in `1`, which is not nice, so the second component is not good. -/
example :
    panGoodComponent (fun b : Bool => if b then ({1, 2} : Set ℕ) else {0, 1}) {0} {0} false ∧
      ¬ panGoodComponent (fun b : Bool => if b then ({1, 2} : Set ℕ) else {0, 1}) {0} {0}
        true := by
  refine ⟨⟨false, ⟨0, by simp, by simp, by simp⟩, Relation.ReflTransGen.refl⟩, ?_⟩
  rintro ⟨j, ⟨x, hxn, -, hxj⟩, hrel⟩
  rcases Relation.ReflTransGen.cases_tail hrel with h | ⟨c, -, y, hyn, -, hyt⟩
  · subst h
    simp only [Set.mem_singleton_iff] at hxn
    subst hxn
    simp at hxj
  · simp only [Set.mem_singleton_iff] at hyn
    subst hyn
    simp at hyt

end GoodComponents

section ExtensionComponents

variable {A B : Type*} [CommRing A] [CommRing B]

/-- Pan's extension components (Definition 7.4.21): the minimal primes of `A` in the image of
`Spec B → Spec A`, for the whole of `Spec B`. In the application `f` is the trace map from the
pseudodeformation ring to the deformation ring of a nonsplit extension (§10.4). -/
def panExtensionComponents (f : A →+* B) : Set (PrimeSpectrum A) :=
  {P | P.asIdeal ∈ minimalPrimes A ∧ P ∈ Set.range (PrimeSpectrum.comap f)}

/-- An extension component contains the kernel of the map. -/
theorem panExtensionComponents_kernel_le (f : A →+* B) {P : PrimeSpectrum A}
    (hP : P ∈ panExtensionComponents f) : RingHom.ker f ≤ P.asIdeal := by
  sorry

/-- Along the identity every minimal prime is an extension component. -/
theorem panExtensionComponents_id :
    panExtensionComponents (RingHom.id A) = {P : PrimeSpectrum A | P.asIdeal ∈ minimalPrimes A} := by
  sorry

/-- Composing with a further map can only shrink the set. -/
theorem panExtensionComponents_comp_subset {C : Type*} [CommRing C] (f : A →+* B) (g : B →+* C) :
    panExtensionComponents (g.comp f) ⊆ panExtensionComponents f := by
  sorry

/-- The identity map detects precisely all minimal-prime points. -/
example :
    panExtensionComponents (RingHom.id A) = {P : PrimeSpectrum A | P.asIdeal ∈ minimalPrimes A} :=
  panExtensionComponents_id

/-- A zero target detects no component. -/
example [Subsingleton B] (f : A →+* B) : panExtensionComponents f = ∅ := by
  refine Set.eq_empty_iff_forall_notMem.2 fun P hP => ?_
  obtain ⟨Q, -⟩ := hP.2
  exact Q.isPrime.ne_top (Subsingleton.elim _ _)

/-- A minimal prime not containing the kernel is not detected. -/
example (f : A →+* B) (P : PrimeSpectrum A) (hker : ¬ RingHom.ker f ≤ P.asIdeal) :
    P ∉ panExtensionComponents f :=
  fun hP => hker (panExtensionComponents_kernel_le f hP)

end ExtensionComponents

/-!
## Targets stated in the README only

The further API targets `panGoodComponent_iff`, `panGoodComponent_congr`,
`panExtensionComponents_mem_iff` and `panExtensionComponents_minimal` are specified in
README §§10.3–10.4.

The higher arithmetic targets use carriers (Galois representations of number fields with local conditions, Hilbert and
quaternionic eigenforms, global and local deformation rings, patched modules, completed
cohomology, and the shared `AutomorphicSystemData` view `RankTwoFamily`) absent from the pinned libraries; the README states those targets with
their intended signatures.

* Layer 1: `MinimalLevelData`, `ResidualModularAlpha`, `ResidualModularBeta`, `defToHecke`,
  `framedHecke`, `framedHeckeModule`, `defToHeckeFramed`; allowable base changes with prescribed
  completions (`cht_soluble_prescribed_completions`); surjectivity and faithfulness after framing.
* Layer 2: `auxLevel`, `auxDelta`, `auxHecke`, `auxMaxIdeal`, `defToAuxHecke`, `twModule`;
  freeness and control at Taylor–Wiles levels.
* Layers 3–4: `PatchingDatum` (with `patchingRadius` above), the patched ring and module,
  their support, finiteness of the minimal deformation ring, `avoidancePair`, integral and
  generic-fibre `R = T`. The avoidance pair and its API require `p > 2`; §3.4a constructs
  the simultaneous ambient modules over A and A′, with common special-fibre actions and
  augmentations, without using the domain-case ring-module criterion.
* Layers 5–6: `StronglyResiduallyModular`, `bcdtHeckeModule`, `DyadicPatchingDatum`,
  `dyadicPatchedRing`, `dyadicPatchedModule`, `dyadicTorusAction`; the Khare–Wintenberger,
  Kisin, Fontaine–Laffaille, BCDT and crystalline lifting theorems, KW I Theorem 4.1 and
  Hypothesis (H).
* Layers 7–9: `OddPrimeLifting`, `DyadicLifting`, `ResiduallyReducibleLifting`,
  `OrdinaryThreeLifting`, the classification of geometric twists, `patchedWeightFiltration`,
  Kisin's multiplicity criterion and the de Rham lifting theorems at odd primes and at `2`.
  Section 8.6 concludes modularity up to a global character twist for arbitrary distinct
  weights, with the labelled Hilbert weight and central-character convention of the README;
  normalized weights `{0,k−1}` over ℚ give exact weight-k modularity through §§7.9 and 7.11.
* Layers 10–12: `PanNicePrime`, `PanPotentiallyNicePrime` (with `panGoodComponent` and
  `panExtensionComponents` above), Pan's residually reducible theorem, the ordinary `3`-adic
  completion and the transfer statements along congruences. Sections 12.2–12.3 use normalized
  weights `{0,k−1}` with `k≥2` for exact modularity. The Pan branch carries the
  twist-two rational dual vanishing hypothesis LC and CC1–CC5. The odd irreducible branch
  carries LL1–LL3 and CC4–CC5, the dyadic branch CC1 and CC4–CC5, and the ordinary branch
  imports ClassicalSerreModularity §I.1 through OrdinaryAutomorphicFormsAndModularityLifting.
* Layer 0: odd-involution descent and Pan’s one-dimensional completion and bounded-denominator
  trace/deformation comparisons, using the native determinants, Cayley–Hamilton algebras, GMAs,
  reducibility ideals and Ribet lattices of IntegralHeckeAndGaloisDeterminants §§0.5, 1.2–1.4.
  Section 10.7a imports `PadicBaker.eq_zero_of_add_sum_mul_eq_zero` from
  LinearFormsInLogarithms §8.10; its common-power logarithm adapter gives `abelian_leopoldt`
  and the Galois-rank and reducible-locus dimension consequences. Section 5.8 imports the
  general unramified Fontaine–Laffaille smoothness theorem of LocalGaloisDeformationRings §3.10
  with its residual Fontaine–Laffaille, regular-width and nonempty fixed-determinant hypotheses.
-/

end TauCetiRoadmap.GL2ModularityLifting
