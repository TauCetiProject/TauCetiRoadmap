import Mathlib

/-!
# AInfCohomology: representative target signatures

These signatures are suggested forms, not an exhaustive checklist. `README.md` is the definitive
specification. This file records definitions with real bodies against the pinned Mathlib and
Tau Ceti, and the layer milestones whose carriers exist at the pins, proved by `sorry`. The heavy objects of the roadmap
(the décalage functor on derived categories of ringed topoi, Breuil–Kisin–Fargues modules, the
pro-étale period sheaves, `AΩ`, semistable charts and their log structures, the canonical
`B_dR⁺`-deformation, relative topological Hochschild homology and Breuil–Kisin cohomology) are
README targets; the closing comment lists their names.

Design choices made explicit here:
- `A_inf` is Mathlib's `WittVector p (PreTilt O p)` and `θ` is `WittVector.fontaineTheta`; the
  Frobenius `φ` is `WittVector.frobeniusEquiv`, an automorphism because the tilt is perfect.
- The cyclotomic elements `μ`, `ξ`, `ξ̃`, `ξ_r`, `ξ̃_r` are defined by polynomial formulas in the
  Witt vectors of any perfect ring of characteristic `p`; no division is used, and the
  factorization `μ = ξ · φ⁻¹(μ)` is a theorem. The generic finite-Witt kernels, regularity
  and Tor independence are imported from CrystallineCohomology CR.4.4; these polynomial
  formulas fix their cyclotomic generators.
- `θ̃ = θ ∘ φ⁻¹` is defined for any ring map and any automorphism, so that its kernel statement
  transports an existing principal kernel and assumes nothing else.
- The divisibility submodule of décalage lives inside a term of Mathlib's
  `CochainComplex (ModuleCat R) ℤ`; all integer degrees are allowed. The principal-`p`
  specialization uses the normalized module core owned by CrystallineCohomology CR.4;
  AI.1 extends it to general regular scalars and ringed topoi.
- The Breuil–Kisin Frobenius on `𝔖 = W(k)[[u]]` is coefficientwise `F` followed by Mathlib's
  substitution `u ↦ u^p`; the crystalline coefficient map is `F ∘ constantCoeff`. These generic
  formulas model the coefficient objects supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory
  R07.4.1 and R07.4.16; the arithmetic maps are transported aliases of that interface.
- Arithmetic period-ring inputs come from PadicPeriodRings. AI.7 defines Breuil–Kisin cohomology
  by Bott-inverted relative trace descent; its comparison with prismatic cohomology is a
  downstream target, not an input to these coefficient formulas.
-/

noncomputable section

namespace TauCetiRoadmap.AInfCohomology

open scoped BigOperators

/-! ## Layer AI.0: Cyclotomic periods and finite Witt coefficients -/

section Cyclotomic

variable (p : ℕ) [Fact p.Prime]
variable {S : Type*} [CommRing S] [CharP S p] [PerfectRing S p]

/-- The element `μ = [ε] − 1` of `W(S)`. For `S = O_C^♭` and a compatible system `ε` of primitive
`p`-power roots of unity this is the cyclotomic period of BMS1, Example 3.16 (Layer AI.0). -/
def mu (ε : S) : WittVector p S :=
  WittVector.teichmuller p ε - 1

/-- The element `ξ = Σ_{j<p} [ε^{1/p}]^j`; it is defined without division in the Witt ring. -/
def xi (ε : S) : WittVector p S :=
  ∑ j ∈ Finset.range p, (WittVector.teichmuller p ((_root_.frobeniusEquiv S p).symm ε)) ^ j

/-- The Frobenius-shifted element `ξ̃ = φ(ξ)`. For `S=O_C^♭` and the fixed compatible
primitive cyclotomic system, it generates the kernel of `θ̃ = θ ∘ φ⁻¹`. -/
def tildeXi (ε : S) : WittVector p S :=
  WittVector.frobenius (xi p ε)

/-- The product `ξ_r = ∏_{j<r} φ^{−j}(ξ)`. For `S=O_C^♭` and the fixed compatible
primitive cyclotomic system, it generates `ker θ_r`. -/
def xiLevel (ε : S) (r : ℕ) : WittVector p S :=
  ∏ j ∈ Finset.range r, ((WittVector.frobeniusEquiv p S).symm^[j]) (xi p ε)

/-- The shifted product `ξ̃_r = ∏_{1 ≤ j ≤ r} φ^{j}(ξ)`. For `S=O_C^♭` and the fixed
compatible primitive cyclotomic system, it generates `ker θ̃_r`. -/
def tildeXiLevel (ε : S) (r : ℕ) : WittVector p S :=
  ∏ j ∈ Finset.range r, ((WittVector.frobeniusEquiv p S)^[j + 1]) (xi p ε)

/-- The cyclotomic factorization `μ = ξ · φ⁻¹(μ)`, valid in `W(S)` for every perfect `S`. -/
theorem mu_factorization (ε : S) :
    mu p ε = xi p ε * (WittVector.frobeniusEquiv p S).symm (mu p ε) := by sorry

/-- The Frobenius of `μ` is `ξ̃ · μ`. -/
theorem frobenius_mu (ε : S) :
    WittVector.frobenius (mu p ε) = tildeXi p ε * mu p ε := by sorry

/-- The recursion `ξ_{r+1} = ξ_r · φ^{−r}(ξ)`. -/
theorem xiLevel_succ (ε : S) (r : ℕ) :
    xiLevel p ε (r + 1) =
      xiLevel p ε r * ((WittVector.frobeniusEquiv p S).symm^[r]) (xi p ε) := by sorry

/-- The recursion `ξ̃_{r+1} = ξ̃_r · φ^{r+1}(ξ)`. -/
theorem tildeXiLevel_succ (ε : S) (r : ℕ) :
    tildeXiLevel p ε (r + 1) =
      tildeXiLevel p ε r * ((WittVector.frobeniusEquiv p S)^[r + 1]) (xi p ε) := by sorry

-- The empty product: length zero.
example (ε : S) : xiLevel p ε 0 = 1 ∧ tildeXiLevel p ε 0 = 1 := by sorry

-- At length one the two conventions already give different generators.
example (ε : S) : xiLevel p ε 1 = xi p ε ∧ tildeXiLevel p ε 1 = tildeXi p ε := by sorry

-- Orientation at length two: `ξ_2` uses `φ⁻¹`, `ξ̃_2` uses `φ`.
example (ε : S) :
    xiLevel p ε 2 = xi p ε * (WittVector.frobeniusEquiv p S).symm (xi p ε) ∧
      tildeXiLevel p ε 2 = tildeXi p ε * WittVector.frobenius (tildeXi p ε) := by sorry

-- Non-example: `ε = 1` is not a primitive system; it gives `μ = 0` and `ξ = p`.
example : mu p (1 : S) = 0 ∧ xi p (1 : S) = p := by sorry

-- Characteristic two does not remove the integer 2 in the Witt ring.
example : mu 2 (1 : ZMod 2) = 0 ∧ xi 2 (1 : ZMod 2) = 2 := by sorry

/-- Residue specialization of the periods (Layer AI.0:integral): a ring map `ρ : S → k` to a
perfect ring of characteristic `p` with `ρ ε = 1` sends `μ` to `0` and `ξ` to `p`. -/
theorem map_mu_xi_of_eq_one {k : Type*} [CommRing k] [CharP k p] [PerfectRing k p]
    (ρ : S →+* k) (ε : S) (hρ : ρ ε = 1) :
    WittVector.map ρ (mu p ε) = 0 ∧ WittVector.map ρ (xi p ε) = p := by sorry

end Cyclotomic

section ShiftedTheta

variable {A O : Type*} [CommRing A] [CommRing O]

/-- `θ̃ = θ ∘ φ⁻¹` for a ring map `θ` and a ring automorphism `φ` (BMS1, §3, after Lemma 3.2). -/
def shiftedTheta (θ : A →+* O) (φ : A ≃+* A) : A →+* O :=
  θ.comp φ.symm.toRingHom

theorem shiftedTheta_surjective (θ : A →+* O) (φ : A ≃+* A) (h : Function.Surjective θ) :
    Function.Surjective (shiftedTheta θ φ) := by sorry

/-- The kernel of `θ̃` is the transport of the kernel of `θ`: if `ker θ = (x)` then
`ker θ̃ = (φ x)`. Principality is a hypothesis, not a conclusion. -/
theorem shiftedTheta_ker (θ : A →+* O) (φ : A ≃+* A) (x : A)
    (hx : RingHom.ker θ = Ideal.span {x}) :
    RingHom.ker (shiftedTheta θ φ) = Ideal.span {φ x} := by sorry

-- The identity automorphism gives the original map.
example (θ : A →+* O) : shiftedTheta θ (RingEquiv.refl A) = θ := by sorry

end ShiftedTheta

/-! ## Checks on the light carriers of AI.2 and AI.3 -/

-- AI.2.4: the rank-one Frobenius image `(ξ̃²)` fails to contain `(ξ̃)`.
example : ¬ (2 : ℤ) ∈ Ideal.span ({(2 : ℤ) ^ 2} : Set ℤ) := by sorry

-- AI.3.1: profinite products use continuous functions, which need not be locally constant.
example (p : ℕ) [Fact p.Prime] :
    Continuous (fun x : PadicInt p => (x : Padic p)) ∧
      ¬ IsLocallyConstant (fun x : PadicInt p => (x : Padic p)) := by sorry

section Fontaine

variable (p : ℕ) [Fact p.Prime]
variable (O : Type*) [CommRing O] [Fact (¬IsUnit (p : O))]
variable [IsAdicComplete (Ideal.span {(p : O)}) O]

/-- `θ̃` on Mathlib's `A_inf(O) = W(O^♭)`, built from the pinned Fontaine map. -/
def thetaTilde : WittVector p (PreTilt O p) →+* O :=
  shiftedTheta (WittVector.fontaineTheta O p) (WittVector.frobeniusEquiv p (PreTilt O p))

/-- `θ̃([a]) = (a^{1/p})^♯`. -/
theorem thetaTilde_teichmuller (a : PreTilt O p) :
    thetaTilde p O (WittVector.teichmuller p a) =
      PreTilt.untilt ((_root_.frobeniusEquiv (PreTilt O p) p).symm a) := by sorry

/-- `θ̃([a]^p) = a^♯`. -/
theorem thetaTilde_teichmuller_pow (a : PreTilt O p) :
    thetaTilde p O (WittVector.teichmuller p a ^ p) = PreTilt.untilt a := by sorry

-- Integer coefficients are fixed by `θ̃`.
example : thetaTilde p O (p : WittVector p (PreTilt O p)) = p := by sorry

end Fontaine

section CyclotomicKernel

variable (p : ℕ) [Fact p.Prime]
variable {C : Type*} [NontriviallyNormedField C] [IsUltrametricDist C] [CompleteSpace C]
  [IsAlgClosed C] [CharZero C]

/-- The valuation ring `O_C` of `C`. -/
abbrev integers (C : Type*) [NontriviallyNormedField C] [IsUltrametricDist C] : Subring C :=
  (NormedField.valuation (K := C)).integer

variable [Fact (¬IsUnit (p : integers C))] [IsAdicComplete (Ideal.span {(p : integers C)}) (integers C)]

/-- Milestone of Layer AI.0: for a compatible system `ε` whose first root `(ε^{1/p})^♯` is a
primitive `p`-th root of unity, `ker θ = (ξ)` and `ker θ̃ = (ξ̃)` in `A_inf = W(O_C^♭)`
(BMS1, Example 3.16 and Proposition 3.17). -/
theorem ker_fontaineTheta_eq_span_xi (ε : PreTilt (integers C) p)
    (hε : IsPrimitiveRoot
      (PreTilt.untilt ((_root_.frobeniusEquiv (PreTilt (integers C) p) p).symm ε)) p) :
    RingHom.ker (WittVector.fontaineTheta (integers C) p) = Ideal.span {xi p ε} ∧
      RingHom.ker (thetaTilde p (integers C)) = Ideal.span {tildeXi p ε} := by sorry

/-- Milestone of Layer AI.0: `p, μ` is a regular sequence on `A_inf` (BMS1, Proposition 3.17). -/
theorem isRegular_p_mu (ε : PreTilt (integers C) p)
    (hε : IsPrimitiveRoot
      (PreTilt.untilt ((_root_.frobeniusEquiv (PreTilt (integers C) p) p).symm ε)) p) :
    RingTheory.Sequence.IsRegular (WittVector p (PreTilt (integers C) p))
      [(p : WittVector p (PreTilt (integers C) p)), mu p ε] := by sorry

-- The three cyclotomic evaluations distinguish the two Fontaine maps.
example (ε : PreTilt (integers C) p)
    (hε : IsPrimitiveRoot
      (PreTilt.untilt ((_root_.frobeniusEquiv (PreTilt (integers C) p) p).symm ε)) p) :
    WittVector.fontaineTheta (integers C) p (mu p ε) = 0 ∧
    WittVector.fontaineTheta (integers C) p (tildeXi p ε) = p ∧
    thetaTilde p (integers C) (tildeXi p ε) = 0 := by sorry

-- The generic polynomials do not assert a kernel formula for arbitrary ε.
example : xi 2 (0 : ZMod 2) = 1 ∧ tildeXi 2 (0 : ZMod 2) = 1 := by sorry

-- Length one identifies the Witt almost ideal with the nonzero proper maximal ideal.
example :
    let m := IsLocalRing.maximalIdeal (integers C)
    Function.Bijective (fun x : TruncatedWittVector p 1 (integers C) => x.coeff 0) ∧
    (p : TruncatedWittVector p 1 (integers C)).coeff 0 ∈ m ∧
    (p : TruncatedWittVector p 1 (integers C)) ≠ 0 ∧
    (1 : TruncatedWittVector p 1 (integers C)).coeff 0 ∉ m := by sorry

-- At length two, the cyclotomic quotient and V(1) have different first coordinates.
example (ζ : integers C) (hζ : IsPrimitiveRoot ζ 4) :
    (WittVector.truncate 2 (1 + WittVector.teichmuller 2 ζ)).coeff 0 = 1 + ζ ∧
    1 + ζ ≠ 0 ∧
    (WittVector.truncate 2 (WittVector.verschiebung (1 : WittVector 2 (integers C)))).coeff 0 = 0 := by sorry

end CyclotomicKernel

/-! ## Layer AI.1: The décalage operator Lη -/

section Decalage

open CategoryTheory

universe u

variable {R : Type u} [CommRing R]

/-- The divisibility submodule `E_f(C)^i = {x ∈ C^i : d x ∈ f · C^{i+1}}` of a cochain complex of
`R`-modules indexed by `ℤ` (BMS1, §6.1). Multiplication by `f^i` identifies it with `(η_f C)^i`
when `f` is a nonzerodivisor on every term; no torsion-freeness is needed to define it. For
`R = ℤ`, `f = p` prime, this submodule is the kernel defining the normalized principal-`p`
core of CrystallineCohomology CR.4; its torsion-free complex and derived interfaces use that core. -/
def etaTerm (C : CochainComplex (ModuleCat.{u} R) ℤ) (f : R) (i : ℤ) : Submodule R (C.X i) :=
  Submodule.comap (C.d i (i + 1)).hom (LinearMap.range (LinearMap.lsmul R (C.X (i + 1)) f))

theorem mem_etaTerm (C : CochainComplex (ModuleCat.{u} R) ℤ) (f : R) (i : ℤ) (x : C.X i) :
    x ∈ etaTerm C f i ↔ ∃ y : C.X (i + 1), f • y = (C.d i (i + 1)).hom x := by sorry

-- For `f = 1` every element is divisible.
example (C : CochainComplex (ModuleCat.{u} R) ℤ) (i : ℤ) : etaTerm C 1 i = ⊤ := by sorry

-- For `f = 0` the divisibility submodule is the module of cocycles.
example (C : CochainComplex (ModuleCat.{u} R) ℤ) (i : ℤ) :
    etaTerm C 0 i = LinearMap.ker (C.d i (i + 1)).hom := by sorry

-- A zero differential gives the entire divisibility submodule for every f.
example (C : CochainComplex (ModuleCat.{u} R) ℤ) (f : R) (i : ℤ)
    (hd : C.d i (i + 1) = 0) : etaTerm C f i = ⊤ := by sorry

/-- The integer complex `[ℤ --a→ ℤ]` in degrees zero and one, zero elsewhere. -/
def integerTwoTerm (a : ℤ) : CochainComplex (ModuleCat ℤ) ℤ :=
  CochainComplex.of
    (fun i : ℤ => if i = 0 ∨ i = 1 then ModuleCat.of ℤ ℤ else ModuleCat.of ℤ (Fin 0 → ℤ))
    (fun i => if h : i = 0 then by
      subst i
      exact ModuleCat.ofHom (LinearMap.lsmul ℤ ℤ a)
    else 0)
    (by sorry)

-- The nondivisible element is excluded by η, even in an acyclic complex.
example : (show (integerTwoTerm 1).X 0 from (1 : ℤ)) ∉ etaTerm (integerTwoTerm 1) 2 0 := by sorry

-- A divisible differential and the terminal term give the full divisibility modules.
example : etaTerm (integerTwoTerm 4) 2 0 = ⊤ ∧
    etaTerm (integerTwoTerm 4) 2 1 = ⊤ := by sorry

-- Changing 2 to −2 multiplies degree-one normalized coordinates by −1.
example (x : ℤ) : (-1 : ℤ) ^ (1 : ℕ) * x = -x := by sorry

-- The negative tensor power of (2) is the line (1/2)ℤ inside ℚ.
example : (1 / 2 : ℚ) ∈ LinearMap.range
    ({ toFun := fun n : ℤ => (n : ℚ) / 2
       map_add' := by sorry
       map_smul' := by sorry } : ℤ →ₗ[ℤ] ℚ) ∧
    (4 : ℚ) * (1 / 2) = 2 := by sorry

-- The cochain Koszul convention d⁰(m) = (xm, ym), d¹(a,b) = xb − ya has square zero.
example (x y m : R) : x * (y * m) - y * (x * m) = 0 := by sorry

-- In the ordered dual basis, d¹(e₁) = −y and d¹(e₂) = x, including characteristic two.
example (x y : R) : x * 0 - y * 1 = -y ∧ x * 1 - y * 0 = x := by sorry

-- Noncommuting operators give a nonzero square over every nonzero coefficient ring.
example [Nontrivial R] :
    let g₁ : Matrix (Fin 2) (Fin 2) R := !![0, 1; 0, 0]
    let g₂ : Matrix (Fin 2) (Fin 2) R := !![0, 0; 1, 0]
    g₁ * g₂ - g₂ * g₁ = !![1, 0; 0, -1] ∧
    (g₁ * g₂ - g₂ * g₁).mulVec ![1, 0] = ![1, 0] ∧
    g₁ * g₂ - g₂ * g₁ ≠ 0 := by sorry

-- Over the zero ring the same commutator vanishes.
example :
    let g₁ : Matrix (Fin 2) (Fin 2) (ZMod 1) := !![0, 1; 0, 0]
    let g₂ : Matrix (Fin 2) (Fin 2) (ZMod 1) := !![0, 0; 1, 0]
    g₁ * g₂ - g₂ * g₁ = 0 ∧
    (g₁ * g₂ - g₂ * g₁).mulVec ![1, 0] = 0 := by sorry

end Decalage

/-! ## Layer AI.3: Integral pro-étale period sheaves and AΩ -/

section QInteger

variable {R : Type*} [CommRing R]

/-- The `q`-integer `[n]_q = Σ_{j<n} q^j`, the coefficient of the divided torus differential
`d(T^n) = [n]_q T^n dlog_q T` of the `q`-de Rham model (BMS1, Remark 7.8). -/
def qInteger (q : R) (n : ℕ) : R := ∑ j ∈ Finset.range n, q ^ j

theorem qInteger_mul_sub_one (q : R) (n : ℕ) : (q - 1) * qInteger q n = q ^ n - 1 := by sorry

-- At `q = 1` the `q`-integer is the ordinary integer `n`.
example (n : ℕ) : qInteger (1 : R) n = n := by sorry

-- `d(T²) = (1 + q) T² dlog_q T`.
example (q : R) : qInteger q 2 = 1 + q := by sorry

-- The empty sum is zero; the divided-difference formula is defined at q = 1.
example (q : R) : qInteger q 0 = 0 := by sorry

/-- The Laurent q-integer for an integer exponent and a unit q (BMS1, Remark 7.8). -/
def laurentQInteger (q : Rˣ) (n : ℤ) : R :=
  if 0 ≤ n then qInteger (q : R) n.toNat
  else -((q ^ n : Rˣ) : R) * qInteger (q : R) (-n).toNat

-- The inverse torus coordinate has coefficient −q⁻¹.
example (q : Rˣ) : laurentQInteger q (-1) = -((q⁻¹ : Rˣ) : R) := by sorry

example (n : ℤ) : laurentQInteger (1 : Rˣ) n = n := by sorry

example (q : Rˣ) : laurentQInteger q 2 = 1 + (q : R) := by sorry

end QInteger

/-! ## Polynomial, monodromy and multiplicative checks of AI.1 and AI.6 -/

-- The log chain rule sums all source occurrences with a given target value (AI.6.6).
example {R ι κ : Type*} [CommRing R] [Fintype ι] [DecidableEq κ]
    (v : ι → κ) (a : κ) (P : MvPolynomial ι R) :
    MvPolynomial.X a * MvPolynomial.pderiv a (MvPolynomial.rename v P) =
      ∑ τ : ι, if v τ = a then
        MvPolynomial.rename v (MvPolynomial.X τ * MvPolynomial.pderiv τ P) else 0 := by sorry

-- Two independent occurrences mapping to Z have a summed derivative, and no individual identity.
example (P : MvPolynomial (Fin 2) ℤ) :
    let f := MvPolynomial.rename (R := ℤ) (fun _ : Fin 2 => ())
    let X : MvPolynomial (Fin 2) ℤ := MvPolynomial.X 0
    let Y : MvPolynomial (Fin 2) ℤ := MvPolynomial.X 1
    let Z : MvPolynomial Unit ℤ := MvPolynomial.X ()
    let D₀ := X • MvPolynomial.pderiv 0
    let D₁ := Y • MvPolynomial.pderiv 1
    let D := Z • MvPolynomial.pderiv ()
    f X = Z ∧ f Y = Z ∧ D (f P) = f (D₀ P + D₁ P) ∧
      f (D₀ Y) = 0 ∧ D (f Y) = Z ∧ Z ≠ 0 := by sorry

-- Branch and torus log derivations, including their weights on every monomial.
example (a b : ℕ) (c : ℤ) :
    let X₀ : MvPolynomial (Fin 2) ℤ := MvPolynomial.X 0
    let X₁ : MvPolynomial (Fin 2) ℤ := MvPolynomial.X 1
    let D : Derivation ℤ (MvPolynomial (Fin 2) ℤ) (MvPolynomial (Fin 2) ℤ) :=
      X₁ • MvPolynomial.pderiv 1 - X₀ • MvPolynomial.pderiv 0
    D (X₀ * X₁ - MvPolynomial.C c) = 0 ∧
    D (X₀ ^ a * X₁ ^ b) = ((b : ℤ) - a) • (X₀ ^ a * X₁ ^ b) := by sorry

example (a b : ℕ) :
    let Y : MvPolynomial (Fin 2) ℤ := MvPolynomial.X 0
    let Z : MvPolynomial (Fin 2) ℤ := MvPolynomial.X 1
    let D : Derivation ℤ (MvPolynomial (Fin 2) ℤ) (MvPolynomial (Fin 2) ℤ) :=
      Y • MvPolynomial.pderiv 0 - Z • MvPolynomial.pderiv 1
    D (Y * Z - 1) = 0 ∧
    D (Y ^ a * Z ^ b) = ((a : ℤ) - b) • (Y ^ a * Z ^ b) := by sorry

-- The position of N relative to the two Frobenius slopes fixes Nφ = pφN.
example :
    let φ : Matrix (Fin 2) (Fin 2) ℤ := !![1, 0; 0, 3]
    let N : Matrix (Fin 2) (Fin 2) ℤ := !![0, 1; 0, 0]
    let N' : Matrix (Fin 2) (Fin 2) ℤ := !![0, 0; 1, 0]
    N * φ = 3 • (φ * N) ∧ N' * φ ≠ 3 • (φ * N') := by sorry

-- Trivial rank-two action gives an exterior product with the ordered sign.
example :
    let x : ExteriorAlgebra ℤ (Fin 2 → ℤ) := ExteriorAlgebra.ι ℤ (Pi.single 0 1 : Fin 2 → ℤ)
    let y : ExteriorAlgebra ℤ (Fin 2 → ℤ) := ExteriorAlgebra.ι ℤ (Pi.single 1 1 : Fin 2 → ℤ)
    x * y ≠ 0 ∧ y * x = -(x * y) := by sorry

-- In characteristic two the exterior relation supplies information beyond the sign rule.
example :
    let k := GaloisField 2 1
    let x : ExteriorAlgebra k k := ExteriorAlgebra.ι k (1 : k)
    Nat.card k = 2 ∧ x * x = 0 ∧ (Polynomial.X : Polynomial k) ^ 2 ≠ 0 := by sorry

-- A Laurent matrix realization of xt = −tx for γ(t) = −t.
example :
    let t : LaurentPolynomial ℤ := LaurentPolynomial.T 1
    let T : Matrix (Fin 2) (Fin 2) (LaurentPolynomial ℤ) := !![t, 0; 0, -t]
    let x : Matrix (Fin 2) (Fin 2) (LaurentPolynomial ℤ) := !![0, 1; 0, 0]
    x * T = -(T * x) ∧ x * x = 0 := by sorry

-- Annihilators of 1 and 0 cannot be interchanged, already on length-two Witt vectors.
example (p : ℕ) [Fact p.Prime] (R : Type*) [CommRing R] :
    (∀ x : TruncatedWittVector p 2 R, x * 1 = 0 ↔ x = 0) ∧
    (∀ x : TruncatedWittVector p 2 R, x * 0 = 0) := by sorry

/-! ## Layer AI.7: Breuil–Kisin cohomology and relative traces -/

section BreuilKisinCoefficient

variable {R : Type*} [CommRing R]

/-- The generic power-series formula for the supplied Breuil–Kisin Frobenius:
`F` on coefficients and `u ↦ u^p`. Its arithmetic specialization uses R07.4.1's map. -/
def coefficientFrobenius (p : ℕ) (hp : p ≠ 0) (F : R →+* R) : PowerSeries R →+* PowerSeries R :=
  (PowerSeries.substAlgHom (PowerSeries.HasSubst.X_pow hp)).toRingHom.comp (PowerSeries.map F)

/-- The generic power-series expression `F ∘ constantCoeff : R[[u]] → R`.
For `R = W(k₀)` and `F = φ_W`, this models the transported alias `c = ε₁` of
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.16's `kisinPeriodScalarMaps`. -/
abbrev crystallineCoefficient (F : R →+* R) : PowerSeries R →+* R :=
  F.comp (PowerSeries.constantCoeff (R := R))

/-- The coefficient formula of the Breuil–Kisin Frobenius. -/
theorem coefficientFrobenius_formula (p : ℕ) (hp : p ≠ 0) (F : R →+* R)
    (a : R) (f : PowerSeries R) (n : ℕ) :
    coefficientFrobenius p hp F (PowerSeries.C a) = PowerSeries.C (F a) ∧
    coefficientFrobenius p hp F PowerSeries.X = PowerSeries.X ^ p ∧
    PowerSeries.coeff n (coefficientFrobenius p hp F f) =
      if p ∣ n then F (PowerSeries.coeff (n / p) f) else 0 := by sorry

/-- The generic residue formula intertwines the supplied Breuil–Kisin Frobenius with `F`;
at `R = W(k₀)` this gives the cohomological compatibility of the imported `ε₁`. -/
theorem crystallineCoefficient_comp (p : ℕ) (hp : p ≠ 0) (F : R →+* R) :
    (crystallineCoefficient F).comp (coefficientFrobenius p hp F) =
      F.comp (crystallineCoefficient F) := by sorry

-- With `F = id` the crystalline map is the constant coefficient.
example : crystallineCoefficient (RingHom.id R) = PowerSeries.constantCoeff (R := R) := by sorry

-- The variable `u` has degree zero and maps to zero.
example (F : R →+* R) : crystallineCoefficient F PowerSeries.X = 0 := by sorry

-- At p = 2 the coefficient at u is zero while u² has coefficient F(a).
example (F : R →+* R) (a : R) :
    PowerSeries.coeff 1 (coefficientFrobenius 2 (by decide) F
      (PowerSeries.C a * PowerSeries.X)) = 0 ∧
    PowerSeries.coeff 2 (coefficientFrobenius 2 (by decide) F
      (PowerSeries.C a * PowerSeries.X)) = F a := by sorry

-- Constant coefficients retain precisely one application of F.
example (F : R →+* R) (a : R) : crystallineCoefficient F (PowerSeries.C a) = F a := by sorry

-- No series has Frobenius image u when all exponents in the image are even.
example : (PowerSeries.X : PowerSeries ℤ) ∉
    Set.range (coefficientFrobenius 2 (by decide) (RingHom.id ℤ)) := by sorry

-- A chosen multiplicative generator of the field of four elements is not Frobenius-fixed.
example :
    let k := GaloisField 2 2
    let a : k := (Classical.choose (IsCyclic.exists_generator (α := kˣ)) : kˣ)
    Nat.card k = 4 ∧ a ^ 2 ≠ a ∧
    WittVector.map (RingHom.id k) (WittVector.teichmuller 2 a) ≠
      WittVector.frobenius (WittVector.map (RingHom.id k) (WittVector.teichmuller 2 a)) ∧
    crystallineCoefficient (WittVector.frobenius : WittVector 2 k →+* WittVector 2 k)
      (PowerSeries.C (WittVector.teichmuller 2 a)) = WittVector.teichmuller 2 (a ^ 2) ∧
    WittVector.teichmuller 2 (a ^ 2) ≠ WittVector.teichmuller 2 a := by sorry

-- For the monic unramified E = u − p, residue evaluation gives −p and the trace unit is −1.
example (p : ℕ) [Fact p.Prime] :
    Polynomial.eval (0 : PadicInt p)
      (Polynomial.X - Polynomial.C (p : PadicInt p)) = -(p : PadicInt p) ∧
    -(p : PadicInt p) * (-1) = p ∧ (2 : PadicInt p) * p ≠ 0 := by sorry

end BreuilKisinCoefficient

-- Precomposing the loop z ↦ s zⁿ with z ↦ zᵖ preserves s and multiplies its weight by p.
example (p n : ℕ) (s z : Circle) :
    (fun w : Circle => s * w ^ n) (z ^ p) = s * z ^ (p * n) := by sorry

-- On weight pn, residual rotation by [λ] becomes weight n through [λ] ↦ λᵖ.
example (p n : ℕ) (s t : Circle) :
    t ^ (p * n) * s = (t ^ p) ^ n * s := by sorry

-- At weight one, p = 2 and t = −1, raising the circle coordinate to p fails equivariance.
example : ((-1 : Circle) * 1) ^ 2 ≠ (-1 : Circle) * (1 : Circle) ^ 2 := by sorry

/-! ## Targets stated in README.md only

The following definitions and constructions are README targets: their carriers (derived categories of
ringed topoi with décalage, Breuil–Kisin–Fargues modules, pro-étale period sheaves, semistable charts
and log structures, B_dR⁺-envelopes, spectra with circle actions) are not available at the pins.

Layer AI.0: `AInf.thetaWitt`. The generic kernel and regularity API of `AInf.xiWitt` and
`AInf.witt_base_change` are transported aliases of CrystallineCohomology CR.4.4's
finite-Witt perfectoid package, for all integral perfectoid maps and either restriction or
Frobenius module structures. The `xiLevel` formulas above fix the cyclotomic generators;
`AInf.witt_almost_ideal` adds the cyclotomic q-generators and almost-ideal assertions. The local name `AInf.witt_etale_base_change` is an alias of
CrystallineCohomology CR.4's coefficient theorem in *Witt localization and étale descent*:
for a prime `p`, `r ≥ 1` and an étale map `A → B` of arbitrary commutative rings,
`W_r(A) → W_r(B)` is étale and `W_r(A′) ⊗_{W_r(A)} W_r(B) ≅ W_r(B ⊗_A A′)` for every `A → A′`.

Layer AI.0:integral: `AInf.bkTwist`; `AInf.residue` is Mathlib's Witt map specialized to the
residue homomorphism, with its period calculation recorded above.

Layer AI.1: `Decalage.etaDifferential`, `Decalage.etaComplex`, `Decalage.etaMap`,
`Decalage.idealPow`, `Decalage.idealEta`, `Decalage.derivedEta`, `Decalage.etaTensor`,
`Decalage.bockstein`, `Decalage.bocksteinMap`, `Decalage.completedTensor`, `Decalage.pCompletion`,
`Decalage.koszulComplex`, `Decalage.contCochains`.

Layer AI.2: `BKF.Module`, `BKF.Rigidified`, `BKF.LatticePair`, `BKF.etale`, `AInf.Yan`, `BKF.reconstruct`,
`AInf.MinusculeBKF`. The period criterion `AInf.p_local_freeness_from_periods` is in AI.2.1,
before closure of crystalline-rigidified BKF modules; `BKF.Rigidified` includes the Frobenius-compatible
crystalline isomorphism, identity residue reduction and comparison-preserving morphisms.

Layer AI.3: `AInfSheaf.completedIntegral`, `AInfSheaf.tilt`, `AInf.classical_ainf_sheaf`,
`AInfSheaf.ainf`, `AInfSheaf.deRhamPeriods`, `AInfSheaf.structuralDeRhamPeriods`,
`AInf.nu`, `AOmega.local`, `AOmega.toricCover`, `AOmega.qModel`, `AInf.sqZero`.
For `AInfSheaf.structuralDeRhamPeriods`, the affinoid perfectoid presentation
`U = lim_i Spa(R_i,R_i⁺)` with completed limit `(R,R⁺)` gives the sheafification of
`colim_i (((R_i⁺ ⊗_{W(k₀)} A_inf(R,R⁺))^∧_p)[1/p])^∧_{ker θ_i}`.
The completions are classical and ordered as written (Sch13-corr, item (3)); the stabilized
toric power-series computation supplies its connection and strict Poincaré lemma.

Layer AI.4: `AInf.hodge_tate_local` provides the θ̃ reduction and framed exterior-power
calculation. `AInf.eta_factorization_criterion` and `AInf.hodge_tate_cotangent` then construct
the canonical first-truncation map with its torus dlog normalization. `AInf.hodge_tate` is
the canonical multiplicative differential-form identification deduced from these inputs.
`AOmega.wittPre`, `AOmega.wittImproved`, `AInf.boundedPD`
(`AInf.bounded_pd_coefficients`).

Layer AI.5: `AOmega.proper`. In `AInf.crystalline_frobenius_bijective`, the ordinary
Frobenius base-change formula has `Y = 𝔛_(O_C/p)` for a proper smooth p-adic formal
`O_C`-scheme. The rational Frobenius-isogeny clause retains arbitrary qcqs smooth `Z`.

Layer AI.6: `Semistable.chartRing`, `Semistable.divisorialLog`, `Semistable.monomialExponents`,
`Semistable.rootTower`, `Semistable.ainfChartLift`, `Semistable.aOmega`,
`Semistable.finiteLevelAcris`, `Semistable.logDerivations`, `Semistable.allCoordinates`,
`Semistable.allCoordinates.rootCovers`, `Semistable.logExactification`,
`Semistable.allCoordinatesPD`, `Semistable.allCoordinatesAOmega`,
`Semistable.allCoordinatesLogCrystalline`, `Semistable.allCoordinatesComparisonMap`,
`AInf.bdr_infinitesimal_envelope`, `AInf.canonical_bdr_deformation`, `AInf.canonical_bdr_etale_map`,
`Semistable.bdrComparisonMap`, `AInf.normalized_valuation_length`,
`Semistable.deRhamLatticeFunctor`, `AInf.pure_integral_model_freeness`. The latter supplies
purity/projectivity and local-ring freeness of algebraic integral models before completion.
The local ring map of `Semistable.bdrComparisonMap` induces the map on log differentials
`dlog X_τ ↦ dlog X_{v(τ)}` and its exterior powers, where `τ` indexes source occurrences and
`v(τ)` is their coordinate value. Its operator identity is
`D′_a ∘ f = Σ_{v(τ)=a} f ∘ D_τ`, compatible with refinement; repeated values contribute a sum.

Layer AI.7: `CohomologicalBK.coefficientNormalization`, `AInf.Trace.tate`,
`AInf.Trace.tateDiagonal`, `AInf.Trace.THH`,
`AInf.Trace.bokstedtSpectralSequence`, `AInf.Trace.dyerLashofInput`,
`AInf.relative_cyclotomic_traces`,
`AInf.qrsp_trace_unfolding`, `CohomologicalBK.cohomology`, `CohomologicalBK.twistedTrace`,
`CohomologicalBK.traceDescent`, `CohomologicalBK.twistCompatibility`,
`CohomologicalBK.choiceTransport`.
`CohomologicalBK.coefficientNormalization` uses transported aliases of R07.4.16's
`kisinPeriodScalarMaps`: `g = ι₀`, `f = ι₁`, `constantCoeff = ε₀`, `c = ε₁`, including
the supplied Eisenstein-kernel identities. `CohomologicalBK.twistCompatibility` extends
R07.4.15's imported `𝔖{1}` and conormal/Frobenius data to the intrinsic `A_inf{1}`.
`AInf.relative_cyclotomic_traces` uses loop precomposition: `(s,n) ↦ (s,pn)` with the
target action transported through `𝕋/C_p ≃ 𝕋`, `[λ] ↦ λ^p`; weight zero stays a point.
`AInf.Trace.bokstedtSpectralSequence` imports DGAInfinity Layer 8's normalized chains.
Internal homological degree `t` corresponds to cohomological degree `−t`, and
Hochschild length `s` contributes `−s`, so total degree is `−(s+t)`; its boundary
lowers length and preserves `t`. AI.7 supplies the skeletal identification and spectral structures.
`AInf.Trace.tateFinite` is BordismFormalGroups F6.5's finite-group Tate functor transported
through EnhancedDerivedSheaves E5:spectra-comparison. `AInf.Trace.tateOrbit` and
`AInf.Trace.completedTateComparison` give the bounded-below Tate-orbit vanishing and the
natural multiplicative equivalence `(X^{t𝕋})^∧_p ≃ (X^{tC_p})^{h(𝕋/C_p)}`, compatible with
`can`. This comparison turns residual-circle fixed points of the absolute or relative
cyclotomic map into Frobenius on p-completed `TC⁻ → TP`.
`AInf.Trace.dyerLashofInput` uses TangentialBordism B4's computed dual Steenrod Hopf algebras
and conjugate generators; it supplies their Dyer–Lashof values and Bökstedt differentials.
For monic E the relative trace coefficients retain a unit α:
`bv=E`, `can(b)=Eσ`, `can(v)=σ⁻¹`, `φ(b)=ασ`, `φ(v)=φ(E)α⁻¹σ⁻¹`.
The finite-Tate specialization sends `b` to `θ̃^(−1)(α)σ`; Bott inversion uses the unit ασ,
and `can⁻¹φ` acts on the localized degree-two line by α/E. A basis rescaling by c changes
α to φ(c)α/c. These same factors are retained in `CohomologicalBK.twistedTrace`,
`CohomologicalBK.traceDescent` and `CohomologicalBK.twistCompatibility`.

-/

end TauCetiRoadmap.AInfCohomology
