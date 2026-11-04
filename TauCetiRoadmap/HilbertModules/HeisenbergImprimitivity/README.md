# Roadmap: Heisenberg imprimitivity for phase-space lattices

**Summary.** For a finite-type locally compact abelian group `M=ℝ^k×ℤ^p×𝕋^q×F` (k,p,q≥0, F
finite abelian) and a lattice D in its phase space `G=M×M̂`, this roadmap builds the
Schwartz–Bruhat space S(M), Poisson summation for D and its symplectic annihilator `E=D^⊥`, the
twisted group C*-algebras `B=C*(D,β)` and `A=C*(E,conj β)` of the Heisenberg cocycle β, and the
two algebra-valued pairings on S(M). Its end theorems are Rieffel's imprimitivity theorem for
lattices — the completion 𝓔 of S(M) is a B–A imprimitivity bimodule, so `B≅K_A(𝓔)` and A and B
are strongly Morita equivalent — together with the existence of finite Parseval frames with
Schwartz windows and the trace formula `dim_A 𝓔=Σ_j‖ξ_j‖₂²=c_E=1/c_D`. On the Euclidean phase
space `ℝ^k×ℝ^k` the operator fundamental identity, frame existence and the frame trace formula
are stated on Mathlib's `SchwartzMap` and `IsZLattice` carriers, and the Euclidean lattice Poisson
formula behind them is consumed from ThetaSeries Layer 1 in symplectic coordinates. The
last layer computes the Euclidean, discrete, toral and finite families and the dictionary with
the smooth noncommutative two-torus module of NoncommutativeGeometry N7.

## Scope and ownership

This roadmap is a child of HilbertModules and owns, for finite-type M:

- the Schrödinger family, the Heisenberg cocycle and its commutator character (Layer 1; the
  cocycle calculus is stated for every locally compact Hausdorff abelian M, since it costs
  nothing more);
- symplectic annihilators, lattices, covolumes and the identity `c_D c_(D^⊥)=1` in phase space
  (Layer 1);
- the Schwartz–Bruhat space S(M), its Fourier theory, Poisson summation for a lattice in the
  phase space of a finite-type M, the symplectic transport of the Euclidean lattice Poisson
  formula of ThetaSeries Layer 1 (`F_sF(e)=𝓕F(−Je)`, `L^⊥=J⁻¹L^∨`, `c_L c_(L^⊥)=1`), and the
  fundamental identity (Layer 2);
- the twisted group C*-algebra `C*(L,c)` of a discrete abelian group L with a normalised
  circle-valued 2-cocycle c: its ℓ¹ algebra, universal and regular completions, canonical trace,
  gauge action, full = reduced theorem, and the inverse-closedness of its rapid-decay subalgebra
  when L is finitely generated (Layer 3, Layer 5). No roadmap on main owns twisted group
  C*-algebras of a 2-cocycle: OperatorAlgebraDynamics D1–D2 construct crossed products for an
  action and regular representations, and are consumed only for those;
- the pairings, positivity, completion, fullness and imprimitivity theorem (Layers 3–4), smooth
  frames, the trace formula and transport (Layer 5), and the worked families (Layer 6).

Left to other owners:

- HilbertModules H1 owns completions of pre-Hilbert modules, H2 adjointable and module-compact
  operators and the finite Parseval frame criterion for unital coefficients, H3 interior tensor
  products, state localisation, imprimitivity bimodules, linking algebras and induction. They are
  consumed, not restated.
- NoncommutativeGeometry N6–N7 own the smooth two-torus 𝒜_θ, its spectral invariance, cyclic
  cohomology, connections, curvature, index and the 0<θ<1 Schwartz module; Layer 6 compares with
  that module and does not rebuild it.
- OperatorAlgebraDynamics D1–D2 own integrated forms of covariant pairs, regular representations,
  the discrete faithful conditional expectation, and the theorem that amenability makes the
  trivial representation weakly contained in the regular one.
- AmenableGroups Layer 6 owns amenability of every abelian discrete group.
- ThetaSeries Layer 1 owns Poisson summation for a full-rank ℤ-lattice in a finite-dimensional
  real inner product space, for Schwartz functions, with both summability halves, the Fourier
  change of variables under a linear automorphism and the dual-lattice transport; its 2A owns the
  Euclidean dual lattice `L^∨` with `L^∨∨=L`, and its 2C the identity `covol(L^∨)=covol(L)⁻¹`.
  The lattice Poisson formula on `ℝ^k×ℝ^k` is that theorem in symplectic coordinates (§2.4) and is
  consumed, not restated.
- Mathlib owns `SchwartzMap`, its Fourier transform, one-dimensional Poisson summation, Fourier
  series on `AddCircle`, `PontryaginDual`, `ZLattice.covolume` and the `CStarModule` classes.

The imprimitivity theorem is stated for lattices D, where both D and `E=D^⊥` are discrete, both
algebras are unital and carry finite traces, and the frame and dimension theory of Layer 5 applies.
Rieffel's theorem for an arbitrary closed subgroup D (rieffel88 line 639, Theorem 2.15, p. 273),
whose algebras are twisted group C*-algebras of non-discrete groups, is outside this roadmap and
belongs to a Part II of it, which starts from the Schwartz–Bruhat analysis of Layer 2.

## Conventions

- `e(r)=exp(2πir)`. Inner products on L²(M) are linear in the **second** variable: `⟨ξ,η⟩=∫
  conj(ξ(t)) η(t) dt`. Rieffel uses the opposite convention (rieffel88 line 385, proof of Lemma 2.3,
  p. 266); every formula from that source is converted.
- A character χ∈M̂ pairs with M by `χ(t)`. On the coordinates: `ℝ^k` with Lebesgue measure and
  `ℝ^k≅ℝ̂^k`, `s↦(t↦e(s⬝t))`; `ℤ^p` with counting measure and dual `𝕋^p`; `𝕋^q` with probability
  Haar measure and dual `ℤ^q`; F with counting measure and `F̂` with normalised counting measure
  (mass `1/|F|` per point). These are dual measures, and the phase measure on `G=M×M̂` is their
  product; it does not depend on the choice of Haar measure on M (rieffel88 line 526, p. 270).
- Schrödinger operators, the Heisenberg cocycle and its commutator character:

  ```
  (π_(m,χ) ξ)(t) = χ(t) ξ(t+m)
  β((m,χ),(n,ψ)) = ψ(m)
  σ(x,y)         = β(x,y) conj(β(y,x))
  ```

  so `π_xπ_y=β(x,y)π_(x+y)` and `π_xπ_y=σ(x,y)π_yπ_x`.
- A **lattice** in G is a discrete subgroup with compact quotient. For a lattice L, `c_L` is the
  total mass of G/L for the quotient of the phase measure by counting measure on L, the volume of
  a fundamental domain.
- Twisted convolution on a discrete abelian group L with a normalised 2-cocycle c (`c(0,x)=c(x,0)=1`,
  `|c|=1`):

  ```
  (f *_c g)(x) = Σ_y f(y) g(x−y) c(y,x−y)
  f^*(x)       = conj(c(−x,x)) conj(f(−x))
  ```

  so the point masses satisfy `δ_xδ_y=c(x,y)δ_(x+y)` and `δ_x^*=conj(c(−x,x))δ_(−x)`.
- Right Hilbert modules over A are Mathlib `CStarModule Aᵐᵒᵖ` instances with the
  opposite-valued inner product, as in HilbertModules H1; the left B-valued pairing is linear in
  its first variable.

## Exact supplier contracts

**From Mathlib.**

- `SchwartzMap` and `SchwartzMap.seminorm` (seminorm index (k,n): polynomial weight, derivative
  order); `SchwartzMap.fourierTransformCLM` on a finite-dimensional real inner product space and
  the Parseval identity `SchwartzMap.integral_sesq_fourier_eq`
  (`Mathlib/Analysis/Distribution/SchwartzSpace/Fourier.lean`).
- One-dimensional Poisson summation `Real.tsum_eq_tsum_fourier` and
  `SchwartzMap.tsum_eq_tsum_fourier` (`Mathlib/Analysis/Fourier/PoissonSummation.lean`); nothing
  multidimensional or for a general lattice exists at the pin, and the lattice version is
  consumed from ThetaSeries Layer 1.
- `fourier`, `fourierCoeff`, `hasSum_fourier_series_L2` on `AddCircle`; `mFourier` on
  `UnitAddTorus` (`Mathlib/Analysis/Fourier/AddCircleMulti.lean`); `Real.fourierChar`.
- `PontryaginDual` with its compact-open topology; Haar measure.
- `IsZLattice`, `ZLattice.covolume` (the volume of a fundamental domain),
  `ZLattice.covolume_eq_det`, `ZSpan.fundamentalDomain` and `ZSpan.isAddFundamentalDomain`.
- `CStarModule` and `WithCStarModule` (`Mathlib/Analysis/CStarAlgebra/Module/`).

**From Tau Ceti.**

- `TauCeti.PontryaginDual.continuous_coe_eval_const` (continuity of evaluation at a point on the
  dual, `TauCeti/Analysis/Fourier/Pontryagin/DualEval.lean`).
- `SchwartzMap.dense_hasCompactSupport` (compactly supported Schwartz functions are dense,
  `TauCeti/Analysis/Distribution/SchwartzSpace/Cutoff.lean`).

**From TauCetiRoadmap.HilbertModules.** H1 (completion of a pre-Hilbert module and extension of
bounded actions), H2 (adjointable and module-compact operators; for unital A, `id_E∈K_A(E)` iff E
is finitely generated projective iff a finite Parseval frame exists, with the frame-to-projection
formulas), H3 (two-pairing definition of an imprimitivity bimodule and its compatibility identity,
conjugate module, evaluation unitaries `E⊗_B E*≅A` and `E*⊗_A E≅B`, state localisation
`E⊗_A H_ω`, induction). It is assumed that these hold for arbitrary C*-algebras with no
separability hypothesis.

**From TauCetiRoadmap.OperatorAlgebraDynamics.** D1 (integrated form of a covariant pair and the
discrete scalar case), D2 (regular representations; for discrete groups the faithful conditional
expectation onto the coefficients; amenability makes the trivial representation weakly contained
in the regular one, discrete ℓ² specialisation). Only untwisted actions are assumed of it.

**From TauCetiRoadmap.AmenableGroups.** Layer 6: every abelian discrete group is amenable.

**From TauCetiRoadmap.ThetaSeries.** Layer 1: 1A `poissonSummation` (for a full-rank ℤ-lattice L
in a finite-dimensional real inner product space E, a Schwartz function f and v∈E,
`Σ_(l∈L) f(v+l) = covol(L)⁻¹ Σ_(m∈L^∨) 𝓕f(m) e(⟨v,m⟩)` with Mathlib's `𝓕f(w)=∫f(x)e(−⟨x,w⟩)dx`),
1C `fourierIntegral_comp_equiv` (`𝓕(f∘A)=|det A|⁻¹ (𝓕f)∘(A⁻¹)ᵀ` for a linear automorphism A of
E), 1D (the image AL of a lattice is a lattice with dual `(A⁻¹)ᵀL^∨` and
`covol(AL)=|det A| covol(L)`), 1E `summable_poisson_left` and `summable_poisson_right` (absolute
convergence of the two sides); 2A `dual_dual` (`L^∨` is again a lattice and `L^∨∨=L`, for the
dual lattice `L^∨=(innerₗ E).dualSubmodule L`); 2C `covolume_dual` (`covol(L^∨)=covol(L)⁻¹`).
These are stated for an inner product space E; the product `(Fin k → ℝ)×(Fin k → ℝ)` carries the
sup norm and is not one, and the transport of 1A to it in symplectic coordinates is this
roadmap's target §2.4, as 1A assigns it to its consumers.

**From TauCetiRoadmap.NoncommutativeGeometry.** N6 (the rotation algebra `A_θ` with
`U₂U₁=e(θ)U₁U₂`, the smooth subalgebra 𝒜_θ and its trace) and N7 (the 0<θ<1 Schwartz module with
`(ξU₁)(s)=ξ(s+θ)`, `(ξU₂)(s)=e(s)ξ(s)`, its frames and Powers–Rieffel projection), for the
comparison in §6.3 only.

## How to read the build

Layer 1 fixes phase space, the Schrödinger family and its cocycle, annihilators and the lattice
geometry with covolumes. Layer 2 builds S(M), proves Poisson summation for finite-type M (the
Euclidean lattice formula being ThetaSeries 1A in symplectic coordinates) and the fundamental
identity, with the Euclidean fundamental identity on native carriers. Layer 3 constructs the twisted
group C*-algebras of discrete abelian groups, the two actions and pairings on S(M), and positivity.
Layer 4 completes S(M), proves fullness and Rieffel's imprimitivity theorem for lattices. Layer 5
proves spectral invariance of the rapid twisted algebras, smooth finite frames, the trace formula
and transport under changes of coordinates. Layer 6 computes the standard families and the two-torus
dictionary.

## Layer 1: Phase space, the Schrödinger family and lattice geometry

### 1.1 The Schrödinger family and the Heisenberg cocycle

For a locally compact Hausdorff abelian group M with Haar measure, define `π_x` for `x=(m,χ)∈G`
by the convention above as a unitary on L²(M), and β and σ as above. Prove that x↦π_x is strongly
continuous, that `π_xπ_y=β(x,y)π_(x+y)`, `π_0=1`, `π_x^*=conj(β(x,−x))π_(−x)`, that β is a
continuous bicharacter (hence a normalised 2-cocycle), and that σ is a continuous alternating
bicharacter (`σ(x,x)=1`, `σ(y,x)=conj σ(x,y)`) which is nondegenerate: `σ(x,·)≡1` forces x=0
(rieffel88 line 337, the definition of `D^⊥` on p. 265). Hence π_d and π_e commute exactly when
`σ(d,e)=1`. No square root of a character and no factor 1/2 is used, so 2-torsion in M is allowed.
On `M=ℝ^k`, with `x=(m,s)` and `y=(n,u)`, these are `schrodinger`, `schrodingerAdjoint` and
`symplecticChar`: `σ(x,y)=e(u⬝m−s⬝n)`, and `schrodingerAdjoint x` is the adjoint of
`schrodinger x`.
*Needs:* Mathlib Haar measure, `PontryaginDual`, `Lp`; Tau Ceti
`TauCeti.PontryaginDual.continuous_coe_eval_const`; continuity of translation in L².

- `schrodinger x` preserves `L²(ℝ^k)` norms, and `l2Inner (schrodinger x ξ) η = l2Inner ξ
  (schrodingerAdjoint x η)` for square-integrable ξ, η.
- For finite-type M, π_x preserves S(M) (Layer 2) and acts continuously on it.

**Checks.**

- On M=ℝ, x=(1,0), y=(0,1/2): `π_xπ_yξ(t)=e((t+1)/2)ξ(t+1)=−π_(x+y)ξ(t)` and `π_yπ_x=π_(x+y)`, so
  β(x,y)=−1, β(y,x)=1, σ(x,y)=−1. With y=(0,1/4) the same computation gives β(x,y)=e(1/4)=i; the
  translation convention `χ(t)ξ(t−m)` would give `e(−1/4)=−i` there, so the two conventions are
  told apart.
- Adjoint: `π_x^*ξ(t)=conj(χ(t−m))ξ(t−m)`; at x=(1,1/4) on ℝ this is `e(−(t−1)/4)ξ(t−1)=i·e(−t/4)ξ(t−1)`,
  and `β(x,−x)=e(−1/4)=−i`, so `conj(β(x,−x))π_(−x)ξ(t)=i·e(−t/4)ξ(t−1)` agrees. Dropping the
  conjugation would give `−i·e(−t/4)ξ(t−1)`.
- On finite M=ℤ/2 with χ₀ trivial and χ₁ nontrivial: `σ((1,χ₀),(0,χ₁))=χ₁(1)·conj(χ₀(0))=−1`, so
  σ is nontrivial although M has 2-torsion; no half-cocycle `β^(1/2)` is formed.

### 1.2 Symplectic annihilators

For a closed subgroup L of G define `L^⊥={x∈G : σ(l,x)=1 for all l∈L}`; on `ℝ^k×ℝ^k` this is
`symplecticAnnihilator`. Prove that L^⊥ is a closed subgroup, that L↦L^⊥ reverses inclusions,
`(L₁+L₂)^⊥=L₁^⊥∩L₂^⊥`, and `L^⊥⊥=L` for closed L (the double-annihilator theorem of Pontryagin
duality, hewitt-ross79 Theorem 24.10, read through the isomorphism `G≅Ĝ`, `x↦σ(·,x)`;
rieffel88 line 916, p. 280, uses it without proof); that every character of L is
`l↦σ(l,x)` for some x∈G, with kernel of x↦σ(·,x)|_L exactly L^⊥, so `G/L^⊥≅L̂` as topological groups
(rieffel88 lines 330–337, pp. 264–265); and that L is discrete iff G/L^⊥ is compact.
*Needs:* 1.1; Mathlib `PontryaginDual`; the explicit duals of the coordinate factors.

**Checks.**

- M=ℝ, `D=aℤ×bℤ` (a,b>0): σ((ja,lb),(n,u))=e(uja−lbn)=1 for all j,l iff ua∈ℤ and bn∈ℤ, so
  `D^⊥=(1/b)ℤ×(1/a)ℤ`. Swapping the roles of the two factors would give `(1/a)ℤ×(1/b)ℤ`, which is
  wrong when a≠b.
- `{0}^⊥=G` and `G^⊥={0}` (nondegeneracy). For M=ℝ and `L=ℝ×{0}`, `σ((m,0),(n,u))=e(um)=1` for
  all m forces u=0, so `L^⊥=L`: a closed subgroup equal to its annihilator, which is neither
  discrete nor cocompact.
- M=ℤ/2, `D=F×{1}`: `D^⊥={(n,ψ): ψ(m)=1 for all m}=F×{1}=D`, a maximal isotropic subgroup.

### 1.3 Lattices and covolumes

Construct the quotient measure on G/L for discrete L by the Weil formula with counting measure on L,
and define `c_L` for a lattice. Prove `0<c_L<∞`, that c_L is the measure of any Borel fundamental
domain, that L^⊥ is a lattice when L is (rieffel88 line 744, Lemma 3.1, p. 276), and `c_L·c_(L^⊥)=1`
(rieffel88 line 810, p. 277). For finite-type G prove that a discrete subgroup is finitely generated
abelian with finite torsion and has polynomial growth in the norm of its real and integer
coordinates. On `ℝ^k×ℝ^k`, `c_L=ZLattice.covolume L`, and for `L=Pℤ^(2k)`, `L^⊥=J⁻¹P^(−T)ℤ^(2k)`
with `J=[[0,I],[−I,0]]`, `c_L=|det P|`; here `L^⊥=J⁻¹L^∨` for the Euclidean dual lattice `L^∨` of
ThetaSeries 2A, and `c_L·c_(L^⊥)=1` is ThetaSeries 2C with 1D for J, `|det J|=1` (§2.4).
*Needs:* 1.2; Mathlib `ZLattice.covolume`, `ZLattice.covolume_eq_det`,
`ZSpan.isAddFundamentalDomain`; ThetaSeries 1D, 2A, 2C on `ℝ^k×ℝ^k`; the structure theorem for
finitely generated abelian groups.

**Checks.**

- `D=aℤ×bℤ` in ℝ×ℝ: c_D=ab and c_(D^⊥)=(1/b)(1/a), product 1.
- Finite M=F: G has total mass `|F|·1=|F|`, so `c_D=|F|/|D|`; since σ is nondegenerate,
  `|D||D^⊥|=|F|²`, and `c_D c_(D^⊥)=|F|²/(|D||D^⊥|)=1`. With mass 1 per point on F̂ instead, the
  product would be `|F|²`, which fails at F=ℤ/2.
- k=1, `P=[[2,1],[0,1]]`: `σ(x,y)=e(xᵀJy)`, and `L^⊥={y : PᵀJy∈ℤ²}=J⁻¹P^(−T)ℤ²` has covolume
  `|det P|⁻¹=1/2`, while `c_L=|det P|=2`. Using `Jᵀ` in place of J gives the same lattice (L^⊥ is
  symmetric under y↦−y), so this Check pins the factor `P^(−T)` rather than the sign of J.

### Examples

M=ℤ^p with `D=ℤ^p×{1}` gives `D^⊥=D`, c_D=1. M=𝕋^q with `D={0}×ℤ^q` gives `D^⊥=D`, c_D=1. For
M=ℤ/N and any subgroup D of `ℤ/N×ℤ/N`, `c_D=N/|D|`.

### Dependencies

Mathlib Haar measure, `PontryaginDual`, `ZLattice.covolume`; Tau Ceti
`TauCeti.PontryaginDual.continuous_coe_eval_const`.

## Layer 2: Schwartz–Bruhat spaces and Poisson summation

### 2.1 The Schwartz–Bruhat space

Define S(M) for `M=ℝ^k×ℤ^p×𝕋^q×F` as the smooth functions which, with all derivatives in the
real and torus variables, decay faster than every polynomial in the real and integer coordinates
(rieffel88 lines 369–374, p. 265), with its seminorms, as a complete locally convex space. Prove the
equivalent Fourier-coordinate description: families `a_(z,n,f)` of `SchwartzMap` elements on
`ℝ^k`, indexed by `z∈ℤ^p`, `n∈ℤ^q`, `f∈F`, with every Euclidean seminorm rapidly decreasing jointly
in (z,n), synthesised by `ξ(x,z,t,f)=Σ_n a_(z,n,f)(x)e(n⬝t)`, the series converging absolutely
and locally uniformly with all derivatives. Identify S(ℝ^k) with `SchwartzMap`, S(ℤ^p) with
rapid sequences, S(𝕋^q) with smooth functions, S(F) with all functions, and S of a product with
the completed projective tensor product.
*Needs:* Mathlib `SchwartzMap`, `SchwartzMap.seminorm`, `mFourier`, `fourierCoeff`.

- S(M) is stable under translation, multiplication by characters, complex conjugation and
  pointwise products, and is dense in L¹(M) and L²(M) with continuous inclusions.
- The Fourier transform `ξ̂(χ)=∫ξ(t)χ(t)dt` is a topological isomorphism S(M)≅S(M̂), inverse to
  the transform with conj χ for the dual measures.

**Checks.**

- M=𝕋 (k=p=0, q=1): S(𝕋) is all smooth functions; `t↦exp(cos 2πt)` belongs, and
  `1_[0,1/2)` does not (its Fourier coefficients decay like 1/n).
- M=ℤ: `n↦2^(−|n|)` belongs, `n↦1/(1+n²)` does not (weight `|n|³` is unbounded against it).
- Finite M=F: S(F)=ℂ^F, and the Fourier transform with normalised counting on F̂ is inverse to
  the unnormalised one; with counting measure on both sides the composite would be |F|·id.

### 2.2 Matrix coefficients and restriction to subgroups

Prove that for ξ,η∈S(M) the matrix coefficient `x↦⟨ξ,π_xη⟩` lies in S(G) (rieffel88 line 381, Lemma
2.3, p. 266), that the restriction of any F∈S(G) to a discrete subgroup L is absolutely summable and
rapidly decreasing in the word length of L (rieffel88 line 395, p. 266, before Corollary 2.4), and
that for a rapidly decreasing φ on a discrete subgroup L, `Σ_l φ(l)π_lξ` converges in S(M)
(rieffel88 line 408, Lemma 2.6, p. 266).
*Needs:* 2.1; 1.3 polynomial growth.

**Checks.**

- M=ℝ, `ξ=η=g` the Gaussian `g(t)=2^(1/4)e^(−πt²)`: `|⟨g,π_(m,s)g⟩|=e^(−π(m²+s²)/2)`, a Schwartz
  function on ℝ², with value 1 at the origin (‖g‖₂=1).
- Restriction to `D=ℤ×ℤ` of that coefficient is summable with sum
  `(Σ_n e^(−πn²/2))²`, finite.
- For `ξ=1_[0,1)` (not Schwartz) the coefficient `⟨ξ,π_(0,s)ξ⟩` decays only like `1/|s|`, so the
  Schwartz hypothesis is not decorative.

### 2.3 Orthogonality, Poisson summation and the fundamental identity

Prove the orthogonality relation: for ξ,η,ζ,ω∈S(M),

```
∫_G ⟨π_xη,ξ⟩ ⟨ω,π_xζ⟩ dx = ⟨ω,ξ⟩ ⟨η,ζ⟩
```

(rieffel88 line 552, Lemma 2.10, p. 270, converted to our inner-product convention: formal dimension
one for the dual measures). Prove Poisson summation for a lattice D: for F∈S(G), both sums converge
absolutely and

```
Σ_(d∈D) F(d) = c_D⁻¹ Σ_(e∈D^⊥) (F_s F)(e),   (F_s F)(e) = ∫_G F(x) σ(x,e) dx
```

(rieffel88 lines 541–546, the Poisson formula on p. 270), by periodising over G/D, computing Fourier
coefficients on the compact group G/D with dual `D^⊥` (1.2), and Fourier inversion on G/D. For
`M=ℝ^k` this formula is ThetaSeries 1A at `v=0` in the symplectic coordinates of 2.4 and is consumed
from there; the periodisation route is for the factors `ℤ^p`, `𝕋^q`, F and the mixed lattices they
admit. Prove the four-vector identity: for `F(x)=⟨π_xη,ξ⟩⟨ω,π_xζ⟩`, `(F_sF)(e)=⟨η,π_eζ⟩⟨ω,π_e^*ξ⟩`
(from the orthogonality relation, as in rieffel88 line 574, proof of Proposition 2.11, p. 271), and
hence the fundamental identity, first weakly and then as an absolutely convergent identity in S(M):

```
Σ_(d∈D) ⟨π_dη,ξ⟩ π_dζ = c_D⁻¹ Σ_(e∈D^⊥) ⟨η,π_eζ⟩ π_e^*ξ
```

(rieffel88 lines 570–589, Proposition 2.11, pp. 271–272).
*Needs:* 2.1, 2.2, 1.2, 1.3; ThetaSeries 1A, 1E through the transport of 2.4 for the Euclidean
factor; Mathlib `fourierCoeff`, `hasSum_fourier_series_L2` and
`SchwartzMap.integral_sesq_fourier_eq` for the coordinate factors.

**Checks.**

- M=ℝ, D=ℤ×ℤ (D^⊥=D, c_D=1), F the Gaussian coefficient of 2.2 squared in modulus,
  `F(m,s)=e^(−π(m²+s²))`: `F_sF=F`, both sides equal `(Σ_n e^(−πn²))²`.
- Finite M=ℤ/2, D=G: `c_D=1/2`, D^⊥={0}, and Poisson reads `Σ_(x∈G)F(x)=2·F_sF(0)=2·(1/2)Σ_xF(x)`
  (the phase measure gives each point mass 1/2). Omitting `c_D⁻¹` would be off by 2.
- Four-vector identity at x-integration on M=ℝ: with `ω=δ_t` formally, both sides reduce to
  `∫ e(um) conj η(r+m) ξ(r) ζ(r+m+n) dm` at r=t−n for e=(n,u); a `+u` versus `−u` error in σ
  replaces e(um) by e(−um) and fails for asymmetric η.

### 2.4 The Euclidean phase space

On `M=ℝ^k`, with phase space `EuclideanPhase k = ℝ^k×ℝ^k` and Lebesgue measure, the lattice
Poisson formula of 2.3 is ThetaSeries 1A in symplectic coordinates. Prove the transport: with
`J=[[0,I],[−I,0]]`, `σ(x,e)=e(⟨x,Je⟩)`, so the symplectic transform `(F_sF)(e)=∫F(x)σ(x,e)dx`
equals `(𝓕F)(−Je)` for Mathlib's transform `𝓕F(w)=∫F(x)e(−⟨x,w⟩)dx` on
`EuclideanSpace ℝ (Fin (2k))`, carried to the product `(Fin k → ℝ)×(Fin k → ℝ)` (a sup-norm
space, not an inner product space) by the continuous linear equivalence that is the identity on
coordinates, which preserves Lebesgue measure; for a lattice L, `L^⊥=J⁻¹L^∨` for the Euclidean
dual lattice `L^∨` of ThetaSeries 2A, so `L^⊥` is a lattice (ThetaSeries 1D) with
`ZLattice.covolume L^⊥=(ZLattice.covolume L)⁻¹` (ThetaSeries 1D and 2C, `|det J|=1`). Hence,
for `L` with `IsZLattice ℝ L` and `F` a Schwartz function on `ℝ^k×ℝ^k`, both `Σ_(d∈L)F(d)` and
`Σ_(e∈L^⊥)(F_sF)(e)` converge absolutely and
`Σ_(d∈L)F(d) = (ZLattice.covolume L)⁻¹ Σ_(e∈L^⊥) (F_sF)(e)`: this is ThetaSeries 1A and 1E at
`v=0` after the reindexing `e↦−Je` of `L^⊥` onto `L^∨` (`L^∨=−L^∨`). The formula is consumed,
not restated. State on native carriers:

- `fundamental_identity`: for such L and Schwartz ξ,η,ζ on ℝ^k, pointwise in t,
  `Σ_(d∈L) l2Inner(π_dη,ξ)(π_dζ)(t) = covol(L)⁻¹ Σ_(e∈L^⊥) l2Inner(η,π_eζ)(π_e^*ξ)(t)`, both sums
  absolutely convergent.

This is the M=ℝ^k case of 2.3: the Euclidean Poisson formula applied to the Schwartz function
`x↦⟨π_xη,ξ⟩(π_xζ)(t)` on phase space, whose symplectic transform is `e↦⟨η,π_eζ⟩(π_e^*ξ)(t)` by
the four-vector identity of 2.3, which is this roadmap's own.
*Needs:* 2.3 for M=ℝ^k; ThetaSeries 1A, 1C, 1D, 1E, 2A, 2C; Mathlib `SchwartzMap`,
`SchwartzMap.fourierTransformCLM`, `ZLattice.covolume`, `IsZLattice`.

**Checks.**

- k=1, `L=ℤ×2ℤ`: `L^∨=ℤ×(1/2)ℤ`, `J⁻¹L^∨=(1/2)ℤ×ℤ=L^⊥` (the annihilator of 1.2),
  `ZLattice.covolume L=2` and `ZLattice.covolume L^⊥=1/2`; for the Gaussian
  `F(m,s)=e^(−π(m²+s²))` with `F_sF=F`, the left side is `θ(1)θ(4)` and the right side
  `(1/2)θ(1/4)θ(1)` with `θ(a)=Σ_n e^(−πan²)`; they agree by the Jacobi identity
  `θ(1/4)=2θ(4)`.
- The sign in `F_sF(e)=𝓕F(−Je)`: k=1, `F(m,s)=e^(−π(m²+s²))e(m)`, so
  `𝓕F(w₁,w₂)=e^(−π((w₁−1)²+w₂²))` and `F_sF(n,u)=𝓕F(−u,n)=e^(−π((u+1)²+n²))`; at e=(0,1) this
  is `e^(−4π)`, while `𝓕F(Je)=𝓕F(u,−n)` would give 1 there.
- k=0: phase space is a point, the only lattice is {0} with covolume 1, `L^⊥={0}`, and both sides
  of the Poisson formula are F(0).
- Fundamental identity paired with ξ, for ξ=η=ζ=g the Gaussian of 2.2 and `L=ℤ×2ℤ`, using
  `⟨g,π_(m,s)g⟩=e^(−π(m²+s²)/2)e(−sm/2)`: the left side is `Σ_(d∈L)|⟨g,π_dg⟩|²=θ(1)θ(4)` and the
  right side `(1/2)Σ_(e∈L^⊥)⟨g,π_eg⟩⟨π_eg,g⟩=(1/2)θ(1/4)θ(1)`, equal. With `schrodinger` in place
  of `schrodingerAdjoint`, the right side becomes `(1/2)Σ_(n∈ℤ/2,u∈ℤ)e^(−π(n²+u²))(−1)^(2nu)`,
  strictly smaller, since the terms with n∈ℤ+1/2 and u odd change sign.

### Examples

For `M=ℝ^k` and `D=Aℤ^k×Bℤ^k` (A,B invertible), `D^⊥=B^(−T)ℤ^k×A^(−T)ℤ^k` and the Poisson
formula is the product of two classical ones with factor `|det A det B|⁻¹`.

### Dependencies

Layer 1; ThetaSeries Layer 1, 2A, 2C; Mathlib `SchwartzMap`, `SchwartzMap.fourierTransformCLM`,
`SchwartzMap.integral_sesq_fourier_eq`, `fourierCoeff`, `mFourier`, `IsZLattice`,
`ZLattice.covolume`; Tau Ceti `SchwartzMap.dense_hasCompactSupport`.

## Layer 3: Twisted group C*-algebras and the two pairings

### 3.1 Twisted group C*-algebras of discrete abelian groups

For a discrete abelian group L and a normalised circle-valued 2-cocycle c, construct the Banach
*-algebra `ℓ¹(L,c)` with the twisted convolution and involution of the Conventions, its universal
C*-completion `C*(L,c)` (supremum over c-projective unitary representations, equivalently over
nondegenerate *-representations of ℓ¹(L,c)), and the twisted regular representation
`(λ_c(x)h)(y)=c(x,y−x)h(y−x)` on ℓ²(L) with reduced completion `C*_r(L,c)`. Prove the universal
property for c-projective representations `V_xV_y=c(x,y)V_(x+y)`, the canonical trace
`τ(f)=f(0)` on C*_r(L,c), faithful, with Fourier coefficients `x↦τ(a δ_x^*)` determining a, and the
gauge action of L̂, `α_γ(δ_x)=γ(x)δ_x`, with fixed-point algebra ℂ1 when L̂ is compact.
Prove `C*(L,c)=C*_r(L,c)` by twisted Fell
absorption: for every c-projective representation V, `V⊗λ` is unitarily equivalent to a multiple
of λ_c via `ξ⊗δ_y↦V_yξ⊗δ_y`, and since L is amenable the trivial representation is weakly
contained in λ, so V is weakly contained in V⊗λ and hence in λ_c.
*Needs:* OperatorAlgebraDynamics D1 (scalar integrated forms), D2 (discrete conditional
expectation, weak containment of the trivial representation in λ for amenable groups);
AmenableGroups Layer 6.

- For L finite, `C*(L,c)` is the twisted group algebra `ℂ^c[L]` with dimension |L|.
- Every nonzero gauge-invariant closed ideal of `C*(L,c)` is the whole algebra: `L̂` is compact
  for every discrete L, and the gauge average of a positive element a is `τ(a)1`.
- A c-projective representation and a c'-projective representation with `c'=c·δu` for a cochain
  u give isomorphic algebras via `δ_x↦u(x)δ_x`.

**Checks.**

- c≡1: `C*(ℤ,1)≅C(𝕋)` by Fourier series, τ is integration against probability Haar measure, and
  full = reduced is the amenability of ℤ.
- L=(ℤ/2)², c the restriction of β for M=ℤ/2: `δ_(1,0)δ_(0,1)=−δ_(0,1)δ_(1,0)`, and
  `C*(L,c)≅M₂(ℂ)` via the Pauli matrices, with τ=½·trace; an untwisted c would give the
  commutative ℂ⁴.
- L=ℤ², `c((m,n),(m',n'))=e(θnm')`: `C*(L,c)` is the rotation algebra A_θ of NoncommutativeGeometry
  N6 with `U₁=δ_(1,0)`, `U₂=δ_(0,1)`, and `U₂U₁=e(θ)U₁U₂`; the reversed cocycle `e(θmn')` would
  give `U₁U₂=e(θ)U₂U₁`, the parameter −θ.

### 3.2 The two actions and pairings

For a lattice D in G put `B=C*(D,β)` and `A=C*(E,conj β)` with `E=D^⊥`. For rapidly decreasing
b on D and a on E define

```
b ξ = Σ_d b(d) π_d ξ                  ξ a = Σ_e a(e) π_e^* ξ
⟨ξ,η⟩_A(e) = ⟨ξ,π_eη⟩                 _B⟨ξ,η⟩(d) = c_D ⟨π_dη,ξ⟩
```

(rieffel88 lines 401–403, Notation 2.5, p. 266, and line 506, p. 269, in the opposite inner-product
convention; the factor c_D is the point mass of rieffel88 lines 812–816, p. 278). Prove that the
right action is a representation of the opposite algebra, `π_y^*π_x^*=conj(β(x,y))π_(x+y)^*`, that
both pairings take values in the rapid sequences (2.2), `⟨ξ,η⟩_A^*=⟨η,ξ⟩_A`, `⟨ξ,ηa⟩_A=⟨ξ,η⟩_A *a`,
`_B⟨bξ,η⟩=b*_B⟨ξ,η⟩` (rieffel88 line 447, Proposition 2.8, p. 267), `_B⟨ξ,η⟩^*=_B⟨η,ξ⟩` (rieffel88
line 460, Proposition 2.9, p. 268), and that the two actions commute (rieffel88 lines 488–490, p.
269). For arbitrary discrete D and E the separate actions exist and commute iff `E⊆D^⊥`.
*Needs:* 1.1, 1.2, 2.2, 3.1.

**Checks.**

- M=ℝ, D=ℤ×ℤ, ξ=η the Gaussian: `⟨ξ,ξ⟩_A(0)=1=‖ξ‖₂²` and `_B⟨ξ,ξ⟩(0)=c_D·1=1`.
- Finite M=ℤ/2, D=G, E=0: `_B⟨ξ,η⟩(d)=(1/2)⟨π_dη,ξ⟩` and `B≅M₂(ℂ)`; for `ξ=η=δ_0`,
  `_B⟨ξ,ξ⟩=(1/2)(δ_(0,1)+δ_(0,χ₁))`, which acts on L²(ℤ/2) as the rank-one projection onto δ_0;
  without the factor c_D it would act as twice that projection.
- The right action uses π_e^*: `(ξδ_x)δ_y` must equal `ξ(δ_x*δ_y)=conj(β(x,y))ξδ_(x+y)`. With π_e
  in place of π_e^* one gets `β(y,x)ξδ_(x+y)` instead; at M=ℝ, x=(1,0), y=(0,1/4) these
  coefficients are `conj(e(1/4))=−i` and `e(0)=1`.

### 3.3 Positivity, compatibility and the norm bounds

Prove compatibility `_B⟨ξ,η⟩ζ=ξ⟨η,ζ⟩_A` for ξ,η,ζ∈S(M) from the fundamental identity 2.3 (rieffel88
line 590, Proposition 2.12, p. 272). Prove that the Schrödinger representations of A and B on L²(M)
are faithful: the kernel is invariant under the gauge action (conjugation by π_x implements the dual
action by the character `σ(x,·)`, and every character arises by 1.2), so it is zero by 3.1
(rieffel88 line 362, Proposition 2.2, p. 265, proves this for closed D by another route). Prove
positivity of `⟨ξ,ξ⟩_A` and `_B⟨ξ,ξ⟩` in A and B (rieffel88 line 603, Proposition 2.13, p. 272): for
h∈S(M), `⟨h, _B⟨ξ,ξ⟩h⟩ = Σ_(e∈E)|⟨ξ,π_eh⟩|² ≥ 0` by the fundamental identity, and symmetrically for
A; definiteness follows from `τ_A(⟨ξ,ξ⟩_A)=‖ξ‖₂²` and `τ_B(_B⟨ξ,ξ⟩)=c_D‖ξ‖₂²`. Prove the bounds
`⟨bξ,bξ⟩_A≤‖b‖²⟨ξ,ξ⟩_A` and `_B⟨ξa,ξa⟩≤‖a‖²_B⟨ξ,ξ⟩` (rieffel88 line 620, Proposition 2.14, p. 273).
*Needs:* 2.3, 3.1, 3.2.

**Checks.**

- Finite M=ℤ/2, D=0, E=G (c_D=2, c_E=1/2): for ξ=δ_0, `π_(m,χ)δ_0=χ(m)δ_m`, so
  `⟨ξ,ξ⟩_A=δ_(0,χ₀)+δ_(0,χ₁)`, acting on the right as `1+π_(0,χ₁)`, twice the projection onto δ_0;
  it is positive, and `τ_A(⟨ξ,ξ⟩_A)=1=‖ξ‖₂²` (the projection has normalised trace 1/2). On the
  left, B=ℂ and `_B⟨ξ,ξ⟩=c_D‖ξ‖₂²=2`, matching `τ_B(_B⟨ξ,ξ⟩)=c_D‖ξ‖₂²`.
- M=ℝ, D=E=ℤ×ℤ, ξ=h=g the Gaussian: `⟨g,_B⟨g,g⟩g⟩=Σ_(e∈ℤ²)|⟨g,π_eg⟩|²=θ(1)²>0`, with
  `θ(a)=Σ_n e^(−πan²)`.
- Compatibility at M=ℝ, `D=ℤ×2ℤ` for ξ=η=ζ=g, paired with g, is the fundamental-identity Check
  of 2.4.

### Examples

For `M=ℤ^p` and `D=ℤ^p×{1}`, `E=D`, `A=B=C(𝕋^p)` and the bimodule is `C(𝕋^p)` itself after
Fourier transform. For finite M=F and D=0, the module is ℂ^|F| as a ℂ–M_|F|(ℂ) bimodule.

### Dependencies

Layers 1–2; OperatorAlgebraDynamics D1–D2; AmenableGroups Layer 6.

## Layer 4: Completion, fullness and imprimitivity

### 4.1 Completion and the embedding into L²

Apply HilbertModules H1 to complete S(M) in `‖ξ‖_A=‖⟨ξ,ξ⟩_A‖^(1/2)` to a right Hilbert A-module
𝓔, as a `CStarModule Aᵐᵒᵖ` instance, and extend the left B-action and B-pairing. Prove
`‖ξ‖₂≤‖ξ‖_A` on S(M), so the identity extends to a contraction `ι:𝓔→L²(M)`, and that ι is
injective with dense image: ι is the state localisation of HilbertModules H3 for the faithful
trace τ_A, since `τ_A(⟨ξ,η⟩_A)=⟨ξ,η⟩`, and the localisation of a faithful trace is injective
(Austad–Enstad 2020, Proposition 3.7). The image is not all of L²(M) in general. Prove that the
B-norm `‖_B⟨ξ,ξ⟩‖^(1/2)` and the A-norm agree on S(M) (rieffel88 line 634, p. 273), so 𝓔 is also the
B-completion.
*Needs:* 3.3; HilbertModules H1, H3.

**Checks.**

- Finite M=F, D=G (E=0, A=ℂ): `⟨ξ,ξ⟩_A=‖ξ‖₂²`, so ι is the identity of ℂ^F and isometric.
- Finite M=ℤ/2, D=0 (A≅M₂(ℂ)): for ξ=δ_0, `⟨ξ,ξ⟩_A` acts as twice a rank-one projection (Check
  of 3.3), so `‖ξ‖_A=√2>1=‖ξ‖₂`: ι is a strict contraction, and the comparison is `‖ξ‖₂≤‖ξ‖_A`,
  not equality.
- Faithfulness of the trace is used: for M=ℤ, `D=E=ℤ×{1}`, A=C*(ℤ)≅C(𝕋) and
  `⟨ξ,ξ⟩_A(n)=Σ_t conj(ξ(t))ξ(t+n)`. Localising along the non-faithful state `a↦Σ_n a(n)`
  (evaluation at 1∈𝕋) gives `|Σ_tξ(t)|²`, which vanishes for ξ=δ_0−δ_1≠0; the faithful trace
  `a↦a(0)` gives `‖ξ‖₂²=2`.

### 4.2 Fullness and the imprimitivity theorem

Prove that both pairings are full: the closed span of the range of `_B⟨·,·⟩` is a closed ideal of B
(by 3.2), invariant under the gauge action (`α_x(_B⟨ξ,η⟩)=_B⟨π_xξ,π_xη⟩`, rieffel88 line 476, p.
268), and nonzero, hence all of B by 3.1; likewise for A. Conclude with HilbertModules H3 that 𝓔 is
a B–A imprimitivity bimodule, that the left action is a *-isomorphism `B≅K_A(𝓔)` sending `_B⟨ξ,η⟩`
to `θ_(ξ,η)`, and that `𝓔⊗_A𝓔*≅B` and `𝓔*⊗_B𝓔≅A` with the pairings as evaluation maps (rieffel88
line 639, Theorem 2.15, p. 273, for lattices). Prove that induction along 𝓔 takes the Schrödinger
representation of A on L²(M) to that of B.
*Needs:* 3.1, 3.3, 4.1; HilbertModules H2, H3.

**Checks.**

- Finite M=F, D=0: `B=ℂ`, `A≅M_|F|(ℂ)`, `K_A(ℂ^F)=ℂ`, the row module.
- Finite M=F, D=G: `B≅M_|F|(ℂ)`, `A=ℂ`, `K_ℂ(ℂ^F)=M_|F|(ℂ)`, the column module.
- Fullness is not simplicity: for M=ℤ, D=ℤ×{1}, B=C(𝕋) is not simple, yet `_B⟨·,·⟩` is full,
  because the gauge-invariant ideals of C(𝕋) under rotation are only 0 and C(𝕋).

### Examples

For `M=ℝ`, θ>0 and `D=ℤ×θ⁻¹ℤ`: `E=θℤ×ℤ`; B is generated by `U=π_(1,0)` and `V=π_(0,1/θ)` with
`UV=σ((1,0),(0,1/θ))VU=e(1/θ)VU`, A by the right action of E, and 𝓔 is the Heisenberg module of
§6.3.

### Dependencies

Layer 3; HilbertModules H1–H3.

## Layer 5: Smooth frames, traces and transport

### 5.1 Spectral invariance and smooth frames

For a finitely generated abelian group L with normalised 2-cocycle c, let S(L,c) be the rapidly
decreasing functions on L with twisted convolution. Prove that S(L,c) is a Fréchet *-algebra, equal
to the smooth vectors of the gauge action of the compact Lie group L̂ on C*(L,c), and that it is
inverse-closed in C*(L,c) in every matrix size, so closed under holomorphic functional calculus
(rieffel88 lines 919–930, p. 280), by differentiating `a⁻¹` along the generators of the gauge
action. Prove that S(M) is a finitely generated projective right S(E,conj β)-module and
`𝓔≅S(M)⊗_(S(E))A` (rieffel88 lines 937–950, Proposition 3.7, p. 281). Prove the smooth-frame
theorem: there are ξ_1,…,ξ_n∈S(M) with `Σ_jθ_(ξ_j,ξ_j)=1`, i.e. `ξ=Σ_jξ_j⟨ξ_j,ξ⟩_A` for every ξ∈𝓔,
obtained from the HilbertModules H2 frame by approximation in S(M) and normalisation by the inverse
square root of the frame operator in S(D,β). A single window is not asserted. On `ℝ^k` this is
`exists_parsevalFrame`: for every lattice L in `ℝ^k×ℝ^k` there are finitely many Schwartz windows
forming a Parseval frame over L in the sense of `IsParsevalFrame` (`Σ_jΣ_(x∈L)|⟨π_xg_j,f⟩|²=‖f‖₂²`
for every Schwartz f); the right A-frame condition over E and the Parseval condition over E are the
same, because `π_e^*` is a unimodular multiple of `π_(−e)` and `E=−E`.
*Needs:* 3.1, 4.2; HilbertModules H2; Mathlib `SchwartzMap`, `IsZLattice`.

**Checks.**

- k=1, `L=(1/2)ℤ×ℤ` (translations by 1/2, modulations by 1): a smooth g supported in [0,1] with
  `Σ_n|g(t+n/2)|²=1` gives `Σ_(x∈L)|⟨π_xg,f⟩|²=∫Σ_n|g(t+n/2)|²|f(t)|²dt=‖f‖₂²` by Parseval on
  intervals of length 1, so one Schwartz window suffices at covolume 1/2.
- k=1, `L=ℤ×ℤ`: `1_[0,1)` is a Parseval frame (an orthonormal basis), but it is not Schwartz;
  the trace formula below forces `‖g‖₂=1` for a single window, so a single Schwartz Parseval
  window at covolume 1 would be an orthonormal basis of unit vectors, which is why
  `exists_parsevalFrame` asserts only some finite n.
- k=0: `L={0}`, n=1, g=1 is a Parseval frame of ℂ.

### 5.2 The trace formula

For a right Parseval frame (ξ_j) put `p_(ij)=⟨ξ_i,ξ_j⟩_A`; prove p is a projection in `M_n(A)` and
that `ξ↦(⟨ξ_j,ξ⟩_A)_j` and `(a_j)↦Σ_jξ_ja_j` are mutually inverse between 𝓔 and `pA^n` (rieffel88
lines 768–780, proof of Proposition 3.3, pp. 276–277). Prove that `Tr_𝓔(T)=Σ_jτ_A(⟨ξ_j,Tξ_j⟩_A)` is
independent of the frame, and

```
Tr_𝓔(L_b) = c_E τ_B(b)        for b∈B,
dim_A 𝓔 = τ_A(p) = Σ_j ‖ξ_j‖₂² = c_E = 1/c_D
```

(rieffel88 line 766, Proposition 3.3, p. 276, and line 832, Theorem 3.4, p. 278, where the trace of
the class of 𝓔 is the volume of a fundamental domain of D^⊥; Austad–Enstad 2020, Proposition 3.5,
for the induced trace). On `ℝ^k` this is `parsevalFrame_trace`: if Schwartz windows g_1,…,g_n form a
Parseval frame over L in the sense of `IsParsevalFrame`, then `Σ_j‖g_j‖₂²=ZLattice.covolume L`. A
rescaling of the Haar measure of M by r>0 multiplies module vectors by `r^(−1/2)` and leaves
`dim_A𝓔` unchanged.
*Needs:* 5.1; HilbertModules H2.

**Checks.**

- The 5.1 window at `L=(1/2)ℤ×ℤ`: `‖g‖₂²=∫_0^(1/2)Σ_n|g(t+n/2)|²dt=1/2`, equal to the
  covolume 1/2. The reciprocal convention `1/covol` would give 2.
- Finite M=ℤ/2, D=0 (E=G, c_E=1/2): 𝓔=ℂ² as the row module over M₂(ℂ), `τ_A(p)=1/2`; with D=G
  (E=0, c_E=2): 𝓔=ℂ² over ℂ, dimension 2.
- Index-two sublattice: if (g_j) is a Parseval frame over L and `L=L'⊔(L'+v)`, then
  `(g_j)∪(π_vg_j)` is a Parseval frame over L' (since `π_(l')π_v=β(l',v)π_(l'+v)` with
  `|β|=1`), the sum of squared norms doubles, and `covol(L')=2·covol(L)`: consistent.

### 5.3 Transport

For a normalised continuous cochain u on G with `|u|=1`, the rephased family `π'_x=u(x)π_x` has
cocycle `β'=δu·β`, `δu(x,y)=u(x)u(y)/u(x+y)`; construct the induced isomorphisms of A, B and 𝓔
(left coefficients multiplied by `u(d)⁻¹`, right coefficients by `u(e)`) with identity and
composition coherence. For a topological isomorphism f:M≅M' with `f_*μ_M=Jμ_(M')`, J>0, the
unitary `ξ↦J^(1/2)ξ∘f⁻¹` intertwines the Schrödinger families and transports lattices,
annihilators, pairings and covolumes. For the Fourier transform `F₊:L²(M)→L²(M̂)`,
`F₊π_(m,χ)=conj(χ(m))π'_(χ,ev_(−m))F₊`, where `ev_(−m)` is evaluation at −m.
*Needs:* 1.1, 4.2, 2.1.

**Checks.**

- M=ℝ, `F₊ξ(s)=∫ξ(t)e(st)dt`, x=(1,0): `F₊π_xξ(s)=e(−s)F₊ξ(s)`, and with χ trivial the formula
  gives `π'_(0,ev_(−1))`, multiplication by `e(−s)`: agreement. With `ev_m` the sign is wrong.
- `u(m,s)=e(m⬝s)` on ℝ^k×ℝ^k: `δu((m,s),(n,u'))=e(−m⬝u'−n⬝s)`, so `β'(x,y)=e(−n⬝s)=conj β(y,x)`,
  and `σ'(x,y)=e(−n⬝s)e(m⬝u')=σ(x,y)`: rephasing changes β but not σ, as it must.
- Dilation on ℝ by a>0, `ξ↦a^(−1/2)ξ(t/a)`: `(m,s)↦(am,s/a)`, covolumes preserved, ‖·‖₂ preserved.

### Examples

On `M=ℝ^k` the rephasing by `u(m,s)=e(m⬝s)` turns `π_(m,s)ξ(t)=e(s⬝t)ξ(t+m)` into
`π'_(m,s)ξ(t)=e(s⬝(t+m))ξ(t+m)`, the modulation-after-translation family; its cocycle is
`β'(x,y)=e(−n⬝s)=conj β(y,x)` and its commutator character is σ again (Check of 5.3), so the two
families have the same lattices, annihilators and covolumes, and isomorphic algebras and modules.

### Dependencies

Layers 3–4; HilbertModules H2.

## Layer 6: Worked families and the two-torus dictionary

### 6.1 Euclidean and finite families

Compute: for `M=ℝ^k`, `D=Aℤ^k×Bℤ^k` (A,B invertible), `E=B^(−T)ℤ^k×A^(−T)ℤ^k`,
`c_D=|det A det B|`, `dim_A𝓔=|det A det B|⁻¹`; for a full lattice `Pℤ^(2k)`,
`E=J⁻¹P^(−T)ℤ^(2k)`, `c_D=|det P|`, `c_E=|det P|⁻¹`, with the change-of-basis law `P↦PU`, U∈GL_(2k)(ℤ).
For M=ℤ^p with `D=ℤ^p×{1}` (E=D) and M=𝕋^q with `D={0}×ℤ^q`, the bimodule is the commutative
Fourier algebra over itself. For finite M=F every subgroup D of `F×F̂` is a lattice, `c_D=|F|/|D|`,
`|D||E|=|F|²`, and `dim_A𝓔=|D|/|F|`; compute D=0 (row module), D=G (column module) and maximal
isotropic D (commutative fibre decomposition) by explicit matrix units. For products,
pairings, covolumes and traces multiply under the external tensor product unitary.
*Needs:* Layers 1–5.

**Checks.**

- `M=ℤ/3`, `D=⟨(1,χ)⟩` with χ(1)=e(1/3): `σ((1,χ),(1,χ))=1`, so D is isotropic of order 3,
  `E=D`, `c_D=1`, and `dim_A𝓔=3/3=1`: 𝓔 is free of rank one over the commutative `C*(D)≅ℂ³`.
- `M=ℝ`, `D=2ℤ×(1/3)ℤ`: `c_D=2/3`, `E=3ℤ×(1/2)ℤ`, `c_E=3/2`, `dim_A𝓔=3/2`; since `τ_A(p)≤n` for
  a projection `p∈M_n(A)`, a frame needs n≥2 windows.
- A lattice in `M=ℝ×ℤ/2` that is not a product: D generated by `((1,[1]),(0,χ₀))` and
  `((0,[0]),(1,χ₁))`, i.e. `D={((a,[a]),(b,χ₁^b)) : a,b∈ℤ}`. A fundamental domain is
  `[0,1)²×ℤ/2×(ℤ/2)^`, of mass `1·2·1`, so `c_D=2`; solving the two generator equations gives
  `D^⊥={((n,[2n]),(u,χ₁^(2u))) : n,u∈(1/2)ℤ}`, of covolume `(1/4)·2=1/2=1/c_D`.

### 6.2 An embedding of ℤ² into ℝ×ℤ/q

For integers q≥1, c, d and reals a,b with ab≠0, define `φ:ℤ²→G` for `M=ℝ×ℤ/q` by
`φ(m,n)=((an,[cn]),(bm,[dm]))`, with the finite pairing `e(uv/q)`. Prove φ is injective, its image
E is a lattice of covolume `q|ab|`, and `β(φ(m,n),φ(r,s))=e((ab+cd/q)nr)`; compute `E^⊥` by the two
generator character equations and the rotation parameter `ab+cd/q`.
*Needs:* 1.2, 1.3.

**Checks.**

- q=1: φ reduces to `(m,n)↦(an,bm)`, E has covolume |ab|, parameter ab.
- q=2, a=b=1, c=d=1: parameter `1+1/2=3/2`, covolume 2.
- ab=0 is excluded: if a=0 then `φ(0,q)=((0,[cq]),(0,[0]))=0`, so φ is not injective (b=0 is
  symmetric).

### 6.3 The two-torus dictionary

For M=ℝ, θ≠0, `χ_m(t)=e(−mt)` and `E_θ={(nθ,χ_m):m,n∈ℤ}`: `conj β(φ(m,n),φ(r,s))=e(θnr)`,
`D_θ=E_θ^⊥={(l,χ_(j/θ)):l,j∈ℤ}`, `c_E=|θ|`, `c_D=1/|θ|`, and

```
(ξ δ_(m,n))(r) = e((r−nθ)m) ξ(r−nθ)
⟨ξ,η⟩_A(m,n)  = ∫ conj(ξ(r)) e(−rm) η(r+nθ) dr
```

Identify δ_(1,0) and δ_(0,1) with U₂ and U₁⁻¹ of NoncommutativeGeometry N7's right module
`(ξU₁)(s)=ξ(s+θ)`, `(ξU₂)(s)=e(s)ξ(s)`, and compare the inner products by coefficient uniqueness.
The left algebra is `C(ℝ/θℤ)⋊ℤ`, acting by `Σ_l h(r,l)ξ(r+l)`; with `Z(r)=e(r/θ)` and
`Tξ(r)=ξ(r+1)`, `TZT^*=e(1/θ)Z`. For 0<θ<1 construct a single smooth window: a real bump ρ
supported in an interval of length l with θ<l<1, positive on a subinterval of length θ, divided by
`(Σ_n|ρ(r−nθ)|²)^(1/2)`; then 𝓔≅pA with `τ(p)=θ`, compared with N7's Powers–Rieffel projection.
For θ>1 use q windows with δ=θ/q<1; for θ<0 reflect r↦−r. At θ=0, E_0 is not a lattice and the
construction does not apply.
*Needs:* 3.2, 4.2, 5.1, 5.2; NoncommutativeGeometry N6, N7.

**Checks.**

- θ=1/2: `c_E=1/2`, a single window as in 5.1, `τ(p)=1/2`.
- `σ((nθ,−m),(l,−j/θ))=e(−jn+ml)=1`, confirming `D_θ⊆E_θ^⊥`; with `χ_m(t)=e(mt)` instead,
  the generators of `D_θ` change sign and N7's U₂ becomes U₂^*.
- θ=0: φ(m,n)=(0,χ_m) is not injective in n, and the proposed coefficient at (0,n) is constant
  in n for ξ=η≠0, contradicting decay; this is the negative control for the hypothesis θ≠0.

### Examples

For `θ=√2−1`, `dim_A𝓔=θ`, the positive-trace generator of K₀(A_θ) under N7's comparison.

### Dependencies

Layers 1–5; NoncommutativeGeometry N6–N7.

## Downstream consumers

HilbertModules H5 compares its commutative torus section modules with the θ≠0 model of §6.3.
NoncommutativeGeometry N7's Heisenberg module and Powers–Rieffel projection are the 0<θ<1 case
of §6.3 and §5.2.

## References

- Marc A. Rieffel, *Projective modules over higher-dimensional non-commutative tori*, Canad. J.
  Math. 40 (1988), 257–338 (rieffel88): Propositions 2.1–2.2, Lemma 2.3, Corollary 2.4, Lemma 2.6,
  Propositions 2.8–2.9, the Poisson formula on p. 270, Lemma 2.10, Propositions 2.11–2.14,
  Theorem 2.15, Lemma 3.1, Propositions 3.2–3.3, Theorem 3.4, the smoothing remark on p. 280 and
  Proposition 3.7. A locator `rieffel88 line N` is a line of the author's copy of the paper
  recorded in the roadmap's source manifest; the statement and printed page beside it are those of
  the journal.
- Edwin Hewitt and Kenneth A. Ross, *Abstract Harmonic Analysis I*, Grundlehren der
  mathematischen Wissenschaften 115, second edition, Springer, 1979 (hewitt-ross79): Theorem
  24.10, the double-annihilator theorem for a closed subgroup of a locally compact abelian group.
- Are Austad and Ulrik Enstad, *Heisenberg modules as function spaces*, J. Fourier Anal. Appl. 26
  (2020), arXiv:1904.10826 (austad-enstad20): Propositions 3.5 and 3.7. Its translation is
  `ξ(t−x)` and its inner product is linear in the first variable; formulas are converted.
