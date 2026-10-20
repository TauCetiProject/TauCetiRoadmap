# Roadmap: crystalline cohomology, de Rham–Witt complexes and logarithmic structures

**Summary.** This roadmap builds crystalline cohomology and its logarithmic version, which
semistable reduction needs. Using the PD foundations of DerivedDeRhamCohomology (§§PD.1–PD.2,
PD.4–PD.7), the augmentation algebra of DerivedModuleAlgebra (§0.DP.3), Mathlib's `WittVector` and
Kähler differentials, it constructs the small and big crystalline sites, crystals, F-crystals and
isocrystals, PD stratifications and quasi-nilpotent connections; the PD Poincaré lemma, which
computes crystalline cohomology by de Rham complexes of envelopes and makes it independent of the
embedding; descent, derived base change, perfectness, cup products, the Künneth formula, the first
Chern class, Frobenius and the Frobenius isogeny for proper smooth schemes, with computations for
curves, elliptic curves, projective space and a crystalline torsion surface; Dieudonné complexes,
saturation and strict completion, the saturated de Rham–Witt complex of an 𝔽_p-algebra, Illusie's
classical complex and Langer–Zink's relative complex, the crystalline comparison, the slope spectral
sequence, the Nygaard filtration and logarithmic Hodge–Witt sheaves; the crystalline trace, Poincaré
duality and Gysin maps. On the logarithmic side it builds monoids, prelog rings, log structures,
charts, the standard classes of morphisms, log smoothness, divisorial log structures, log regularity
and the logarithmic Abhyankar lemma; log differentials, the log Cartier isomorphism, log PD
envelopes, the log crystalline site, its crystals and connections, the log Poincaré lemma and
derived p-adic log crystalline cohomology; Hyodo–Kato complexes with Frobenius and monodromy, the
relation `Nφ = pφN`, the Hyodo–Kato comparison theorem and the change of uniformizer, convergent
complexes on tubes, log rigid Hyodo–Kato cohomology; and finally crystalline coefficients with
Frobenius, filtration and monodromy, relative crystalline cohomology and the Gauss–Manin connection.
The CR.DDR sections construct the derived de Rham–crystalline comparisons, quasiregular crystalline
calculations and derived logarithmic algebra. The end theorems are the crystalline–de Rham
comparison through the PD Poincaré lemma, the crystalline de Rham–Witt comparison, crystalline
Poincaré duality, the Hyodo–Kato comparison theorem.

The layers are:

| Layer | Title | Headline targets |
| --- | --- | --- |
| CR.1 | Crystalline sites, structure sheaves and crystals | `PDScheme`, the crystalline sites, crystals, F-crystals and isocrystals, PD differentials, quasi-nilpotent connections, crystals ≃ connections |
| CR.2 | The PD Poincaré lemma and de Rham computations | `Ru_{X/S,*}`, linearization, the PD Poincaré lemma, crystalline cohomology from an embedding, independence of the embedding, the étale crystalline site |
| CR.DDR.4.1, CR.DDR.4.3–4.4, CR.DDR.5.8–5.10 | Derived de Rham and crystalline cohomology | comparison map, base-linear realization, lci comparison, p-adic comparison |
| CR.3 | Descent, finiteness, base change and Frobenius | Čech and hypercover descent, derived base change, perfectness, cup products, Künneth, `c₁`, Frobenius, weak Lefschetz, curves and elliptic curves |
| CR.3:Frobenius-isogeny | The Frobenius isogeny | p-power control of inseparable pullback, the rational Frobenius isogeny |
| CR.4 | Ordinary and relative de Rham–Witt complexes | Dieudonné complexes, saturation, `W_r(M)`, strict completion, the saturated and classical de Rham–Witt complexes, the relative complex, the crystalline comparison, slopes, Nygaard |
| CR.DDR.4.5, CR.DDR.5.18, CR.DDR.5.20–5.22 | Derived Witt and quasiregular crystalline theory | derived Nygaard filtration, QRSP envelopes, `A_crys`, crystalline Čech complex |
| CR.3:duality | Trace and Poincaré duality | the crystalline trace, Poincaré duality, Gysin maps, the diagonal class |
| CR.5:log-algebra | Logarithmic structures | integral, fine and saturated monoids, prelog rings, log structures, charts, strict/exact/integral/Kummer morphisms, log smoothness, Kato's chart criterion, log regularity, Abhyankar |
| CR.5 | Logarithmic differentials and log crystalline cohomology | log differentials, the log Cartier isomorphism, log PD envelopes, the log crystalline site, log crystals and connections, the log Poincaré lemma, the log structure on `A_cris` |
| CR.DDR.6 | Derived logarithmic algebra and crystalline comparison | supplied logarithmic constructors, derivation and extension classifiers, corrected lci comparison, log quasisyntomic descent |
| CR.6 | Hyodo–Kato complexes and semistable structure | Hyodo–Kato complexes, `Nφ = pφN`, the Hyodo–Kato comparison theorem, change of uniformizer, convergent complexes, log rigid Hyodo–Kato cohomology |
| CR.7 | Coefficients and relative cohomology | crystalline coefficients with Frobenius, filtration and monodromy, relative direct images, Gauss–Manin |

The layer labels are the labels other roadmaps cite. They are built in the order of the table
(see *How to read the build*); CR.3:duality comes after CR.4 because the crystalline trace is
built from the top-degree de Rham–Witt sheaf.

## Scope and ownership

**Owned here.** PD schemes; the small, big and étale
crystalline sites with their morphisms; structure, quotient and PD ideal sheaves; crystals in
quasi-coherent and finite locally free modules, isocrystals and F-crystals; PD differentials,
PD stratifications, integrable and topologically quasi-nilpotent connections and the
crystal–connection equivalence; crystalline cohomology `Ru_{X/S,*}` and its global sections,
linearization, the PD Poincaré lemma, the Čech–Alexander and smooth-ambient computations,
independence of the embedding, the filtered and smooth-lift comparisons and the formal comparison
for a proper smooth lift. Čech, Mayer–Vietoris and étale hypercover descent for crystalline
cohomology, derived base change, perfectness of proper smooth crystalline cohomology, cup
products, the Künneth formula, the crystalline first Chern class, the Leray spectral sequence,
the semilinear Frobenius and its linearization, weak Lefschetz, curves, elliptic curves and the
torsion surface of Bhatt–Morrow–Scholze §2; the Frobenius isogeny. Dieudonné complexes and their
morphisms, saturation, décalage `η_p`, the Verschiebung filtration and the finite quotients
`W_r(M)`, strict Dieudonné complexes and towers, strict completion and the décalage fixed-point
description; the inputs on Mathlib's Witt vectors that de Rham–Witt theory needs (structural
identities, Witt lifting of torsion-free Frobenius lifts, divided powers on `V W_{r−1}(R)`, Witt
vectors of étale maps); Dieudonné algebras, the saturated de Rham–Witt complex and its degree-zero
seminormalisation; Illusie's classical complex as the initial V-pro-complex and its comparison
with the saturated one; Langer–Zink's relative de Rham–Witt complex with basic Witt differentials,
étale descent, Laurent and perfectoid bases and the continuous complex; the finite and infinite
crystalline comparison, the degree-scaled Frobenius, the slope decomposition of isocrystals over
a perfect field and the slope spectral sequence, the Nygaard filtration; logarithmic Hodge–Witt
sheaves and their exact sequences; the crystalline trace, finite étale transfer, Poincaré duality,
Gysin maps and the diagonal class. Monoids, geometric prelog charts, étale log structures and the
geometric extensions in Layer CR.5:log-algebra; sheafification of the supplied affine log
differential modules and ordinary log de Rham complexes, their continuous and coefficient
extensions, residues, Cartier type and the log Cartier
isomorphism, exactification, fine and integral quasi-coherent log PD envelopes, log PD
thickenings, the log crystalline site, log crystals, log stratifications, log connections and log
quasi-nilpotence, the log Poincaré lemma, embedding-system descent, derived p-adic log
crystalline cohomology, the unique lift of p-divisible log structures and the log structure on
`A_cris`. Hyodo–Kato theory (Layer CR.6), including the logarithmic de Rham–Witt complex of a log
smooth Cartier-type scheme over `k^log`, Sato’s homological Witt residue complex,
the convergent complexes on tubes that
Disegni–Liu use, ordinary rigid cohomology of the smooth finite-type strata needed for
log rigid Hyodo–Kato cohomology after Grosse-Klönne. Crystalline coefficients with Frobenius,
filtration and monodromy on semistable models, relative crystalline direct images,
proper smooth base change and the Gauss–Manin connection. Derived de Rham–crystalline comparisons,
derived de Rham–Witt and quasiregular crystalline calculations, classifiers and comparisons for
the supplied Gabber log cotangent and log derived de Rham objects, corrected log lci crystalline
comparisons and log quasisyntomic descent
are owned by the CR.DDR sections.

**Prerequisites and boundaries.** A statement belongs here if it is about crystalline or log
crystalline sites and their crystals, the cohomology of those sites and its de Rham, de Rham–Witt
and Hyodo–Kato models, or log structures as such; period rings beyond `A_cris`, prisms,
`A_inf`-cohomology, Galois representations and general rigid cohomology are used here only where a
target says so, and are otherwise outside it. Comparisons with étale, prismatic and
`A_inf`-cohomology belong to the roadmaps of those comparisons, which build on this one.

- **DerivedModuleAlgebra** owns module derived tensor, cotangent complexes, integral derived powers,
  module derived limits and completion (§§0.1–0.17, 1.1–1.9), and the double-complex spectral
  sequence (§S.1). **DerivedDeRhamCohomology** owns the remaining completion and filtered-module
  interfaces (Layer 1), ordinary and derived de Rham complexes (Layer 2), ordinary derived Cartier
  theory (Layer 3), quasisyntomic descent (Layer 5), the PD conjugate filtration (§4.2), the
  shared prelog category, universal affine log differential modules, ordinary exterior log dg
  construction and derived logarithmic constructors with their canonical period specialization
  (§6.20), and period applications (§§5.11–5.15, 6.21). This roadmap owns the derived de Rham–crystalline map and
  lci comparisons (§§CR.DDR.4.1, CR.DDR.4.3–CR.DDR.4.4, CR.DDR.5.8–CR.DDR.5.10), derived de
  Rham–Witt and quasiregular crystalline calculations (§§CR.DDR.4.5, CR.DDR.5.18,
  CR.DDR.5.20–CR.DDR.5.22), and logarithmic derivation/extension classifiers, general comparisons
  and descent on those supplied constructors (§§CR.DDR.6.1–CR.DDR.6.20).
  EnhancedDerivedSheaves supplies the ringed-site enhancement; module completion uses
  DerivedModuleAlgebra and the filtered interfaces use DerivedDeRhamCohomology.
- **PadicPeriodRings** supplies the completed algebraic closure `C_K` (§2), the ordinary
  principal Fontaine envelope and its p-adic completion `A_cris(O_C)` (§3), and their period
  structures (§4.1). It owns the topological period carriers, invariant functors and fixed-field
  identities (§§4.1–4.3). The supplier order is PadicPeriodRings, DerivedDeRhamCohomology, then
  CrystallineCohomology. DerivedDeRhamCohomology §PD.7 identifies its general envelope at `O_C`
  with the supplied principal envelope; CR.5.5 places the log structure on that shared carrier.
- **DiamondsAndVStacks** D6.9 owns ring seminormality, subintegral ring maps and the
  seminormal reflection with its subintegral unit, universal property and restriction
  compatibility. CR.4.5–CR.4.6 use its public ring-level interface in namespace
  `DiamondsAndVStacks` for the saturated de Rham–Witt residue, degree-zero identification
  and cusp comparison; the generic ring theory is supplied there.
- **Ordinary algebraic connections.** CR.1.3 owns `Crystalline.Connection` over arbitrary
  commutative base rings and its extension, curvature, horizontal maps, coefficient de Rham
  complexes, base change, tensor and Hom/dual operations. ComplexComparisonPartII C5.2 and
  FormalConnectionsOpers F2 import, specialize and sheafify this carrier and its operations;
  their ordinary connection interfaces are adapters to `Crystalline.Connection`. Tensor
  symmetry identifies `M ⊗ Ω¹` with `Ω¹ ⊗ M`; additivity and Leibniz imply linearity over the
  base field. FormalConnectionsOpers owns the continuous/formal extension, differential
  operators, jets/Atiyah sequences, Lie–Rinehart PBW and principal-group connections.
- **EnhancedDerivedSheaves**
  (specification)
  owns the enhanced derived categories of sheaves, derived tensor products and internal Hom,
  pullback and pushforward (Layer E1), derived limits, hypercovers and hypercover descent (Layer
  E2), Kan extensions and Beck–Chevalley comparisons (Layer E3) and the quasicategorical background
  (Layer E0); this roadmap applies them to crystalline sites.
- **SchemeAndStackFoundations** Layer 2 owns coherent cohomology, perfect complexes, Tor-independent
  base change and coherent Grothendieck duality with its trace; Layer 4 owns deformations of smooth
  schemes and line bundles (§4.6).
- **LocalPurity** §§2.1–2.2 owns regular-local purity and extension of finite étale covers
  across missing points with regular local stalks of dimension at least two. **PurityOfBranchLocus** §2.1
  owns pointwise branch purity and §2.2 its global corollary for finite dominant generically étale
  maps between locally noetherian schemes with normal integral source and regular integral
  target; CR.5:log-algebra.4 applies that corollary componentwise to finite normal covers.
  **AbhyankarLemma**
  Layers 0–3 owns DVR tameness, DVR Abhyankar, ramification in codimension one and the
  regular-divisor theorem. CR.5:log-algebra.4 owns the SNC Abhyankar theorem, the compatible
  tame Kummer tower and its full tame fundamental group, and the logarithmic application,
  using those shared inputs.
- **AdicSpacesPartIII** owns formal schemes, the theorem on formal functions and Grothendieck
  existence (Layer F0), admissible formal schemes, generic fibres, specialisation and tubes (Layer
  R2) and coherent sheaves (Layer R3). **AdicSpacesPartIV** owns the analytic site comparisons
  (Layer R4), dagger spaces and weak completions (Layer F1); **AdicEtaleGeometry** §A1.6 supplies
  the analytic étale site used in these comparisons.
- **EnhancedDerivedSheaves** §E1.9 owns perfectness and arbitrary base change of proper flat
  pushforward. **PerfectoidSpaces** Layer P1 owns perfectoid rings, tilts, the sharp map and
  Fontaine's `θ` with its principal kernel. **DerivedModuleAlgebra** §S.1 owns the spectral sequence
  of a first-quadrant double complex. **SchemeAndStackFoundations** §§2.1–2.2 owns
  `cech_to_cohomology` and `leray_spectral_sequence` for general sites.
- **DerivedModuleAlgebra** owns the grading `Γ_A(M) = ⊕ Γ^d_A(M)`, the arbitrary base change of
  `Γ^d` and `Γ^d ≅ TSym^d` for free modules (§0.DP.2), and the Koszul complex with its
  regular-sequence resolution (§0.K.1). **TauCetiRoadmap.JacobianChallenge** owns coherent
  cohomology of curves, Riemann–Roch and Serre duality (Layer B) and relative coherent cohomology
  with base change (Layer C). **TauCetiRoadmap.EllipticCurves** owns the Frobenius endomorphism of
  an elliptic curve over a finite field and its trace (Layers 1 and 3).
- **Mathlib** has divided power structures, divided power morphisms and sub-PD ideals, the divided
  powers on `(p) ⊂ ℤ_p`, on ideals of `ℚ`-algebras and on square-zero ideals, the divided power
  algebra `DividedPowerAlgebra` with `dp`, `lift` and `map`, Witt vectors with Frobenius,
  Verschiebung, Teichmüller and truncations, `PreTilt` and `fontaineTheta`, `BDeRhamPlus`,
  `Perfection.teichmuller₀` for an ideal-adically complete ring with characteristic-p quotient,
  Kähler differentials, `IsCancelMul`, `GrothendieckGroup` and `IsAffineMonoid`, and isocrystals
  with the classification in dimension one; it has no divided power envelope, no augmentation ideal
  of `Γ`, no crystalline site, no de Rham complex beyond `Ω¹`, no log structure. Tau Ceti has
  `TauCeti.teichmuller` for Henselian local rings with finite residue field, and completeness and
  Teichmüller–Frobenius lemmas for Witt vectors. The unit-logarithm target uses these existing
  multiplicative representatives and Tau Ceti's `NormedSpace.logOneAdd` series carrier.
  **PadicFunctionalAnalysis** §4.5 on main supplies convergence and the logarithm laws on
  principal units in a complete normed `ℚ_p`-algebra. CR.6.2 owns the Teichmüller-normalized
  extension to `O_Kˣ` and its Hyodo–Kato change-of-uniformizer application.
- **Not here.** Prisms, δ-rings and prismatic and q-crystalline cohomology; `A_inf`-cohomology and
  Breuil–Kisin–Fargues modules; the rational period rings `B_cris`, `B_st`, `B_dR` and Fontaine's
  period functors; the crystalline, semistable and de Rham comparison theorems with étale
  cohomology; rigid cohomology of general varieties, overconvergent isocrystals and Robba rings; the
  classification of finite flat group schemes and p-divisible groups by Dieudonné modules,
  Breuil–Kisin modules and their Galois representations; the K-theory of local fields and higher
  local class field theory; Habiro cohomology and q-de Rham–Witt complexes. These build on this
  roadmap. Witt cohomology under h-covers, convergent coefficient descent, rational Witt cohomology
  of singular schemes and Cartier transforms of periodic connections are the subject of
  CrystallineCohomologyPartII, which starts where this roadmap stops.

## Conventions

**Derived comparisons.** `D(A)` is the derived category of `A`-modules and
`DF(A)` is the derived category of `ℤᵒᵖ`-indexed diagrams of `A`-module complexes.
Complexes use cohomological degrees: a module `M[1]` lies in degree `−1`.
`dR` is the direct-sum realization of de Rham complexes of a polynomial resolution;
its Hodge completion is the derived limit of finite Hodge quotients. The derived
p-completion `Λ_p` is a separate reflection. The conjugate filtration is increasing
with `Fil_−1 = 0`; both Hodge and conjugate graded pieces carry the shift `[−i]`.
Affine products use shuffle multiplication and global products use the ringed-site
cup product in `D(A)`. Completed tensor products mean completion of derived tensor;
no exchange with a limit is used without its stated boundedness hypotheses.

**Divided powers.** A PD ring is a triple `(A, I, γ)`: a commutative ring `A`, an ideal `I` and
Mathlib's `DividedPowers I`. The operations `γ_n` are total functions `A → A` that vanish outside
`I` in every degree, including degree 0, with `γ₀ = 1` and `γ₁ = id` on `I`. The multiplication
identity has coefficient `choose(m + n, m)` for `x ∈ I` and `m, n ≥ 0`. The iteration identity is
`γ_m(γ_n(x)) = uniformBell(m, n)·γ_{mn}(x)` for `x ∈ I`, `m ≥ 0` and `n ≥ 1`, as in Mathlib's
`DividedPowers.dpow_comp`. For these indices, the natural number `uniformBell(m, n)` equals
`(mn)!/(m!(n!)^m)` and is then mapped to `A`; no operation is defined by dividing by a factorial
in a ring with torsion. The degree-zero rule remains `γ₀(x) = 1` on `I`, without asserting that
`γ₀(x) ∈ I`. A PD morphism is Mathlib's `DividedPowers.IsDPMorphism`. For a prime `p`, the canonical
divided powers on `(p)` in a `ℤ_(p)`-algebra are `γ_n(pa) = c_n aⁿ` for all `n ≥ 0`, where `c₀ = 1`
and, for `n ≥ 1`, `c_n` is the image of `pⁿ/n! ∈ pℤ_(p)`; `p = 2` is included. These are Stacks
Definition 23.2.1 (tag [07GL](https://stacks.math.columbia.edu/tag/07GL)) and Example 23.2.3
(tag [07GN](https://stacks.math.columbia.edu/tag/07GN)), with Mathlib's totalization. Compatibility
of divided powers with a base is Stacks Definition 60.4.1: there is a divided power structure on
`J + IB` extending both.

**Checks.**

- For `A = ℤ`, `I = (0)` and `dividedPowersBot`, `γ₀(γ₀(0)) = γ₀(1) = 0`, whereas
  `uniformBell(0, 0)·γ₀(0) = 1`. Thus iteration cannot include inner index zero.
- For `x ∈ I`, `m = 0` and `n ≥ 1`, both sides of iteration are `1`, since `γ_n(x) ∈ I`.
  For `n = 1`, iteration reduces to `γ_m(x) = γ_m(x)` for every `m ≥ 0`.
- At `m = 2`, `n = 0`, the rational factorial expression is `1/2`, while Mathlib's
  `uniformBell(2, 0) = 1`; the factorial formula requires positive inner index too.
- In `ℤ_(2)`, `c₀ = 1 ∉ 2ℤ_(2)` and `c₁ = c₂ = 2 ∈ 2ℤ_(2)`; after passage to `ℤ/4`,
  `γ₀(2) = 1` and `γ₂(2) = 2`.

**Envelopes and filtrations.** `D_{B,γ}(J)` is the divided power envelope of an ideal `J ⊇ IB` of
an `A`-algebra `B` relative to `(A, I, γ)`, with divided power ideal `J̄`;
`A⟨x_w : w ∈ W⟩ = Γ_A(A^{(W)})` is the divided power polynomial algebra, with
`x_w^{[n]} = dp_n(e_w)`. `Fⁿ_γ I = I^{[n]}` is the divided power filtration. PD nilpotence
(`Fⁿ_γ I = 0` for some `n`), nilpotence of `I`, local nilpotence of `p` and p-adic completeness are
four different conditions: in `ℤ/4` the ideal `(2)`, with the divided powers induced from `ℤ₂`, has
square zero and is not PD nilpotent: `γ_{2^k}(2) = 2^{2^k}/(2^k)!` has 2-adic valuation one, so it
is a
nonzero element of `(2)` for every `k`.

**Crystalline sites.** The conventions are those of the Stacks Project, Chapter 60. A PD base is a
PD scheme `(S, I, γ)` over `ℤ_(p)`, `S₀ = V(I)`, and `X` is an `S₀`-scheme on which `p` is locally
nilpotent; `p` need not be nilpotent on `S`. `Cris(X/S)` is the small and `CRIS(X/S)` the big
crystalline site, with objects `(U, T, δ)` and the Zariski topology; the étale variants carry the
étale topology. `u_{X/S} : (X/S)_cris → Sh(X_Zar)` is a morphism of topoi, not of ringed topoi to
`(X_Zar, O_X)`, and `Ru_{X/S,*}` takes values in `D(X_Zar, f⁻¹O_S)`. The log crystalline site uses
the étale topology, after Kato and Beilinson.

**Connections and stratifications.** A connection is written `∇m = Σ_i θ_i(m) dx_i`. In the Taylor
isomorphism `ξ_i = x_i ⊗ 1 − 1 ⊗ x_i = p₀(x_i) − p₁(x_i) ∈ D(1)`, the sign used in the proof of
Stacks Lemma 60.17.3. Quasi-nilpotence is imposed on the exponents `k ≥ 1`. Log quasi-nilpotence
in Layer CR.5 uses the falling factorials `∏_{0 ≤ j < a_i}(∇_i − j)` along a log basis `dlog t_i`.

**Witt vectors and the letters r and n.** `W(A)` and `W_r(A)` are Mathlib's `WittVector` and
`TruncatedWittVector`. Layer CR.4 indexes truncation by `r` (`W_r(A)`, `W_rΩ`, the operators
`F : W_{r+1} → W_r`, `V : W_r → W_{r+1}` and the restriction `R`); Layers CR.1, CR.3, CR.5 and CR.6
write `W_n = W_n(k) = W(k)/pⁿ` for a perfect field `k`, with the canonical divided powers on `(p)`.
For a saturated Dieudonné complex `M`, `W_r(M) = M/(im V^r + im dV^r)` is a quotient complex, not a
ring of Witt vectors. `σ` is the Witt Frobenius of `W(k)` throughout.

**Frobenius on complexes.** On a Dieudonné complex and on every F–V procomplex `dF = pFd`, so the
graded Frobenius `F` is not a map of complexes. On a saturated complex `FV = VF = p`; on
Langer–Zink's relative complexes `FV = p`, while `VF` is multiplication by `V(1)`, which equals `p`
for `𝔽_p`-algebras and not in general. The Frobenius of de Rham–Witt complexes that matches
crystalline Frobenius is the degree-scaled `𝐅 = p^q·F` in degree `q`. An F-crystal `(E, Φ)`
relative to a Frobenius lift `σ` has `Φ : (F_X)^*_{crys}E → E`; on `K = RΓ_crys(X/S, E)`,
`F_K : K ⊗^L_{A,σ} A → K` is the linearized Frobenius and `F : K → K` the σ-semilinear one. A
nondegenerate F-crystal has an integer `i` and `V` with `V∘Φ = pⁱ`. Layers CR.6 and CR.7 write `φ`
for the Frobenius of Hyodo–Kato complexes and coefficient crystals. Commutative differential
graded algebras are strictly commutative: `x² = 0` for every `x` of odd degree, also at `p = 2`.

**Tate twists.** A twist `(r)` scales Frobenius by `p^{−r}` and shifts the filtration:
`φ_{D(r)} = p^{−r}φ_D` and `Fil^i(D(r)) = Fil^{i+r}D`, with monodromy unchanged. So `W(−d)` is `W`
with Frobenius `p^d·σ`.

**Log structures.** Log structures are Kato's, on the small étale site: `α : M → O_X` with
`α⁻¹(O_X^×) ≅ O_X^×`. Monoids are written multiplicatively inside rings and additively in charts.
Fine means integral and finitely generated, fs fine and saturated; neither integrality nor
saturation follows from the other conditions. Integral quasi-coherent log structures (Beilinson,
Binda–Kato–Vezzani) admit charts by arbitrary integral monoids, and log smoothness for them means
log smoothness of a fine model. Fibre products are taken in the category named: log, integral or
fs.

**Log points and log Witt bases.** The standard log point `k^log` over a perfect field `k` is
`Spec k` with the log structure of `ℕ → k`, `1 ↦ 0`; `W_n(k)^log` and `W(k)^log` carry
`ℕ → W_n(k)`, `W(k)`, `1 ↦ 0`, with Frobenius `σ` on the ring and multiplication by `p` on the
chart. This is not the chart `1 ↦ p`. In the targets that follow Disegni–Liu, `κ°` is the standard
log point over a perfect field `κ`, `W°` is `W(κ)^log`, `W[t]°` is `Spec W[t]` with the log
structure of `1 ↦ t` (written `W(k)[t]^log` elsewhere), and `W^triv` is `Spec W` with the trivial
log structure.

**Hyodo–Kato theory.** `O_K` is a complete discrete valuation ring of mixed characteristic with
perfect residue field `k`, `K₀ = W(k)[1/p]`, and `K̆₀ = W(k̄)[1/p]` the completion of the maximal
unramified extension of `K₀`. For cochain complexes use `d_{C[−1]} = −d_C`. The parameter
inclusion `ι_θ : C[−1] → C̃` has degree-q component
`ι_θ^q(a) = (−1)^{q−1} a ∧ θ = θ ∧ a`, for `a ∈ C^{q−1}` and `θ = dlog t`.
Every triangle below labelled `∧θ` or `∧dlog t` uses this signed inclusion; the raw
right-wedge operation alone is only a degree-one graded map. Monodromy is the connecting
map of this triangle, with its identification with the first logarithmic PD Taylor coefficient
made using the same shift convention. For the two-term complex `x ↦ dx`,
`ι_θ^1(x)=xθ`, `ι_θ^2(dx)=−dx∧θ`, and
`dι_θ^1(x)=dx∧θ=ι_θ^2(−dx)`. Omitting the degree sign reverses the latter coefficient.
Then `Nφ = pφN`, and the change of uniformizer is
`ρ_{πu} = ρ_π ∘ exp(log_K(u)N)` with the normalised unit logarithm. The Hyodo–Kato map `ρ_π`
depends on the uniformizer `π`.

**Disegni–Liu.** The targets on logarithmic Witt models cite Disegni–Liu in arXiv:2204.09239v3,
whose Appendix B is on pp. 79–84; the convergent targets of Layer CR.6 cite the 2024
publisher-formatted author copy, where Appendix B is on PDF pp. 113–118. Equation and lemma
numbers agree; page numbers do not.

**Čech products and trace signs.** On `C^r(Ω^s)` use the total differential
`δ + (−1)^r d` and the product of bidegrees `(r,s)` and `(t,u)` with sign
`(−1)^{st}` before the Čech cup product and exterior product. On projective space
use the increasing order `U₀,…,U_d`, coordinates `t_i=X_i/X₀` and the positive
Chern cocycle `dlog(X_j/X_i)` on `U_i∩U_j`. Thus
`h^d = ε_d [dlog t₁∧…∧dlog t_d]`, where
`ε_d=(−1)^{d(d−1)/2}`. In dimensions 0, 1 and 2 the values are 1, 1 and −1:
on `U₀∩U₁∩U₂`, the product is
`−dlog t₁∧dlog(t₂/t₁)=−dlog t₁∧dlog t₂`.
In particular the sign remains part of the integral convention at `p=2`.
`Suggested.lean` declares `Crystalline.cechTraceSign`.

**Names.** Lean names in this README are relative to the namespace
`TauCetiRoadmap.CrystallineCohomology`
of `Suggested.lean` and are suggestions; `Crystalline.*` holds the crystalline and de Rham–Witt
material, `LogCrystalline.*` the logarithmic material, and `DerivedDeRham.*` the CR.DDR targets
owned here, retaining the namespace of the DerivedDeRhamCohomology constructors they extend.

## Exact supplier contracts

### From Mathlib (pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`)

- **Divided powers.** `DividedPowers` (fields `dpow`, `dpow_null`, `dpow_zero`, `dpow_one`,
  `dpow_mem`, `dpow_add`, `dpow_mul`, `mul_dpow`, `dpow_comp`), `dividedPowersBot`,
  `DividedPowers.dpow_sum`, `dpow_sum'`, `prod_dpow`, `exp`, `exp_add`, `factorial_mul_dpow_eq_pow`,
  `coincide_on_smul`, `ofInjective`, `ofRingEquiv`, `ext`; `DividedPowers.IsDPMorphism` with
  `map_dpow`, `on_span`, `of_comp` and `dpow_eq_from_gens`; `DividedPowers.IsSubDPIdeal`,
  `span_isSubDPIdeal_iff`, `isSubDPIdeal_ker`, the quotient structures
  `DividedPowers.Quotient.dividedPowers` and `Quotient.OfSurjective.dividedPowers`, the equalizer
  `mem_dpEqualizer_iff`; `PadicInt.dividedPowers` with `PadicInt.coe_dpow_eq`;
  `DividedPowers.RatAlgebra.dividedPowers` with `dpow_eq_inv_fact_smul`;
  `DividedPowers.OfSquareZero.dividedPowers`. These are used as they stand: total operations
  vanishing outside the ideal, morphisms as ring maps commuting with all `dpow`.
- **The divided power algebra.** `DividedPowerAlgebra` with `dp`, `dp_zero`, `dp_sum_smul`,
  `embed_def`, `induction_on`, `algHom_ext`, `lift`, `lift'`, `lift_apply_dp`, `lift_unique`,
  `lift_surjective`, `map`, `map_apply_dp` and `submodule_span_prod_dp_eq_top`. Its augmentation
  ideal is supplied by DerivedModuleAlgebra §0.DP.3; its canonical divided powers are supplied
  by DerivedDeRhamCohomology §PD.5.
- **Witt vectors and tilts.** `WittVector` with `frobenius`, `frobeniusEquiv`, `verschiebung`,
  `frobenius_verschiebung`, `verschiebung_frobenius`, `verschiebung_mul_frobenius`, `teichmuller`,
  `ghostComponent`, `map`, `truncate`, `isAdicCompleteIdealSpanP`,
  `mem_span_p_iff_coeff_zero_eq_zero`,
  `eq_zero_of_p_mul_eq_zero`, `eq_of_apply_teichmuller_eq`; `TruncatedWittVector` and
  `TruncatedWittVector.truncate`; `PreTilt`, `WittVector.fontaineTheta`,
  `fontaineTheta_teichmuller`,
  `mk_fontaineTheta`, `surjective_fontaineTheta`; `WittVector.Isocrystal`,
  `StandardOneDimIsocrystal`
  and `isocrystal_classification` (dimension one over an algebraically closed field).
- **Finite cyclic group cohomology.**
  `Rep.FiniteCyclicGroup.groupCohomologyIsoEven` in
  `Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean`, lines 76–87,
  identifies positive even cohomology with the homology of the norm / generator-minus-identity
  complex. For the trivial Z_p-representation of Z/p² this gives H²=Z_p/p².
- **Infinite Witt identities and truncation.** In
  `Mathlib.RingTheory.WittVector.Identities`, `WittVector.frobenius_verschiebung` gives
  `F(Vx) = px` over every commutative ring, `verschiebung_mul_frobenius` gives the projection
  formula, and `verschiebung_frobenius` gives `V(Fx) = px` in characteristic p.
  `WittVector.verschiebung_injective` and `verschiebung_coeff_succ` in
  `Mathlib.RingTheory.WittVector.Verschiebung` supply the injective coordinate shift;
  `WittVector.coeff_frobenius_charP` supplies coordinate Frobenius.
  `WittVector.mem_ker_truncate` and `TruncatedWittVector.truncate` in
  `Mathlib.RingTheory.WittVector.Truncated` supply the existing restriction and its coordinate
  kernel. `WittVector.eq_zero_of_p_mul_eq_zero` in `Mathlib.RingTheory.WittVector.Complete`
  supplies p-torsion-freeness for perfect characteristic-p rings. CR.4.4 adds the finite-length
  operators and the reduced-ring extension, using these declarations.
- **Multiplicative representatives.** `Perfection.teichmuller₀ p I`, for a commutative ring
  complete for the I-adic topology with characteristic-p quotient, is a multiplicative map
  `Perfection (R ⧸ I) p →*₀ R`. `Perfection.mk_teichmuller₀` identifies its reduction with
  the zeroth coefficient. For perfect `R ⧸ I`, compose with
  `(PerfectionMap.id p (R ⧸ I)).equiv` to obtain the multiplicative section of reduction.
  `Perfection.teichmuller₀_spec` gives uniqueness from compatible p-power lifts. This supplies
  the representatives used in the unit logarithm for ramified as well as unramified O_K.
- **Commutative algebra.** `KaehlerDifferential` with `D`, `linearMapEquivDerivation`,
  `mvPolynomialBasis` and `isLocalizedModule_map`; `ExteriorAlgebra`; `Algebra.Etale`;
  `IsAdicComplete`, `AdicCompletion`; `IsLocalization`; `Module.Flat`;
  `RingTheory.Sequence.IsRegular`;
  `IsRegularLocalRing`; `TrivSqZeroExt`; `MvPolynomial.basisMonomials` and
  `MvPolynomial.gradedAlgebra`;
  `IsCancelMul`, `Monoid.FG`, `IsAffineMonoid`, `Algebra.GrothendieckGroup`.
- **Homological algebra and sheaves.** `CochainComplex`, `HomologicalComplex` with `homology`,
  `stupidTrunc` and `truncLE`, `QuasiIso`, `DerivedCategory` with its t-structure,
  `CategoryTheory.GrothendieckTopology`, `SheafOfModules` with `pullback`, `Submodule` and the
  pullback–pushforward adjunction, `PresheafOfModules.sheafification`,
  `AlgebraicGeometry.Scheme.smallEtaleTopology`, `AlgebraicGeometry.Scheme.IdealSheafData`,
  `AlgebraicGeometry.Proj`, `CategoryTheory.Ind`.

### From Tau Ceti (pinned at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`)

- `TauCeti.Associative.dividedPower` and `TauCeti.Associative.dividedPower_eq_dpow` (`xⁿ/n!` in a
  `ℚ`-algebra, agreeing with Mathlib's rational divided powers), `TauCeti.nilpotentExpUnit`
  (the exponential of a nilpotent element), and `TauCeti.teichmuller` (Teichmüller units of a local
  field with finite residue field), from `TauCeti.RingTheory.DividedPowers.Associative`,
  `TauCeti.RingTheory.Nilpotent.Exp` and `TauCeti.RingTheory.Henselian.Teichmuller`, respectively.
  The last map is defined on residue-field units of any Henselian local ring with finite residue
  field; reduction composed with it is the identity.
- **Witt completeness and Frobenius.** `TauCeti.RingTheory.WittVector.Complete` supplies
  `WittVector.isAdicComplete_span_p_teichmuller`: for a perfect characteristic-p commutative ring
  `R` complete for `(ϖ)`, `W(R)` is complete for `(p, [ϖ])`. It also supplies
  `TauCeti.WittVector.completeSpace_and_t2Space_adicTopology_span_p_teichmuller` for the corresponding
  complete Hausdorff adic topology. `TauCeti.RingTheory.WittVector.Frobenius` supplies
  `WittVector.frobenius_teichmuller` (`F([r]) = [r]^p` in characteristic p),
  `WittVector.frobeniusEquiv_symm_teichmuller` for perfect `R`, and
  `TauCeti.WittVector.continuous_frobenius` and `continuous_frobeniusEquiv_symm` for the
  `(p, [ϖ])`-adic topology. These inputs are consumed as library results.

### From TauCetiRoadmap roadmaps

- **DGAInfinity**, Layer 1: strict differential graded models and their morphisms for the
  polynomial and free prelog realizations.
- **DerivedModuleAlgebra**, §0.DP.3: the augmentation of `Γ_A(M)`, its augmentation ideal
  and scalar splitting. §0.DP.2: `Γ_A(M) = ⊕_d Γ^d_A(M)` as an `A`-linear
  equivalence, the base change `B ⊗_A Γ^d_A(M) ≅ Γ^d_B(B ⊗_A M)` for every `A`-algebra `B`, and
  `Γ^d_A(M) ≅ TSym^d_A(M)` for free `M`. §0.K.1: the Koszul complex of a sequence, exact in
  positive degrees with `H₀ = R/(f₁, …, f_r)` when the sequence is weakly regular.
- **JacobianChallenge**, Layer B: for a geometrically connected smooth proper curve `C/k` of genus
  `g`, `dim H⁰(O) = 1`, `dim H⁰(Ω¹) = g`, `dim H¹(Ω¹) = 1` (Serre duality with `ω = Ω¹`) and
  Riemann–Roch. Layer C: proper flat finitely presented pushforward, flat base change and
  cohomology and base change.
- **EllipticCurves**, Layers 1 and 3: the Frobenius endomorphism `π` of an elliptic curve over `𝔽_q`
  with `deg(1 − π) = #E(𝔽_q)`, the trace `a = q + 1 − #E(𝔽_q)`, the relation `π² − [a]π + [q] = 0`,
  and the supersingularity criterion `p ∣ a`.

### From other roadmaps

- **LocalPurity**, §§2.1–2.2: purity for regular local rings of dimension at least two
  (Stacks [0BMA](https://stacks.math.columbia.edu/tag/0BMA), the cover-extension formulation),
  spreading out and extension across points where purity holds
  ([0EY7](https://stacks.math.columbia.edu/tag/0EY7)). Its
  `finiteEtale_extend_of_regular_codimTwo` and fully faithful restriction give unique extension
  from an open `U ⊆ X` when every `x ∈ X ∖ U` has a regular local stalk of dimension at least two.
- **PurityOfBranchLocus**, §§0.1 and 2.1–2.2: §0.1's `Scheme.Hom.unramifiedAt_iff_stalkMap`
  (for a morphism locally of finite type, unramified at a point iff the stalk map is formally
  unramified) and pointwise Zariski–Nagata branch purity (SGA 1 X,
  Théorème 3.1; Stacks [0BMB](https://stacks.math.columbia.edu/tag/0BMB)). For a morphism of
  locally noetherian schemes, at a point x with normal source stalk, regular target stalk,
  quasi-finiteness, equal positive stalk dimensions and unramifiedness at all codimension-one
  generalizations of x, the morphism is étale at x. [§2.2's global corollary](../PurityOfBranchLocus/README.md#22-the-global-corollary)
  `Scheme.Hom.etale_of_etaleAt_codimOne`: a finite dominant generically étale morphism from a
  normal integral locally noetherian scheme to a regular integral locally noetherian scheme is
  étale iff its stalk maps at the codimension-one points of the source are formally unramified;
  generic étaleness means separability of the finite function-field extension, with the purely
  inseparable field extension as its boundary. CR.5:log-algebra.4's *Componentwise branch purity*
  applies this corollary to each connected component of a finite normal cover.
- **AbhyankarLemma**, §§0.1–0.3, 1.1 and 3.3–3.4: tame finite separable extensions of DVR
  fraction fields, their Kummer extensions and DVR Abhyankar
  ([0BRM](https://stacks.math.columbia.edu/tag/0BRM)); the codimension-one tame-cover predicate
  and its base-change laws with their stated hypotheses; and the regular-divisor local
  structure and finite normalization
  ([0EYG](https://stacks.math.columbia.edu/tag/0EYG),
  [0EYH](https://stacks.math.columbia.edu/tag/0EYH)). These supply the one-branch inputs to
  CR.5:log-algebra.4; the SNC extension and tame Kummer tower are constructed here.
- **DerivedModuleAlgebra**: §§1.2, 1.3 and 1.5 (derived completeness, the completion
  reflector and ordinary quotient towers); **DerivedDeRhamCohomology** §1.22 (valid
  exchanges of completion with derived operations), perfectness modulo a nilpotent ideal and of
  compatible perfect towers; Layer 2, §§2.12, 2.21 and 2.27 (the ordinary de Rham complex
  `Ω^•_{B/A}` as an `A`-complex with `A`-linear differential, its universal property among
  commutative differential graded algebras, and its version for completely smooth formal algebras);
  Layer 3, §§3.4 and 3.6 (the polynomial Cartier map and the Cartier isomorphism for smooth
  `𝔽_p`-algebras).
- **DerivedModuleAlgebra**: §§0.1–0.2 (polynomial resolutions and module derived tensor),
  §§0.4–0.6, 0.8, 0.10–0.17 (cotangent complexes, square-zero extensions, transitivity,
  localization, regular quotients and integral derived powers); §§1.1–1.7 (module towers,
  completeness, completion and complete flatness), §1.T.1 (Milnor sequences), §S.1
  (the first-quadrant double-complex spectral sequence).
- **DerivedDeRhamCohomology**: §§PD.1–PD.2, PD.4–PD.7 (divided powers from generators,
  gluing, extension, PD filtration and nilpotence, base-compatible divided powers, PD envelopes
  and `A_cris`); §§1.13–1.17, 1.22–1.23 (perfect systems, filtered modules,
  completion exchanges and quasisyntomic cotangent amplitude); §§2.22–2.26, 2.28 (derived
  de Rham, base change, Hodge pieces, completions and transitivity); §§3.2–3.3, 3.5–3.6.1,
  3.8, 3.11, 3.13 (conjugate filtration, derived twists, Cartier and quotient calculations);
  §4.2 (PD conjugate filtration); §§5.1–5.8.1, 5.17, 5.19 (quasisyntomic and QRSP descent,
  base-linear schemes and formal schemes, raw lci sheaves with affine recovery and realization,
  Teichmüller-quotient torsion-freeness); §6.20 (the shared prelog category, free adjunction,
  `freePrelogResolutions`, `prelogHomotopyPushout`, `gabberLogCotangent`,
  `logCotangentFunctoriality`, `logDerivedDeRham`, `logDeRhamDLog`, `logCartier`,
  `logificationBoundaries` and their public laws); §§6.20–6.21 (`periodLogComparisonData`,
  `periodLogSpecialization` and `periodDLogCanonical`). The logarithmic comparisons here use
  these same cotangent and de Rham objects, ordinary-to-log maps, transitivity boundaries,
  products, Hodge filtrations, conjugate filtrations on reductions and completion maps.
  The period objects and `d log` are their supplied specializations, including p=2 and arbitrary
  perfect residue fields, naturally for Galois actions and valued embeddings. Generic prelog
  data are supplied by §6.20 independently of this roadmap's geometric log structures.
- **DiamondsAndVStacks** D6.9: `IsSeminormalRing` (unique square/cube roots),
  `IsSubintegral` (ring maps), `subintegral_lift` (unique extension to seminormal targets),
  `subintegral_bijective_of_seminormal` (a subintegral map from a seminormal ring to a reduced
  ring is bijective), `snRing`, `snMap : R →+* snRing R` (the subintegral unit),
  `snRing_seminormal`, `sn_lift` (the reflection property) and `sn_compare` (uniqueness of
  the reflection). All these names are in namespace `DiamondsAndVStacks`; the de Rham–Witt
  applications use these same predicates, carriers and unit.
- **PadicPeriodRings**: §2 (`PadicFieldCompletion`, the completed algebraic closure of a complete
  discretely valued mixed-characteristic field with perfect residue field); §3
  (`periodPDEnvelope`, its ordinary p-adic completion, `θ_cris`, logarithm and functorial maps);
  §4.1 (Frobenius and the compatible period structures). CR.5.5 uses this `A_cris(O_C)` carrier,
  identified with the general construction by DerivedDeRhamCohomology §PD.7.
- **EnhancedDerivedSheaves**: §§0.1–0.4 (ringed-site enhancement, replacements, tensor–Hom,
  towers and coherent functors), §E1.4 (enhanced inverse/direct image), §E1.6 (Kunz
  flatness and its converse), §E1.9 (perfect proper pushforward); Layer E0 (the Dold–Kan
  mapping-space comparison and quasicategories);
  Layer E1 (the enhanced derived category of a ringed site, derived tensor and internal Hom,
  derived pullback and pushforward, complexes of module sheaves and coherent composition
  comparisons); Layer E2:towers.1 (`derivedTowerLimit`, coherent derived limits on arbitrary
  ringed sites); Layer E2 (hypercovers, bounded-below hypercover descent and the Čech complex of a
  finite cover); §E2.2 (`IsReplete.derived_limits` and `IsReplete.milnor`, only on replete topoi,
  including the point topos for module towers); Layer E3
  (Beck–Chevalley comparisons).
- **SchemeAndStackFoundations**: §0.26 supplies `wittScheme n X`, `wittScheme_affine` and
  `wittScheme_one` for perfect `𝔽_p`-schemes and n≥1. CR.4.6 constructs
  `Crystalline.wittScheme` for all schemes on which p is locally nilpotent, proves agreement
  with that perfect-scheme constructor, and supplies the differential module sheaves and descent
  on this carrier. CR.3:duality uses this same extended scheme.
- **EtaleCohomologyFoundations**: §F.7, `VanishingCycles.etaleWeakLefschetz`, supplies
  restriction isomorphisms below the middle degree and injection in the middle for smooth
  ample sections of smooth projective varieties, with finite coefficients of invertible
  annihilator and integral ℓ-adic coefficients for ℓ invertible in the base field.
  §§F.4.1–F.4.4, `VanishingCycles.normalizedAdicSystems`,
  `VanishingCycles.classicalAdicRealization`, `VanishingCycles.etaleProetaleAdicComparison`
  and `VanishingCycles.adicFiniteness`, supply normalized coefficient towers, realization
  as a derived limit, its pro-étale comparison, finite-group compatibility, integral
  finiteness and derived reduction. CR.3.5 applies them with ℓ=p over C of characteristic zero.
- **SchemeAndStackFoundations**: §2.15, `hochschildSerre_galois_covering`, supplies the
  finite-coefficient spectral sequence for a finite étale G-torsor. CR.3.5 identifies its
  integral realization using EtaleCohomologyFoundations §F.4 and specializes it to G=Z/p².
- **SchemeAndStackFoundations**: §0.15 (Néron–Popescu desingularization);
  §§2.1–2.2 (`cech_to_cohomology` and `leray_spectral_sequence`
  for general sites); Layer 2 (coherent cohomology, Tor-independent base change,
  perfect complexes and their biduality, a single perfect generator of `D_QCoh`, coherent
  Grothendieck duality with `(g∘f)^! ≅ f^!g^!`, the finite and smooth formulas, the proper trace
  and Serre duality, the pro-étale site and `ν`, extension by zero `F_!`, étale lifting across
  nilpotent thickenings and faithfully flat descent of quasi-coherent modules); Layer 4
  (§4.6, deformations of smooth schemes and line bundles; §4.7, formal spectra and adic
  thickening systems).
- **AdicSpacesPartIII**: §F0.3 (formal schemes and their adic systems), §F0.6
  (*coherent-as-inverse-system*, *theorem-on-formal-functions*, *cohomology-of-mittag-leffler-limit*,
  and the good-filtration and uniform Serre-vanishing targets), §F0.7 (`grothendieck-existence`)
  and §F0.8 (*grothendieck-algebraization*, applied to a proper compatible system with a line
  bundle ample on its closed fibre). §§R2.2–R2.4 supply admissible formal schemes, generic fibres,
  specialisation and tubes.
- **AdicEtaleGeometry**: §A1.6, the analytic étale site and its base-change morphisms.
  **AdicSpacesPartIV**: §§R4.1–R4.2, its restriction to locally noetherian analytic carriers,
  functoriality and slices; §F1.5, weak completions; §F1.7 (`dagger-space`), dagger spaces;
  §F1.11, finiteness of de Rham cohomology of semistable tubes under its stated finiteness
  inputs.
- **EnhancedDerivedSheaves**, §E1.9: for `f : X → Spec R` proper, flat and
  of finite presentation and `F` finite locally free,
  `RΓ(X, F)` is perfect and commutes with every base change.
- **PerfectoidSpaces**, Layer P1: §P1.24, integral perfectoid rings `IsIntegralPerfectoid`
  (BMS Definition 3.5) with the Frobenius criterion of BMS Lemma 3.10; §P1.25, the passage from a
  perfectoid Tate pair `(S, S⁺)` to the integral perfectoid ring `S⁺`, and back when `S⁺` is
  bounded in `S`; the tilt and the sharp map; and Fontaine's `θ : W(S♭⁺) → S⁺`, surjective with
  kernel generated by a primitive non-zero-divisor for a perfectoid Tate pair `(S, S⁺)`
  (§§P1.17–P1.18). This roadmap uses `IsIntegralPerfectoid` and has no integral perfectoid
  predicate of its own.
- **SchemeAndStackFoundations**, §0.29: `absoluteFrobenius`,
  `schemeFrobeniusTwist`, `relativeFrobenius`, their factorization, naturality and arbitrary relative
  base change, independently of the Dieudonné-theory layers. Log Frobenius uses these underlying
  scheme maps and the p-power map on the log monoids.
- **DerivedModuleAlgebra**, §S.1: the spectral sequence of a first-quadrant double
  complex. **SchemeAndStackFoundations**, §§2.1–2.2: `cech_to_cohomology` and
  `leray_spectral_sequence`, for general sites.

## How to read the build

The PD foundations are DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7 and
DerivedModuleAlgebra §0.DP.3. Layer CR.1 uses them to construct PD
schemes and the crystalline sites and identifies crystals with modules with quasi-nilpotent
connection; Layer CR.2 proves the PD Poincaré lemma and computes crystalline cohomology by de Rham
complexes; Layer CR.3 develops the formal properties of crystalline cohomology of proper smooth
schemes, with CR.3:Frobenius-isogeny on top of it. After CR.2.2, CR.DDR.4.1, CR.DDR.4.3,
CR.DDR.4.4 and CR.DDR.5.8–CR.DDR.5.10 compare derived de Rham with crystalline models.
Layer CR.4 is the de Rham–Witt theory: it begins
with pure homological algebra (Dieudonné complexes), passes through Witt-vector inputs and the
three de Rham–Witt complexes, and ends with the crystalline comparison, slopes and the Nygaard
filtration. CR.DDR.4.5 and CR.DDR.5.18, CR.DDR.5.20–CR.DDR.5.22 then build derived Witt
and quasiregular crystalline theory; CR.3:duality uses its top-degree sheaf to build the trace.
Layer CR.5:log-algebra is
independent of all crystalline layers and can be built in parallel with CR.1–CR.4. Its
componentwise branch-purity adapter uses PurityOfBranchLocus §§0.1 and 2.2; the SNC Abhyankar
targets also use LocalPurity §§2.1–2.2 and AbhyankarLemma Layers 0–3 as specified in
*Exact supplier contracts*. Layer CR.5
combines it with Layer CR.1 and the PD foundations to build log crystalline cohomology. CR.DDR.6 develops
logarithmic classifiers and crystalline comparisons on DerivedDeRhamCohomology §6.20's shared
constructors after CR.5.5. Layer CR.6 builds
Hyodo–Kato theory on CR.4 and CR.5, and Layer CR.7 collects coefficients and relative cohomology for
the roadmaps that consume this one. Within each layer the targets are in dependency order.

## Layer CR.1: Crystalline sites, structure sheaves and crystals

This layer globalises the PD foundations of DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7 and
DerivedModuleAlgebra §0.DP.3: PD schemes, the small, big and étale crystalline sites with their
morphisms, the structure and PD ideal sheaves, crystals in quasi-coherent and finite locally free
modules, isocrystals and F-crystals. It then builds PD differentials, modules with integrable
connection, PD stratifications and topologically quasi-nilpotent connections, and proves that
crystals on an affine scheme with a smooth lift are the modules with integrable quasi-nilpotent
connection on the PD envelope.

### CR.1.1 PD schemes and crystalline sites

**Schemes with a quasi-coherent PD ideal.** A PD scheme (divided power scheme) is a triple (T,J,γ):
a scheme T, a quasi-coherent sheaf of ideals J⊂O_T and maps of sheaves γ_n:J→J (n≥1, with γ₀=1) such
that (O_T(W),J(W),γ) is a PD ring for every open W⊂T. A morphism of PD schemes (T,J,γ)→(T′,J′,γ′) is
a morphism of schemes f:T→T′ with f⁻¹J′·O_T⊂J such that (O_T′(W′),J′(W′),γ′)→(O_T(f⁻¹W′),J(f⁻¹W′),γ)
is a PD homomorphism for every open W′⊂T′. Let U=V(J)→T be the closed immersion defined by J. The
triple (U,T,γ) is a PD thickening if U→T is a thickening, that is, a closed immersion inducing a
homeomorphism of underlying spaces. If p is a prime, T is a scheme over ℤ_(p) and p is locally
nilpotent on U, then U→T is a thickening if and only if p is locally nilpotent on T.

*Hypotheses.* T is a scheme, J⊂O_T a quasi-coherent sheaf of ideals, and γ_n is given for every n≥1.
In the last sentence p is a prime number, T is a scheme over ℤ_(p) and p is locally nilpotent on
U=V(J).

The API:

- `Crystalline.PDScheme.affine`: On an affine open, J gives its ring ideal and the restricted
  powers.
- `Crystalline.PDScheme.localize`: The powers on a basic open D(s) are γ_n(x/sᵏ)=γ_n(x)/sᵏⁿ for
  x∈I(Spec A), k≥0.
- `Crystalline.PDScheme.map_comp`: Identity and composite PD morphisms preserve all powers.
- `Crystalline.PDScheme.fiberProduct`: For morphisms of PD schemes f:(T,J,δ)→(S,I,γ) and
  f′:(T′,J′,δ′)→(S,I,γ) there are a PD scheme (T″,J″,δ″) and a cartesian square in the category of
  PD schemes; T″→T×_ST′ is a closed immersion and `T″₀→T₀×_{S₀}T′₀` is an isomorphism, where T₀=V(J)
  and similarly for the others (Stacks Lemma 60.7.4; affine-locally T″ is the spectrum of the
  pushout of PD rings, *Pushouts of divided power rings* (DerivedDeRhamCohomology §PD.6)).
- `Crystalline.PDScheme.isThickening_iff`: For a PD scheme (T,J,γ) over ℤ_(p) with p locally
  nilpotent on U=V(J): U→T is a thickening if and only if p is locally nilpotent on T.

*Proof sketch.* A PD structure on a quasi-coherent ideal is determined by its values on affine
opens: on a basic open D(s) of an affine open the powers are γ_n(x/sᵏ)=γ_n(x)/sᵏⁿ (*Divided powers
after localization* (DerivedDeRhamCohomology §PD.2)), which is the compatibility with restriction.
Morphisms are defined by preservation of the powers on sections; identities and composites of PD
morphisms are PD morphisms. Last sentence: on an affine open with ring A and PD ideal I, p is
nilpotent in A/I. If pᴺ=0 in A then for x∈I, `x^{pN}=(pN)!·γ_{pN}(x)=0` because pᴺ divides (pN)!;
conversely if I is locally nilpotent then pʳ∈I is nilpotent (Stacks, Divided Power Algebra, Lemma
23.2.6). A closed immersion is a thickening exactly when its ideal is locally nilpotent. ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.7, Definitions 60.7.1–60.7.3
and observation (1) before Situation 60.7.5.) *Needs:* *Divided powers after localization*
(DerivedDeRhamCohomology §PD.2); *PD-nilpotent divided power ideals and ordinary nilpotence*
(DerivedDeRhamCohomology §PD.4); *Pushouts of divided power rings* (DerivedDeRhamCohomology §PD.6);
Mathlib `AlgebraicGeometry.Scheme.IdealSheafData`.

**Checks.**

- `test_pdScheme_zero`: An identity immersion has the zero PD ideal.
- `test_pdScheme_affine`: Spec(A/I)→Spec A for a PD ideal recovers precisely the original affine PD
  ring.
- `test_pdScheme_two`: Spec F₂→Spec ℤ/4, with the PD structure γ_n(2)=2ⁿ/n! on (2), is a PD
  thickening on which 2 is nilpotent, although the ideal (2) is not PD-nilpotent.
- On Spec ℤ/4 the ideal (2) carries exactly two PD structures, with γ₂(2)=2 and with γ₂(2)=0
  (Stacks, Divided Power Algebra, Lemma 23.5.3 and Remark 23.3.6); the identity of Spec ℤ/4 is not a
  morphism of PD schemes from one to the other.
- For a PD ring (A,I,γ) and s∈A, the affine PD scheme (Spec A,Ĩ,γ) restricted to D(s) has powers
  γ_n(x/sᵏ)=γ_n(x)/sᵏⁿ.

**Small and big crystalline sites.** Let p be a prime, (S,I,γ) a PD scheme over ℤ_(p), S₀=V(I)⊂S,
and X→S₀ a morphism of schemes such that p is locally nilpotent on X (Stacks Situation 60.7.5; p
need not be nilpotent on S). A PD thickening of X relative to (S,I,γ) is a PD thickening (U,T,δ)
together with a morphism of PD schemes (T,J,δ)→(S,I,γ) and an S-morphism U→X; a morphism of such
objects is a morphism of PD schemes over S compatible with the maps to X. They form the category
CRIS(X/S); for every object, p is locally nilpotent on T. A family {(U_a,T_a,δ_a)→(U,T,δ)} is a
Zariski covering if U_a=U×_TT_a for all a and {T_a→T} is a Zariski covering. The big crystalline
site of X over (S,I,γ) is CRIS(X/S) with the Zariski topology. The small crystalline site Cris(X/S)
is the full subcategory of the objects (U,T,δ) for which U→X is an open immersion, with the Zariski
topology. Also define CRIS_fppf(X/S) on the same big objects, with covers
U_a=U×_T T_a and a jointly surjective family of flat finitely presented
maps T_a→T. The divided powers on each T_a are the unique flat extensions.
Its structure sheaf is `O_crys(U,T) = Γ(T,O_T)`. For a commutative group scheme G/X,
`G_crys(U,T) = G(U)` defines an abelian sheaf for this topology, by fppf descent.
The same construction applies to the commutative p-divisible sheaves used in Dieudonné theory.
The downstream internal Ext construction belongs to AbelianSchemesAndArithmeticModuli
§A4.CR.7.2: it is formed in the category of abelian sheaves of this fppf topos and then
restricted to Zariski or étale crystalline objects. Changing topology is part of that
restriction; no equivalence of all sheaves or all Ext functors is asserted.

For Dieudonné crystals on a general p-nilpotent X, also define the base-compatible variant
`Crystalline.CrisCompatibleFppfSite`. Here X is an S-scheme to which γ extends, rather than
necessarily an S₀-scheme. An object has U→X, a p-nilpotent ambient S-scheme T and a closed immersion
U→T with PD ideal (J,δ), where δ and γ extend to a common divided-power structure on J+IO_T
(*Compatibility of divided powers with a base*, DerivedDeRhamCohomology §PD.5). Morphisms preserve δ
and the structural maps. Use the Zariski, étale or fppf topology with cartesian closed fibres and
the corresponding covering families on T; write `CrisCompatibleSite` for the small Zariski version
(U open in X) and `CrisCompatibleEtaleSite` for its étale analogue. The big fppf version is
`CrisCompatibleFppfSite`. Flat extension and gluing on the sum of ideals make these covers stable
under pullback and composition. When X→S₀, IO_T⊂J, so compatibility says exactly that T→S is a PD
morphism; this variant then agrees with CRIS_fppf(X/S). Over (ℤ_p,(p),γ) every p-nilpotent scheme
has the canonical divided powers on pO_X from DerivedDeRhamCohomology §PD.5. The base-compatible
site therefore supplies the general-base D(G) of Layer CR.7. This ordinary variant uses Beilinson's
compatible PD-base convention with trivial log structures (§1.2, pp.3–4; §1.5, pp.6–7; the p-adic
base is the union of finite levels as in §1.12, pp.16–17).

*Hypotheses.* p is a prime number; (S,I,γ) is a PD scheme over ℤ_(p) and S₀=V(I). X→S₀ is a morphism
of schemes and p is locally nilpotent on X; no nilpotence of p on S is assumed. For the
base-compatible variants replace X→S₀ by X→S with γ extending to IO_X. The abelian
group-sheaf construction assumes G commutative.

The API:

- `Crystalline.CrisCompatibleFppfSite.object`: A thickening with a common
  extension on J+IO_T is an object, without requiring IO_X=0.
- `Crystalline.CrisCompatibleFppfSite.special_fibre`: If IO_X=0,
  this category and its topology agree with CRIS_fppf(X/S).
- `Crystalline.CrisCompatibleFppfSite.flat_cover`: Compatible flat extensions
  give the stated fppf covers and their pullbacks.
- `Crystalline.CrisFppfSite.flat_cover`: Cartesian closed fibres and a jointly
  surjective fppf family of ambient schemes give a cover; flat extension
  supplies the PD structures and is compatible with composition and pullback.
- `Crystalline.CrisFppfSite.group_sections`: For commutative G/X, the abelian group sheaf
  on (U,T) is G(U), with its usual fppf descent, whereas the structure sheaf evaluates on T.
- `Crystalline.CrisFppfSite.restrict`: The topology-change restriction sends
  the structure sheaf to the Zariski crystalline structure sheaf.
- `Crystalline.CrisSite.object`: A compatible p-nilpotent PD thickening with U→X gives a big object;
  U open gives a small object.
- `Crystalline.CrisSite.cover_pullback`: The pullback of a jointly surjective family of opens of T
  is a cover.
- `Crystalline.CrisSite.small_inclusion`: The small-object inclusion preserves the displayed covers
  and composition of morphisms.
- `Crystalline.CrisSite.finiteLimits`: CRIS(X/S) and Cris(X/S) have all finite nonempty limits, in
  particular products of pairs and fibre products; the functor (U,T,δ)↦U to schemes over X and the
  inclusion Cris(X/S)→CRIS(X/S) commute with them (Stacks Lemmas 60.8.2 and 60.9.2).
- `Crystalline.CrisSite.flat_baseChange`: In a fibre square of CRIS(X/S) with corners (U₃,T₃,δ₃),
  (U₂,T₂,δ₂), (U₁,T₁,δ₁) over (U,T,δ): if T₂→T is flat and U₂=T₂×_TU, then T₃=T₁×_TT₂ as schemes
  (Stacks Lemma 60.8.3).
- `Crystalline.CrisSite.trivialThickening`: U↦(U,U,∅) is a functor from schemes over X to CRIS(X/S),
  and from X_Zar to Cris(X/S), left adjoint to (U,T,δ)↦U (Stacks, after Definitions 60.8.1 and
  60.9.1).

*Proof sketch.* CRIS(X/S) has all finite nonempty limits and (U,T,δ)↦U commutes with them (Stacks
Lemma 60.8.2). In the affine case the product of two thickenings is obtained from the pushout
(B″,J″,δ″) of PD rings (*Pushouts of divided power rings* (DerivedDeRhamCohomology §PD.6)) by taking
the PD envelope of the kernel of B″→B/J⊗_CB′/J′ (Stacks Lemma 60.5.3); the general case glues these
(*Schemes with a quasi-coherent PD ideal*, fibre products). For a fibre square of thickenings in
which T₂→T is flat and U₂=T₂×_TU, T₃=T₁×_TT₂ as schemes, because divided powers extend uniquely
along flat maps (Stacks Lemma 60.8.3, *Flat extension of divided powers* (DerivedDeRhamCohomology
§PD.2)). Hence the base change of a Zariski covering is the restriction to open subschemes, and
Zariski coverings define a topology. The objects with U→X an open immersion are stable under finite
nonempty limits, so the same coverings define the topology of Cris(X/S) (Stacks, before Definition
60.9.1). The Stacks Project omits the proof that the big crystalline site has finite nonempty limits
computed in the underlying category (Stacks Lemma 60.8.2, with the affine calculation of Lemma
60.5.3 and the fibre products of PD schemes of Lemma 60.7.4); gluing the affine construction is part
of this target. ([Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology,
Situation 60.7.5; §60.8, Definitions 60.8.1 and 60.8.4, Lemmas 60.8.2–60.8.3; §60.9, Definition
60.9.1.) *Needs:* *Schemes with a quasi-coherent PD ideal*; *Universal base-compatible divided power
envelope* (DerivedDeRhamCohomology §PD.6); *Pushouts of divided power rings*
(DerivedDeRhamCohomology §PD.6); *Flat extension of divided powers* (DerivedDeRhamCohomology §PD.2);
Mathlib `CategoryTheory.ObjectProperty.FullSubcategory`; Mathlib `CategoryTheory.ObjectProperty.ι`.
For the fppf variant, use the same flat fibre-square calculation and the base-change/composition
axioms for fppf covers (SchemeAndStackFoundations Layer 2). The topology for the Dieudonné Ext is
specified explicitly in [Madapusi–Mondal, *Perfect F-gauges and finite flat group
schemes*](https://www.keerthimadapusi.com/assets/preprints/fflat.pdf), Remark 4.3.3, printed
pp.13–14, immediately before Proposition 4.3.4.

**Checks.**

- `test_compatible_mixed_identity`: X=Spec ℤ/p² over (ℤ_p,(p),γ)
  has the identity object J=0 in the compatible site: the common extension
  is the canonical structure on (p). It is not an object of the
  S₀-scheme version, since pO_X≠0.
- `test_compatible_special_fibre`: On X=Spec F_p, compatibility on
  J+pO_T is exactly δ|_(p)=γ, since pO_T⊂J. The W_n(k) object
  is therefore the same in both versions.
- `test_compatible_conflict`: For p=2, U=Spec F₂⊂T=Spec ℤ/4,
  δ₂(2)=0 is incompatible with the canonical base structure γ₂(2)=2.
  The compatible site rejects it even though its ideal has square zero.
- `test_fppf_cover`: Over F_p with trivial PD ideals,
  Spec F_p[s]→Spec F_p[t], t↦s^p, is an fppf cover, finite free of rank p;
  it is not an étale cover. Taking the closed fibres equal to the ambient
  schemes gives a cover of the big fppf crystalline site.
- `test_fppf_group`: On the trivial object Spec F_p[t], the constant
  group Q_p/Z_p has its usual constant sections, while μ_p has only the
  identity section. On Spec F_p[ε]/(ε²), μ_p has the nonidentity
  section 1+ε, whose p-th power is 1.
- `test_fppf_noncommutative`: Over `X = S = Spec F₂` with zero PD ideal, the constant
  finite étale group scheme S₃ has sections S₃ on `(X,X)`. The transpositions `(12)` and
  `(23)` do not commute. The group functor on X-schemes already satisfies fppf descent,
  so sheafification leaves these noncommuting sections intact. The abelian specialization
  excludes this G.
- `test_fppf_structure`: On (Spec F_p,Spec F_p[ε]/(ε²)) the structure
  sheaf is F_p[ε]/(ε²) but G_crys sees the closed fibre, so
  μ_p,crys has only the identity section. Replacing G(U) by G(T)
  changes the Ext input and fails this test.
- `test_crisSite_identity`: If I=0, X=S₀=S and p is locally nilpotent on S, then (S,S,∅) is an
  object of Cris(X/S) whose map to X is an isomorphism.
- `test_crisSite_Wn`: For k a perfect field of characteristic p, n≥1 and S=Spec W_n(k) with the
  canonical PD structure γ_m(pa)=(pᵐ/m!)aᵐ on (p): (Spec k,Spec W_n(k),γ) is an object of Cris(Spec
  k/S), and it is a final object.
- `test_crisSite_non_nilp`: No PD scheme with underlying scheme Spec ℤ_p is the thickening of an
  object of a crystalline site, because p is not nilpotent in ℤ_p. In particular (Spec F_p,Spec
  ℤ_p,γ) is not an object of Cris(Spec F_p/Spec ℤ_p).
- `test_crisSite_product_Z4`: In Cris(Spec F₂/Spec ℤ_(2)) with the zero PD ideal on the base, the
  product of (Spec F₂⊂Spec ℤ/4,δ) and (Spec F₂⊂Spec ℤ/4,δ′), where δ₂(2)=2 and δ′₂(2)=0, is (Spec
  F₂,Spec F₂,∅).

**Morphisms and comparisons of crystalline sites.** (Big sites.) Let (S,I,γ)→(S′,I′,γ′) be a
morphism of PD schemes over ℤ_(p) and X→Y a morphism of schemes lying over S₀→S′₀, with p locally
nilpotent on X and Y. The functor CRIS(X/S)→CRIS(Y/S′) sending (U,T,δ) to (U,T,δ) with U→X→Y is
continuous and cocontinuous and defines a morphism of topoi f_CRIS:(X/S)_CRIS→(Y/S′)_CRIS (Stacks
Remark 60.8.5). (Big and small.) The inclusion Cris(X/S)→CRIS(X/S) is fully faithful, continuous and
cocontinuous and commutes with finite nonempty limits; it gives morphisms of topoi
i:(X/S)_cris→(X/S)_CRIS and π:(X/S)_CRIS→(X/S)_cris with π⁻¹=i_!, π_*=i⁻¹ and π∘i=id (Stacks Lemma
60.9.2). (Small sites.) f_cris:=π_Y∘f_CRIS∘i_X:(X/S)_cris→(Y/S′)_cris (Stacks Remark 60.9.3); there
is no functor of small sites underlying it. (Zariski projection.) The functor Cris(X/S)→X_Zar,
(U,T,δ)↦U, is continuous and cocontinuous and commutes with products and fibre products; it defines
a morphism of topoi `u_{X/S}:(X/S)_cris→Sh(X_Zar)` (Stacks Remark 60.9.4). (Localisation.) For open
subschemes X′⊂X and S_open⊂S with X′ mapping into S_open, Cris(X′/S_open)→Cris(X/S) is fully
faithful and identifies Cris(X′/S_open) with the localisation of Cris(X/S) at `u⁻¹h_{X′}`, compatibly
with `u_{X′/S_open}` and `u_{X/S}` (Stacks Lemma 60.9.5).

*Hypotheses.* p is a prime number; (S,I,γ)→(S′,I′,γ′) is a morphism of PD schemes over ℤ_(p). X→S₀
and Y→S′₀ are morphisms of schemes with p locally nilpotent on X and Y, and X→Y lies over S₀→S′₀.
For localisation: X′⊂X and S_open⊂S are open subschemes with X′ mapping into S_open. S_open is
independent of the target PD scheme S′ in the first paragraph.

The API:

- `Crystalline.crisSiteMap_comp`: For composable squares X→Y→Z over (S,I,γ)→(S′,I′,γ′)→(S″,I″,γ″):
  (g∘f)_CRIS=g_CRIS∘f_CRIS, and id_CRIS=id.
- `Crystalline.cris_u_sections`: For a sheaf F on Cris(X/S) and V⊂X open,
  `Γ(V,u_{X/S,*}F)=Γ((V/S)_cris,F|_{Cris(V/S)})`, where Cris(V/S)⊂Cris(X/S) is the full subcategory of
  objects (U,T,δ) with U⊂V (Stacks Lemma 60.9.5).
- `Crystalline.cris_small_big`: π∘i=id as morphisms of topoi, π_*=i⁻¹ and π⁻¹=i_!; consequently
  Hⁿ((X/S)_CRIS,G)=Hⁿ((X/S)_cris,i⁻¹G) for every abelian sheaf G on CRIS(X/S) and every n.
- `Crystalline.cris_u_inverse_eval`: For a Zariski sheaf G on X, u⁻¹G evaluated on (U,T,δ) is G(U),
  with sheafification understood. In particular (u⁻¹O_X^×)(U,T,δ)=Γ(U,O_U)^×; the homomorphism
  O_crys^×→u⁻¹O_X^× is restriction along U→T. This is the evaluation used in first-chern-class.

*Proof sketch.* A cocontinuous functor of sites defines a morphism of topoi. The functor of Remark
60.8.5 is continuous and cocontinuous because coverings of (U,T,δ) are defined by Zariski coverings
of T alone. The inclusion gives i together with a left adjoint i_! of i⁻¹ satisfying
i⁻¹i_!=i⁻¹i_*=id; i_! is right exact and commutes with fibre products, so it is exact once i_!(∗)=∗.
By the proof of Lemma 60.9.2 this holds when a set of objects of Cris(X/S) covers the final object
of (X/S)_CRIS; for X and S affine every object of CRIS(X/S) with T affine maps to an object (X,Spec
D_e,γ̄) of Cris(X/S) (Stacks Lemma 60.5.6). Then π⁻¹:=i_! and π_*:=i⁻¹. u and the localisation
square are Stacks Remark 60.9.4 and Lemma 60.9.5; the latter gives Γ(V,u_*F)=Γ((V/S)_cris,F) for V⊂X
open. The inverse-image evaluation is the functor (U,T,δ)↦U defining u; covers of T induce covers of
U. Apply this to units to obtain the reduction map used by first-chern-class (Bhatt–de Jong §3.1,
p.7). The Stacks Project proves exactness of i_! (and so the existence of π) only for affine X and
S; the general case needs a set of objects of Cris(X/S) covering the final object of the big topos,
and the composition (g∘f)_cris ≅ g_cris∘f_cris for small topoi needs the local factorisation of
morphisms through Cris(Y/S′). Both are part of this target. ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.8, Remark 60.8.5; §60.9,
Lemma 60.9.2, Remarks 60.9.3–60.9.4, Lemma 60.9.5; [Bhatt–de Jong, *Crystalline cohomology and de
Rham cohomology*](https://arxiv.org/abs/1110.5001v1), §3.1, p.7, displayed characterization of u⁻¹.)
*Needs:* *Small and big crystalline sites*; *Universal base-compatible divided power envelope*
(DerivedDeRhamCohomology §PD.6); Mathlib `CategoryTheory.Functor.sheafAdjunctionContinuous`; Mathlib
`CategoryTheory.Functor.sheafAdjunctionCocontinuous`; Mathlib
`SheafOfModules.pullbackPushforwardAdjunction`.

**Checks.**

- `test_crisMap_identity`: For f=id_X over id_S: f_CRIS is the identity of (X/S)_CRIS and f_cris=π∘i
  is the identity of (X/S)_cris.
- `test_crisMap_open`: For X′⊂X open and S′=S, the morphism (X′/S)_cris→(X/S)_cris is the
  localisation of (X/S)_cris at `u⁻¹h_{X′}`, and `u_{X/S}` restricts to `u_{X′/S}` (Stacks Lemma 60.9.5).
- `test_crisMap_variants`: For X=S=Spec F_p with the zero PD ideal, the sheaf `G:(U,T,δ)↦Γ(U,Ω_{U/X})`
  on CRIS(X/S) has i⁻¹G=0 but G(𝔸¹_X,𝔸¹_X,∅)=F_p[t]dt≠0; hence π⁻¹i⁻¹G≠G and i∘π is not isomorphic
  to the identity.
- For f the identity of X over the identity of S, f_CRIS=id and f_cris=π∘i=id (Stacks Lemma 60.9.2).

**The étale crystalline sites.** For a crystalline situation (p,S,X), the big étale crystalline site
has the objects and morphisms of CRIS(X/S). A covering family (U_i,T_i,δ_i)→(U,T,δ) is given by
jointly surjective étale maps T_i→T, the Cartesian squares U_i=U×_T T_i, and the unique extended
divided powers. The small étale crystalline site is its full subcategory where U→X is étale. Its
structure and PD ideal sheaves evaluate to O_T and ker(O_T→O_U). Its projection to X_ét sends
(U,T,δ) to U. The Zariski crystalline site uses open immersions U→X and Zariski covers of T.
Changing the topology of the big site gives ε:CRIS_ét(X/S)→CRIS_Zar(X/S). No equivalence of
arbitrary sheaves under this change is asserted.

*Hypotheses.* p is prime, S a PD scheme over ℤ_(p), X→S₀ with p locally nilpotent on X. The PD ideal
of an object is locally nilpotent, as in the existing crystalline site; étale pullback is flat.

The API:

- `Crystalline.etale_crystalline_site_toX`: The projection (U,T,δ)↦U takes values in X_ét on the
  small site and pulls an étale cover of T back to a cover of U.
- `Crystalline.etale_crystalline_site_structure`: O_crys,ét(U,T)=Γ(T,O_T) and
  J_crys,ét(U,T)=ker(Γ(T,O_T)→Γ(U,O_U)); these are étale sheaves.
- `Crystalline.etale_crystalline_site_change`: The identity on big-site objects from the finer étale
  topology gives ε to the big Zariski crystalline topos; ε⁻¹ is étale sheafification of the Zariski
  sheaf.

*Proof sketch.* Extend divided powers uniquely under the flat maps T_i→T using flat-extension; the
Cartesian U_i identify their kernels. Étale maps and joint surjectivity are stable under composition
and base change, giving a pretopology and its generated Grothendieck topology. Étale-local lifting
across a nil thickening identifies étale maps to U with their lifts to T; this supplies the small
site and the continuity of its projection. Descent for O_T and its ideal gives the ringed structure.
The nil-thickening étale-lifting input comes from SchemeAndStackFoundations Layer 2. Unique lifting
of étale morphisms across locally nilpotent thickenings comes from SchemeAndStackFoundations Layer
SchemeAndStackFoundations Layer 2. ([Stacks Project](https://stacks.math.columbia.edu), Crystalline
Cohomology, §60.8, [Definition 60.8.4 (07IB)](https://stacks.math.columbia.edu/tag/07IB), variant
with étale coverings; [Stacks Project](https://stacks.math.columbia.edu), Descent, §35.9,
Proposition 35.9.3 (03DW).) *Needs:* *Small and big crystalline sites*; *Schemes with a
quasi-coherent PD ideal*; *Flat extension of divided powers* (DerivedDeRhamCohomology §PD.2); *Étale
extension of PD envelopes* (DerivedDeRhamCohomology §PD.6); SchemeAndStackFoundations Layer 2.

**Checks.**

- `test_etale_crystalline_identity`: An identity of a thickening is an étale covering singleton.
- `test_etale_crystalline_field_cover`: For X=Spec F_p, the object (Spec F_(p²),Spec F_(p²),0) is
  small étale over X but not small Zariski over X; the map to (X,X,0) is a covering.
- `test_etale_crystalline_affine_descent`: For an affine thickening Spec B and a finite faithfully
  flat étale B-algebra B′, the equalizer B′⇉B′⊗_B B′ is B, and the equalizer of the pulled-back PD
  ideals is the original ideal.

**Structure, quotient and PD-ideal sheaves.** On either fixed crystalline site, define
O_crys(U,T)=Γ(T,O_T), O_X^cris(U,T)=Γ(U,O_U), and J_crys=ker(O_crys→O_X^cris) as sheaves, with
pointwise PD operations. The sequence 0→J_crys→O_crys→O_X^cris→0 is exact as sheaves; the map
O_crys(U,T,δ)→O_X^cris(U,T,δ) need not be surjective for every object (U,T,δ). These ring/ideal
sheaves provide the ringed crystalline topos.

*Hypotheses.* p is a prime number; (S,I,γ) is a PD scheme over ℤ_(p) and S₀=V(I)⊂S; X→S₀ is a
morphism of schemes with p locally nilpotent on X (Stacks Situation 60.7.5). The site is CRIS(X/S)
or Cris(X/S) with the Zariski topology.

The API:

- `Crystalline.crisStructure_eval`: Evaluation gives O_T on the Zariski slice of a thickening.
- `Crystalline.crisPDideal_kernel`: J_crys is the kernel sheaf of the displayed quotient map.
- `Crystalline.crisPDideal_restrict`: Restriction maps preserve every divided power.
- `Crystalline.crisRestrict`: For a sheaf F on the site and an object (U,T,δ), the restriction F_T
  is the Zariski sheaf on T with F_T(W)=F(U∩W,W,δ|_W) for W⊂T open; F↦F_T is exact, and
  (O_crys)_T=O_T.
- `Crystalline.crisComparison`: For a morphism f:(U,T,δ)→(U′,T′,δ′) the restriction maps of F define
  c_f:f⁻¹F_T′→F_T and, for an O_crys-module F, an O_T-linear map c_f:f^*F_T′→F_T; c_f is an
  isomorphism when f:T→T′ is an open immersion with U=U′×_T′T (automatic on Cris(X/S), not on
  CRIS(X/S)), and `c_{g∘f}=c_f∘f^*(c_g)`.
- `Crystalline.crisSheaf_ofRestrictions`: Zariski sheaves F_T for all objects (U,T,δ), with maps
  c_f:f⁻¹F_T′→F_T for all morphisms f that are isomorphisms for open immersions f:T→T′ with
  U=U′×_T′T and satisfy `c_{g∘f}=c_f∘f⁻¹(c_g)`, define a sheaf on the site with these restrictions and
  comparison maps (Stacks §60.10).
- `Crystalline.crisPDideal_pdPower`: For r≥0 the PD power `J_crys^{[r]}⊂O_crys` is the sheaf of ideals
  whose restriction to T is the quasi-coherent ideal `J_T^{[r]}` generated on affine opens by the
  products `γ_{e₁}(x₁)⋯γ_{e_t}(x_t)` with x_j in the ideal of U and Σe_j≥r (*Divided power filtration*
  (DerivedDeRhamCohomology §PD.4)); `J_crys^{[0]}=O_crys` and `J_crys^{[1]}=J_crys`.

*Proof sketch.* Open descent proves the two presheaves are sheaves. Affine-local surjectivity proves
sheaf epimorphism. The kernel restrictions preserve all PD operations, yielding the sheaf PD ideal.
([Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.10 (Sheaves on the
crystalline site): the restriction F_T, the comparison maps c_f, the structure sheaf `O_{X/S}`, and
the sequence `0→J_{X/S}→O_{X/S}→underline(G_a)→0`.) *Needs:* *Small and big crystalline sites*;
*Schemes with a quasi-coherent PD ideal*; *Divided power filtration* (DerivedDeRhamCohomology §PD.4).

**Checks.**

- `test_crisStructure_affine`: For T=Spec B,U=Spec(B/J), the sequence evaluates to0→J→B→B/J→0.
- `test_crisStructure_zero`: For an identity thickening the evaluated ideal is0.
- `test_crisStructure_sheaf_epi`: For k a field of characteristic p, U=𝔸²_k∖{0} over S=Spec k with
  the zero PD ideal, and T the first-order deformation of U over k[ε] glued from D(x)[ε] and D(y)[ε]
  by 1+ε·x⁻¹y⁻¹∂_x on D(xy)[ε], with γ_n=0 on εO_T for n≥2: (U,T,γ) is an object of Cris(U/S), and
  x∈Γ(U,O_U) has no lift to Γ(T,O_T). So O_crys(U,T,γ)→O_X^cris(U,T,γ) is not surjective although
  the map of sheaves is.
- On an affine object (Spec B/J,Spec B,δ) the sequence evaluates to 0→J→B→B/J→0, and the PD
  structure of J_crys there is δ.

### CR.1.2 Crystals, isocrystals and F-crystals

**Quasi-coherent and finite locally free crystals.** Let the site be CRIS(X/S) or Cris(X/S), ringed
by O_crys. An O_crys-module E is a crystal in O_crys-modules if for every morphism
f:(U,T,δ)→(U′,T′,δ′) the comparison map `c_f:f^*E_T′=O_T⊗_{f⁻¹O_T′}f⁻¹E_T′→E_T` is an isomorphism. It
is a crystal in quasi-coherent modules, respectively of finite type, respectively in finite locally
free modules, if moreover every restriction E_T is a quasi-coherent O_T-module, respectively
quasi-coherent of finite type, respectively finite locally free. An O_crys-module is quasi-coherent
as a module on the ringed site if and only if it is a crystal in quasi-coherent modules (Stacks
Lemma 60.11.2). For O_crys-modules E, F one has `(E⊗F)_T=E_T⊗_{O_T}F_T`, and the tensor product of two
crystals is a crystal; for a crystal E in finite locally free modules the dual E^∨=Hom(E,O_crys) is
a crystal with `(E^∨)_T=Hom_{O_T}(E_T,O_T)`. Crystals in finite locally free modules, with the
sequences that are exact on every thickening, form a rigid tensor exact category; they are not
closed under cokernels.

*Hypotheses.* p is a prime number; (S,I,γ) is a PD scheme over ℤ_(p) and S₀=V(I)⊂S; X→S₀ is a
morphism of schemes with p locally nilpotent on X (Stacks Situation 60.7.5). The site is CRIS(X/S)
or Cris(X/S), ringed by O_crys; E_T and c_f are the restrictions and comparison maps of *Structure,
quotient and PD-ideal sheaves*. A sequence of O_crys-modules is exact if and only if its restriction
to T is exact for every object (U,T,δ).

The API:

- `Crystalline.Crystal.pullback_iso`: The canonical f^*E_T′→E_T is O_T-linear and invertible.
- `Crystalline.Crystal.tensor_eval`: Evaluation of E⊗F is E_T⊗_(O_T)F_T.
- `Crystalline.Crystal.dual_eval`: For finite locally free E, evaluation of E∨ is
  Hom_(O_T)(E_T,O_T), with evaluation/coevaluation.
- `Crystalline.Crystal.quasiCoherent_iff`: An O_crys-module is quasi-coherent on the ringed site if
  and only if every restriction E_T is a quasi-coherent O_T-module and E is a crystal (Stacks Lemma
  60.11.2).
- `Crystalline.Crystal.pullback`: For f_cris:(X/S)_cris→(Y/S′)_cris (*Morphisms and comparisons of
  crystalline sites*) and a crystal E in quasi-coherent O_crys-modules on Cris(Y/S′), f_cris^*E is a
  crystal in quasi-coherent modules on Cris(X/S); for every object (U,T,δ) of Cris(X/S) and every
  morphism g of CRIS(Y/S′) from (U,T,δ) to an object (V,T′,δ′) of Cris(Y/S′), (f_cris^*E)_T≅g^*E_T′.
  Pullback preserves finite type, finite local freeness, tensor products and duals.

*Proof sketch.* Restriction E↦E_T is the pullback along the morphism of ringed topoi
(Sh(T_Zar),O_T)→(Sh(C),O_crys) defined by the continuous and cocontinuous functor W↦(U∩W,W,δ|_W)
(*Structure, quotient and PD-ideal sheaves*); it is exact and commutes with tensor products and with
Hom out of finite locally free modules. Lemma 60.11.2: a presentation of a quasi-coherent module
over the localised site C/(U,T,δ) restricts to a presentation of E_T and of E_T′ for every T′→T,
which gives quasi-coherence of E_T and the crystal property; conversely a presentation of E_T on an
affine T pulls back to every T′→T by the crystal property. Tensor products and duals of crystals:
apply f^* to the formulas of step 1. A short sequence of crystals in finite locally free modules
that is exact on every T is locally split on T, which gives the exact structure. ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.11, Definition 60.11.1,
Lemma 60.11.2 and Definition 60.11.3; [Esnault–Groechenig, *Rigid connections and
F-isocrystals*](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf), §2.6, p. 14
of the author-hosted manuscript (definition of Crys(Z/W_n)).) *Needs:* *Structure, quotient and
PD-ideal sheaves*; *Morphisms and comparisons of crystalline sites*; Mathlib `SheafOfModules`.

**Checks.**

- `test_crystal_structure`: O_crys with canonical comparisons is a rank-one crystal.
- `test_crystal_constant`: The crystal from a finite free base module evaluates as its tensor
  extension to O_T.
- `test_crystal_not_abelian`: For k a perfect field of characteristic p, X=Spec k and S=Spec W₂(k)
  with the canonical PD structure on (p): the cokernel of p:O_crys→O_crys is a crystal in
  quasi-coherent modules whose value on (Spec k,Spec W₂(k),γ) is k, which is not a free
  W₂(k)-module; so crystals in finite locally free modules are not closed under cokernels.
- `test_crystal_quotient_sheaf`: For `X=𝔸¹_{F_p}` over S=Spec F_p with the zero PD ideal,
  O_X^cris:(U,T,δ)↦Γ(U,O_U) is an O_crys-module with quasi-coherent restrictions and with c_f an
  isomorphism for every open immersion f:T→T′ with U=U′×_T′T, but it is not a crystal: for the
  first-order thickening p₀:T′→T=X with `O_T′=O_X⊕Ω_{X/F_p}`, the map `c_{p₀}:O_T′→O_X` is not
  injective.
- The structure crystal: O_crys is a crystal in finite locally free modules of rank one.
- A constant crystal: for S=Spec A and a finite free A-module M of rank one, M⊗_AO_crys has value
  M⊗_AΓ(T,O_T) on (U,T,δ), with the identity comparison maps.

**Rational crystals and nondegenerate F-crystals.** (Crystals and isocrystals over W.) Let k be a
perfect field of characteristic p, W=W(k) and W_n=W/pⁿ with the canonical PD structure on (p), and Z
a smooth k-scheme. Crys(Z/W_n) is the category of crystals of finite type on Cris(Z/Spec W_n), and
Crys(Z/W) the category of crystals of finite type on Cris(Z/Spec W); every object of Cris(Z/Spec W)
is Zariski locally an object of some Cris(Z/Spec W_n). The category of isocrystals is the
ℚ-linearization Isoc(Z/W)=Crys(Z/W)_ℚ: the same objects, with Hom_Isoc(E,F)=Hom_Crys(E,F)⊗_ℤℚ
(Esnault–Groechenig §2.6). Crystals in finite locally free modules form a full subcategory of
Crys(Z/W); Isoc(Z/W) is formed from all crystals of finite type, not only from these. (F-crystals.)
Let (A,I,γ) be a PD ring with A a ℤ_(p)-algebra and p∈I, S=Spec A, σ:A→A a PD homomorphism with
σ(x)≡xᵖ mod pA for all x∈A, and X→S₀=Spec A/I a morphism of schemes with p locally nilpotent on X
(Stacks Situation 60.26.1). The absolute Frobenius F_X lies over Spec σ and gives
(F_X)_cris:(X/S)_cris→(X/S)_cris. An F-crystal on X/S relative to σ is a pair (E,Φ) of a crystal E
in finite locally free O_crys-modules and a map Φ:(F_X)_cris^*E→E. It is nondegenerate if there
exist an integer i≥0 and a map V:E→(F_X)_cris^*E with V∘Φ=pⁱ·id (Stacks Definition 60.26.2). If the
rank of E is at most r, then `V′=p^{ri}V` satisfies `V′∘Φ=Φ∘V′=p^{ri+i}·id` (Stacks Remark 60.26.3). The
case A=W(k) or W_n(k), I=(p), σ the Frobenius of Witt vectors is the instance over a perfect field.
(F-isocrystals.) For Z smooth over perfect k, (F_Z)_cris^* induces an endofunctor F^* of Isoc(Z/W);
an F-isocrystal is an object E of Isoc(Z/W) with an isomorphism Φ:F^*E→E in Isoc(Z/W), and E has a
Frobenius structure in the sense of Esnault–Groechenig if (F^*)^fE≅E for some integer f≥1.

*Hypotheses.* p is a prime number. For Crys and Isoc: k is a perfect field of characteristic p,
W=W(k) carries the canonical PD structure γ_n(pa)=(pⁿ/n!)aⁿ on (p), and Z is a smooth k-scheme. For
F-crystals: (A,I,γ) is a PD ring with A a ℤ_(p)-algebra and p∈I, σ:A→A is a PD homomorphism with
σ(x)≡xᵖ mod pA, X→Spec A/I is a morphism of schemes with p locally nilpotent on X, and E is a
crystal in finite locally free O_crys-modules. Nondegeneracy is a condition on (E,Φ); it is not part
of the definition of an F-crystal.

The API:

- `Crystalline.Isocrystal.hom`: For E, F in Crys(Z/W):
  `Hom_{Isoc(Z/W)}(E,F)=Hom_{Crys(Z/W)}(E,F)⊗_ℤℚ`, with composition induced from Crys(Z/W).
- `Crystalline.FCrystal.linearize`: Evaluation of Φ is linear from the Frobenius-twisted module; its
  associated endomorphism is σ-semilinear.
- `Crystalline.FCrystal.dual`: For a finite locally free rational crystal E with an isomorphism
  Φ:F^*E≅E, define E^∨=Hom(E,O_crys)[1/p]. Its Frobenius is (Φ⁻¹)^∨:F^*(E^∨)≅E^∨ using
  F^*(E^∨)≅(F^*E)^∨. In a basis it is the inverse transpose of Φ, and evaluation E^∨⊗E→O_crys[1/p]
  commutes with Frobenius. This gives a dual in F-isocrystals, without asserting an integral
  F-crystal structure on E^∨.
- `Crystalline.Isocrystal.frobeniusPullback`: For Z smooth over a perfect field k, pullback by
  (F_Z)_cris preserves crystals of finite type and induces a ℚ-linear endofunctor F^* of Isoc(Z/W).
- `Crystalline.FCrystal.nondegenerate_twoSided`: If (E,Φ) is a nondegenerate F-crystal with
  V∘Φ=pⁱ·id and E has rank at most r, then for every N≥ri the map V′=pᴺV satisfies
  `V′∘Φ=Φ∘V′=p^{N+i}·id`; in particular Ker Φ and Coker Φ are killed by `p^{ri+i}` (Stacks Remark
  60.26.3).

*Proof sketch.* Crys and Isoc: apply *Quasi-coherent and finite locally free crystals* to
Cris(Z/Spec W_n) and Cris(Z/Spec W); the ℚ-linearization keeps the objects and tensors the Hom
groups with ℚ. (F_X)_cris is the morphism f_cris of *Morphisms and comparisons of crystalline sites*
for the square formed by F_X and Spec σ; the pullback of a crystal in finite locally free modules is
again one (*Quasi-coherent and finite locally free crystals*, pullback). Instance over a perfect
field: W(k) is Mathlib's ring of Witt vectors, W_n(k) its truncation (WittVector.truncate,
TruncatedWittVector) and σ is WittVector.frobenius, which satisfies σ(x)≡xᵖ mod p and preserves the
canonical powers γ_n(pa)=(pⁿ/n!)aⁿ; σ descends to W_n(k) because in characteristic p the m-th
coefficient of σ(x) is the p-th power of the m-th coefficient of x. Remark 60.26.3: for r×r matrices
K, L over a ring with KL=pⁱ one has `det(K)det(L)=p^{ri}`; with L′ the adjugate of L,
`L·(p^{ri}K)=det(K)·LKLL′=det(K)·pⁱ·det(L)=p^{ri+i}`. Apply this locally to V and Φ. Duality: finite
local freeness identifies the pullback of the dual with the dual of the pullback. Rational
invertibility of Φ then yields the stated inverse dual map, and evaluation compatibility follows by
applying Φ⁻¹ before a functional. No integral inverse is used. ([Esnault–Groechenig, *Rigid
connections and
F-isocrystals*](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf), §2.6, pp.
14–15 of the author-hosted manuscript (Crys(Z/W_n), Crys(Z/W), Isoc(Z/W)); Introduction, p. 3
(Frobenius structure) and Remark 1.7; [Stacks Project](https://stacks.math.columbia.edu),
Crystalline Cohomology, §60.26 (tag 07N0), Situation 60.26.1, Definition 60.26.2 and Remark
60.26.3.) *Needs:* SchemeAndStackFoundations §0.29 (`absoluteFrobenius`, `schemeFrobeniusTwist`,
`relativeFrobenius`); *Quasi-coherent and finite locally free crystals*; *Morphisms and comparisons
of crystalline sites*; *Canonical divided powers on the ideal generated by p*
(DerivedDeRhamCohomology §PD.5); Mathlib `WittVector.frobenius`; Mathlib `WittVector.truncate`;
Mathlib `TruncatedWittVector`; Mathlib `WittVector`.

**Checks.**

- `test_isocrystal_unit`: The unit W-crystal with Witt Frobenius gives the unit F-isocrystal.
- `test_isocrystal_p`: For E in Crys(Z/W), multiplication by p on E is an isomorphism in Isoc(Z/W),
  with inverse id_E⊗p⁻¹ in Hom(E,E)⊗_ℤℚ; for E=O_crys and Z nonempty it is not an isomorphism in
  Crys(Z/W).
- `test_isocrystal_zeroF`: For X=Spec k: over A=W(k) the pair (O_crys,Φ=0) is not a nondegenerate
  F-crystal; over A=W_e(k) it is nondegenerate in the sense of Stacks Definition 60.26.2, with V=0
  and i=e.
- `test_fcrystal_p`: For X=Spec k and A=W(k), (O_crys,Φ=p·can) is a nondegenerate F-crystal with
  V=can⁻¹ and i=1; Φ is not an isomorphism of crystals, and its image in Isoc(Spec k/W) is an
  isomorphism.

### CR.1.3 Differentials, connections and stratifications

**Universal PD differentials and the PD de Rham complex.** Let A be a ring, (B,J,δ) a PD ring and
A→B a ring map. A PD A-derivation into a B-module M is an A-derivation θ:B→M with
`θ(δ_n(x))=δ_{n−1}(x)θ(x)` for all x∈J and n≥1 (δ₀=1). Ω¹_PD(B/A) is the quotient of the Kähler module
`Ω_{B/A}` by the B-submodule generated by the elements `dδ_n(x)−δ_{n−1}(x)dx` for x∈J and n≥1, and
d:B→Ω¹_PD(B/A) is the universal PD A-derivation. Put Ω^q_PD(B/A)=∧^q_BΩ¹_PD(B/A). The exterior
derivative of `Ω^•_{B/A}` descends to Ω^•_PD(B/A), because for n≥2 the element
`d(dδ_n(x)−δ_{n−1}(x)dx)=−dδ_{n−1}(x)∧dx` maps to `−δ_{n−2}(x)dx∧dx=0` in Ω²_PD(B/A); the resulting
complex is the PD de Rham complex (Stacks Remark 60.6.7). It is initial among the strictly
graded-commutative differential graded A-algebras P (`ωη=(−1)^{ij}ηω` for ω∈Pⁱ, η∈Pʲ, and ω²=0 for ω
of odd degree) with an A-algebra map B→P⁰ such that B→P⁰→P¹ is a PD derivation.

*Hypotheses.* A is a commutative ring, (B,J,δ) a PD ring and A→B a ring map; no PD structure on A is
used. Exterior powers are alternating (ω∧ω=0 for ω of degree one), also when 2 is not invertible;
δ₀(x)=1.

The API:

- `Crystalline.pdDifferentials_lift`: B-linear maps Ω¹_PD→M correspond bijectively to PD
  A-derivations B→M.
- `Crystalline.pdDifferentials_dpow`: dδ_n(x)=δ_(n−1)(x)dx for x∈J,n>0.
- `Crystalline.pdDifferentials_map`: A compatible PD A-map gives its base-changed differential map,
  preserving wedges and d.
- `Crystalline.pdDifferentials_adjoin`: (1) For the polynomial algebra B[x] with PD ideal JB[x] and
  the extended divided powers, Ω¹_PD(B[x]/A)=Ω¹_PD(B/A)⊗_BB[x]⊕B[x]·dx. (2) For the PD polynomial
  algebra B⟨x⟩ with PD ideal JB⟨x⟩+B⟨x⟩₊, Ω¹_PD(B⟨x⟩/A)=Ω¹_PD(B/A)⊗_BB⟨x⟩⊕B⟨x⟩·dx, with
  `d(x^{[n]})=x^{[n−1]}dx` (Stacks Lemma 60.6.2(1)–(2)).
- `Crystalline.pdDifferentials_quotient`: For an ideal K⊂J with δ_n(K)⊂K for all n≥1, B′=B/K and the
  induced divided powers on J/K: Ω¹_PD(B′/A) is the quotient of Ω¹_PD(B/A)⊗_BB′ by the B′-submodule
  generated by the dk, k∈K (Stacks Lemma 60.6.2(3)).
- `Crystalline.pdDifferentials_diagonal`: For a PD homomorphism (A,I,γ)→(B,J,δ), let
  (B(1),J(1),δ(1)) be the coproduct of (B,J,δ) with itself over (A,I,γ) (*Pushouts of divided power
  rings* (DerivedDeRhamCohomology §PD.6)), s₀,s₁:B→B(1) the coprojections and K the kernel of
  B(1)→B. Then K∩J(1) is stable under the divided powers and `Ω¹_PD(B/A)=K/(K²+(K∩J(1))^{[2]})`, with
  d(b) the class of s₁(b)−s₀(b) (Stacks Lemma 60.6.3).
- `Crystalline.pdDifferentials_completion`: Let p be a prime, A a ℤ_(p)-algebra and p nilpotent in
  B/J. Then δ extends to B_e=B/pᵉB for e≫0 and to the p-adic completion B^∧, and
  lim_eΩ¹_PD(B_e/A)=lim_eΩ¹_PD(B/A)/pᵉ=lim_eΩ¹_PD(B^∧/A)/pᵉ (Stacks Lemma 60.6.10).

*Proof sketch.* `Ω_{B/A}` is the Kähler module (Mathlib KaehlerDifferential); the complex
`Ω^•_{B/A}=∧^•_BΩ_{B/A}` with its exterior derivative is taken from DerivedDeRhamCohomology Layer 2
(§2.12 *The ordinary algebraic de Rham complex*). Let N be the kernel of `Ω_{B/A}→Ω¹_PD(B/A)`. It is
generated by the `ω=dδ_n(x)−δ_{n−1}(x)dx`, and `dω=−dδ_{n−1}(x)∧dx` lies in `N∧Ω_{B/A}` because
`dδ_{n−1}(x)≡δ_{n−2}(x)dx` modulo N. By the graded Leibniz rule d preserves the ideal of `∧^•Ω_{B/A}`
generated by N, so it descends to ∧^•Ω¹_PD(B/A) with d²=0. Degree one: B-linear maps Ω¹_PD(B/A)→M
correspond to PD A-derivations B→M (Stacks Definition 60.6.1). All degrees: for P as in the
statement the PD derivation B→P¹ factors through a B-linear map Ω¹_PD(B/A)→P¹, which extends
uniquely to a map of graded algebras ∧^•Ω¹_PD(B/A)→P because squares of elements of P¹ vanish; it
commutes with d since both differentials are derivations that agree on b and db. ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.6, Definition 60.6.1, Lemma
60.6.2 and Remark 60.6.7 (Lemmas 60.6.3 and 60.6.10 for the API); [Langer–Zink, *De Rham–Witt
cohomology for a proper and smooth morphism*](https://www.math.uni-bielefeld.de/~zink/dRW.pdf),
§1.1, Definition 1.1 (p. 11) and the paragraph after Lemma 1.2 (p. 13).) *Needs:* *Relative divided
power polynomial algebras* (DerivedDeRhamCohomology §PD.5); *Pushouts of divided power rings*
(DerivedDeRhamCohomology §PD.6); DerivedDeRhamCohomology Layer 2 (§2.12 *The ordinary algebraic de
Rham complex*); DerivedDeRhamCohomology Layer 2 (§2.21 *The universal differential graded algebra*);
Mathlib `KaehlerDifferential`; Mathlib `DividedPowers`; Mathlib
`KaehlerDifferential.linearMapEquivDerivation`.

**Checks.**

- `test_pdDifferentials_base`: If J=0 then `Ω¹_PD(B/A)=Ω_{B/A}`, the ordinary Kähler module; and
  Ω¹_PD(A/A)=0 for every PD structure on an ideal of A.
- `test_pdDifferentials_polynomial`: For A⟨t⟩, d(t^[n])=t^[n−1]dt and Ω¹_PD is free on dt.
- `test_pdDifferentials_Fp`: Over F_p⟨t⟩ the relation d(t^[p])=t^[p−1]dt remains nonzero despite
  d(t^p)=0.
- Ω¹_PD(A⟨t⟩/A)=A⟨t⟩·dt with `d(t^{[n]})=t^{[n−1]}dt` (Stacks Lemma 60.6.2(2)); for A=F_p the ordinary
  Kähler module of F_p⟨t⟩≅F_p[y_0,y_1,…]/(y_iᵖ), `y_i=t^{[pⁱ]}`, is free on the infinitely many dy_i.
- If J=0 then `Ω^•_PD(B/A)=Ω^•_{B/A}`.
- For A=F₂, B=F₂[x] with J=0, the commutative graded algebra P=B[e] with e in degree one and
  d(feⁿ)=f′eⁿ⁺¹ is a differential graded A-algebra with `ωη=(−1)^{ij}ηω` and e²≠0; there is no map of
  differential graded algebras `Ω^•_{B/A}→P` extending the identity of B, which is why ω²=0 in odd
  degree is required.

**Differentials of a smooth envelope.** Let (A,I,γ) be a PD ring, A→P a ring map, J⊂P an ideal with
IP⊂J, and `(D,J̄,γ̄)=D_{P,γ}(J)` the PD envelope. The canonical map `Ω_{P/A}⊗_PD→Ω¹_PD(D/A)` is an
isomorphism (Stacks Lemma 60.6.6); no flatness of D over P is needed. Hence
`Ω^q_PD(D/A)=Ω^q_{P/A}⊗_PD` for every q≥0. If P is smooth over A these D-modules are finite locally
free. If p is a prime, A is a ℤ_(p)-algebra and p is nilpotent in P/J, then with D_e=D/pᵉD the
p-adic completion of Ω¹_PD(D/A) is lim_eΩ¹_PD(D_e/A) (Stacks Lemma 60.6.10); for P=A[x_i] it
consists of the sums Σf_idx_i with f_i in the p-adic completion D^∧ of D and, for every e, f_i∈pᵉD^∧
for all but finitely many i.

*Hypotheses.* (A,I,γ) is a PD ring, P an A-algebra and J⊂P an ideal containing IP. Smoothness of P
over A is used only for finite local freeness. For the completed statement: p is a prime, A is a
ℤ_(p)-algebra and p is nilpotent in P/J.

*Proof sketch.* For a D-module M, the square-zero extension D⊕M carries the PD structure
`δ_n(x+m)=γ̄_n(x)+γ̄_{n−1}(x)m` on J̄⊕M (*Divided powers on a second-order thickening*
(DerivedDeRhamCohomology §PD.5)). An A-derivation ϑ:P→M gives the A-algebra map P→D⊕M, b↦(b,ϑ(b)),
which sends J into J̄⊕M; by the universal property of the envelope it extends uniquely to a PD
homomorphism D→D⊕M, whose second component is a PD A-derivation D→M restricting to ϑ. So
A-derivations P→M correspond to PD A-derivations D→M, and the Yoneda lemma gives the isomorphism
(first proof of Stacks Lemma 60.6.6). Exterior powers commute with base change. Completion: the
kernel of Ω¹_PD(D/A)→Ω¹_PD(D_e/A) is pᵉΩ¹_PD(D/A) by the quotient formula of *Universal PD
differentials and the PD de Rham complex* and d(pᵉ)=0 (proof of Stacks Lemma 60.6.10). ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.6, Lemma 60.6.6 (tag 07HW),
first proof, and Lemma 60.6.10; §60.3, Lemma 60.3.1.) *Needs:* *Universal PD differentials and the
PD de Rham complex*; *Universal base-compatible divided power envelope* (DerivedDeRhamCohomology
§PD.6); *Divided powers on a square-zero extension* (DerivedDeRhamCohomology §PD.5); *Divided powers
on a second-order thickening* (DerivedDeRhamCohomology §PD.5); Mathlib `AdicCompletion`.

**Checks.**

- For P=A[x] and J=IP+(x): D=A⟨x⟩ and Ω¹_PD(D/A)=D·dx with `d(x^{[n]})=x^{[n−1]}dx`.
- No flatness: for A=ℤ_p, P=ℤ_p[x,y] and J=(x²,xy,y²,p) (Stacks Example 60.22.1), Ω¹_PD(D/A) is free
  on dx and dy although D is not flat over P: τ=γ̄_p(x²)γ̄_p(y²)−γ̄_p(xy)² is a nonzero element of D
  with pτ=0.

**Modules with integrable connection and their de Rham complexes.** (Rings.) Let A→B be a ring map
and `π:Ω_{B/A}→Ω` a surjection of B-modules such that the exterior derivative of `Ω^•_{B/A}` descends to
Ω^•:=∧^•_BΩ; this holds if Ker π is generated as a B-module by elements ω whose differential dω maps
to zero in Ω², as for `Ω=Ω_{B/A}` and for Ω=Ω¹_PD(B/A) (*Universal PD differentials and the PD de Rham
complex*). Write d:B→Ω for the induced derivation. A connection on a B-module M is an additive map
∇:M→M⊗_BΩ with ∇(bm)=b∇(m)+m⊗db for b∈B and m∈M. It extends to additive maps `∇:M⊗_BΩⁱ→M⊗_BΩ^{i+1}`,
∇(m⊗ω)=∇(m)∧ω+m⊗dω. The connection is integrable if the composite M→M⊗_BΩ¹→M⊗_BΩ² is zero; then
(M⊗_BΩ^•,∇) is a cochain complex of A-modules, the de Rham complex of (M,∇) (Stacks Remark 60.6.8).
(Base change.) Given a commutative square of rings A→A′, B→B′ and a B-linear map φ:Ω→Ω′ compatible
with `Ω_{B/A}→Ω_{B′/A′}`, the base change of (M,∇) is M⊗_BB′ with ∇′(m⊗b′)=Σm_i⊗b′φ(db_i)+m⊗db′
whenever ∇(m)=Σm_i⊗db_i; it is integrable if ∇ is, and m⊗η↦m⊗φ(η) is a map of de Rham complexes
M⊗_BΩ^•→M⊗_B(Ω′)^• (Stacks Remark 60.6.9). (Crystalline site.) In the situation of *Small and big
crystalline sites*, `Ω_{X/S}` is the O_crys-module on Cris(X/S) with the universal PD S-derivation
`d_{X/S}:O_crys→Ω_{X/S}`; its restriction to T is the quasi-coherent O_T-module `Ω_{T/S,δ}`, whose
sections over an affine open W⊂T mapping into an affine open V⊂S are Ω¹_PD(Γ(W,O_W)/Γ(V,O_V))
(Stacks Lemmas 60.12.2–60.12.4). A connection on an O_crys-module F is a map of abelian sheaves
`∇:F→F⊗_{O_crys}Ω_{X/S}` with ∇(fs)=f∇(s)+s⊗df; it is integrable if ∇∘∇=0, and then `F⊗Ω^•_{X/S}` is its
de Rham complex on Cris(X/S) (Stacks §§60.14–60.15).

`Suggested.lean` declares `Crystalline.Connection` for the ordinary Kähler-differential case.
This is the shared algebraic carrier over arbitrary commutative base rings; no characteristic,
integrability or quasi-nilpotence restriction enters its definition. Additivity and the Leibniz
rule give `∇(am)=a∇(m)` for a∈A, since d kills base scalars. In characteristic zero this is the
base-field linearity of the sheafified carrier used by ComplexComparisonPartII C5.2 and
FormalConnectionsOpers F2. Tensor symmetry transports the extension, curvature, tensor and
Hom/dual operations to their `Ω¹⊗M` convention. Their scheme gluing and continuous/formal
extensions use these operations.

*Hypotheses.* A→B is a map of commutative rings, `π:Ω_{B/A}→Ω` a surjection of B-modules to which the
exterior derivative descends, and M a B-module. For the sheaf version: p is a prime, (S,I,γ) a PD
scheme over ℤ_(p), X→S₀ a morphism with p locally nilpotent on X, and F an O_crys-module on the
small site Cris(X/S).

The API:

- `Crystalline.Connection.extend`: `∇:M⊗_BΩⁱ→M⊗_BΩ^{i+1}`, ∇(m⊗ω)=∇(m)∧ω+m⊗dω, is well defined, and
  ∇(η∧ω)=∇(η)∧ω+(−1)ⁱη∧dω for η∈M⊗_BΩⁱ and ω∈Ωʲ.
- `Crystalline.Connection.curvature`: The curvature ∇∘∇:M→M⊗_BΩ² is B-linear and
  (∇∘∇)(m⊗ω)=(∇∘∇)(m)∧ω; ∇ is integrable if and only if the curvature vanishes, and then ∇∘∇=0 on
  every M⊗_BΩⁱ.
- `Crystalline.Connection.deRhamComplex`: For an integrable connection, (M⊗_BΩ^•,∇) is a cochain
  complex of A-modules in degrees ≥0; a horizontal B-linear map M→N induces a map of de Rham
  complexes.
- `Crystalline.Connection.baseChange`: For a commutative square A→A′, B→B′ and φ:Ω→Ω′ compatible
  with `Ω_{B/A}→Ω_{B′/A′}`: ∇′(m⊗b′)=Σm_i⊗b′φ(db_i)+m⊗db′ (where ∇(m)=Σm_i⊗db_i) is a connection on
  M⊗_BB′, integrable if ∇ is, and m⊗η↦m⊗φ(η) is a map of complexes M⊗_BΩ^•→M⊗_B(Ω′)^• (Stacks Remark
  60.6.9).
- `Crystalline.Connection.tensor`: For connections on M and N, ∇(m⊗n)=∇(m)⊗n+m⊗∇(n) is a connection
  on M⊗_BN; its curvature is R_M⊗1+1⊗R_N, so it is integrable if both are.
- `Crystalline.Connection.hom`: For M finitely generated projective, (∇φ)(m)=∇_N(φ(m))−(φ⊗1)(∇_M(m))
  is a connection on Hom_B(M,N), integrable if both are; a B-linear map φ is horizontal if and only
  if ∇φ=0. With N=(B,d) this is the dual connection.
- `Crystalline.crisDifferentials`: On Cris(X/S), `Ω_{X/S}` with `d_{X/S}:O_crys→Ω_{X/S}` is the
  universal PD S-derivation; `(Ω_{X/S})_T=Ω_{T/S,δ}` and `d_{X/S}` restricts to `d_{T/S,δ}`; `Ω_{X/S}` has
  quasi-coherent restrictions and `c_f:f^*(Ω_{X/S})_T′→(Ω_{X/S})_T` is surjective when f:T→T′ is a
  closed immersion, but `Ω_{X/S}` is in general not a crystal (Stacks Lemmas 60.12.3 and 60.12.6).
- `Crystalline.Connection.ofCrystal`: A crystal F in O_crys-modules on Cris(X/S) carries a canonical
  integrable connection: for an object (U,T,δ), with T′ the first-order thickening
  `O_T′=O_T⊕Ω_{T/S,δ}`, projections p₀,p₁:T′→T and `c=c_{p₁}⁻¹∘c_{p₀}:p₀^*F_T→p₁^*F_T`, one has
  ∇(s)=p₁^*s−c(p₀^*s) in `F_T⊗_{O_T}Ω_{T/S,δ}` (Stacks Lemma 60.15.1).

*Proof sketch.* Descent of d: if N=Ker π is generated by elements ω with `dω∈N∧Ω_{B/A}`, then by the
graded Leibniz rule d preserves the ideal of `∧^•Ω_{B/A}` generated by N. The extension
∇(m⊗ω)=∇(m)∧ω+m⊗dω respects bm⊗ω=m⊗bω: the difference of the two values is
b∇(m)∧ω+m⊗db∧ω+bm⊗dω−b∇(m)∧ω−bm⊗dω−m⊗db∧ω=0 (Stacks Remark 60.6.8). ∇∘∇:M→M⊗_BΩ² is B-linear and
(∇∘∇)(m⊗ω)=(∇∘∇)(m)∧ω, so integrability gives ∇∘∇=0 in all degrees. Base change: Stacks Remark
60.6.9. Sheaf version: `Ω_{X/S}` is the quotient of the module of differentials of O_crys over the
pullback of O_S by the local sections `dδ_n(x)−δ_{n−1}(x)dx` (Stacks §60.12); Lemmas 60.12.2–60.12.4
identify its restrictions. Connection of a crystal (Stacks Lemma 60.15.1): with the first-order
thickening T′ of Remark 60.13.1 (*Divided powers on a second-order thickening*
(DerivedDeRhamCohomology §PD.5)), c pulled back along the diagonal T→T′ is the identity, so
p₁^*s−c(p₀^*s) lies in the kernel `F_T⊗Ω_{T/S,δ}` of p₁^*F_T→F_T; integrability follows from the
commutative triangle of comparison maps on the second-order thickening of Remark 60.13.2. ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.6, Remarks 60.6.8–60.6.9;
§60.12, Definition 60.12.1 and Lemmas 60.12.2–60.12.4; §60.14; §60.15, Lemma 60.15.1.) *Needs:*
*Universal PD differentials and the PD de Rham complex*; *Structure, quotient and PD-ideal sheaves*;
*Quasi-coherent and finite locally free crystals*; *Divided powers on a square-zero extension*
(DerivedDeRhamCohomology §PD.5); *Divided powers on a second-order thickening*
(DerivedDeRhamCohomology §PD.5); Mathlib `KaehlerDifferential`.

**Checks.**

- `test_connection_unit`: (B,d) is an integrable connection on B, with de Rham complex (Ω^•,d); the
  canonical connection of the structure crystal O_crys is `d_{X/S}`.
- `test_connection_exponential`: For A=F_p, B=F_p[t], `Ω=Ω_{B/A}` and M=B·e with ∇(e)=e⊗dt:
  ∇(fe)=(f′+f)e⊗dt, the connection is integrable, and its de Rham complex is B→B·dt, f↦(f′+f)dt.
- `test_connection_not_integrable`: For B=A[x,y] with A≠0, `Ω=Ω_{B/A}` and M=B·e with ∇(e)=e⊗x·dy:
  ∇(∇(e))=e⊗dx∧dy≠0, so ∇ is not integrable and M⊗_BΩ^• is not a complex.
- `test_connection_pd`: For Ω=Ω¹_PD(B/A) with J=0, a connection is a connection relative to the
  ordinary Kähler differentials `Ω_{B/A}`; for B=A⟨t⟩ with PD ideal B₊, Ω=B·dt and a connection on M
  is ∇(m)=θ(m)⊗dt for an additive map θ:M→M with θ(bm)=∂_t(b)m+bθ(m) for all b∈B, where ∂_t is the
  A-linear map with `∂_t(t^{[n]})=t^{[n−1]}` and ∂_t(1)=0.

**PD stratifications on a smooth lift.** In Stacks Situation 60.5.1 (p a prime, (A,I,γ) a PD ring
with A a ℤ_(p)-algebra, A→C a ring map with IC=0 and p nilpotent in C), let P=A[x_i] be a polynomial
algebra with a surjection P→C of A-algebras, and for n≥0 let J(n) be the kernel of P⊗_A⋯⊗_AP→C (n+1
factors). D(n) is the p-adic completion of the PD envelope of J(n) relative to γ, and D=D(0). The
D(n) form a cosimplicial object in PD rings, and D(n) is the coproduct of n+1 copies of D in the
category Cris^∧(C/A) of p-adically complete PD thickenings of C (Stacks Remark 60.5.4, Lemma
60.17.2). Write p₀,p₁:D→D(1), q₀,q₁,q₂:D→D(2) and q₀₁,q₁₂,q₀₂:D(1)→D(2) for the coprojections and
Δ:D(1)→D for the codiagonal. A PD stratification on a p-adically complete D-module M is a
D(1)-linear isomorphism `ε:M⊗^∧_{D,p₀}D(1)→M⊗^∧_{D,p₁}D(1)` such that Δ^*ε=id_M and
q₀₂^*ε=q₁₂^*ε∘q₀₁^*ε as maps `M⊗^∧_{D,q₀}D(2)→M⊗^∧_{D,q₂}D(2)`. Here ⊗^∧ is the p-adically completed
tensor product.

*Hypotheses.* p is a prime number; (A,I,γ) is a PD ring with A a ℤ_(p)-algebra; A→C is a ring map
with IC=0 and p nilpotent in C (Stacks Situation 60.5.1). P=A[x_i] is a polynomial algebra on any
set of variables, with a surjection P→C of A-algebras. M is a p-adically complete D-module.

The API:

- `Crystalline.PDStratification.diagonal`: Pulling ε to the diagonal gives id_M.
- `Crystalline.PDStratification.cocycle`: q₀₂^*ε=q₁₂^*ε∘q₀₁^*ε as maps
  `M⊗^∧_{D,q₀}D(2)→M⊗^∧_{D,q₂}D(2)`.
- `Crystalline.PDStratification.from_crystal`: The crystal pullback isomorphisms on D(1) define ε
  and satisfy the cocycle.
- `Crystalline.PDStratification.taylorCoefficients`: For a PD stratification ε and m∈M there are
  unique elements θ_K(m)∈M, K running over the multi-indices of finite support, with
  `ε(m⊗1)=Σ_Kθ_K(m)⊗∏_iξ_i^{[k_i]}` in `M⊗^∧_{D,p₁}D(1)`, where ξ_i=x_i⊗1−1⊗x_i=p₀(x_i)−p₁(x_i); the sum
  converges p-adically. One has θ_0=id and `θ_K∘θ_L=θ_{K+L}`; so the `θ_i=θ_{e_i}` commute and
  `θ_K=∏_iθ_i^{k_i}` (proof of Stacks Lemma 60.17.3).

*Proof sketch.* D(n) is, as a D-algebra through the first coprojection, the p-adic completion of the
PD polynomial algebra D⟨ξ_i(j)⟩, j=1,…,n, with ξ_i(j)=x_i⊗1⊗⋯⊗1−1⊗⋯⊗x_i⊗⋯⊗1 (x_i in slot j+1):
`P^{⊗(n+1)}=P[ξ_i(j)]` and J(n) is generated by J and the ξ_i(j) (Stacks Lemmas 60.2.5 and 60.17.1;
*Relative divided power polynomial algebras* (DerivedDeRhamCohomology §PD.5)). For an object (B→C,δ)
of Cris^∧(C/A), morphisms D→B are the A-algebra maps P→B sending J into Ker(B→C); since `P^{⊗(n+1)}`
is a coproduct of A-algebras, D(n) is the (n+1)-fold coproduct of D (Stacks Lemma 60.17.2). This
gives the coprojections, the codiagonal and the cosimplicial structure. For a crystal F in
quasi-coherent modules, choose e₀ so that X factors through Spec D_e and the quotient PD
structures exist for e≥e₀. With M=lim_(e≥e₀)Γ((X,Spec D_e,γ̄),F), the crystal property on
Spec D(1)_e gives
isomorphisms `M⊗^∧_{D,p₀}D(1)→M(1)←M⊗^∧_{D,p₁}D(1)`; their composite is a PD stratification, the
cocycle identity being the commutative triangle on Spec D(2)_e (proof of Stacks Lemma 60.17.3).
([Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.17, the rings D(n)
before Lemma 60.17.1, Lemmas 60.17.1–60.17.2, and the proof of Lemma 60.17.3.) *Needs:* *Universal
base-compatible divided power envelope* (DerivedDeRhamCohomology §PD.6); *Completed PD envelopes and
the derived-completion comparison* (DerivedDeRhamCohomology §PD.6); *Relative divided power
polynomial algebras* (DerivedDeRhamCohomology §PD.5); *Small and big crystalline sites*;
*Quasi-coherent and finite locally free crystals*; Mathlib `IsAdicComplete`.

**Checks.**

- `test_stratification_unit`: The structure module has its canonical identity-after-base-change
  stratification.
- `test_stratification_three`: For A=F_p with the zero PD ideal, C=P=F_p[t] and M=D=F_p[t] with ε
  the identity of D(1)=F_p[t]⟨ξ⟩, ξ=t⊗1−1⊗t: `ε(f⊗1)=p₀(f)=Σ_kp₁(f^{(k)})·ξ^{[k]}` for every f, so θ_k
  is the k-th derivative.
- `test_stratification_connection`: For A=F_p with the zero PD ideal and C=P=F_p[t], the module
  M=F_p[t]·e with the integrable connection ∇e=e⊗dt has no PD stratification whose coefficient θ_1
  is the operator θ of ∇: such an ε would satisfy `ε(e⊗1)=Σ_kθᵏ(e)⊗ξ^{[k]}` with only finitely many
  nonzero terms, but θᵏ(e)=e for all k.
- On M=F_p[t]·e with the connection ∇e=e⊗dt there is no PD stratification inducing ∇: by the cocycle
  identity such an ε satisfies `ε(e⊗1)=Σ_kθᵏ(e)⊗ξ^{[k]}`, a finite sum in M⊗D(1), whereas θᵏ(e)=e for
  all k.

**Integrable topologically quasi-nilpotent connections.** In Stacks Situation 60.5.1 let
`P=A[x_i]_{i∈Λ}` be a polynomial algebra with a surjection P→C of A-algebras with kernel J, D the
p-adic completion of the PD envelope `D_{P,γ}(J)`, D_e=D/pᵉD, and Ω_D=lim_eΩ¹_PD(D_e/A). Ω_D is the
p-adic completion of `Ω¹_PD(D_{P,γ}(J)/A)=D_{P,γ}(J)⊗_PΩ_{P/A}`, which is free on the dx_i; every
element of Ω_D is uniquely a sum Σf_idx_i with f_i∈D and, for every e, f_i∈pᵉD for all but finitely
many i; and d:D→Ω_D is the limit of the universal PD derivations of the D_e. Let M be a p-adically
complete D-module. A connection on M is an additive map ∇:M→M⊗^∧_DΩ_D with ∇(fm)=m⊗df+f∇(m); it is
integrable if ∇∘∇=0 (*Modules with integrable connection and their de Rham complexes*, with
completed tensor products). Write ∇(m)=Σ_iθ_i(m)dx_i with operators θ_i:M→M. The connection is
topologically quasi-nilpotent if for every m∈M there are only finitely many pairs (i,k) with k≥1 and
θ_iᵏ(m)∉pM (Stacks §60.17, conditions (1)–(4)). If ∇ is integrable then θ_i∘θ_j=θ_j∘θ_i, and
`θ_K:=∏_iθ_i^{k_i}` is defined for every multi-index K of finite support. If ∇ is integrable and
topologically quasi-nilpotent, then for every m∈M and e≥1 only finitely many K have θ_K(m)∉pᵉM. For
ring maps A→P′→C with P′ smooth over A and P′→C surjective, and D′ the p-adic completion of the PD
envelope of its kernel, an integrable connection (M′,∇′) over D′ is called topologically
quasi-nilpotent if its base change along a PD map b:D′→D as in Stacks Lemma 60.17.5 is.

*Hypotheses.* p is a prime number; (A,I,γ) is a PD ring with A a ℤ_(p)-algebra; A→C is a ring map
with IC=0 and p nilpotent in C (Stacks Situation 60.5.1). `P=A[x_i]_{i∈Λ}` is a polynomial algebra on
any set Λ, with a surjection P→C; D is the p-adic completion of the PD envelope of its kernel
relative to γ. M is a p-adically complete D-module; ⊗^∧ is the p-adically completed tensor product.

The API:

- `Crystalline.QNConnection.operators`: ∇(m)=Σ_iθ_i(m)dx_i, and θ_i(fm)=∂_i(f)m+fθ_i(m) for f∈D and
  m∈M, where df=Σ_i∂_i(f)dx_i in Ω_D.
- `Crystalline.QNConnection.commute`: Integrability implies θ_iθ_j=θ_jθ_i.
- `Crystalline.QNConnection.finite_taylor`: If ∇ is integrable and topologically quasi-nilpotent,
  then for every m∈M and e≥1 only finitely many multi-indices K of finite support have θ_K(m)∉pᵉM;
  hence `Σ_Kθ_K(m)⊗ξ^{[K]}` converges p-adically for every family of elements ξ_i of a PD ideal in a
  p-adically complete D-algebra.

*Proof sketch.* `Ω¹_PD(D_{P,γ}(J)/A)=D_{P,γ}(J)⊗_PΩ_{P/A}` is free on the dx_i (*Differentials of a
smooth envelope*), and its p-adic completion is lim_eΩ¹_PD(D_e/A) (Stacks Lemma 60.6.10); this gives
the unique expansions Σf_idx_i and the derivation d:D→Ω_D. The Leibniz rule for ∇ gives
θ_i(fm)=∂_i(f)m+fθ_i(m), where df=Σ∂_i(f)dx_i. For a total order on Λ, the coefficient of dx_i∧dx_j
(i<j) in ∇(∇m) is θ_iθ_j(m)−θ_jθ_i(m); so integrability is equivalent to the commutation of the θ_i.
Finiteness modulo pᵉ: θ_i(m)∈pᵉM for all but finitely many i because ∇(m) lies in the completed sum;
for each remaining i the condition modulo p, applied to m and then to the elements m′ with
θ_iᵏ(m)=pm′, gives θ_iʳ(m)∈pᵉM for r≥r_i; by commutation θ_K(m)∈pᵉM unless K is supported in that
finite set with k_i<r_i. The agreement of quasi-nilpotence in étale coordinates with the transported
condition of Stacks Lemma 60.17.5 needs D′(1) ≅ D′⟨ξ₁, …, ξ_d⟩^∧ for étale coordinates
(Berthelot–Ogus §§3–4); this comparison is part of this target. ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.17, conditions (1)–(4)
before Lemma 60.17.3; Lemma 60.17.5 and its footnote for a smooth P′; [Esnault–Groechenig, *Rigid
connections and
F-isocrystals*](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf), §2.6, p. 15
of the author-hosted manuscript, the paragraph before Theorem 2.19.) *Needs:* *Modules with
integrable connection and their de Rham complexes*; *Universal PD differentials and the PD de Rham
complex*; *Differentials of a smooth envelope*; *Universal base-compatible divided power envelope*
(DerivedDeRhamCohomology §PD.6); *Completed PD envelopes and the derived-completion comparison*
(DerivedDeRhamCohomology §PD.6); DerivedDeRhamCohomology Layer 2 (§2.12 *The ordinary algebraic de
Rham complex*); Mathlib `IsAdicComplete`.

**Checks.**

- `test_qn_trivial`: For A=F_p with the zero PD ideal and C=P=F_p[t], so D=F_p[t]: (D,d) is
  integrable and topologically quasi-nilpotent, with θ=d/dt and θᵏ(f)=0 for k>deg f.
- `test_qn_unipotent`: Over F_p[t], θ(e₁)=0,θ(e₂)=e₁ gives a nonzero rank-two connection with θ^p=0.
- `test_qn_exponential`: Over F_p[t], ∇e=e⊗dt is integrable but θ^p(e)=e, so it is not
  quasi-nilpotent.
- A nontrivial connection satisfying the condition: for A=F_p with the zero PD ideal and C=P=F_p[t]
  (so D=F_p[t]), on M=De₁⊕De₂ with θ(e₁)=0, θ(e₂)=e₁ one has θ=∂+N with N²=0 and [∂,N]=0, hence
  θᵖ=∂ᵖ+Nᵖ=0.
- A connection outside it: on M=F_p[t]·e with ∇e=e⊗dt, θ=∂+1 and θᵖ=∂ᵖ+1=id, so θᵏ(e)=e for all k.
- (D,d) is integrable and topologically quasi-nilpotent for every D as above, being attached to the
  structure crystal (Stacks Lemma 60.17.3).

**Crystals, stratifications and quasi-nilpotent connections.** Convention. A PD stratification is
`ε:M⊗^∧_{D,p₀}D(1)→M⊗^∧_{D,p₁}D(1)` (*PD stratifications on a smooth lift*), a connection is written
∇m=Σ_iθ_i(m)dx_i (*Integrable topologically quasi-nilpotent connections*), and
ξ_i=x_i⊗1−1⊗x_i=p₀(x_i)−p₁(x_i)∈D(1). (1) In Stacks Situation 60.5.1 with X=Spec C and S=Spec A, let
P=A[x_i]→C be a surjection from a polynomial algebra, D the p-adic completion of the PD envelope of
its kernel and D_e=D/pᵉD. Choose e₀ so that X factors through Spec D_e and the quotient PD
structures exist for every e≥e₀. All crystalline evaluations in this tower use e≥e₀. For a
crystal F in quasi-coherent O_crys-modules on Cris(X/S),
M=lim_(e≥e₀)Γ((X,Spec D_e,γ̄),F) is a p-adically complete D-module with
M/pᵉM=Γ((X,Spec D_e,γ̄),F) for e≥e₀; the
crystal property gives a PD stratification ε on M, and `ε(m⊗1)=Σ_Kθ_K(m)⊗∏_iξ_i^{[k_i]}` with
`θ_K=∏_iθ_i^{k_i}`, where ∇(m)=Σ_iθ_i(m)dx_i is the canonical connection of F evaluated on the Spec
D_e; ∇ is integrable and topologically quasi-nilpotent (Stacks Lemma 60.17.3). (2) The functor
F↦(M,∇) is an equivalence from the category of crystals in quasi-coherent O_crys-modules on
Cris(X/S) to the category of pairs (M,∇) of a p-adically complete D-module and an integrable,
topologically quasi-nilpotent connection ∇:M→M⊗^∧_DΩ_D (Stacks Proposition 60.17.4). A quasi-inverse
sends (M,∇) to the crystal with value `M⊗_{D,f}B` on an affine object (U,Spec B,δ) with a morphism
f:D→B of thickenings, two choices f, g being identified by
`c_{f,g}(m⊗1)=Σ_Kθ_K(m)⊗∏_i(f(x_i)−g(x_i))^{[k_i]}`, a finite sum. (3) Let A→P′→C be ring maps with P′
smooth over A and P′→C surjective with kernel J′, and D′ the p-adic completion of `D_{P′,γ}(J′)`.
There are a surjection P→C from a polynomial algebra and PD A-algebra maps a:D→D′, b:D′→D compatible
with the maps to C with a∘b=id; base change along a and b gives an equivalence between the pairs
(M,∇) over D and the pairs (M′,∇′) over D′ that are p-adically complete, integrable and
topologically quasi-nilpotent, and the equivalence of (2) holds for the functor F↦(M′,∇′) (Stacks
Lemma 60.17.5).

*Hypotheses.* p is a prime number; (A,I,γ) is a PD ring with A a ℤ_(p)-algebra; A→C is a ring map
with IC=0 and p nilpotent in C (Stacks Situation 60.5.1). X=Spec C and S=Spec A. In (1) and (2),
P=A[x_i] is a polynomial algebra on any set of variables with a surjection P→C; in (3), P′ is a
smooth A-algebra with a surjection P′→C. Crystals are crystals in quasi-coherent O_crys-modules on
the small site Cris(X/S); modules over D and D′ are p-adically complete.

*Proof sketch.* Lemma 60.17.3: (X,Spec D_e,γ̄) is an object of Cris(X/S) for e≥e₀ after choosing
e₀ sufficiently large (Stacks Lemma 60.5.5). Restriction to this cofinal range preserves inverse
limits; the crystal property gives `M_e=M_{e+1}/pᵉM_{e+1}` for e≥e₀ and the isomorphisms
`M⊗^∧_{D,p₀}D(1)→M(1)←M⊗^∧_{D,p₁}D(1)`, whose composite c is expanded in the divided powers of the ξ_i
(*PD stratifications on a smooth lift*, Taylor coefficients). The connection of F is
∇(s)=p₁^*s−c(p₀^*s) (*Modules with integrable connection and their de Rham complexes*), and ξ_i maps
to −dx_i modulo the square of the diagonal ideal, which gives ∇(m)=Σθ_i(m)dx_i. The cocycle identity
on D(2), with ζ″_i=ζ_i+ζ′_i and the PD addition formula `(ζ+ζ′)^{[k]}=Σ_{a+b=k}ζ^{[a]}ζ′^{[b]}`, gives
`θ_K∘θ_L=θ_{K+L}`; no division by K! occurs. The p-adic convergence of the expansion of c(m⊗1) gives
topological quasi-nilpotence. Proposition 60.17.4: for an affine object (U,Spec B,δ) choose f:D→B
(Stacks Lemma 60.5.6) and put `F_T=(M⊗_{D,f}B)~`. The sums defining `c_{f,g}` are finite by *Integrable
topologically quasi-nilpotent connections*; `c_{g,h}∘c_{f,g}=c_{f,h}` and `c_{f,f}=1` by the same
addition formula, so the value does not depend on f. A morphism a of affine objects gives
a^*F_T≅F_T′ by taking f′=f∘a; the sheaf on Cris(X/S) is obtained from these data by *Structure,
quotient and PD-ideal sheaves*. Lemma 60.17.5: choose P=A[y_1,…,y_m]→P′ surjective; a:D→D′ is
induced. The kernel of D_e→D′_e is locally nilpotent, so P′→D′_e lifts to P′→D_e and then, step by
step along square-zero extensions, to P′→D (formal smoothness of P′ over A), which gives b with
a∘b=id. With F and G the base changes along a and b, F∘G=id and G(F(M,∇))≅(M,∇) through `c_{id,b∘a}`.
The verifications that Stacks omits in Proposition 60.17.4 and Lemma 60.17.5 (independence of the
restriction maps from the choice of lift, extension from affine objects to all of Cris(X/S),
functoriality, quasi-inverseness, horizontality of `c_{id,b∘a}`), the formally smooth case of Stacks
Remark 60.17.6, and the global case for non-affine X embedded in a smooth scheme (Berthelot,
*Cohomologie cristalline*, LNM 407, II 4.3.10 and IV 1.6.5) are part of this target. ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.17, Lemma 60.17.3,
Proposition 60.17.4 and Lemma 60.17.5 (Remark 60.17.6 for the formally smooth case, without proof);
[Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.17, proof of Lemma
60.17.3 (definition of ξ_i and the expansion of c).) *Needs:* *Integrable topologically
quasi-nilpotent connections*; *PD stratifications on a smooth lift*; *Quasi-coherent and finite
locally free crystals*; *Structure, quotient and PD-ideal sheaves*; *Modules with integrable
connection and their de Rham complexes*; *Relative divided power polynomial algebras*
(DerivedDeRhamCohomology §PD.5); *Universal base-compatible divided power envelope*
(DerivedDeRhamCohomology §PD.6); *Differentials of a smooth envelope*.

**Checks.**

- Sign check on the structure crystal: for F=O_crys, M=D, ∇=d and ε is the identity of D(1); for
  m=x_j the formula gives ε(x_j⊗1)=p₁(x_j)+ξ_j=p₀(x_j), as D(1)-linearity requires (θ_0(x_j)=x_j,
  θ_j(x_j)=1 and all other θ_K(x_j) vanish). With ξ_j replaced by p₁(x_j)−p₀(x_j) the right side
  would be 2p₁(x_j)−p₀(x_j).
- For A=F_p with the zero PD ideal and C=P=F_p[t]: the rank-two connection θ(e₁)=0, θ(e₂)=e₁
  corresponds to a crystal, with ε(e₂⊗1)=e₂⊗1+e₁⊗ξ; the pair (F_p[t]·e,∇e=e⊗dt) corresponds to no
  crystal.
- For `A=P=ℤ_p`, `I=(p²)` with restricted canonical divided powers and `C=ℤ/p²`, the
  zero-variable presentation has `D=ℤ_p`. The evaluation `(X,Spec D_e)` exists for `e≥2`;
  `e=1` fails because `X=Spec(ℤ/p²)` does not factor through `Spec F_p` over `Spec ℤ_p`.

### CR.1.4 Evaluation on Witt vectors

**Finite-Witt evaluation and formal coefficient comparison.** Let k be a perfect field of
characteristic p, W=W(k) with the canonical PD structure on (p), W_n=W/pⁿ, Z a smooth k-scheme of
finite type and Ẑ a smooth p-adic formal W-scheme with Ẑ⊗_Wk=Z; put Z_n=Ẑ⊗_WW_n. Then (Z,Z_n,γ) is
an object of Cris(Z/Spec W_n). Let MIC(Z_n) be the category of `O_{Z_n}`-modules of finite type with
an integrable connection `∇_n:E_n→E_n⊗Ω¹_{Z_n/W_n}`. Call (E_n,∇_n) quasi-nilpotent if for every
affine open Spec P′ of Z_n the pair (Γ(Spec P′,E_n),∇_n) over D′=P′ is topologically quasi-nilpotent
in the sense of *Integrable topologically quasi-nilpotent connections* (Stacks Lemma 60.17.5), and
let MIC(Z_n)^qn be the full subcategory of these. (1) Evaluation `E↦(E_{Z_n},∇)` on the object
(Z,Z_n,γ) is an equivalence from Crys(Z/W_n), the crystals of finite type on Cris(Z/Spec W_n), to
MIC(Z_n)^qn, compatible with reduction from `W_{n+1}` to W_n; crystals in finite locally free modules
correspond to the (E_n,∇_n) with E_n finite locally free. (2) (E_n,∇_n) in MIC(Z_n) is
quasi-nilpotent if and only if its reduction `(E_1,∇_1)=(E_n,∇_n)⊗_{W_n}k` is. (3) Crys(Z/W) is
equivalent to the category of coherent O_Ẑ-modules E with an integrable connection such that
(E,∇)⊗_WW_n lies in MIC(Z_n)^qn for every n; such E satisfy E=lim_nE/pⁿE.

*Hypotheses.* k is a perfect field of characteristic p; W=W(k) carries the canonical PD structure on
(p); W_n=W/pⁿ. Z is a smooth k-scheme of finite type and Ẑ a smooth p-adic formal scheme over W with
reduction Z; the lift Ẑ is part of the data and need not exist for every Z. Modules are of finite
type and connections are integrable.

*Proof sketch.* Z_n is flat over W_n, so γ extends to `pO_{Z_n}` (*Flat extension of divided powers*
(DerivedDeRhamCohomology §PD.2)) and (Z,Z_n,γ) is an object of Cris(Z/Spec W_n) (Stacks Remark
60.24.11(1)); the PD envelope of Z in Z_n is Z_n itself and `Ω¹_PD(O_{Z_n}/W_n)=Ω¹_{Z_n/W_n}`
(*Differentials of a smooth envelope*). (1): on an affine open Spec P′ of Z_n, *Crystals,
stratifications and quasi-nilpotent connections* (3) identifies crystals in quasi-coherent modules
on the corresponding open of Z with pairs over D′=P′; by that equivalence a pair is topologically
quasi-nilpotent if and only if it is the evaluation of a crystal, so the condition does not depend
on the choice of b. Finite type corresponds to finite type, and E is finite locally free on every
thickening if and only if `E_{Z_n}` is, because every affine thickening maps to Z_n locally. Both
categories and the evaluation functor are compatible with restriction to opens of Z (Stacks Lemma
60.9.5); glue. (2): condition (4) of *Integrable topologically quasi-nilpotent connections* for a
pair (M,∇) over D only involves M/pM, and the PD envelope over (W_n,(p),γ) reduces modulo p to the
PD envelope over (k,0), since the kernel of the reduction is generated by the γ_m(pa)=(pᵐ/m!)aᵐ∈pD
(Stacks Lemma 60.2.3). (3): every object of Cris(Z/Spec W) is Zariski locally an object of some
Cris(Z/Spec W_n), so a crystal of finite type over W is a compatible system of crystals over the
W_n; coherent modules on the noetherian formal scheme Ẑ are the compatible systems of coherent
modules on the Z_n (EGA I 10.11.3). ([Esnault–Groechenig, *Rigid connections and
F-isocrystals*](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf), §2.6, p. 15
of the author-hosted manuscript: the paragraph before Theorem 2.19 and the paragraph before
Corollary 2.20; [Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.17,
Lemma 60.17.5; §60.24, Remark 60.24.11(1)–(2).) *Needs:* *Crystals, stratifications and
quasi-nilpotent connections*; *Rational crystals and nondegenerate F-crystals*; *Integrable
topologically quasi-nilpotent connections*; *Quasi-coherent and finite locally free crystals*;
*Differentials of a smooth envelope*; *Flat extension of divided powers* (DerivedDeRhamCohomology
§PD.2); AdicSpacesPartIII F0.6 (*Coherent modules on a locally noetherian formal scheme as
compatible systems*); AdicSpacesPartIII F0.3 (*Formal schemes and locally noetherian formal
schemes*).

**Checks.**

- For Z=𝔸¹_k and Ẑ=Spf W⟨t⟩: (O_Ẑ,d) corresponds to the structure crystal, and the connection
  ∇e=λe⊗dt on W⟨t⟩·e (λ∈W) corresponds to a crystal on Cris(Z/Spec W) if and only if p divides λ,
  because modulo p one has θ=∂+λ̄ and θᵖ=λ̄ᵖ.

### Examples

- For a perfect field `k`, the site `Cris(Spec k/W_n(k))` has the final object `(Spec k, Spec
  W_n(k), γ)`, so crystals of quasi-coherent modules are `W_n(k)`-modules.
- For `X = 𝔸¹_k` over `S = Spec W_n(k)`, with the smooth lift `Spec W_n(k)[x]`, a crystal of
  quasi-coherent modules is a `W_n(k)[x]`-module `M` with a connection `∇ = θ dx` such that for
  every `m ∈ M`, `θᵏ(m) ∈ pM` for `k` large; the Taylor isomorphism uses `ξ = x ⊗ 1 − 1 ⊗ x`.

### Dependencies

DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7 and DerivedModuleAlgebra §0.DP.3;
SchemeAndStackFoundations (Layer 2); DerivedDeRhamCohomology (Layer 2); AdicSpacesPartIII (F0.6,
F0.3); Mathlib.

## Layer CR.2: The PD Poincaré lemma and de Rham computations

This layer defines crystalline cohomology as the derived direct image `Ru_{X/S,*}` and computes it:
linearization of a crystal along a smooth embedding, the PD Poincaré lemma, the Čech–Alexander
complex of a cover and the de Rham complex of the envelope of an embedding, independence of the
embedding, the smooth-lift comparison with its PD filtration, the formal comparison for a proper
smooth lift, and the change from the Zariski to the étale crystalline site.

### CR.2.1 Crystalline cohomology and linearization

**Enhanced crystalline direct image and global sections.** In the situation of *Small and big
crystalline sites* (Layer CR.1), with f:X→S the structure map, `u_{X/S}:(X/S)_cris→Sh(X_Zar)` is a
morphism of topoi (*Morphisms and comparisons of crystalline sites* (Layer CR.1)). It is not a
morphism of ringed topoi to (X_Zar,O_X): the natural ring map goes from O_crys to u⁻¹O_X. Through
u⁻¹f⁻¹O_S→O_crys every O_crys-module is a module over u⁻¹f⁻¹O_S, and
`Ru_{X/S,*}:D((X/S)_cris,O_crys)→D(X_Zar,f⁻¹O_S)` is the derived direct image. Crystalline cohomology
is `RΓ_crys(X/S,E)=RΓ(Cris(X/S),E)=RΓ(X_Zar,Ru_{X/S,*}E)`, an object of D(Γ(S,O_S)). In particular,
for a PD ring (A,I,γ) with A a ℤ_(p)-algebra and p nilpotent in A/I, S=Spec A and X an S₀-scheme
with p locally nilpotent on X, RΓ_crys(X/S,E)∈D(A) is defined although p need not be nilpotent in A.
In that case pᵉA⊂I is stable under γ for e≫0; with S_e=Spec A/pᵉA, Cris(X/S_e) is a full subcategory
of Cris(X/S), and for every O_crys-module F with restrictions F_e to Cris(X/S_e) one has
RΓ(Cris(X/S),F)≅Rlim_eRΓ(Cris(X/S_e),F_e) (Stacks Remark 60.24.10).

*Hypotheses.* p is a prime number; (S,I,γ) is a PD scheme over ℤ_(p) and S₀=V(I)⊂S; X→S₀ is a
morphism of schemes with p locally nilpotent on X (Stacks Situation 60.7.5). E is an O_crys-module,
or a complex of O_crys-modules, on Cris(X/S). For the limit formula: S=Spec A for a PD ring (A,I,γ)
with A a ℤ_(p)-algebra and p nilpotent in A/I, and F is any O_crys-module.

The API:

- `Crystalline.RΓcrys_comp`: `RΓ_crys(X/S,−)=RΓ(X_Zar,−)∘Ru_{X/S,*}` as functors
  D((X/S)_cris,O_crys)→D(Γ(S,O_S)), where `Ru_{X/S,*}` takes values in D(X_Zar,f⁻¹O_S).
- `Crystalline.RΓcrys_map`: For a square X→Y over (S,I,γ)→(S′,I′,γ′) as in *Morphisms and
  comparisons of crystalline sites* (Layer CR.1), an O_crys-module F′ on Cris(Y/S′) and a map
  f_cris⁻¹F′→F of sheaves on Cris(X/S) linear over `f_cris⁻¹O_{Y/S′}→O_{X/S}`, there is a map
  RΓ_crys(Y/S′,F′)→RΓ_crys(X/S,F), linear over Γ(S′,O_S′)→Γ(S,O_S).
- `Crystalline.RΓcrys_limit`: For a PD ring (A,I,γ) with A a ℤ_(p)-algebra and p nilpotent in A/I,
  S=Spec A and S_e=Spec A/pᵉA (e≫0): `RΓ(Cris(X/S),F)≅Rlim_eRΓ(Cris(X/S_e),F|_{Cris(X/S_e)})` for
  every O_crys-module F (Stacks Remark 60.24.10).

*Proof sketch.* `u_{X/S}` comes from the continuous and cocontinuous functor (U,T,δ)↦U (Stacks Remark
60.9.4); O_crys is an algebra over u⁻¹f⁻¹O_S through the structure morphism of Stacks Remark 60.9.6.
The derived direct image and derived global sections are taken in the enhanced derived categories of
EnhancedDerivedSheaves Layer E1. `RΓ(Cris(X/S),−)=RΓ(X_Zar,−)∘Ru_{X/S,*}` because
`Γ(Cris(X/S),−)=Γ(X_Zar,u_{X/S,*}−)` and the direct image of an injective `O_crys`-module is
totally acyclic, hence acyclic for global sections (Stacks
[08J6](https://stacks.math.columbia.edu/tag/08J6), using
[072Z](https://stacks.math.columbia.edu/tag/072Z) and
[0731](https://stacks.math.columbia.edu/tag/0731)). For unbounded complexes, use K-injective
replacements and the canonical comparisons with underlying abelian sheaves (Stacks
[0D6J](https://stacks.math.columbia.edu/tag/0D6J)); the exact inverse image on abelian sheaves
gives composition there, and the comparisons transport it with its `Γ(S,O_S)`-action to modules.
This is the coherent composition comparison of EnhancedDerivedSheaves E1.4, also Stacks
[0D6E](https://stacks.math.columbia.edu/tag/0D6E). Limit formula, following the
hint of Remark 60.24.10: reduce to F injective; then the F_e are injective, the maps
`Γ(F_{e+1})→Γ(F_e)` are surjective, and Γ(F)=lim_eΓ(F_e) because every object of Cris(X/S) is Zariski
locally an object of some Cris(X/S_e). The identification RΓ(Cris(X/S), F) = Rlim_e RΓ(Cris(X/S_e),
F_e) of Stacks Remark 60.24.10 is stated there without proof; the argument (restriction to
Cris(X/S_e) preserves injectives, the maps `Γ(F_{e+1})` → Γ(F_e) are surjective and Γ(F) = lim_e
Γ(F_e)) is part of this target. ([Stacks Project](https://stacks.math.columbia.edu), Crystalline
Cohomology, §60.24, Remark 60.24.10 (Rlim; a remark with a hint of proof); see also §60.9, Remarks
60.9.4 and 60.9.6; [Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology,
§60.9, Remark 60.9.4 (Comparison with Zariski site).) *Needs:* *Structure, quotient and PD-ideal
sheaves* (Layer CR.1); *Morphisms and comparisons of crystalline sites* (Layer CR.1);
EnhancedDerivedSheaves Layer E1 (*The enhanced derived category*);
EnhancedDerivedSheaves Layer E1 (*Derived sheaf tensor*);
EnhancedDerivedSheaves E2:towers.1 (`derivedTowerLimit`) and §E2.2
(`IsReplete.derived_limits`, point topos for the surjective global-section tower).

**Checks.**

- `test_RΓcrys_empty`: The empty scheme has zero crystalline cohomology.
- `test_RΓcrys_point`: For k a perfect field of characteristic p, X=Spec k and S=Spec W_e(k) with
  the canonical PD structure on (p): RΓ_crys(X/S,O_crys)=W_e(k) in degree 0.
- `Crystalline.pdPoint_pullback_p_boundary`: For `X = Spec 𝔽_p`, `S = Spec ℤ_p` and `I = (p)`
  with its canonical divided powers, multiplication by `p` is injective on `f⁻¹O_S = ℤ_p`.
  Module pullback takes it to multiplication by `p` on `O_crys`, whose section `1` on the identity
  thickening `(X,X)` is nonzero and killed by `p`. Thus module pullback is not exact and module
  direct image need not preserve injectives (Stacks
  [015Z](https://stacks.math.columbia.edu/tag/015Z)); the comparison uses acyclicity instead.
- `test_RΓcrys_limit_not_groups`: For `X=𝔸¹_{F_p}` over S=Spec ℤ_p and F=O_crys, the map
  H¹(RΓ_crys(X/S,O_crys))→lim_eH¹(RΓ_crys(X/S_e,O_crys)) is not injective: the class of
  `η=Σ_{e>0}pᵉx^{pᵉ−1}dx` is nonzero and maps to zero, since `η≡d(Σ_{0<j<e}x^{pʲ})` modulo pᵉ (Stacks
  Example 60.22.2).
- Affine space: for `X=𝔸ʳ_{F_p}` over S=Spec ℤ_p, RΓ_crys(X/S,O_crys) is the p-adically completed de
  Rham complex D→Ω¹_D→⋯→Ωʳ_D of D=ℤ_p[x_1,…,x_r]^∧; H⁰=ℤ_p, and H¹ is not p-adically separated when
  r=1 (Stacks Example 60.22.2).
- Finite-level reduction: for `X=𝔸¹_{F_p}`, RΓ_crys(X/Spec ℤ/pᵉ,O_crys) is (ℤ/pᵉ)[x]→(ℤ/pᵉ)[x]dx, the
  reduction modulo pᵉ of the complex over ℤ_p, and the complex over ℤ_p is the derived limit of
  these (the transition maps are termwise surjective).

### CR.2.2 The Poincaré lemma and computation by embeddings

**The relative PD Poincaré lemma.** (1) Let A be a ring and `P=A⟨x_i⟩_{i∈W}` a PD polynomial algebra
on any set W of variables, with its PD ideal P₊. For every A-module N the complex
0→N→N⊗_AP→N⊗_AΩ¹_PD(P/A)→N⊗_AΩ²_PD(P/A)→⋯ is exact (Stacks Lemma 60.20.1). (2) Let (B,I,δ) be a PD
ring with B an A-algebra, `P=B⟨x_i⟩_{i∈W}` with PD ideal IP+P₊, and M a B-module with an integrable
connection ∇:M→M⊗_BΩ¹_PD(B/A). Then the map of de Rham complexes M⊗_BΩ^•_PD(B/A)→M⊗_BΩ^•_PD(P/A) is
a quasi-isomorphism (Stacks Lemma 60.20.2). (3) Let p be a prime. In (1), with D₀ the p-adic
completion of P and `Ωⁱ_{D₀}` the p-adic completion of Ωⁱ_PD(P/A), the complex
`0→N→N⊗^∧_AD₀→N⊗^∧_AΩ¹_{D₀}→⋯` is exact for every p-adically complete A-module N. In (2), with D and
D′ the p-adic completions of B and P and Ωⁱ_D, `Ωⁱ_{D′}` the p-adic completions of Ωⁱ_PD(B/A) and
Ωⁱ_PD(P/A), the map `M⊗^∧_DΩ^•_D→M⊗^∧_DΩ^•_{D′}` is a quasi-isomorphism for every p-adically complete
D-module M with an integrable connection ∇:M→M⊗^∧_DΩ¹_D. (4) For one variable z over B the
contraction is explicit: on Ω^•_PD(B⟨z⟩/B), the B-linear map h with `h(z^{[n]}dz)=z^{[n+1]}` and h=0
in degree 0 satisfies dh+hd=id−ev₀, where ev₀ is evaluation at z=0 in degree 0 and zero in degree 1
(Stacks Example 60.25.2).

*Hypotheses.* A is a commutative ring and W any set of variables. In (2): (B,I,δ) is a PD ring, B an
A-algebra, and M a B-module with an integrable connection relative to Ω¹_PD(B/A). In (3): p is a
prime number, the modules N and M are p-adically complete, and ⊗^∧ is the p-adically completed
tensor product.

*Proof sketch.* (1): for N=A the complex is a direct sum, over the multi-indices K of finite
support, of subcomplexes E(K) spanned by the forms
`∏_{i∉I}x_i^{[k_i]}∏_{i∈I}x_i^{[k_i−1]}dx_{i₁}∧⋯∧dx_{i_j}` with I⊂Supp(K); E(0) is A→A and for K≠0,
E(K) is the complex `0→A→⊕_{s∈S}A→∧²(⊕_{s∈S}A)→⋯` with S=Supp(K), which is homotopic to zero. So the
complex for N=A is homotopy equivalent to zero as a complex of A-modules, and tensoring with N keeps
this (proof of Stacks Lemma 60.20.1). For one variable the homotopy is the one in (4). (2): filter
Ω^•_PD(P/A) by `Fⁱ=σ_{≥i}Ω^•_PD(B/A)∧Ω^•_PD(P/A)`. The sequence
0→Ω¹_PD(B/A)⊗_BP→Ω¹_PD(P/A)→Ω¹_PD(P/B)→0 is split with last term free on the dx_i (*Universal PD
differentials and the PD de Rham complex* (Layer CR.1), adjoining PD variables), so
grⁱ_F(M⊗_BΩ^•_PD(P/A))=M⊗_BΩⁱ_PD(B/A)⊗_BΩ^•_PD(P/B), which by (1) is quasi-isomorphic to
M⊗_BΩⁱ_PD(B/A) in degree 0; the filtration is finite in each degree, so the map is a
quasi-isomorphism. (3): the same arguments after p-adic completion; the homotopies of (1) are
termwise linear maps and pass to completions. (4): `d(z^{[n]})=z^{[n−1]}dz`, so
`dh(z^{[n]}dz)=z^{[n]}dz` and `hd(z^{[n]})=z^{[n]}` for n≥1, hd(1)=0. ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.20, Lemmas 60.20.1 and
60.20.2; §60.25, Lemma 60.25.1 and Example 60.25.2.) *Needs:* *Relative divided power polynomial
algebras* (DerivedDeRhamCohomology §PD.5); *Universal PD differentials and the PD de Rham complex*
(Layer CR.1); *Modules with integrable connection and their de Rham complexes* (Layer CR.1); Mathlib
`AdicCompletion`; Mathlib `AdicCompletion.map`.

**Checks.**

- 0→A→A⟨z⟩→A⟨z⟩dz→0 is exact, with `d(z^{[n]})=z^{[n−1]}dz` and contraction `h(z^{[n]}dz)=z^{[n+1]}`.
- Divided powers are needed: in the ordinary de Rham complex of F_p[z] the form `z^{p−1}dz` is closed
  and not exact.
- A constant crystal: for (B,I,δ)=(A,0,∅) and M=N with the zero connection, (2) says that
  N→N⊗_AΩ^•_PD(A⟨x_i⟩/A) is a quasi-isomorphism, which is (1).

**Crystalline cohomology from an embedding.** Setting for (1)–(4): Stacks Situation 60.5.1 with
X=Spec C and S=Spec A, P=A[x_i]→C a surjection from a polynomial algebra, D(n) the p-adically
completed PD envelopes of *PD stratifications on a smooth lift* (Layer CR.1), D=D(0), and
T(n)_e=Spec D(n)/pᵉD(n), so that (X,T(n)_e,γ̄) is an object of Cris(X/S) for e≫0. (1)
(Čech–Alexander complex.) Let F be an O_crys-module on Cris(X/S) such that every restriction F_T is
quasi-coherent and c_f:f^*F_T′→F_T is surjective for every morphism of Cris(X/S) with f:T→T′ a
closed immersion. Then M(n)=lim_eΓ((X,T(n)_e,γ̄),F) is a cosimplicial module over the cosimplicial
ring D(•), and the complex M(0)→M(1)→M(2)→⋯ computes RΓ(Cris(X/S),F) (Stacks Proposition 60.21.1).
(2) For such F, `Hʲ(Cris(X/S),F⊗_{O_crys}Ωⁱ_{X/S})=0` for all i>0 and j≥0 (Stacks Lemma 60.21.2). (3)
If F is a crystal in quasi-coherent modules and (M,∇) the associated module with connection over D
(*Crystals, stratifications and quasi-nilpotent connections* (Layer CR.1)), then M⊗^∧_DΩ^•_D
computes RΓ(Cris(X/S),F) (Stacks Proposition 60.21.3); if p is nilpotent in A the completions may be
omitted. (4) If A→P′→C are ring maps with P′ smooth over A and P′→C surjective, D′ is the p-adic
completion of the PD envelope of the kernel and (M′,∇′) is the pair over D′ associated to F, then
`M′⊗^∧_{D′}Ω^•_{D′}` computes RΓ(Cris(X/S),F) (Stacks Lemma 60.21.4). (5) (Sheaf form.) In the
situation of *Small and big crystalline sites* (Layer CR.1), for a crystal F in quasi-coherent
modules, `Ru_{X/S,*}(F⊗_{O_crys}Ωⁱ_{X/S})=0` for all i>0, so the map of complexes `F⊗Ω^•_{X/S}→F[0]`
becomes an isomorphism after `Ru_{X/S,*}` (Stacks Proposition 60.23.1); for every object (U,T,δ) this
gives a canonical map `RΓ(Cris(X/S),F)→RΓ(T,F_T⊗_{O_T}Ω^•_{T/S,δ})`. (6) (Closed embedding.) If
moreover p is locally nilpotent on S and X→P is a closed S₀-immersion into a smooth S-scheme with PD
envelope D, then (X,D,γ̄) is an object of Cris(X/S) and the map of (5) for T=D induces an
isomorphism `Ru_{X/S,*}F≅F_D⊗_{O_P}Ω^•_{P/S}` in D(X_Zar,f⁻¹O_S).

*Hypotheses.* (1)–(4): p is a prime number; (A,I,γ) is a PD ring with A a ℤ_(p)-algebra; A→C is a
ring map with IC=0 and p nilpotent in C; X=Spec C and S=Spec A (Stacks Situation 60.5.1). P is a
polynomial A-algebra on any set of variables with a surjection onto C; in (4), P′ is a smooth
A-algebra with a surjection onto C. (5)–(6): p is a prime number; (S,I,γ) is a PD scheme over ℤ_(p)
and S₀=V(I)⊂S; X→S₀ is a morphism of schemes with p locally nilpotent on X (Stacks Situation
60.7.5). In (6), p is locally nilpotent on S and P is a smooth S-scheme with a closed S₀-immersion
X→P. F is an O_crys-module on the small site Cris(X/S) with the properties stated in each part; in
(3)–(6) it is a crystal in quasi-coherent modules.

*Proof sketch.* (1): the cohomology of a module with quasi-coherent restrictions vanishes on affine
objects (Stacks Lemma 60.18.1), so RΓ(Cris(X/S),F) is the cohomology of the category of thickenings
(X,T,δ) with the chaotic topology (Lemma 60.18.2). The surjectivity hypothesis makes the transition
maps `F(B_{e+1})→F(B_e)` surjective, so passing to the category Cris^∧(C/A) of complete thickenings
does not change cohomology (Lemma 60.18.3). There D is weakly final (Lemma 60.5.7) with D×⋯×D=D(n)
(Lemma 60.17.2), and Lemma 60.18.4 gives the complex. (2): the cosimplicial module `Ω_{D(•)}` is
homotopic to zero (Example 60.19.1, Lemma 60.19.2), and homotopies are preserved by exterior powers,
tensor products and completion (Lemma 60.16.1), so `M(•)⊗^∧Ωⁱ_{D(•)}` is homotopic to zero for i>0
(Lemma 60.19.3); apply (1) to `F⊗Ωⁱ_{X/S}`. (3): the double complex `K^{a,b}=M⊗^∧_DΩ^a_{D(b)}` has
acyclic columns for a>0 by (2), and its column a=0 computes RΓ by (1). Each row is quasi-isomorphic
to M⊗^∧_DΩ^•_D by *The relative PD Poincaré lemma*, because D(b) is the completion of a PD
polynomial algebra over D (Lemma 60.17.1), and the b+1 coprojections induce the same map on
cohomology; compare the two spectral sequences. (4): with a:D→D′ and b:D′→D as in *Crystals,
stratifications and quasi-nilpotent connections* (Layer CR.1) (3), it suffices that every PD
A-endomorphism ρ of D over C induces a quasi-isomorphism `M⊗^∧_DΩ^•_D→M⊗^∧_{D,ρ}Ω^•_D`; factor ρ
through D⟨ξ_i⟩^∧ by x_i↦x_i+ξ_i and ξ_i↦ρ(x_i)−x_i and apply *The relative PD Poincaré lemma* twice.
(5): by localisation (Stacks Lemma 60.9.5) the cohomology of `Ru_{X/S,*}(F⊗Ωⁱ_{X/S})` over an affine
open of X lying over an affine open of S is that of (2). (6): X→D is a thickening because p is
locally nilpotent on D; on affine opens the map of (5) for T=D is the quasi-isomorphism of (4), as
in the hint to Stacks Remark 60.24.11. ([Stacks Project](https://stacks.math.columbia.edu),
Crystalline Cohomology, §60.21, Propositions 60.21.1 and 60.21.3, Lemmas 60.21.2 and 60.21.4;
§60.23, Proposition 60.23.1 and the map displayed after Remark 60.23.2; §60.24, Remark 60.24.11
(hint) for part (6); [Illusie, *Complexe de de Rham–Witt et cohomologie
cristalline*](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part 0, §3.2 (Calcul de la
cohomologie cristalline): 3.2.1–3.2.3, Théorème 3.2.4 ((3.2.4.1), (3.2.4.2)) and 3.2.5, printed pp.
536–539.) *Needs:* *Enhanced crystalline direct image and global sections*; *The relative PD
Poincaré lemma*; *Differentials of a smooth envelope* (Layer CR.1); *Universal PD differentials and
the PD de Rham complex* (Layer CR.1); *Crystals, stratifications and quasi-nilpotent connections*
(Layer CR.1); *PD stratifications on a smooth lift* (Layer CR.1); *Modules with integrable
connection and their de Rham complexes* (Layer CR.1); *Morphisms and comparisons of crystalline
sites* (Layer CR.1); *Structure, quotient and PD-ideal sheaves* (Layer CR.1); EnhancedDerivedSheaves Layer E2 (*Hypercover in a topos*); EnhancedDerivedSheaves Layer E2 (*Bounded-below hypercover descent*); DerivedModuleAlgebra §S.1 (*The spectral sequence of a first-quadrant double complex*).

**Checks.**

- Affine space: for C=F_p[x_1,…,x_r] over A=ℤ_p and P=ℤ_p[x_1,…,x_r], D is the p-adic completion of
  P and RΓ(Cris(X/S),O_crys) is D→Ω¹_D→⋯→Ωʳ_D (Stacks Example 60.22.2); over A=ℤ/pᵉ it is the de
  Rham complex of (ℤ/pᵉ)[x_1,…,x_r].
- A constant crystal: for a finite free A-module N and F=N⊗_AO_crys, (M,∇)=(N⊗_AD,1⊗d) and the
  complex of (3) is N⊗_AΩ^•_D.
- A singular case: for C=F_p[x,y]/(x²,xy,y²) over A=ℤ_p, τ=γ̄_p(x²)γ̄_p(y²)−γ̄_p(xy)²∈D is a nonzero
  class in H⁰(Cris(X/S),O_crys) with pτ=0 (Stacks Example 60.22.1).

**Crystalline linearization along a smooth embedding.** Setting: p a prime, (A,I,γ) a PD ring with p
nilpotent in A, A→C a ring map with IC=0, X=Spec C, S=Spec A, P=A[x_1,…,x_d] with a surjection P→C
with kernel J, and `D=D_{P,γ}(J)`, so that (X,Spec D,γ̄) is an object of Cris(X/S). Construction: for
an object (U,T,δ) of Cris(X/S) let (U,D_T,δ_T)=(U,T,δ)×(X,Spec D,γ̄) be the product in Cris(X/S),
with projections pr_T:D_T→T and pr_D:D_T→Spec D; D_T is the PD envelope of U in T×_SSpec P relative
to δ. For a D-module N the linearization L(N) is the O_crys-module on Cris(X/S) with
`L(N)_T=pr_{T,*}pr_D^*Ñ` and the restriction maps given by functoriality of the product. (1) If T=Spec
B is affine and h:D→B is a morphism of thickenings, then D_T=Spec B⟨ξ_1,…,ξ_d⟩ with pr_D given by
x_i↦h(x_i)+ξ_i, so L(N)(U,T,δ)=N⊗_DB⟨ξ_1,…,ξ_d⟩; L(N) is a crystal in quasi-coherent O_crys-modules.
(2) RΓ(Cris(X/S),L(N))≅N, placed in degree 0. (3) `L(Ω^q_PD(D/A))_T=pr_{T,*}Ω^q_PD(D_T/T)`, and the
relative PD de Rham differentials of D_T over T make L(Ω^•_PD(D/A)) a complex of O_crys-modules with
an augmentation O_crys→L(D). For a crystal E in quasi-coherent O_crys-modules with value E_D on Spec
D, `E⊗_{O_crys}L(Ω^q_PD(D/A))≅L(E_D⊗_DΩ^q_PD(D/A))`, and the augmented complex
`E→E⊗_{O_crys}L(Ω^•_PD(D/A))` is exact: E is resolved by linearizations.

*Hypotheses.* p is a prime number; (A,I,γ) is a PD ring with p nilpotent in A; A→C is a ring map
with IC=0; X=Spec C and S=Spec A. P=A[x_1,…,x_d] with a surjection P→C of A-algebras with kernel J;
`D=D_{P,γ}(J)` is the PD envelope (no completion is needed). N is a D-module; in (3), E is a crystal
in quasi-coherent O_crys-modules on Cris(X/S).

The API:

- `Crystalline.linearization_eval`: L(N)(U,T,δ)=Γ(D_T,pr_D^*Ñ) with (U,D_T,δ_T)=(U,T,δ)×(X,Spec
  D,γ̄); for T=Spec B affine and h:D→B a morphism of thickenings, D_T=Spec B⟨ξ_1,…,ξ_d⟩ with
  pr_D:x_i↦h(x_i)+ξ_i and L(N)(U,T,δ)=N⊗_DB⟨ξ_1,…,ξ_d⟩.
- `Crystalline.linearization_map`: A D-linear map N→N′ induces a map of O_crys-modules L(N)→L(N′),
  compatibly with composition and with the restriction maps.
- `Crystalline.linearization_augmentation`: For a crystal E in quasi-coherent O_crys-modules, the
  maps `E_T→pr_{T,*}pr_T^*E_T=pr_{T,*}pr_D^*Ẽ_D` define E→L(E_D), and `L(E_D⊗_DN)≅E⊗_{O_crys}L(N)` for
  every D-module N.
- `Crystalline.linearization_cohomology`: RΓ(Cris(X/S),L(N))≅N in degree 0: Γ(Cris(X/S),L(N))=N and
  Hⁱ(Cris(X/S),L(N))=0 for i>0.
- `Crystalline.linearization_resolution`: L(Ω^•_PD(D/A)), with
  `L(Ω^q_PD(D/A))_T=pr_{T,*}Ω^q_PD(D_T/T)` and the relative PD de Rham differentials, is a complex of
  O_crys-modules, and for every crystal E in quasi-coherent O_crys-modules the augmented complex
  `E→E⊗_{O_crys}L(Ω^•_PD(D/A))` is exact.

*Proof sketch.* Products exist in Cris(X/S) (*Small and big crystalline sites* (Layer CR.1)). For an
affine object with ring B and PD ideal J_B, the product with (X,Spec D,γ̄) is the PD envelope over
(B,J_B,δ) of the kernel of B[x_1,…,x_d]→B/J_B; with h:D→B (it exists by Stacks Lemma 60.5.6) this
kernel is J_BB[x]+(x_i−h(x_i)), and the envelope is B⟨ξ_i⟩ with ξ_i=x_i−h(x_i) (Stacks Lemma
60.2.5). Crystal property: for a morphism of affine objects given by B→B′ and h′ the composite,
B′⟨ξ⟩=B⟨ξ⟩⊗_BB′ compatibly with the maps from D. (2): L(N) satisfies the hypotheses of *Crystalline
cohomology from an embedding* (1), so RΓ is computed by the cosimplicial module n↦L(N)(X,Spec
D(n),γ̄)=N⊗_DD(n+1), using D(n)×D=D(n+1) (Stacks Lemma 60.17.2). This cosimplicial module is
homotopy equivalent to the constant one with value N: the codegeneracies D(n+1)→D(n) multiplying the
last two factors are an extra degeneracy. (3): `Ω^q_PD(B⟨ξ⟩/B)=B⟨ξ⟩⊗_PΩ^q_{P/A}` (*Differentials of a
smooth envelope* (Layer CR.1) over the base B), `E_{D_T}=E_T⊗_BB⟨ξ⟩` by the crystal property along
pr_T, and 0→E_T→E_T⊗_BB⟨ξ⟩→E_T⊗_BΩ¹_PD(B⟨ξ⟩/B)→⋯ is exact by *The relative PD Poincaré lemma* (1).
([Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.20, Lemma 60.20.1;
§60.2, Lemma 60.2.5; §60.5, Lemma 60.5.6; §60.17, Lemma 60.17.2; §60.21, Proposition 60.21.1 (the
lemmas used in the proof; the chapter contains no linearization functor).) *Needs:* *Universal
base-compatible divided power envelope* (DerivedDeRhamCohomology §PD.6); *Relative divided power
polynomial algebras* (DerivedDeRhamCohomology §PD.5); *Small and big crystalline sites* (Layer
CR.1); *Quasi-coherent and finite locally free crystals* (Layer CR.1); *PD stratifications on a
smooth lift* (Layer CR.1); *Universal PD differentials and the PD de Rham complex* (Layer CR.1);
*Differentials of a smooth envelope* (Layer CR.1); *The relative PD Poincaré lemma*; *Crystalline
cohomology from an embedding*.

**Checks.**

- `test_linearization_zero`: L(0)=0.
- `test_linearization_identity`: For A=F_p with the zero PD ideal and C=P=F_p[x], so that D=F_p[x]
  and X=Spec D: L(D)(X,X,∅)=F_p[x]⟨ξ⟩, where the two maps from F_p[x] are x↦x and x↦x+ξ; this is
  free of infinite rank over F_p[x] and is not D. RΓ(Cris(X/S),L(D))=F_p[x] in degree 0.
- `test_linearization_PD`: For the same data, L(D)(X,X,∅)=F_p[x]⟨ξ⟩ is not the polynomial ring
  F_p[x][ξ]: `ξᵖ=p!·ξ^{[p]}=0` in it, and `ξ^{[p]}` is not a polynomial in ξ.
- For the same data the complex L(Ω^•_PD(D/A)) on (X,X,∅) is F_p[x]⟨ξ⟩→F_p[x]⟨ξ⟩dξ,
  `ξ^{[n]}↦ξ^{[n−1]}dξ`, linear over F_p[x]; its kernel is F_p[x] and it is surjective, so
  O_crys→L(Ω^•_PD(D/A)) is exact on this object.
- RΓ(Cris(X/S),L(D))=F_p[x] in degree 0 for the same data.

**Linearization in a smooth ambient scheme.** Let p be nilpotent on the PD base S and i:X↪P a closed
S-immersion with P smooth of finite presentation over S. Let D be its PD envelope and N a
quasi-coherent O_D-module, viewed on X. For a crystalline thickening (U,T), form the PD envelope D_T
of U in T×_S P relative to the PD ideal on T. With projections a:D_T→T and b:D_T→D, define
L_i(N)_T=a_*b^*N. Its transition maps come from these envelopes. `Ru_{X/S,*}L_i(N)≅N` as sheaves of
base modules on X; higher direct images vanish. The linearizations of E_D⊗Ω^q_(P/S), with their
relative PD differential, form a resolution of a quasi-coherent crystal E. This also defines
linearization of the differential operators in the coefficient de Rham complex.

*Hypotheses.* p is prime and nilpotent on S; the closed immersion is compatible with the base PD
structure. P/S is smooth of finite presentation, D its ordinary PD envelope; E is a quasi-coherent
crystal. For p-adic bases this construction is taken levelwise, then as a derived inverse limit of
compatible coefficient complexes; exactness of an ordinary limit requires its stated Mittag–Leffler
hypotheses.

The API:

- `Crystalline.smooth_linearization_eval`: L_i(N)_T=a_*b^*N, with D_T the relative PD envelope of U
  in T×_SP; this formula defines the restriction maps.
- `Crystalline.smooth_linearization_map`: An O_D-linear map N→N′ induces L_i(N)→L_i(N′); identity
  and composition are preserved.
- `Crystalline.smooth_linearization_acyclic`: u_*L_i(N)=N and R^qu_*L_i(N)=0 for q>0 as base-module
  sheaves on X.
- `Crystalline.smooth_linearization_resolution`: The crystal transition isomorphisms identify
  E⊗L_i(Ω^q_(P/S)|_D) with L_i(E_D⊗Ω^q_(P/S)|_D); the augmented relative PD de Rham complex is
  exact.

*Proof sketch.* Work locally on P with an étale coordinate chart into affine space. Formal étaleness
lifts the ambient map to each thickening; envelope-etale-extension identifies D_T locally with the
corresponding PD polynomial envelope. The coordinate formula is the existing linearization. Its zero
higher-direct-image statement is the extra-degeneracy contraction of the envelope Čech complex. The
construction by a_*b^*N makes coordinate changes canonical. The PD Poincaré contraction on each
chart resolves E; the crystal transition maps identify its coefficients, so the local resolutions
glue. Apply the construction to the relative differential operator between successive forms. Finite
levels glue over X. For a p-adic base take Rlim of the compatible finite-level resolutions and use
the coherent derived limits of EnhancedDerivedSheaves E2:towers.1; do not infer exactness of
ordinary limits without a hypothesis. ([Bhatt–de Jong, *Crystalline cohomology and de Rham
cohomology*](https://arxiv.org/abs/1110.5001v1), §2, Remarks 2.9 and 2.18, pp.4,7; Theorem 3.6,
pp.8–9; [Le Stum–Quirós, *The filtered Poincaré lemma in higher
level*](https://arxiv.org/abs/math/0409564v1), §3, Definition 3.3 and Proposition 3.8, pp.10–12,
with m=0.) *Needs:* *Crystalline linearization along a smooth embedding*; *Étale extension of PD
envelopes* (DerivedDeRhamCohomology §PD.6); *The relative PD Poincaré lemma*; *Quasi-coherent and
finite locally free crystals* (Layer CR.1); *Universal PD differentials and the PD de Rham complex*
(Layer CR.1); EnhancedDerivedSheaves E2:towers.1 (`derivedTowerLimit`).

**Checks.**

- `test_smooth_linearization_zero`: L_i(0)=0 on every object.
- `test_smooth_linearization_line`: For X=P=A¹_(F_p), D=X and (U,T)=(X,X), L_i(O_X)_T=F_p[x]⟨ξ⟩ with
  the second coordinate x+ξ.
- `test_smooth_linearization_etale_chart`: Restrict the preceding construction to X=P=G_m. The value
  is F_p[x,x⁻¹]⟨ξ⟩, and x+ξ is invertible since ξ^p=0; thus the two ambient maps respect the
  inverted coordinate.
- The value at a trivial thickening of the affine line is O_X⟨ξ⟩, while Ru_*L(O_X)=O_X; evaluation
  is different from pushforward.

**Independence of the presentation and of the embedding.** In the setting of *Crystalline cohomology
from an embedding* (1)–(4), let F be a crystal in quasi-coherent O_crys-modules and (M,∇) the
associated module with connection over D. (1) For every PD A-algebra endomorphism ρ:D→D compatible
with the maps to C, the induced map `M⊗^∧_DΩ^•_D→M⊗^∧_{D,ρ}Ω^•_D` is a quasi-isomorphism (proof of
Stacks Lemma 60.21.4). (2) For ring maps A→P′→C with P′ smooth and P′→C surjective, a surjection
P→P′ from a polynomial algebra and a:D→D′, b:D′→D as in *Crystals, stratifications and
quasi-nilpotent connections* (Layer CR.1) (3), the base change maps `M′⊗^∧_{D′}Ω^•_{D′}→M⊗^∧_DΩ^•_D`
along b and `M⊗^∧_DΩ^•_D→M′⊗^∧_{D′}Ω^•_{D′}` along a are quasi-isomorphisms (Stacks Lemma 60.21.4).
(3) Each of the b+1 coprojections D→D(b) induces a quasi-isomorphism `M⊗^∧_DΩ^•_D→M⊗^∧_DΩ^•_{D(b)}`,
and they all induce the same map in the derived category, the inverse being induced by the
codiagonal D(b)→D (proof of Stacks Proposition 60.21.3). (4) Let P₁→C and P₂→C be surjections from
polynomial A-algebras, with completed envelopes D₁, D₂, and D₁₂ the completed envelope of the kernel
of P₁⊗_AP₂→C, and let (M₁,∇), (M₂,∇), (M₁₂,∇) be the modules with connection of F. Then D₁₂ is the
p-adic completion of a PD polynomial algebra over D₁ and over D₂, and the maps
`M₁⊗^∧Ω^•_{D₁}→M₁₂⊗^∧Ω^•_{D₁₂}←M₂⊗^∧Ω^•_{D₂}` are quasi-isomorphisms compatible with the
identifications of the three complexes with RΓ(Cris(X/S),F). (5) Any two PD A-algebra maps g,h:D₂→D₁
compatible with the maps to C induce the same map `M₂⊗^∧Ω^•_{D₂}→M₁⊗^∧Ω^•_{D₁}` in the derived
category.

*Hypotheses.* p is a prime number; (A,I,γ) is a PD ring with A a ℤ_(p)-algebra; A→C is a ring map
with IC=0 and p nilpotent in C; X=Spec C and S=Spec A (Stacks Situation 60.5.1). F is a crystal in
quasi-coherent O_crys-modules on Cris(X/S). P, P₁ and P₂ are polynomial A-algebras on any sets of
variables, each with a surjection onto C; P′ is a smooth A-algebra with a surjection onto C.

*Proof sketch.* (1): write ρ(x_i)=x_i+z_i with z_i in the PD ideal of D. Then ρ=τ∘σ with
σ:D→D⟨ξ_i⟩^∧, x_i↦x_i+ξ_i, and τ the PD D-algebra map with ξ_i↦z_i. The automorphism α of D⟨ξ_i⟩^∧
with x_i↦x_i−ξ_i, ξ_i↦ξ_i makes α∘σ the inclusion, so σ induces a quasi-isomorphism by *The relative
PD Poincaré lemma*; the inclusion D→D⟨ξ_i⟩^∧ is a section of τ, so τ induces one too. (2): a∘b=id
shows that one composite is the identity; the other composite is the map induced by ρ=b∘a, a
quasi-isomorphism by (1). (3): D(b) is the completion of a PD polynomial algebra over D through each
coprojection (Stacks Lemma 60.17.1), so *The relative PD Poincaré lemma* applies; each coprojection
is a section of the codiagonal. (4): P₁⊗_AP₂=P₁[y_j], and the kernel of P₁[y_j]→C is
J₁P₁[y_j]+(y_j−f_j) for lifts f_j∈P₁ of the images of the y_j, so D₁₂ is the completion of
`D_{P₁,γ}(J₁)⟨y_j−f_j⟩` (Stacks Lemma 60.2.5); apply *The relative PD Poincaré lemma*. The
identifications with RΓ of *Crystalline cohomology from an embedding* (1) and (3) are natural in the
presentation P→C. (5): g and h define (g,h):D₂(1)→D₁ with g=(g,h)∘p₀ and h=(g,h)∘p₁, and p₀, p₁
induce the same map in the derived category by (3). ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.21, proof of Lemma 60.21.4
and proof of Proposition 60.21.3; §60.17, Lemma 60.17.1; §60.2, Lemma 60.2.5.) *Needs:* *Crystalline
cohomology from an embedding*; *The relative PD Poincaré lemma*; *Crystals, stratifications and
quasi-nilpotent connections* (Layer CR.1); *PD stratifications on a smooth lift* (Layer CR.1);
*Relative divided power polynomial algebras* (DerivedDeRhamCohomology §PD.5); *Universal
base-compatible divided power envelope* (DerivedDeRhamCohomology §PD.6).

**Checks.**

- A smooth hypersurface through two embeddings: for k a perfect field of characteristic p, A=W_e(k)
  with the canonical PD structure on (p), f∈A[x_1,…,x_n] with nonzero reduction f̄, X=Spec
  k[x]/(f̄), and P′=A[x]/(f) smooth over A: the presentation P=A[x] gives D=A[x]⟨ξ⟩/(ξ−f), the
  presentation P′ gives D′=P′, and the PD map a:D→D′ (`ξ^{[m]}↦0` for m≥1) induces a quasi-isomorphism
  `Ω^•_PD(D/A)→Ω^•_{P′/A}`; both complexes compute RΓ_crys(X/Spec W_e(k),O_crys).

**De Rham computation in a smooth ambient embedding.** In the situation of
smooth-ambient-linearization, for a quasi-coherent crystal E with envelope value E_D and its
integrable PD connection, `Ru_{X/S,*}E≅(E_D⊗_(O_P)Ω^•_(P/S),∇)` as complexes of f⁻¹O_S-modules on X.
For p-adic bases and compatible crystals at finite level the analogous identity is the derived limit
of these complexes. If i₁:X↪P₁ and i₂:X↪P₂ are two smooth embeddings, pullback through X↪P₁×_SP₂
gives canonical quasi-isomorphisms between their envelope complexes, coherent for triples and
compatible with base change and open restriction.

*Hypotheses.* The hypotheses of smooth-ambient-linearization, with E a quasi-coherent crystal. For
the p-adic version, define both sides by Rlim of the compatible finite-level complexes.

*Proof sketch.* Apply Ru_* to the acyclic linearization resolution; degree q pushes forward to
E_D⊗Ω^q_(P/S), and its differential is the coefficient connection. Locally the comparison is the
same map as the envelope Čech–Alexander bicomplex comparison, since both restrict a crystal to the
same envelope and use its Taylor stratification. Bhatt–de Jong Theorems 2.12 and 3.6 verify this map
for a smooth ambient Z_p-scheme. The PD-base case uses the same PD contraction with the given base
powers. For two embeddings, project from the product envelope. On étale charts the additional
coordinates are PD variables, and their relative complex is contracted by ξ^[n]dξ↦ξ^[n+1]. Thus each
projection is a quasi-isomorphism. All maps come from envelope universal properties, so the diagrams
for triple products commute; Čech descent glues them. Take the compatible finite-level maps and Rlim
for the p-adic version. ([Bhatt–de Jong, *Crystalline cohomology and de Rham
cohomology*](https://arxiv.org/abs/1110.5001v1), §2, Theorem 2.12, Remarks 2.18–2.19, pp.4–7; §3,
Theorem 3.6 with proof, pp.8–9; [Le Stum–Quirós, *The filtered Poincaré lemma in higher
level*](https://arxiv.org/abs/math/0409564v1), §3, Corollaries 3.10–3.11, p.12, level m=0.) *Needs:*
*Linearization in a smooth ambient scheme*; *Crystalline cohomology from an embedding*;
*Independence of the presentation and of the embedding*; *Étale extension of PD envelopes*
(DerivedDeRhamCohomology §PD.6); EnhancedDerivedSheaves Layer E2 (*Bounded-below hypercover
descent*).

**Checks.**

- For a smooth lift X=P×_SS₀, the envelope is P with its extended base PD ideal, and the complex is
  ordinary de Rham with coefficients.
- On X=Spec F_p[t]/(t²) embedded in A¹_(F_p), the envelope complex, rather than Ω^•_X, computes
  crystalline cohomology.

**Čech–Alexander totalization and refinements.** Let X/S be a crystalline situation, E a
quasi-coherent crystal, and U_•→X a Zariski hypercover whose terms admit smooth ambient embeddings.
Form for each U_n its compatible envelope Čech–Alexander de Rham bicomplex C_n using all repeated
intersections and ambient tensor factors. Then RΓ_crys(X/S,E)≅Tot_n RΓ(U_n,C_n). If X is separated
and a finite totally ordered affine cover is used, the alternating Čech total complex of the
intersection envelope complexes also computes it. A refinement gives a canonical comparison
quasi-isomorphism; any two refinements agree in the derived category after passage to a common
refinement. At p-adic level use Rlim of the compatible finite-level totalizations.

*Hypotheses.* Hypercover descent is for bounded-below complexes; in the smooth finite-dimensional
case the de Rham direction is bounded. Use homotopy totalization; replace derived limits by ordinary
limits only when the stated acyclicity and surjectivity conditions hold.

*Proof sketch.* Each affine envelope bicomplex computes the local crystalline complex by
embedding-computation and smooth-ambient-comparison. Its cosimplicial positive-form rows contract as
in Bhatt–de Jong Lemmas 2.15–2.17, while the columns use the PD Poincaré lemma. Apply bounded-below
hypercover descent (EnhancedDerivedSheaves Layer E2) to the sheaf Ru_*E, obtaining the global
totalization. For a finite ordered cover the augmented alternating Čech resolution of sheaves is
exact stalkwise: choose a covering index and insert it as a contracting homotopy. Resolve the terms
for derived global sections, yielding the alternating model. A refinement maps the augmented
resolutions; the identity augmentation and common refinement give independence in the derived
category. Derived inverse limit preserves the compatible comparison equivalences. ([Bhatt–de Jong,
*Crystalline cohomology and de Rham cohomology*](https://arxiv.org/abs/1110.5001v1), §2, Lemmas
2.13–2.17 and proof of Theorem 2.12, pp.5–6; §3, proof of Theorem 3.6, pp.8–9; [Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.24, Remarks
60.24.3–60.24.4.) *Needs:* *Crystalline cohomology from an embedding*; *De Rham computation in a
smooth ambient embedding*; *Enhanced crystalline direct image and global sections*;
EnhancedDerivedSheaves Layer E2 (*Hypercover in a topos*);
EnhancedDerivedSheaves Layer E2 (*Bounded-below hypercover descent*).

**Checks.**

- For a one-member cover, the alternating totalization is its single envelope complex.
- Repeated intersections remain in the Čech–Alexander model; normalisation or the alternating model
  removes degeneracies without changing cohomology.
- Duplicating an affine member U as the cover (U,U) contracts the positive Čech direction;
  H⁰ of that direction is one copy of the affine crystalline complex, rather than two.

**Positive PD forms vanish after crystalline projection.** For X a Z_p-scheme with p locally
nilpotent and E a quasi-coherent crystal on (X/Z_p)_cris, Ru_*(E⊗Ω^q_crys)=0 for every q>0.
Consequently the projection of the crystalline de Rham complex (E→E⊗Ω¹_crys→⋯) to E[0] becomes an
isomorphism under Ru_*. Here u is ringed over f⁻¹O_(Spec Z_p), and Ω_crys is the PD differential
sheaf on thickenings. The same argument applies over a finite Z/p^e base at each compatible level.

*Hypotheses.* p is prime, X→Spec Z_p and p locally nilpotent on X. E is a crystal in quasi-coherent
modules; the assertion is after Ru_*, not a vanishing of Ω^q_crys itself.

*Proof sketch.* Use affine opens and the PD-envelope Čech–Alexander resolution. In degree one the
cosimplicial module of forms has basis dx_i(j), indexed by the tensor positions. The interval
homotopy keeps dx_i(j) before a chosen cut and sends the remaining generators to zero. Its two
endpoints are the identity and zero. Exterior powers, tensoring with the coefficient cosimplicial
module and completed limits of the explicit homotopy preserve this contraction. Thus every
positive-form row has zero cohomology. The first-quadrant bicomplex spectral sequence proves the
projection assertion; Zariski localisation proves the Ru_* statement. ([Bhatt–de Jong, *Crystalline
cohomology and de Rham cohomology*](https://arxiv.org/abs/1110.5001v1), §2, Lemmas 2.14–2.17 and
Example 2.16, pp.5–6; §3, Theorem 3.2, p.7.) *Needs:* *Universal PD differentials and the PD de Rham
complex* (Layer CR.1); *Crystalline cohomology from an embedding*; *Čech–Alexander totalization and
refinements*; *Quasi-coherent and finite locally free crystals* (Layer CR.1);
DerivedModuleAlgebra §S.1 (*The spectral sequence of a first-quadrant double complex*).

**Checks.**

- On a one-variable PD envelope Ω¹ is nonzero, despite its derived crystalline pushforward being
  zero.

**Change of topology for quasi-coherent crystals.** Restriction and étale extension give inverse
equivalences between quasi-coherent crystals on the small étale and small Zariski crystalline sites.
They preserve finite local freeness. For such a crystal E and every Zariski open V⊂X, the natural
map RΓ((V/S)_cris,Zar,E)→RΓ((V/S)_cris,ét,E_ét) is an isomorphism, functorial in V and E.
Equivalently Ru_Zar,*E agrees with Rν_*Ru_ét,*E_ét for ν:X_ét→X_Zar, as objects with base
coefficients f⁻¹O_S.

*Hypotheses.* The crystalline situation of etale-crystalline-site. Only quasi-coherent crystals are
compared; arbitrary sheaves on these sites need not have the same cohomology.

*Proof sketch.* On an affine thickening the crystal is a quasi-coherent module on T. Étale extension
is obtained by flat base change, and faithfully flat module descent makes it unique and compatible
on overlaps. Étale maps U′→U lift uniquely across the nil thickening U→T; this reduces extension
from Zariski to étale objects to the preceding descent. Restriction and extension are inverse by the
crystal transition isomorphisms. For affine thickenings, higher cohomology of quasi-coherent modules
vanishes in either topology (Stacks Theorem 59.22.4). Compute by the same PD-envelope Čech–Alexander
resolution in either topology. On general V, apply Zariski hypercover descent; the common affine
computation gives the derived comparison. The small-site hypercover and envelope comparison is
proved directly; no equivalence of topoi is claimed. Invariance of the étale site under locally
nilpotent closed thickenings and faithfully flat étale descent of quasi-coherent modules come from
SchemeAndStackFoundations Layer 2; extending the envelope Čech computation to the small étale
crystalline site and the cofinality of local envelope covers are part of this target. ([Stacks
Project](https://stacks.math.columbia.edu), Étale Cohomology, §59.22, Theorem 59.22.4 and proof;
[Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.17, Lemmas
60.17.2–60.17.3; §60.21, Proposition 60.21.1.) *Needs:* *The étale crystalline sites* (Layer CR.1);
*Quasi-coherent and finite locally free crystals* (Layer CR.1); *Crystalline cohomology from an
embedding*; *Étale extension of PD envelopes* (DerivedDeRhamCohomology §PD.6);
EnhancedDerivedSheaves Layer E2 (*Bounded-below hypercover descent*); SchemeAndStackFoundations
Layer 2.

**Checks.**

- For Spec F_p the étale extension of the unit crystal has value F_(p²) on its unramified field
  cover and invariants F_p.
- The comparison of the unit crystal on affine space uses the PD de Rham complex; it does not imply
  vanishing of crystalline cohomology of affine space.

### CR.DDR.4.1 The derived de Rham to crystalline map

For a ring map `A → B` of `ℤ/p^n`-algebras, `n ≥ 1`, construct `Comp_(B/A) : dR_(B/A) →
RΓ_crys((B/A)_crys, O_crys)`, `DerivedDeRham.crystallineComparisonMap`, as a natural map in `DF(A)`,
where the target is §CR.2.1's crystalline cohomology for the canonical divided powers on `p` with
its PD filtration, using `Crystalline.CrisCompatibleSite` of §CR.1.1. On a polynomial resolution `P•
→ B`, the map `Ω•_(P•/A) → Ω•_(P•/A) ⊗_(P•) D_(P•)(ker(P• → B))` is a map of strict Hodge-filtered
dg algebras into the envelope model. The PD Poincaré lemma (§CR.2.2) identifies the realization of
that model with the target in `DF(A)`. The target is classical crystalline cohomology of `B`, whose
products are the ringed-site cup products specified in *Crystalline cup products*. `Comp` is
multiplicative in the sense of the Conventions: it intertwines the shuffle product of
DerivedDeRhamCohomology §2.22 with these cup products in `D(A)` (`crystallineComparisonCup`). It is
not asserted to be a map of strict dg algebras into a strict model of the global target.

[Bhatt12], Proposition 3.25 and Remark 3.26, p.12.

*Needs:* DerivedDeRhamCohomology §2.22 (*De Rham cohomology from polynomial resolutions*);
DerivedModuleAlgebra §0.1 (*Simplicial polynomial resolutions*); DerivedDeRhamCohomology §§PD.5–PD.6; §CR.1.1,
§CR.2.1–§CR.2.2.

Prove the following named laws.

- `crystallineComparisonNatural`: a base-compatible square induces a commuting square of comparison
  maps.
- `crystallineComparisonHodge`: the map carries the Hodge filtration to the crystalline PD
  filtration.
- `crystallineComparisonSmooth`: for a smooth map of flat `ℤ/p^n`-algebras this is the PD Poincaré
  equivalence.
- `crystallineComparisonCup`: `Comp ∘ ∪_dR = ∪_crys ∘ (Comp ⊗^L Comp)` in `D(A)`, with `∪_crys` the
  cup ringed-site product specified in *Crystalline cup products*. Proof route: on the envelope
  model the map is a map of strict dg algebras. In each simplicial degree the identification of the
  envelope de Rham complex with crystalline cohomology (*Crystalline cohomology from an embedding*)
  carries its wedge product to the cup product, as in the proof of *Crystalline cup products* and in
  `Crystalline.crysCup_deRham` for smooth lifts. The shuffle product on the realization is then
  compared with the cup product degreewise.

**Checks.**

- `test_crys_map_base`: for `A → A` over `ℤ/p^n`, `Comp` is the identity on `A`.
- `test_crys_map_polynomial`: for `F_p → F_p[t]`, `Comp` identifies the ordinary complex with the
  crystalline PD de Rham model.
- `test_crys_map_nonlci`: for `F_p → F_p[x,y]/(x,y)²`, the map exists but cannot be an equivalence:
  `H^−1` of the source is nonzero (DerivedDeRhamCohomology §3.11) and the classical target is
  coconnective.

### CR.DDR.4.3 Regular quotients and classical PD envelopes

For `A → B = A/I` with `A` and `B` flat over `ℤ/p^n`, `n ≥ 1`, and `I` locally generated by a finite
regular sequence, prove that `Comp` identifies `dR_(B/A)` with the PD envelope `D_A(I)` compatible
with the divided powers on `p`. Its Hodge filtration is the PD filtration. Modulo `p` its conjugate
filtration is the PD conjugate filtration of DerivedDeRhamCohomology §4.2. The proof uses the
envelope, flatness, tensor-discreteness and reduction facts of DerivedDeRhamCohomology §PD.6.

[Bhatt12], Lemma 3.29, Claim 3.30, Lemmas 3.37–3.38, Corollary 3.40, pp.13–17.

*Needs:* §CR.DDR.4.1 (*The derived de Rham to crystalline map*); DerivedDeRhamCohomology §3.8
(*Regular quotient divided-power calculations*); DerivedDeRhamCohomology §2.23 (*Derived base change
and Künneth*); DerivedDeRhamCohomology §PD.6; §CR.2.1–§CR.2.2.

Lean: `DerivedDeRham.regularPdComparison`.

**Checks.**

- `test_regular_pd_zero`: for `I = 0`, `dR_(A/A) = A = D_A(0)`.
- `test_regular_pd_line`: for `A = F_p[t]`, `B = F_p` (`n = 1`), `dR_(B/A) ≃ D_A((t)) = F_p⟨t⟩`, the
  divided power polynomial algebra, in which `γ_p(t) ≠ 0` although `t^p = 0`; it is not the quotient
  ring `F_p`.
- `test_regular_pd_hodge`: in the same example the Hodge filtration is the PD filtration: `γ_n(t) ∈
  Fil_H^n` and `γ_n(t) ∉ Fil_H^(n+1)`.

### CR.DDR.4.4 Frobenius on nilpotent-p derived de Rham

For a `ℤ/p^n`-algebra `B`, polynomial crystalline Frobenius gives a natural endomorphism `φ` of
`dR_(B/(ℤ/p^n))`, commuting with the crystalline comparison map. For p-completed algebras use the
compatible finite reductions. On characteristic-p Cartier graded pieces record the Frobenius twist.
This construction does not identify the Hodge filtration with the conjugate or Nygaard filtration.

[Bhatt12], Proposition 3.47 and proof, p.19; Remark 9.8.

*Needs:* §CR.DDR.4.1 (*The derived de Rham to crystalline map*); DerivedDeRhamCohomology §2.22 (*De
Rham cohomology from polynomial resolutions*); DerivedDeRhamCohomology §2.26 (*p-completed derived
de Rham*); DerivedDeRhamCohomology §3.3 (*The derived Frobenius twist*); §CR.2.1.

Lean: `DerivedDeRham.deRhamFrobenius`.

Prove the following named laws.

- `deRhamFrobeniusNatural`: algebra maps over `ℤ/p^n` commute with `φ`.
- `deRhamFrobeniusCrystalline`: `Comp` intertwines `φ` and crystalline Frobenius.
- `deRhamFrobeniusLimit`: the finite `φ` maps induce the endomorphism of `Λ_p dR`.
- `deRhamFrobeniusDegreeZero`: modulo `p`, degree-zero polynomial functions map by `b ↦ b^p`.

**Checks.**

- `test_derham_frob_base`: on the base `ℤ/p^n`, the canonical Frobenius is the identity.
- `test_derham_frob_coordinate`: modulo `p` on `F_p[t]`, `t` maps to `t^p` and the differential of
  `t^p` is zero.
- `test_derham_frob_filtration_boundary`: for `F_p[t]/F_p`, polynomial Frobenius has `φ(t) = t^p`
  and `φ(dt) = 0`, while inverse Cartier sends `dt^(1)` to the nonzero class `[t^(p−1) dt]`, also at
  `p = 2` where it is `[t dt]`. A Frobenius endomorphism therefore cannot substitute for inverse
  Cartier or identify the two filtrations ([Bhatt12], Theorem 3.2, p.7).

### CR.DDR.5.8 Base-linear realization of crystalline direct image

For a morphism `f : X → S` of schemes with the PD base and crystalline site of §CR.2.1, construct
`DerivedDeRham.baseLinearSheafDerived.crystallineComparison`, comparing strict base-linear models
of crystalline direct image and global sections with their enhanced models. Use the common
coefficient categories and strict-model realization of DerivedDeRhamCohomology §5.8. For lci maps
of flat `ℤ/p^n`-schemes, `n ≥ 1`, this adapter transports the raw sheaves, Hodge stages, finite
quotients and products of §5.8.1 via `rawLciDeRhamRealization`; the source remains raw. It also
transports the separate Hodge-completed objects of §5.8 and their maps from the raw objects.
The coefficient sheaf is `f⁻¹O_S`: `Ru_{X/S,*}` lies in `D(X_Zar, f⁻¹O_S)` and `RΓ` lies
in `D(Γ(S,O_S))`. Compare strict models and the ringed-site enhancement in these categories. The
filtered comparison preserves levelwise quasi-isomorphisms, cofibres and products and commutes with
restriction and derived inverse limits, including finite reductions and their compatible p-adic
towers. Cotangent powers have their quasi-coherent `O_X`-module structures before restriction of
scalars; the full de Rham differential is base-linear.

[BL22], Appendix B, Construction B.7 and Remark B.8; Appendix E, Proposition E.16, pp.226, 235–236;
[StacksSites] §§21.17–21.19, Tags 06YS, 06YY, 07A5, 07A6, 0B6C, and §21.33, Lemmas 21.33.1–21.33.3,
Tags 0FPK, 0FPL, 0FPM; [StacksCoh] §20.25, Tag 01FP.

*Needs:* §CR.2.1 (*Enhanced crystalline direct image and global sections*); DerivedDeRhamCohomology
§5.8 (*Base-linear ringed-site realization*), §5.8.1 (*Raw lci sheaves and realization*),
§§1.14–1.15; DerivedModuleAlgebra §§0.2, 1.1, 1.T.1;
EnhancedDerivedSheaves §§0.1–0.3, E1.4 (`ClassicalDerived.enhancedCategory`,
`ClassicalDerived.replacements`, `ClassicalDerived.tensorHom`, `ClassicalDerived.inverseLimits`,
`enhancedPullback`, `enhancedPushforward`); SchemeAndStackFoundations §2.18.

**Checks.**

- `test_crystalline_realization_base`: on `X = S = Spec A`, the identity PD thickening realizes to
  `A` in degree zero, with its base-linear structure.
- `test_crystalline_realization_base_linear`: for a nonzero `A` and `B = A[t]`, the strict de Rham
  model has `d(t·1) = dt ≠ 0 = t·d(1)`, including on `D(t)`. Restriction and the crystalline
  realization therefore use `f⁻¹O_S`-linear maps.
- `test_crystalline_realization_tower`: a compatible tower of finite reductions has the same
  realized derived limit on both sides; its Milnor `lim¹` contribution is retained unless the
  cohomology tower is Mittag–Leffler.

### CR.DDR.5.9 The lci crystalline comparison theorem

For `n ≥ 1` and an lci morphism `f : X → S` of flat `ℤ/p^n`-schemes (finite presentation and local
regular immersion convention), the natural `Comp_f` from
`DerivedDeRham.rawLciDeRhamSheaves` of DerivedDeRhamCohomology §5.8.1 to crystalline direct image
is an isomorphism of Hodge-filtered objects of the base-linear filtered derived category (in
`DF(A)` after global sections when `S = Spec A`). It is compatible with `rawLciDeRhamCup` of
DerivedDeRhamCohomology §5.8.1 and *Crystalline cup products* (`crystallineComparisonCup`), with
base change in its Tor-independent crystalline range, and with Frobenius. The crystalline target
uses `Crystalline.CrisCompatibleSite` of §CR.1.1 (compatible PD thickenings over the canonical PD
base). This is [Bhatt12] Theorem 3.27: the exclusions are failure of the relative lci condition or
of flatness of either coefficient scheme over `ℤ/p^n`. The relative map need not be flat and its
target may be singular.

[Bhatt12], Theorem 3.27, Lemmas 3.39 and 3.44–3.45, proof pp.18–19.

*Needs:* §CR.DDR.4.1 (*The derived de Rham to crystalline map*); §CR.DDR.4.3 (*Regular quotients and
classical PD envelopes*); DerivedDeRhamCohomology §3.13 (*Smooth ordinary and completed de Rham
comparisons*); DerivedDeRhamCohomology §2.28 (*Derived de Rham transitivity filtrations*);
DerivedDeRhamCohomology §5.8.1 (*Raw lci sheaves and realization*: `rawLciDeRhamSheaves`,
`rawLciDeRhamAffine`, `rawLciDeRhamLocalization`, `rawLciDeRhamRealization`, `rawLciDeRhamCup`);
DerivedDeRhamCohomology §3.5 (*Derived Cartier graded pieces*); DerivedDeRhamCohomology §3.6.1
(*Relative conjugate transitivity*); §CR.2.1–§CR.2.2; §CR.DDR.5.8 (*Base-linear realization of
crystalline direct image*).

Construct the sheaf comparison using §CR.DDR.5.8 and the raw realization of
DerivedDeRhamCohomology §5.8.1.

- `crystallineComparisonSheaf`: the affine maps from raw `dR_(B/A)`, recovered by
  `rawLciDeRhamAffine`, glue from `rawLciDeRhamSheaves` in `D(X_Zar, f⁻¹O_S)` to crystalline
  direct image from `CrisCompatibleSite`. The localization and descent laws of
  `rawLciDeRhamLocalization` and the refinement-independent `rawLciDeRhamRealization` give this
  filtered map and its derived global sections in `DF(A)` when `S = Spec A`, preserving
  `rawLciDeRhamCup` and the crystalline cup products in `D(A)`.
  The separate map to DerivedDeRhamCohomology §5.8 is Hodge completion on affine charts.

Lean: `DerivedDeRham.lciCrystallineComparison`.

**Checks.**

- `test_lci_crys_polynomial`: a smooth polynomial algebra satisfies the hypothesis and the
  comparison is the PD Poincaré equivalence.
- `test_lci_crys_regular_quotient`: a regular quotient of flat `ℤ/p^n`-algebras is lci and recovers
  §CR.DDR.4.3. In particular `F_p[t] → F_p[t]/(t²)` lies in the theorem's scope: both coefficient
  algebras are flat over `F_p`, and `(t²)` is a regular immersion, although the relative map is
  nonflat and the target is singular.
- `test_lci_crys_raw_source`: for `F_p[t] → F_p`, `t ↦ 0`, the comparison source and crystalline
  target are the raw PD algebra `⊕_(j≥0) F_p·γ_j(t)`. The map to DerivedDeRhamCohomology §5.8
  instead has target `∏_(j≥0) F_p·γ_j(t)`; the sequence with all coefficients 1 is outside its
  image. Hodge completion therefore changes the source of the comparison ([Bhatt12], Lemma 3.29
  and Remark 3.33).
- `test_lci_crys_square_zero`: `F_p[x,y]/(x,y)²` is not lci and the comparison fails (§CR.DDR.4.1),
  including `p = 2`.

### CR.DDR.5.10 p-adic crystalline comparison by derived limits

Let `A → B` be a map of p-complete bounded-torsion rings whose derived reductions are ordinary flat
`ℤ/p^n`-algebras and lci for every `n`, compatibly. Then `Λ_p dR_(B/A) ≃ Rlim_n
RΓ_crys((B/p^n)/(A/p^n))`. The same assertion applies to compatible p-adic formal schemes with the
analogous finite-level hypotheses. The filtration is the derived limit of the Hodge/PD filtration.
The finite-level sources are the raw objects of DerivedDeRhamCohomology §5.8.1, identified by
§CR.DDR.5.9 before taking the p-adic derived limit. Each limit and base-change map is derived;
reduction of arbitrary rings to `π₀` is not allowed.

[Bhatt12], Definition 8.1, Lemma 8.3, Theorem 8.4, pp.31–32.

*Needs:* DerivedModuleAlgebra §1.3 (*The derived completion reflector*); DerivedModuleAlgebra §1.5
(*When ordinary quotient towers compute completion*); DerivedDeRhamCohomology §1.22 (*Valid
exchanges of completion and derived operations*); DerivedDeRhamCohomology §2.26 (*p-completed
derived de Rham*); DerivedDeRhamCohomology §2.23 (*Derived base change and Künneth*); §CR.DDR.5.9
(*The lci crystalline comparison theorem*); DerivedModuleAlgebra §1.1 (*Derived limits of towers*);
DerivedModuleAlgebra §1.T.1 / *The Milnor sequence for towers of complexes*.

Lean: `DerivedDeRham.pAdicCrystallineComparison`.

**Checks.**

- `test_padic_crys_identity`: for the identity of a p-complete algebra both sides are its
  p-completion.
- `test_padic_crys_smooth`: for `ℤ_p → ℤ_p⟨t⟩` the finite reductions compare levelwise.
- `test_padic_crys_lim_one`: the inverse limit is derived; a `lim¹` term of the levelwise cohomology
  is retained (as in `test_rlim_lim_one`).

### CR.2.3 Smooth lifts and the formal comparison

**Smooth-lift comparison and PD filtration.** (1) (Smooth lift; Stacks Remark 60.24.11.) Let p be a
prime, (A,I,γ) a PD ring with p nilpotent in A, S=Spec A, S₀=Spec A/I, Y a smooth S-scheme,
X=Y×_SS₀, and F a crystal in quasi-coherent O_crys-modules on Cris(X/S). Then γ extends to a PD
structure on the ideal of X in Y, so that (X,Y,γ) is an object of Cris(X/S); the restriction F_Y
carries a canonical integrable connection `∇:F_Y→F_Y⊗_{O_Y}Ω_{Y/S}`; and
`RΓ(Cris(X/S),F)≅RΓ(Y,F_Y⊗_{O_Y}Ω^•_{Y/S})` in D(A). (2) (Filtration on an envelope.) Let (A,I,γ) be a
PD ring, P an A-algebra, J⊂P an ideal containing IP, (D,J̄,γ̄) the PD envelope and `J̄^{[a]}` the PD
powers of J̄ (*Divided power filtration* (DerivedDeRhamCohomology §PD.4)), with `J̄^{[a]}=D` for a≤0. Then
`d(J̄^{[a]})⊂J̄^{[a−1]}·Ω¹_PD(D/A)`. Hence for every integer r the submodules
`Filʳ(Ω^q_PD(D/A))=J̄^{[r−q]}·Ω^q_PD(D/A)` form a subcomplex Filʳ of Ω^•_PD(D/A), decreasing in r,
equal to the whole complex for r≤0; and for a D-module M with integrable connection the submodules
`J̄^{[r−q]}·(M⊗_DΩ^q_PD(D/A))` form a subcomplex of M⊗_DΩ^•_PD(D/A). (3) If I=0 and J=0, so that D=P,
then `Filʳ=σ_{≥r}Ω^•_{P/A}`, the stupid truncation. In the situation of (1), for D=O_Y and J̄=IO_Y,
the image of Filʳ in `Ω^•_{X/S₀}` is `σ_{≥r}Ω^•_{X/S₀}`.

*Hypotheses.* (1): p is a prime number, (A,I,γ) a PD ring with p nilpotent in A, Y a smooth scheme
over S=Spec A, X=Y×_SSpec A/I, and F a crystal in quasi-coherent O_crys-modules on Cris(X/S). (2):
(A,I,γ) is a PD ring, P an A-algebra and J⊂P an ideal containing IP; q≥0 and r is any integer; M is
a D-module with an integrable connection relative to Ω¹_PD(D/A).

*Proof sketch.* (1), following the hint of Stacks Remark 60.24.11: Y is flat over S, so γ extends to
IO_Y (*Flat extension of divided powers* (DerivedDeRhamCohomology §PD.2)); the connection is that of
*Modules with integrable connection and their de Rham complexes* (Layer CR.1) on the object (X,Y,γ),
and `Ω¹_PD(O_Y/S)=Ω_{Y/S}` by *Differentials of a smooth envelope* (Layer CR.1); the map
`RΓ(Cris(X/S),F)→RΓ(Y,F_Y⊗Ω^•_{Y/S})` of *Crystalline cohomology from an embedding* (5) is an
isomorphism over affine opens by *Crystalline cohomology from an embedding* (4), so
`Ru_{X/S,*}F≅F_Y⊗Ω^•_{Y/S}` on Y_Zar=X_Zar. (2): `J̄^{[a]}` is generated by the products
`γ̄_{e₁}(x₁)⋯γ̄_{e_t}(x_t)` with x_j∈J̄ and Σe_j≥a; by `d(γ̄_n(x))=γ̄_{n−1}(x)dx` and the Leibniz rule,
d of b times such a product lies in `J̄^{[a]}Ω¹+J̄^{[a−1]}Ω¹=J̄^{[a−1]}Ω¹_PD(D/A)`. For coefficients
use ∇(jη)=dj∧η+j∇(η). (3): for I=0 and J=0 every positive PD power is zero. In (1) the PD powers
`(IO_Y)^{[a]}` with a≥1 lie in IO_Y and map to zero in O_X. Part (1) is Stacks Remark 60.24.11, stated
with a hint only; identifying the comparison map with the quasi-isomorphism of Stacks Lemma 60.21.4
for affine X is part of this target. ([Stacks Project](https://stacks.math.columbia.edu),
Crystalline Cohomology, §60.24, Remark 60.24.11 (Comparison; a remark with a hint of proof); [Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.6, the definition of `I^{[n]}`
before Lemma 60.6.3.) *Needs:* *Crystalline cohomology from an embedding*; *Universal PD
differentials and the PD de Rham complex* (Layer CR.1); *Differentials of a smooth envelope* (Layer
CR.1); *Modules with integrable connection and their de Rham complexes* (Layer CR.1); *Divided power
filtration* (DerivedDeRhamCohomology §PD.4); *Flat extension of divided powers*
(DerivedDeRhamCohomology §PD.2).

**Checks.**

- For S=S₀ (I=0) and Y=X smooth over S, `Filʳ=σ_{≥r}Ω^•_{X/S}`, and (1) reads
  `RΓ(Cris(X/S),O_crys)≅RΓ(X,Ω^•_{X/S})`.
- For k a perfect field of characteristic p, Y=S=Spec W_e(k) and X=Spec k: Filʳ is the ideal
  `(p)^{[r]}` of W_e(k), generated by the pⁿ/n! with n≥r.
- For D=A⟨x⟩ (P=A[x], J=(x), I=0): Filʳ is spanned in degree 0 by the `x^{[n]}` with n≥r and in degree
  1 by the `x^{[n]}dx` with n≥r−1, and `d(x^{[n]})=x^{[n−1]}dx` respects this.

**Filtered PD Poincaré lemma and comparison.** Let p∈I and p be nilpotent on the PD base (S,I,γ),
i:X↪P smooth as above, and E a finite locally free crystal. Give E on the crystalline site the
filtration J_crys^[r]E (J^[r]=O for r≤0). On its envelope de Rham complex set
Fil^r(E_D⊗Ω^q_(P/S))=J_D^[r−q]E_D⊗Ω^q_(P/S), where J_D=ker(O_D→O_X). Then
Ru_*(J_crys^[r]E)≅Fil^r(E_D⊗Ω^•_(P/S),∇) for every integer r, compatibly with r and with
smooth-ambient independence. In a smooth lift the filtration is the base PD filtration combined with
degree, and modulo the base PD ideal it becomes the Hodge filtration. The p-adic assertion is the
derived inverse limit of the finite-level filtered identities.

*Hypotheses.* p is prime, p∈I, and p is nilpotent on S for the finite-level statement. E is finite
locally free. The filtration J^[r]E is saturated and transversal for the T-inverse image of
filtrations; this does not assert equality with the ordinary pullback of filtered submodules. The
finite-level envelope, coefficient connection and sign convention are those of
smooth-ambient-comparison.

*Proof sketch.* The PD derivation sends J^[a] to J^[a−1]Ω¹, so the displayed degree-q submodules
form a subcomplex. Finite local freeness identifies their tensors with the corresponding ideal
multiples. On a PD coordinate ξ, h(ξ^[n]dξ)=ξ^[n+1] increases the PD order and lowers the form
degree by one, so it preserves total PD-plus-form weight. Tensor the coordinate contractions and use
the horizontal Taylor identification of coefficients. This proves the filtered Poincaré resolution.
For a locally free E, multiplication of PD ideals gives J^[i]·J^[r−i]E⊆J^[r]E, including i=r, where
J^[0]E=E. Consequently the sum defining the saturated T-inverse image is J_T^[r]E_T, which proves
saturation and transversality. Use Le Stum–Quirós 1997 Definitions 4.2.1–4.2.2 and Example 4.2.3,
rather than asserting that ordinary pullback preserves these submodules. The filtered-paper Theorem
3.5, Propositions 3.6,3.8 and Corollary 3.7 at m=0 apply; Corollaries 3.10–3.11 give the
closed-embedding comparison. The product-envelope homotopies preserve the same weight, giving
embedding independence of the filtration. Take Rlim for compatible finite levels in the complete
case. ([Le Stum–Quirós, *The filtered Poincaré lemma in higher
level*](https://arxiv.org/abs/math/0409564v1), §2, Proposition 2.10, pp.7–8; §3, Theorem 3.5,
Propositions 3.6,3.8, Corollary 3.7, Theorem 3.9 and Corollaries 3.10–3.11, pp.10–12 (m=0); [Le
Stum–Quirós, *Transversal crystals of finite
level*](https://www.numdam.org/article/AIF_1997__47_1_69_0.pdf), §4.2, Definitions 4.2.1–4.2.2,
Example 4.2.3 and Propositions 4.2.4–4.2.5, printed pp.90–91; §1.1, Definitions 1.1.3–1.1.6,
pp.72–73.) *Needs:* *Divided power filtration* (DerivedDeRhamCohomology §PD.4); *Divided power
stability of the weighted filtration* (DerivedDeRhamCohomology §PD.6); *Universal PD differentials
and the PD de Rham complex* (Layer CR.1); *Linearization in a smooth ambient scheme*; *De Rham
computation in a smooth ambient embedding*; *Smooth-lift comparison and PD filtration*;
EnhancedDerivedSheaves E2:towers.1 (`derivedTowerLimit`).

**Checks.**

- For X=P=Spec F_p[t], J_D=0, Fil¹ of the resulting de Rham complex is 0→Ω¹, whereas the unfiltered
  complex begins with O_X.
- On F_p⟨ξ⟩, ξ^[n]dξ of total weight n+1 contracts to ξ^[n+1] of the same weight.
- No higher-level m-PD structure is needed.

**Formal comparison with trace-free endomorphism coefficients.** (1) (Stacks Remark 60.24.14.) Let p
be a prime, (A,I,γ) a PD ring with A noetherian and p-adically complete and p nilpotent in A/I,
S=Spec A, S₀=Spec A/I, Y a proper smooth S-scheme, X=Y×_SS₀, and F a crystal of finite type in
quasi-coherent O_crys-modules on Cris(X/S). Then there is a coherent O_Y-module F_Y with an
integrable connection `∇:F_Y→F_Y⊗_{O_Y}Ω_{Y/S}` such that, for e≥e₀ with e₀ large enough that
p^e₀A⊂I and the quotient PD structures exist for all e≥e₀, F_Y/pᵉF_Y with its connection is the module
with connection over A/pᵉA of *Smooth-lift comparison and PD filtration* (1), and
`RΓ(Cris(X/S),F)≅RΓ(Y,F_Y⊗_{O_Y}Ω^•_{Y/S})` in D(A). (2) For A=W(k) with k a perfect field, I=(p) and
K=W(k)[1/p]: `RΓ(Cris(X/S),F)⊗_{W(k)}K≅RΓ(Y_K,F_{Y_K}⊗Ω^•_{Y_K/K})`. (3) (Trace-free endomorphisms.)
Let E be a crystal in finite locally free O_crys-modules of constant rank r≥1. The trace
tr:End(E)=E^∨⊗E→O_crys is a surjective map of crystals, End⁰(E):=Ker(tr) is a crystal in finite
locally free modules of rank r²−1, and (1) and (2) apply to End(E) and End⁰(E). The map
O_crys⊕End⁰(E)→End(E), (a,φ)↦a·id+φ, has cokernel O_crys/r·O_crys; it is an isomorphism if p does
not divide r, and it is not surjective if p divides r and X is nonempty.

*Hypotheses.* (1): p is a prime number; (A,I,γ) is a PD ring with A noetherian and p-adically
complete and p nilpotent in A/I; Y is proper and smooth over S=Spec A; X=Y×_SSpec A/I; F is a
crystal of finite type in quasi-coherent O_crys-modules on Cris(X/S). (2): A=W(k) for a perfect
field k of characteristic p, with the canonical PD structure on (p). (3): E is a crystal in finite
locally free O_crys-modules of constant rank r≥1.

*Proof sketch.* Choose e₀ so that X factors over S_e=Spec A/pᵉA and the quotient PD structures
exist for all e≥e₀. For every e≥e₀, F restricts to a crystal on Cris(X/S_e), and
*Smooth-lift comparison and PD filtration* (1) gives a coherent module with integrable connection
`(F_{Y_e},∇_e)` on Y_e=Y×_SS_e with `RΓ(Cris(X/S_e),F)≅RΓ(Y_e,F_{Y_e}⊗Ω^•_{Y_e/S_e})`, compatibly in e.
Grothendieck's existence theorem (AdicSpacesPartIII F0.7 (*Grothendieck’s existence theorem*)) gives
a coherent F_Y with `F_Y/pᵉ=F_{Y_e}`. The connections are algebraized through the O-linear
isomorphisms `p₁^*F_{Y_e}≅p₂^*F_{Y_e}` on the first-order neighbourhood of the diagonal of Y_e over
S_e that correspond to ∇_e: that neighbourhood is proper over S, so the compatible system of
isomorphisms comes from a unique isomorphism over S. RΓ(Cris(X/S),F)≅Rlim_eRΓ(Cris(X/S_e),F)
(*Enhanced crystalline direct image and global sections*), and
`RΓ(Y,F_Y⊗Ω^q_{Y/S})≅Rlim_eRΓ(Y_e,F_{Y_e}⊗Ω^q_{Y_e/S_e})` for every q by the theorem on formal
functions (AdicSpacesPartIII F0.6 (*The theorem on formal functions*)), hence for the de Rham
complex, which has finitely many terms. All towers here are indexed by e≥e₀; cofinality identifies
their limits with the full p-adic limits. (2): W(k)→K is flat and Y is quasi-compact and separated.
(3): tr is a map of crystals because it is compatible with pullback, it is surjective because
locally End(E) is a matrix algebra, and the kernel of a surjection of finite locally free modules is
finite locally free; tr(a·id+φ)=ra, so the image of O_crys⊕End⁰(E) is tr⁻¹(r·O_crys). Part (1) is
Stacks Remark 60.24.14, stated with a hint; the existence of F_Y by Grothendieck existence and the
algebraisation of the non-O-linear connection through the first-order neighbourhood of the diagonal
are part of this target. ([Stacks Project](https://stacks.math.columbia.edu), Crystalline
Cohomology, §60.24, Remark 60.24.14 (Complete comparison; a remark with a hint of proof), with
Remarks 60.24.10 and 60.24.11; [Esnault–Groechenig, *Rigid connections and
F-isocrystals*](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf), §7, p. 36 of
the author-hosted manuscript (the sentence before Definition 7.2); used again in the proof of
Proposition 7.4(2), p. 37.) *Needs:* *Smooth-lift comparison and PD filtration*; *Enhanced
crystalline direct image and global sections*; *Quasi-coherent and finite locally free crystals*
(Layer CR.1); *Modules with integrable connection and their de Rham complexes* (Layer CR.1);
AdicSpacesPartIII F0.6 (*The theorem on formal functions*); AdicSpacesPartIII F0.6 (*Coherent modules
on a locally noetherian formal scheme as compatible systems*); AdicSpacesPartIII F0.7
(*Grothendieck’s existence theorem*); DerivedDeRhamCohomology (§1.22 *Valid exchanges of
completion and derived operations*); AdicSpacesPartIII F0.6 (*Good filtrations and the
Mittag-Leffler property*); SchemeAndStackFoundations Layer 2 (*Tor-independent base change for
quasi-coherent complexes*).

**Checks.**

- For `Y=ℙ¹_{W(k)}` and F=O_crys: RΓ_crys(ℙ¹_k/Spec `W(k),O_crys)≅RΓ(ℙ¹_{W(k)},Ω^•`), with cohomology
  W(k) in degrees 0 and 2 and zero in degree 1.
- For E of rank one, End⁰(E)=0 and End(E)=O_crys.
- For E=O_crys⊕O_crys and p=2: tr(id)=2, and End(E)/(O_crys·id+End⁰(E))≅O_crys/2·O_crys≠0, so End(E)
  is not the direct sum of O_crys·id and End⁰(E).
- For `A=ℤ_p`, `I=(p²)` with restricted canonical divided powers, `Y=Spec ℤ_p` and
  `X=Spec(ℤ/p²)`, the finite-level comparison starts at `e₀=2`. There is no site `Cris(X/F_p)`
  compatible with this `A`-structure, while the cofinal tower gives the same formal comparison.

### Examples

- For `X` smooth over `S = Spec W_n(k)` with a smooth lift, `RΓ_crys(X/S, O)` is the de Rham
  cohomology of the lift (*Smooth-lift comparison and PD filtration*); for `X = ℙ^N_k` it is free
  over `W_n(k)` in even degrees `0, …, 2N` and zero otherwise.

### Dependencies

Layers CR.1; EnhancedDerivedSheaves (Layer E1, Layer E2); DerivedModuleAlgebra (§S.1);
SchemeAndStackFoundations (Layer 2); AdicSpacesPartIII (F0.6, F0.6, F0.6, F0.7);
DerivedDeRhamCohomology (Layer 1); Mathlib.

## Layer CR.3: Descent, finiteness, base change and Frobenius

This layer proves the structural theorems for crystalline cohomology of proper smooth schemes:
descent along finite affine covers, Mayer–Vietoris and étale hypercovers; derived base change and
perfectness; cup products, the Künneth formula, the crystalline first Chern class and the Leray
spectral sequence; the semilinear Frobenius; weak Lefschetz; and computations for curves, elliptic
curves over finite fields and the crystalline torsion surface of Bhatt–Morrow–Scholze.

### CR.3.1 Descent

**Crystalline cohomology from a finite affine cover: the alternating Čech complex.** Let (A,I,γ) be
a PD ring in which p is nilpotent, S=Spec A, S₀=Spec A/I, X a quasi-compact separated S₀-scheme and
E a crystal in quasi-coherent O_crys-modules on X/S. Choose a finite affine open cover X=⋃_(λ∈Λ)U_λ
with U_λ=Spec C_λ, a total order on Λ, and for each λ a surjection P_λ→C_λ from a polynomial
A-algebra. For λ₀<…<λ_n write U_(λ₀)∩…∩U_(λ_n)=Spec C_(λ₀…λ_n), let D_(λ₀…λ_n) be the PD envelope,
relative to γ, of the kernel of P_(λ₀)⊗_A…⊗_A P_(λ_n)→C_(λ₀…λ_n), and let (M_(λ₀…λ_n),∇) be the
D_(λ₀…λ_n)-module with integrable connection attached to E. Then RΓ_crys(X/S,E) is isomorphic in
D(A) to the total complex of the double complex M^(n,m)=⊕_(λ₀<…<λ_n)
M_(λ₀…λ_n)⊗_(D_(λ₀…λ_n))Ω^m_PD(D_(λ₀…λ_n)/A), with the Čech differential in n and the de Rham
differential of ∇ in m.

*Hypotheses.* p is a prime number; (A,I,γ) is a PD ring and p is nilpotent in A; S=Spec A, S₀=Spec
A/I. X is a quasi-compact separated S₀-scheme; hence every finite intersection of affine opens of X
is affine. E is a crystal in quasi-coherent O_crys-modules on the Zariski crystalline site of X/S.
The open cover is finite and by affine opens U_λ=Spec C_λ, its index set Λ is totally ordered, and
for each λ a surjection P_λ→C_λ from a polynomial A-algebra is given.

*Proof sketch.* RΓ_crys(X/S,E)=RΓ_crys(X/S,E⊗_(O_crys)Ω^•_(X/S)), because Ru_*(E⊗Ω^i_(X/S))=0 for
i>0 (Stacks Proposition 60.23.1). On U_(λ₀)∩…∩U_(λ_n) the cohomology of E⊗Ω^•_(X/S) is computed by
M_(λ₀…λ_n)⊗Ω^•_PD(D_(λ₀…λ_n)/A), by the affine computation for the embedding into Spec(P_(λ₀)⊗_A…⊗_A
P_(λ_n)) (Stacks Proposition 60.21.3; *Crystalline cohomology from an embedding* (Layer CR.2)). No
p-adic completion is needed because p is nilpotent in A. The U_λ form a finite totally ordered
covering of the final object of the crystalline topos by subobjects. The alternating Čech complex of
such a covering computes the cohomology of a bounded-below complex of sheaves when it does so on
every finite intersection. ([Stacks Project](https://stacks.math.columbia.edu), Crystalline
Cohomology, §60.24, Remark 60.24.4 (tag 07MN), Alternating Čech complex; notation from Remark
60.24.3 (tag 07MM).) *Needs:* *Crystalline cohomology from an embedding* (Layer CR.2); *Morphisms
and comparisons of crystalline sites* (Layer CR.1); EnhancedDerivedSheaves Layer E2 (*Hypercover in a topos*); EnhancedDerivedSheaves Layer E2 (*Bounded-below hypercover descent*); EnhancedDerivedSheaves Layer
E2.

**Checks.**

- If Λ has one element (X affine) the double complex is the single column M⊗Ω^•_PD(D/A), and the
  statement is the affine computation of *Crystalline cohomology from an embedding* (Layer CR.2)
  (Stacks Proposition 60.21.3).
- For X=P¹_k over A=W_n(k), k perfect of characteristic p, with the two standard charts Spec k[x],
  Spec k[y] and P₀=W_n[x], P₁=W_n[y]: D₀=W_n[x], D₁=W_n[y], D₀₁ is the PD envelope of (xy−1) in
  W_n[x,y], and the total complex has cohomology W_n, 0, W_n, 0 in degrees 0, 1, 2, 3, in agreement
  with RΓ_dR(P¹_(W_n)/W_n).
- For two disjoint affine points over k with structure coefficients and base W_n(k), the ordered
  two-member cover gives W_n(k)⊕W_n(k) in degree zero. The empty intersection contributes zero.

**Mayer–Vietoris for crystalline cohomology.** For X=U∪V an open cover and E an O_crys-module (or a
bounded-below coefficient complex), there is a natural distinguished triangle
RΓ_crys(X/S,E)→RΓ_crys(U/S,E)⊕RΓ_crys(V/S,E)→RΓ_crys((U∩V)/S,E)→RΓ_crys(X/S,E)[1], whose middle
arrow is res_U−res_V. It is compatible with coefficients, restrictions and PD base-change maps.

*Hypotheses.* Use bounded-below derived cohomology on the crystalline site and its Zariski
projection.

*Proof sketch.* The localisation of site-morphisms identifies restrictions to U,V and their
intersection. Apply the exact augmented two-open Čech resolution to Ru_*E. Stalkwise one of U,V
contains the point, giving a split exact complex with the stated difference map. Derived global
sections turn this resolution into the distinguished triangle. Functoriality of the resolution gives
all compatibilities. ([Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology,
§60.24, Remark 60.24.2; §60.9, Lemma 60.9.5.) *Needs:* *Morphisms and comparisons of crystalline
sites* (Layer CR.1); *Enhanced crystalline direct image and global sections* (Layer CR.2);
EnhancedDerivedSheaves Layer E1 (*The enhanced derived category*).

**Checks.**

- For U=X,V=∅ the triangle reduces to the identity on RΓ(X).
- For U=V=X the middle arrow is (a,b)↦a−b, and the first arrow is diagonal.

**Descent along étale hypercovers.** Let U_•→X be an étale hypercover of schemes over the PD base S
and E a quasi-coherent crystal. With pullback coefficients E_n on each U_n, the augmentation
RΓ_crys(X/S,E)→Tot_n RΓ_crys(U_n/S,E_n) is an isomorphism. Totalization is a homotopy limit. For
bounded-below coefficient complexes use their derived hypercohomology; in the p-adic setting use
compatible finite-level descent followed by Rlim. This does not assert h-, fppf- or proper descent
for arbitrary crystalline coefficients.

*Hypotheses.* The crystalline situation of etale-crystalline-site; U_• is an étale hypercover. The
coefficient complexes are bounded below; unbounded descent would need a separate convergence
theorem.

*Proof sketch.* Extend E to the étale crystalline site by etale-crystal-comparison. Its derived
projection to X_ét has étale-local evaluations given by the crystalline complexes on U_n. Apply the
bounded-below hypercover theorem of E2 to this projected complex. Use etale-crystal-comparison on X
and on each U_n to express the two sides in the original Zariski crystalline convention.
Compatibility of restriction supplies the augmentation. Take Rlim of these finite-level equivalences
in the complete case; homotopy limits commute with homotopy limits. ([Stacks
Project](https://stacks.math.columbia.edu), Étale Cohomology, §59.22, Theorem 59.22.4; [Bhatt–de
Jong, *Crystalline cohomology and de Rham cohomology*](https://arxiv.org/abs/1110.5001v1), §3, proof
of Theorem 3.6, pp.8–9.) *Needs:* *Change of topology for quasi-coherent crystals* (Layer CR.2);
*Enhanced crystalline direct image and global sections* (Layer CR.2); EnhancedDerivedSheaves Layer E2 (*Hypercover in a topos*); EnhancedDerivedSheaves Layer E2 (*Bounded-below hypercover descent*).

**Checks.**

- For an étale covering map U→X its full Čech nerve gives the usual descent totalization.
- A non-Zariski field extension F_(p²)/F_p is a descent example; deleting the higher overlap terms
  would give F_(p²), rather than F_p, for the unit crystal.

### CR.3.2 Base change and perfectness

**Derived crystalline base change.** Let (A′,I′,γ′)→(A,I,γ) be a homomorphism of PD rings, S′=Spec
A′, S=Spec A, X′ a scheme over A′/I′, X a scheme over A/I and f:X→X′ a morphism over Spec A/I→Spec
A′/I′, with p locally nilpotent on X and X′. For an O_crys-module E′ on X′/S′ with pullback
E=f_crys^*E′ put K′=RΓ_crys(X′/S′,E′) and K=RΓ_crys(X/S,E). (1) There is a canonical base-change map
K′⊗^L_(A′)A→K in D(A). (2) It is an isomorphism if all of the following hold: p is nilpotent in A′;
E′ is a crystal in quasi-coherent O_crys-modules; X′→Spec A′/I′ is quasi-compact and
quasi-separated; X=X′×_(Spec A′/I′)Spec A/I; E′ is a flat O_crys-module; X′ is smooth over A′/I′. The conditions
on X′, X and E′ hold when X′ is quasi-compact, quasi-separated and smooth over A′/I′, X is its base
change and E′ is a finite locally free crystal. (3) p-adic form: let A′ and A be p-adically complete
with p nilpotent in A′/I′ and in A/I, and assume the conditions of (2) except the nilpotence of p in
A′. For e so large that p^eA′⊂I′ is stable under γ′ put K′_e=RΓ_crys(X′/Spec(A′/p^e),E′). If K′ is a
perfect complex of A′-modules and K′⊗^L_(A′)A′/p^e→K′_e is an isomorphism for all such e, then
K′⊗^L_(A′)A→K is an isomorphism.

*Hypotheses.* (A′,I′,γ′)→(A,I,γ) is a homomorphism of PD rings, both Z_(p)-algebras: the ring map
sends I′ into I and commutes with the divided powers. X′ is a scheme over A′/I′ and X a scheme over
A/I, p is locally nilpotent on both, and f:X→X′ lies over Spec A/I→Spec A′/I′; E′ is an
O_crys-module on X′/Spec A′ and E=f_crys^*E′. For (2): p is nilpotent in A′; E′ is a crystal in
quasi-coherent O_crys-modules and is flat over O_crys; X′→Spec A′/I′ is quasi-compact,
quasi-separated and smooth; X=X′×_(Spec A′/I′)Spec A/I. For (3): A′ and A are p-adically complete, p is nilpotent
in A′/I′ and in A/I, the conditions of (2) other than the nilpotence of p in A′ hold, K′ is a
perfect complex of A′-modules, and K′⊗^L_(A′)A′/p^e→RΓ_crys(X′/Spec(A′/p^e),E′) is an isomorphism
for all e with p^eA′⊂I′ stable under γ′.

The API:

- `Crystalline.crysBaseChange_id`: For the identity of (A,I,γ) and the identity of X the base-change
  map K⊗^L_A A→K is the canonical isomorphism.
- `Crystalline.crysBaseChange_comp`: For PD homomorphisms (A″,I″,γ″)→(A′,I′,γ′)→(A,I,γ) and
  morphisms X→X′→X″ over them, the base-change map K″⊗^L_(A″)A→K is the composite of
  (K″⊗^L_(A″)A′)⊗^L_(A′)A→K′⊗^L_(A′)A with K′⊗^L_(A′)A→K.
- `Crystalline.crysBaseChange_natural`: A homomorphism E′₁→E′₂ of O_crys-modules on X′/S′ induces a
  commutative square of base-change maps; the base-change map is also natural for morphisms g:Y′→X′
  of schemes over A′/I′ and their base changes.

*Proof sketch.* (1): compose the base-change map of the commutative square of ringed topoi formed by
the crystalline topoi of X/S and X′/S′ and the Zariski topoi of S and S′ with the canonical map
Lf_crys^*E′→f_crys^*E′=E (Stacks Remark 60.24.8). (2): since p is nilpotent no completion occurs. Use quasi-compactness,
quasi-separatedness and Mayer–Vietoris to reduce to affine smooth closed fibres and finite affine
covers of their intersections. A smooth affine A′/I′-algebra lifts to a smooth A′-algebra B′:
I′ is a nil ideal, and the finite-presentation lifting problem descends to a finitely generated
nilpotent subideal, where the usual smooth lifting theorem applies. Let B=B′⊗_(A′)A. The
smooth-lift comparison identifies both crystalline complexes with the coefficient de Rham
complexes on these lifts. The evaluation M′ of the flat crystal is B′-flat, B′ is A′-flat, and
Ω^q_(B′/A′) is finite projective over B′. Thus this bounded de Rham complex is termwise A′-flat,
and its derived base change is M′⊗_(B′)B⊗_BΩ^•_(B/A). Descent identifies this comparison with the
canonical crystalline arrow. (3): K=Rlim_e K_e with
K_e=RΓ_crys(X/Spec(A/p^e),E), and by (2) for A′/p^e→A/p^e,
K_e≅K′_e⊗^L_(A′/p^e)A/p^e≅(K′⊗^L_(A′)A)⊗^L_A A/p^e, compatibly in e. As K′⊗^L_(A′)A is a perfect
complex and A=lim_e A/p^e with surjective transition maps, Rlim_e((K′⊗^L_(A′)A)⊗^L_A
A/p^e)=K′⊗^L_(A′)A. The lci generalization of Stacks Remark 60.24.9 is not asserted: its claim that arbitrary
lifts of the divided-power equations are Koszul-regular fails over nonflat PD bases. ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.24, Remark 60.24.8 (tag
07MS), Base change map, and Remark 60.24.9 (tag 07MU), Base change isomorphism, conditions (1)–(7)
and the hints; [Stacks Project](https://stacks.math.columbia.edu), Cohomology on Sites, Cohomology
on Sites, Remark 07A7 (base change map for a commutative square of ringed topoi).) *Needs:*
*Crystalline cohomology from a finite affine cover: the alternating Čech complex*; *Smooth-lift comparison and PD filtration* (Layer CR.2);
SchemeAndStackFoundations Layer 4 (§4.6, smooth lifting across nilpotent thickenings);
*Crystalline cohomology from an embedding* (Layer CR.2); *Differentials of a smooth envelope* (Layer
CR.1); EnhancedDerivedSheaves Layer E1 (*Derived sheaf tensor*);
EnhancedDerivedSheaves Layer E3 (*Coherent Beck–Chevalley comparisons*); DerivedDeRhamCohomology
Layer 1; *Mayer–Vietoris for crystalline cohomology*.

**Checks.**

- For X smooth, quasi-compact and quasi-separated over a perfect field k of characteristic p and σ
  the Frobenius of W_n(k), a PD automorphism of (W_n(k),(p)):
  RΓ_crys(X/W_n)⊗^L_(W_n,σ)W_n≅RΓ_crys(X^(p)/W_n), where X^(p)=X×_(k,Frob)k.
- For P¹_k and the reduction W_(n+1)(k)→W_n(k) the map is the isomorphism
  (W_(n+1)⊕W_(n+1)[−2])⊗^L_(W_(n+1))W_n≅W_n⊕W_n[−2].
- Over A′=F_p[t,ε]/(ε²,tε), I′=(ε) with square-zero powers, A=F_p[t], I=0,
  X′=X=Spec F_p and structure coefficients, the closed fibre is lci and the closed-fibre
  base change is Tor-independent. Nevertheless D′=A′⟨ξ⟩/(ξ−t) has
  Tor₂^(A′)(D′,A)≠0: in the presentation (t,ε) of I′≅F_p, the cycle
  (ξ^[p−1],0) is not a boundary, since boundary first coordinates lie in εD′ and
  ξ^[p−1] survives modulo ε. With no ambient differential coordinates the crystalline
  complexes are D′[0] and F_p⟨t⟩[0]. Smoothness excludes this example.

**Proper smooth crystalline perfectness and reductions.** (1) Let (A,I,γ) be a PD ring with A
Noetherian and p nilpotent in A, X a proper smooth scheme over A/I and E a finite locally free
crystal on X/Spec A. Then K=RΓ_crys(X/Spec A,E) is a perfect complex of A-modules. (2) Let (A,I,γ)
be a PD ring with A Noetherian and p-adically complete and p nilpotent in A/I, X proper smooth over
A/I and E a finite locally free crystal on X/Spec A. For e such that p^eA⊂I is stable under γ (all
sufficiently large e) put K_e=RΓ_crys(X/Spec(A/p^e),E). Then K=Rlim_e K_e is a perfect complex of
A-modules and K⊗^L_A A/p^e→K_e is an isomorphism for every such e. (3) Let k be a perfect field of
characteristic p, A=W(k), I=(p), X proper smooth over k of dimension ≤d and E a finite locally free
crystal on X/W(k). Then K=RΓ_crys(X/W(k),E) is a perfect complex of W(k)-modules of Tor-amplitude in
[0,2d], K⊗^L_(W(k))W_n(k)≅RΓ_crys(X/W_n(k),E) for all n≥1, and each H^i(K) is a finitely generated
W(k)-module, zero unless 0≤i≤2d. The modules H^i(K) can have p-torsion. (4) In the situation of (2),
for a homomorphism (A,I,γ)→(B,J,δ) of PD rings with B Noetherian and p-adically complete and p
nilpotent in B/J, the base-change map K⊗^L_A B→RΓ_crys(X_B/Spec B,E_B) of *Derived crystalline base
change* is an isomorphism, where X_B=X×_(Spec A/I)Spec B/J and E_B is the pullback of E.

*Hypotheses.* (1): (A,I,γ) is a PD ring, A is Noetherian and p is nilpotent in A; X is proper and
smooth over A/I; E is a crystal in finite locally free O_crys-modules on X/Spec A. (2), (4): (A,I,γ)
is a PD ring, A is Noetherian and p-adically complete, p is nilpotent in A/I; X is proper and smooth
over A/I; E is a crystal in finite locally free O_crys-modules on the crystalline site of X over
Spec A. In (4), (B,J,δ) satisfies the same conditions as (A,I,γ) and A→B is a homomorphism of PD
rings. (3): k is a perfect field of characteristic p, A=W(k) with I=(p) and its unique divided
powers (then p^eW(k) is stable under γ for every e≥1); X is proper and smooth over k; d≥0 with dim
X≤d.

*Proof sketch.* (1): by *Derived crystalline base change* (2) for (A,I,γ)→(A/I,0), K⊗^L_A
A/I≅RΓ_crys(X/Spec(A/I),E), and this is RΓ(X,E_X⊗Ω^•_(X/(A/I))) by *Smooth-lift comparison and PD
filtration* (Layer CR.2), X being its own smooth lift over A/I. Each RΓ(X,E_X⊗Ω^q_(X/(A/I))) is a
perfect complex of A/I-modules, because E_X⊗Ω^q is finite locally free and X→Spec A/I is proper and
flat; by the stupid filtration K⊗^L_A A/I is perfect. I is a nil ideal (x^n=n!·γ_n(x) and p is
nilpotent in A) and is finitely generated because A is Noetherian, hence nilpotent. A complex whose
derived reduction modulo a nilpotent ideal is perfect is perfect (Stacks, More on Algebra, Lemma
07LU). So K is perfect. (2): the K_e are perfect by (1), and K_(e′)⊗^L A/p^e≅K_e for e′≥e by
*Derived crystalline base change* (2). For a p-adically complete ring the derived limit of such a
tower is perfect and K⊗^L_A A/p^e≅K_e (Stacks, More on Algebra, Lemma 09AW). The tower is an object
of the derived category of inverse systems; by the corrected statement (B2.1) of Berthelot–Ogus,
Appendix B, it is isomorphic there to a system of bounded-above complexes of projective
A/p^e-modules with surjective transition maps, whose termwise limit represents K. (3): K⊗^L_W
k≅RΓ(X,E_X⊗Ω^•_(X/k)) lies in degrees [0,2d], since Ω^q=0 for q>d and coherent cohomology vanishes
above degree d; a perfect complex over the local ring W whose reduction to the residue field lies in
[0,2d] has Tor-amplitude in [0,2d]. (4): apply *Derived crystalline base change* (3); its two
assumptions are (2). The reduction to coherent cohomology uses proper flat perfectness and base
change (EnhancedDerivedSheaves §E1.9); the amplitude bound comes from
the preceding coherent-fibre calculation. The other inputs are perfectness modulo a nilpotent ideal
and compatible perfect towers (DerivedDeRhamCohomology Layer 1); the non-noetherian extension of
Stacks Remark 60.24.12 is not asserted. ([Stacks Project](https://stacks.math.columbia.edu),
Crystalline Cohomology, §60.24, Remark 60.24.12 (tag 07MX), Perfectness, and Remark 60.24.13 (tag
07MY), Complete perfectness; Remark 60.24.10 (tag 07MV) for the derived limit; [Berthelot–Ogus,
corrigendum to Appendix B of *Notes on crystalline
cohomology*](https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf), p. 1: the opening
paragraph and the replacement text for (B2.1); pp. 1–2: (B2.1a) and its proof.) *Needs:* *Derived
crystalline base change*; *Smooth-lift comparison and PD filtration* (Layer CR.2);
DerivedDeRhamCohomology Layer 1; EnhancedDerivedSheaves (§E1.9 *Perfect pushforward with proper support*, `perfect_proper_pushforward`); SchemeAndStackFoundations Layer 2
(*D_QCoh of a qcqs scheme is generated by one perfect complex*).

**Checks.**

- RΓ_crys(P¹_k/W(k))≅W⊕W[−2], and its reduction modulo p^n is W_n⊕W_n[−2]≅RΓ_crys(P¹_k/W_n(k)).
- Properness cannot be dropped: for X=A¹ over F_p and A=Z_p, H¹_crys(X/Z_p) is not p-adically
  separated, hence not a finitely generated Z_p-module (Stacks Example 60.22.2).
- Torsion occurs: for the surface H_k of BMS1 Theorem 2.10, H²_crys(H_k/W(k)) has torsion submodule
  k⊕k, although K is perfect.

### CR.3.3 Products, Chern classes and the Leray spectral sequence

**The crystalline first Chern class and the hyperplane class.** Let (S,I,γ) be a PD scheme over
Z_(p), S₀=V(I), and X an S₀-scheme on which p is locally nilpotent. On the crystalline site of X/S
let O_crys, O_X^cris and J_crys=ker(O_crys→O_X^cris) be the sheaves of *Structure, quotient and
PD-ideal sheaves* (Layer CR.1), δ the divided powers of J_crys, and u:(X/S)_crys→X_Zar the
projection. (1) The sequence of sheaves of abelian groups 1→1+J_crys→O_crys^*→(O_X^cris)^*→1 is
exact, and (O_X^cris)^*=u^(−1)O_X^*. (2) log:1+J_crys→J_crys,
log(1+x)=Σ_(n≥1)(−1)^(n−1)·(n−1)!·δ_n(x), is a homomorphism from the multiplicative group 1+J_crys
to the additive group J_crys; on each thickening the sum is locally finite because p is locally
nilpotent there. (3) The first Chern class c₁:Pic(X)=H¹(X,O_X^*)→H²_crys(X/S)=H²((X/S)_crys,O_crys)
is the composite of u^(−1), the connecting homomorphism H¹((O_X^cris)^*)→H²(1+J_crys) of (1), the
map induced by log, and the map induced by J_crys⊂O_crys. (4) The sign of the connecting
homomorphism is fixed by the following property: if p is nilpotent on S, Y is a smooth lift of X
over S and L̃ is an invertible O_Y-module lifting L, with trivialising sections s_λ on an open
cover, then under H²_crys(X/S)≅H²(Y,Ω^•_(Y/S)) the class c₁(L) is the class of the Čech 1-cocycle
(dlog(s_μ/s_λ))_(λ,μ) with values in Ω¹_(Y/S), the de Rham first Chern class of L̃. (5) c₁ is a
homomorphism of groups and is natural for the morphisms of crystalline topoi induced by commutative
squares of schemes over PD morphisms. (6) For a perfect field k of characteristic p and X proper
smooth over k, c₁(L)∈H²_crys(X/W(k)) is the compatible system of the classes
c₁(L)∈H²_crys(X/W_n(k)); the hyperplane class is h=c₁(O(1))∈H²_crys(P^d_k/W(k)).

*Hypotheses.* (S,I,γ) is a PD scheme over Z_(p), S₀=V(I), and X is an S₀-scheme on which p is
locally nilpotent; the crystalline site is that of *Small and big crystalline sites* (Layer CR.1),
whose thickenings have p locally nilpotent. L is an invertible O_X-module. In (4): p is locally
nilpotent on S, Y is smooth over S with Y×_S S₀=X, and L̃ is an invertible O_Y-module with L̃|_X≅L.
In (6): k is a perfect field of characteristic p, S=Spec W_n(k) or Spec W(k) with the PD ideal (p),
and X is proper and smooth over k; then H²_crys(X/W)=lim_n H²_crys(X/W_n), because the groups
H¹_crys(X/W_n) have finite length.

The API:

- `Crystalline.crysChern_log`: log((1+x)(1+y))=log(1+x)+log(1+y) for local sections x, y of J_crys,
  where log(1+x)=Σ_(n≥1)(−1)^(n−1)·(n−1)!·δ_n(x).
- `Crystalline.crysChern_add`: c₁(L⊗M)=c₁(L)+c₁(M), c₁(O_X)=0 and c₁(L^∨)=−c₁(L) for invertible
  O_X-modules L, M.
- `Crystalline.crysChern_pullback`: For a morphism g:X′→X over a morphism of PD schemes S′→S:
  g^*c₁(L)=c₁(g^*L) in H²_crys(X′/S′).
- `Crystalline.crysChern_fil`: c₁(L) lies in the image of H²((X/S)_crys,J_crys)→H²_crys(X/S).
- `Crystalline.crysChern_deRham`: If p is locally nilpotent on S, Y is a smooth lift of X over S and
  L̃ an invertible O_Y-module lifting L with trivialising sections s_λ, then under
  H²_crys(X/S)≅H²(Y,Ω^•_(Y/S)) of *Smooth-lift comparison and PD filtration* (Layer CR.2) c₁(L) is
  the class of the Čech 1-cocycle (dlog(s_μ/s_λ)) with values in Ω¹_(Y/S).
- `Crystalline.crysChern_reduction`: For k perfect and X proper smooth over k, the reduction
  H²_crys(X/W(k))→H²_crys(X/W_n(k)) sends c₁(L) to c₁(L), and for n=1 the image is the de Rham class
  c₁^dR(L)∈H²_dR(X/k).
- `Crystalline.crysChern_hyperplane`: h=c₁(O(1))∈H²_crys(P^d_k/W(k)) for a perfect field k of
  characteristic p and d≥1.

*Proof sketch.* Exactness of (1): a unit of O_U lifts locally to a section of O_T, which is a unit
because sections x of J_crys are locally nilpotent (x^n=n!·δ_n(x) and p is locally nilpotent on T);
the kernel of O_T^*→O_U^* is 1+J_T. The identification (O_X^cris)^*=u^(−1)O_X^* is the formula for
u^(−1) of *Morphisms and comparisons of crystalline sites* (Layer CR.1). log is a homomorphism: in
the PD polynomial algebra Z⟨x,y⟩ (*Relative divided power polynomial algebras*
(DerivedDeRhamCohomology §PD.5)), which is torsion-free, the identity
log((1+x)(1+y))=log(1+x)+log(1+y) holds degree by degree, since it holds over Q where δ_n(x)=x^n/n!;
map x, y to sections of J_crys. The terms with (n−1)! divisible by a power of p that annihilates O_T
vanish, so only finitely many terms occur locally. Define c₁ by (3). Additivity and naturality
follow from those of the connecting homomorphism and of log. Comparison (4) is proved on Čech
cocycles. Let {Y_λ} be an open cover of Y with trivialising sections s_λ of L̃ and
g_λμ=s_μ/s_λ∈O_Y^*(Y_λ∩Y_μ), a 1-cocycle lifting the cocycle ḡ_λμ of L. For λ=(λ₀,…,λ_a) put
Y_λ=Y_λ₀∩⋯∩Y_λ_a, X_λ=X∩Y_λ, and let D_λ(m) be the PD envelope of X_λ in the (m+1)-fold fibre
product of Y_λ over S, with projections p_i:D_λ(m)→Y_λ; D_λ(0)=Y_λ because γ extends to IO_Y. Since
Y_λ is smooth over S, every thickening of an open of X_λ maps Zariski-locally to (X_λ,Y_λ,γ), whose
self-products are the D_λ(m). So for every abelian sheaf F on the crystalline site, Zariski descent
on X and the Čech-to-derived map of this covering give an edge map from the Čech–Alexander bicomplex
C(F)=(∏F(D_λ(m)))_(a,m) to RΓ((X/S)_crys,F), natural in F and compatible with the connecting map of
a short exact sequence of sheaves on every cocycle that lifts to a cochain. For the sequence (1),
the cocycle (ḡ_λμ) of C(u^(−1)O_X^*) in bidegree (1,0) lifts to (g_λμ); its Čech coboundary is 1 and
its Alexander coboundary is h_λμ=p₁^*g_λμ·(p₀^*g_λμ)^(−1)∈(1+J_crys)(D_λμ(1)). Hence c₁(L) is the
image of the cocycle (log h_λμ) of C(O_crys) in bidegree (1,1). For the additive comparison take the
triple complex C(O_crys⊗Ω^•) of PD de Rham complexes of the D_λ(m): its quotient in form degree 0 is
C(O_crys), its quotient in Alexander degree 0 is the Čech–de Rham complex of Ω^•_(Y/S) on {Y_λ}, and
these two quotient maps induce the isomorphism H²_crys(X/S)≅H²(Y,Ω^•_(Y/S)) of *Smooth-lift
comparison and PD filtration* (*Crystalline cohomology from an embedding* (1), (3), (5);
*Čech–Alexander totalization and refinements*). The differential of an envelope is a PD derivation,
d(δ_n(x))=δ_(n−1)(x)dx, and sections of J_crys are locally nilpotent, so d log(1+x)=(1+x)^(−1)dx;
thus d(log h_λμ)=p₁^*dlog g_λμ−p₀^*dlog g_λμ is the Alexander coboundary of (dlog g_λμ). So (log
h_λμ), together with (dlog g_λμ) in Alexander degree 0 and form degree 1 carrying the sign of the
total differential, is a cocycle of the triple complex whose two quotients are (log h_λμ) and the
Čech–de Rham cocycle (dlog g_λμ); the sign convention of (4) is the one for which this sign is +.
Replacing s_λ by v_λs_λ changes (dlog g_λμ) by the Čech coboundary of (dlog v_λ), and a refinement
of the cover gives the same class. The comparison is one of classes, not of complexes of units:
Ru_*O_crys^* is not represented by the multiplicative de Rham complex O_Y^*→Ω¹_(Y/S)→Ω²_(Y/S)→⋯,
whose H¹ classifies line bundles with an arbitrary integrable connection, whereas invertible
crystals correspond to those whose connection is quasi-nilpotent (*Crystals, stratifications and
quasi-nilpotent connections* (Layer CR.1)); `test_crysChern_not_multiplicative` gives a connection
in the difference. (6): for X proper smooth over k the groups H¹_crys(X/W_n) are W_n-modules of
finite length (*Proper smooth crystalline perfectness and reductions*), so lim¹ vanishes and
H²_crys(X/W)=lim_n H²_crys(X/W_n); the classes c₁(L) are compatible by naturality. ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.10 (tag 07IN), Sheaves on
the crystalline site: the kernel `J_{X/S}` of `O_{X/S}→O_X` and its divided powers; [Gros, *Classes de
Chern et classes de cycles en cohomologie de Hodge–Witt
logarithmique*](http://www.numdam.org/item/MSMF_1985_2_21__1_0.pdf), Chapitre I, §5.1, printed p. 24
(PDF page 25): (5.1.8)–(5.1.9), the definition of c₁ by the exact sequence (1) and log; [Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.21, Propositions 60.21.1
(tag 07JN) and 60.21.3 (tag 07LG), Lemma 60.21.2 (tag 07LF); §60.17, Proposition 60.17.4 (tag 07JH);
[Stacks Project](https://stacks.math.columbia.edu), de Rham Cohomology, de Rham Cohomology, Section
"First Chern class in de Rham cohomology" (tag 0FLE); Lemma 0FMJ (de Rham cohomology of projective
space).) *Needs:* *Structure, quotient and PD-ideal sheaves* (Layer CR.1); *Morphisms and
comparisons of crystalline sites* (Layer CR.1); *Universal PD differentials and the PD de Rham
complex* (Layer CR.1); *Crystals, stratifications and quasi-nilpotent connections* (Layer CR.1);
*Enhanced crystalline direct image and global sections* (Layer CR.2); *Crystalline cohomology from
an embedding* (Layer CR.2); *Čech–Alexander totalization and refinements* (Layer CR.2); *Smooth-lift
comparison and PD filtration* (Layer CR.2); *Relative divided power polynomial algebras*
(DerivedDeRhamCohomology §PD.5); *Proper smooth crystalline perfectness and reductions*;
EnhancedDerivedSheaves Layer E2 (*Hypercover in a topos*).

**Checks.**

- `test_crysChern_P1`: For a perfect field k of characteristic p, H²_crys(P¹_k/W_n(k)) is free of
  rank one over W_n(k) with basis h=c₁(O(1)); under H²_crys(P¹_k/W_n)≅H²(P¹_(W_n),Ω^•) the class h
  is that of the Čech 1-cocycle dt/t on U₀∩U₁, t=T₁/T₀.
- `test_crysChern_twist`: c₁(O(m))=m·h in H²_crys(P^d_k/W(k)) for every integer m.
- `test_crysChern_mod_p`: For k a perfect field of characteristic p and S=Spec k: c₁(O(p))=0 in
  H²_crys(P¹_k/k)=H²_dR(P¹_k/k), although O(p) is not trivial and c₁(O(p))=p·h≠0 in
  H²_crys(P¹_k/W(k)); so c₁ is not injective, and the class over W(k) is not determined by its
  reduction modulo p.
- `test_crysChern_trivial`: c₁(O_X)=0 in H²_crys(X/S).
- `test_crysChern_not_multiplicative`: For S=Spec F_p (I=0) and X=Y=A¹_(F_p)=Spec F_p[t], the
  trivial line bundle with the integrable connection ∇=d+dt gives a nonzero class in H¹ of the
  multiplicative de Rham complex O_Y^*→Ω¹_(Y/S)→Ω²_(Y/S)→⋯ (dt is not dlog of a unit, as
  F_p[t]^*=F_p^*). For ∂=d/dt, ∇_∂=∂+1 and (∂+1)^p=∂^p+1=1 on F_p[t], so ∇ is not quasi-nilpotent
  and is not the connection of an invertible crystal on X/S: the map from invertible crystals to line
  bundles with integrable connection on Y is not surjective.
- For S=S₀=Spec k and X smooth over k, c₁ is the de Rham first Chern class H¹(X,O_X^*)→H²_dR(X/k)
  induced by dlog:O_X^*→Ω¹_(X/k).
- For P^d over W_n(k): h is the class of the Čech 1-cocycle dlog(T_μ/T_λ) on the standard cover; for
  d≥1, H²_crys(P^d_k/W_n(k)) is free of rank one with basis h.

**Crystalline cup products.** Let (A,I,γ) be a PD ring with A a Z_(p)-algebra, S=Spec A, X a scheme
over A/I on which p is locally nilpotent, and write K(E)=RΓ_crys(X/S,E) for an O_crys-module E. (1)
For O_crys-modules E, F the cup product is the map ∪:K(E)⊗^L_A K(F)→K(E⊗_(O_crys)F) in D(A) obtained
from the cup product RΓ(E)⊗^L RΓ(F)→RΓ(E⊗^L_(O_crys)F) of the ringed crystalline topos followed by
E⊗^L F→E⊗F; the unit is A→K(O_crys). (2) It is associative and unital, natural in E and F, and
compatible with pullback along the morphisms of crystalline topoi induced by commutative squares of
schemes over homomorphisms of PD rings. (3) On H^*_crys(X/S)=H^*(K(O_crys)) it is a graded A-algebra
structure, graded commutative: x∪y=(−1)^(ij)·y∪x for x∈H^i, y∈H^j. In particular 2·x∪x=0 for x of
odd degree, hence x∪x=0 when p is odd; for p=2 this gives only 2·x∪x=0. (4) For schemes X, Y over
A/I the external product of x∈H^*(K_X(E)) and y∈H^*(K_Y(F)) is
pr₁^*x∪pr₂^*y∈H^*(K_(X×Y)(pr₁^*E⊗pr₂^*F)), X×Y the fibre product over A/I.

*Hypotheses.* (A,I,γ) is a PD ring and A is a Z_(p)-algebra; X is a scheme over A/I on which p is
locally nilpotent. E and F are O_crys-modules on the crystalline site of X/Spec A; E⊗F is their
tensor product over O_crys. No flatness is assumed. In (4), Y is a second scheme over A/I on which p
is locally nilpotent. The coefficient de Rham comparison `Crystalline.crysCup_deRham` additionally
requires E and F to be quasi-coherent crystals, p nilpotent in A and a smooth lift Y of X over A.

The API:

- `Crystalline.crysCup_unit`: The class 1∈H⁰_crys(X/S), image of 1 under the unit A→K(O_crys),
  satisfies 1∪x=x=x∪1 for x∈H^*(K(E)), under O_crys⊗E≅E≅E⊗O_crys.
- `Crystalline.crysCup_graded_comm`: For x∈H^i_crys(X/S) and y∈H^j_crys(X/S): x∪y=(−1)^(ij)·y∪x; for
  O_crys-modules E, F the same holds between K(E⊗F) and K(F⊗E) through the exchange isomorphism.
- `Crystalline.crysCup_reduction`: For a homomorphism of PD rings (A′,I′,γ′)→(A,I,γ) and f:X→X′ over
  it, the base-change map K′(E′)⊗^L_(A′)A→K(f_crys^*E′) of *Derived crystalline base change* is
  compatible with cup products and units. In particular, for p^eA⊂I stable under γ, the reduction
  K(E)→RΓ_crys(X/Spec(A/p^e),E) carries cup products to cup products.
- `Crystalline.crysCup_assoc`: (x∪y)∪z=x∪(y∪z) in H^*(K(E⊗F⊗G)) for x∈H^*(K(E)), y∈H^*(K(F)),
  z∈H^*(K(G)); the same holds for the maps of complexes in D(A).
- `Crystalline.crysCup_pullback`: For a morphism g:X′→X of schemes over a homomorphism of PD rings
  and O_crys-modules E, F on X: g^*(x∪y)=g^*x∪g^*y and g^*1=1.
- `Crystalline.crysCup_deRham`: If p is nilpotent in A and Y is a smooth lift of X over A, then
  under H^*_crys(X/S)≅H^*(Y,Ω^•_(Y/A)) of *Smooth-lift comparison and PD filtration* (Layer CR.2)
  the cup product is induced by the wedge product of Ω^•_(Y/A). For quasi-coherent crystals E,F,
  use the same comparisons for E,F and E⊗F, with their canonical integrable connections on Y;
  the product is induced by `(e⊗ω)∧(f⊗η)=(e⊗f)⊗(ω∧η)` on their coefficient de Rham complexes.
- `Crystalline.crysCup_external`: For schemes X, Y over A/I and classes x∈H^*(K_X(E)),
  y∈H^*(K_Y(F)): x⊠y=pr₁^*x∪pr₂^*y∈H^*(K_(X×Y)(pr₁^*E⊗pr₂^*F)); on complexes, K_X(E)⊗^L_A
  K_Y(F)→K_(X×Y)(pr₁^*E⊗pr₂^*F).

*Proof sketch.* For a ringed topos (Sh(C),O) and a ring map A→Γ(C,O), derived global sections carry
a cup product RΓ(K)⊗^L_A RΓ(M)→RΓ(K⊗^L_O M), which is associative and graded commutative (Stacks,
Cohomology on Sites, Section 'Cup product', tags 0FPJ, 0FPL, 0FPM). Apply it to the crystalline
topos with O=O_crys and compose with E⊗^L F→E⊗F. For E=F=O_crys compose with the multiplication
O_crys⊗O_crys→O_crys; it is commutative, so H^*_crys(X/S) is graded commutative, and x∪x=−x∪x for x
of odd degree. For quasi-coherent crystals, the comparisons of *Crystalline cohomology from an
embedding* (Layer CR.2) and *Smooth-lift comparison and PD filtration* (Layer CR.2) intertwine cup
products with `(e⊗ω)∧(f⊗η)=(e⊗f)⊗(ω∧η)`. For the structure crystal use the multiplicative
truncation `Ω^•_(X/S)→O_crys[0]`: its derived direct image under Ru_* is an isomorphism, which is
inverted and then composed with restriction to the thickening. For coefficients the truncations
`E⊗Ω^•_(X/S)→E[0]`, and those for F and E⊗F, commute with the wedge pairing and become
isomorphisms after Ru_* (Stacks 07LM). Compatibility with the
base-change map of *Derived crystalline base change* is the compatibility of the cup product with a
commutative square of ringed topoi (Stacks tag 0H9A). ([Stacks
Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.23, Proposition 60.23.1 (tag
07LM) and the restriction map (60.23.2.1); §60.21, Proposition 60.21.3 (tag 07LG); [Stacks
Project](https://stacks.math.columbia.edu), Cohomology on Sites, Cohomology on Sites, Section "Cup
product" (tag 0FPJ); Lemmas 0FPL (associativity), 0FPM (commutativity) and 0H9A (base change).)
*Needs:* *Enhanced crystalline direct image and global sections* (Layer CR.2); *Crystalline
cohomology from an embedding* (Layer CR.2); *Smooth-lift comparison and PD filtration* (Layer CR.2);
*Derived crystalline base change*; *The crystalline first Chern class and the hyperplane class*;
EnhancedDerivedSheaves Layer E1 (*Derived sheaf tensor*);
EnhancedDerivedSheaves Layer E1.

**Checks.**

- `test_crysCup_point`: For X=Spec k, k a perfect field of characteristic p, and S=Spec W(k):
  K(O_crys)=W(k) in degree 0 and the cup product is the multiplication of W(k).
- `test_crysCup_P1`: On P¹×P¹ over a perfect field k, with h_a=pr_a^*h and
  h=c₁(O(1))∈H²_crys(P¹/W(k)): h₁∪h₂=h₂∪h₁ generates H⁴_crys(P¹×P¹/W(k))≅W(k), and h₁∪h₁=0=h₂∪h₂.
- `test_crysCup_P2`: On P² over a perfect field k: h∪h generates H⁴_crys(P²/W(k))≅W(k) and h∪h∪h=0,
  for h=c₁(O(1)).
- `test_crysCup_odd`: For a geometrically connected smooth proper curve C over a perfect field k and
  x,y∈H¹_crys(C/W(k)): x∪y=−y∪x and x∪x=0 in H²_crys(C/W(k)).
- For `S=Spec F_p` with zero PD ideal and `X=Y=Spec F_p[t]`, let `E=J_crys`, `F=O_crys`.
  Although `E_Y=0`, the exact sequence `0→J_crys→O_crys→O_crys/J_crys→0` has global-section
  map `F_p[t^p]→F_p[t]`, so the connecting class of `t` is nonzero in `H¹_crys(X/S,J_crys)`.
  Its cup product with `1` is itself: arbitrary modules admit cup products but do not satisfy
  this coefficient de Rham comparison. Also `dt≠0`, so the degree-zero identity cannot define
  a map of complexes `O_crys[0]→Ω^•_(X/S)` on this identity thickening.
- H^*_crys(P^d_k/W(k))=W[h]/(h^(d+1)) as a graded ring, h=c₁(O(1)), k a perfect field of
  characteristic p.

### CR.3.4 Frobenius

**Semilinear crystalline Frobenius and linearization.** Let (A,I,γ) be a PD ring with A a
Z_(p)-algebra and p∈I, and σ:A→A a homomorphism of PD rings with σ(x)≡x^p modulo pA. Let S=Spec A,
S₀=Spec A/I and X an S₀-scheme. (1) The absolute Frobenius F_X of X lies over the absolute Frobenius
F_(S₀) of S₀, which Spec(σ) lifts; it induces a morphism of crystalline topoi
(F_X)_crys:(X/S)_crys→(X/S)_crys. (2) An F-crystal on X/S relative to σ is a crystal E in finite
locally free O_crys-modules together with a map Φ:(F_X)_crys^*E→E; it is nondegenerate if there are
an integer i≥0 and a map V:E→(F_X)_crys^*E with V∘Φ=p^i. The structure sheaf with the canonical
isomorphism (F_X)_crys^*O_crys=O_crys is an F-crystal. (3) For an F-crystal (E,Φ) and
K=RΓ_crys(X/S,E) the linearised Frobenius F_K:K⊗^L_(A,σ)A→K is the composite of three maps: the
base-change map K⊗^L_(A,σ)A→RΓ_crys(X^(1)/S,E^(1)), where X^(1)=X×_(S₀,F_(S₀))S₀ and E^(1) is the
pullback of E along the projection X^(1)→X over Spec(σ); the pullback
RΓ_crys(X^(1)/S,E^(1))→RΓ_crys(X/S,(F_X)_crys^*E) along the relative Frobenius F_(X/S₀):X→X^(1); and
the map induced by Φ. (4) The composite F:K→K⊗^L_(A,σ)A→K is σ-semilinear on cohomology:
F(ax)=σ(a)F(x).

*Hypotheses.* (A,I,γ) is a PD ring, A a Z_(p)-algebra, p∈I. σ:A→A is a ring endomorphism with
σ(I)⊂I, σ∘γ_n=γ_n∘σ on I for all n≥0, and σ(x)≡x^p modulo pA for all x∈A. X is a scheme over A/I (so
p=0 on X). (E,Φ) is an F-crystal on X/Spec A relative to σ: E is a crystal in finite locally free
O_crys-modules and Φ:(F_X)_crys^*E→E is O_crys-linear. No nondegeneracy is assumed.

The API:

- `Crystalline.crysFrobenius_semilinear`: The endomorphism F of H^*(K) induced by K→K⊗^L_(A,σ)A→K is
  additive and satisfies F(ax)=σ(a)·F(x) for a∈A.
- `Crystalline.crysFrobenius_linearize`: F_K:K⊗^L_(A,σ)A→K is an A-linear map in D(A), the composite
  of the base-change map for Spec(σ), the pullback along the relative Frobenius F_(X/S₀):X→X^(1) and
  the map induced by Φ.
- `Crystalline.crysFrobenius_lift`: Assume p is nilpotent in A. Let Y be a smooth lift of X over A
  and φ̃:Y→Y a morphism over Spec(σ) whose reduction modulo p is the absolute Frobenius of Y⊗_A A/p.
  Under RΓ_crys(X/S)≅RΓ(Y,Ω^•_(Y/A)) of *Smooth-lift comparison and PD filtration* (Layer CR.2) the
  semilinear Frobenius of the structure crystal is induced by φ̃^*:Ω^•_(Y/A)→Ω^•_(Y/A), and
  φ̃^*(Ω^q_(Y/A))⊂p^q·Ω^q_(Y/A) for every q≥0.
- `Crystalline.crysFrobenius_natural`: For a morphism g:X′→X of schemes over A/I and a morphism of
  F-crystals g_crys^*(E,Φ)→(E′,Φ′), the induced map K→K′ commutes with the linearised Frobenius
  maps; in particular g^*∘F=F∘g^* on H^*_crys.
- `Crystalline.crysFrobenius_cup`: For F-crystals (E,Φ_E), (E′,Φ_(E′)) and the F-crystal
  (E⊗E′,Φ_E⊗Φ_(E′)): F(x∪y)=F(x)∪F(y); and F(1)=1 in H⁰_crys(X/S).
- `Crystalline.crysFrobenius_chern`: F(c₁(L))=p·c₁(L) in H²_crys(X/S) for every invertible
  O_X-module L, because F_X^*L≅L^(⊗p).
- `Crystalline.crysFrobenius_finite_field`: For k=F_(p^f), A=W(k) and σ the Witt vector Frobenius,
  the iterate F^f is W(k)-linear on H^*_crys(X/W(k)).

*Proof sketch.* The square formed by F_X, F_(S₀) and the structure map X→S₀ commutes and Spec(σ) is
a PD morphism lifting F_(S₀); *Morphisms and comparisons of crystalline sites* (Layer CR.1) gives
(F_X)_crys. F_X is the composite of the relative Frobenius F_(X/S₀):X→X^(1) and the projection
X^(1)→X over F_(S₀); hence F_(X/S₀)^*E^(1)=(F_X)_crys^*E. Compose the base-change map of *Derived
crystalline base change* (1) for the projection over Spec(σ), the pullback along F_(X/S₀), and
RΓ_crys(X/S,Φ). Semilinearity: K→K⊗^L_(A,σ)A, x↦x⊗1, is σ-semilinear and the three maps of (3) are
A-linear. Functoriality in X and compatibility with cup products follow from the corresponding
properties of pullback, of the base-change map and of the cup product. If p is nilpotent in A, Y is
a smooth lift of X and φ̃:Y→Y lies over Spec(σ) and reduces modulo p to the absolute Frobenius of
Y⊗_A A/p, functoriality of the comparison of *Smooth-lift comparison and PD filtration* (Layer CR.2)
identifies F with the map induced by φ̃^* on Ω^•_(Y/A); φ̃^*(dy)=d(y^p+p·z)∈p·Ω¹_(Y/A), so
φ̃^*(Ω^q_(Y/A))⊂p^q·Ω^q_(Y/A). ([Stacks Project](https://stacks.math.columbia.edu), Crystalline
Cohomology, §60.26, Situation 60.26.1 (tag 07N2), Definition 60.26.2 (tag 07N3), and the first
paragraph of the proof of Theorem 60.26.4 (tag 07N5).) *Needs:* SchemeAndStackFoundations §0.29
(`absoluteFrobenius`, `schemeFrobeniusTwist`, `relativeFrobenius`); *Morphisms and comparisons of
crystalline sites* (Layer CR.1); *Rational crystals and nondegenerate F-crystals* (Layer CR.1);
*Derived crystalline base change*; *Enhanced crystalline direct image and global sections* (Layer
CR.2); *Crystalline cup products*; *The crystalline first Chern class and the hyperplane class*;
*Smooth-lift comparison and PD filtration* (Layer CR.2).

**Checks.**

- `test_crysFrobenius_point`: For X=Spec k, k perfect of characteristic p, A=W(k), σ the Witt vector
  Frobenius: K=W(k) and F=σ; it is not W(k)-linear when k≠F_p.
- `test_crysFrobenius_P1`: For P¹ over a perfect field k and A=W(k): F=σ on H⁰_crys=W and F(h)=p·h
  for h=c₁(O(1))∈H²_crys(P¹/W(k)).
- `test_crysFrobenius_Pd`: On H^(2i)_crys(P^d/W(k))=W·h^i, k perfect: F(a·h^i)=σ(a)·p^i·h^i for
  0≤i≤d.
- `test_crysFrobenius_singular`: For X=Spec F_p[x,y]/(x²,xy,y²), A=Z_p with I=(p) and σ=id: the
  Frobenius F of H⁰_crys(X/Z_p) is not injective.
- For P^d over k: F(h^i)=p^i·h^i on H^(2i)_crys(P^d/W(k))=W·h^i, 0≤i≤d.

**Proper smooth crystalline Künneth formula.** Let k be a perfect field of characteristic p, W=W(k),
X and Y proper smooth k-schemes and E, F finite locally free crystals on X/W and Y/W; write
K(X,E)=RΓ_crys(X/W,E). The external cup product K(X,E)⊗^L_W K(Y,F)→K(X×_kY,pr₁^*E⊗pr₂^*F),
x⊗y↦pr₁^*x∪pr₂^*y, is an isomorphism in D(W). It is compatible with cup products, with the
reductions ⊗^L_W W_n(k), and, when (E,Φ_E) and (F,Φ_F) are F-crystals relative to the Witt vector
Frobenius σ, with the linearised Frobenius maps of *Semilinear crystalline Frobenius and
linearization* for (E,Φ_E), (F,Φ_F) and (pr₁^*E⊗pr₂^*F,Φ_E⊗Φ_F). Consequently there are short exact
sequences 0→⊕_(i+j=n)H^i(K(X,E))⊗_W
H^j(K(Y,F))→H^n(K(X×Y,pr₁^*E⊗pr₂^*F))→⊕_(i+j=n+1)Tor₁^W(H^i(K(X,E)),H^j(K(Y,F)))→0.

*Hypotheses.* k is a perfect field of characteristic p; W=W(k) with the PD ideal (p). X and Y are
proper and smooth over k. E and F are crystals in finite locally free O_crys-modules on X/W and Y/W.
For the Frobenius compatibility, (E,Φ_E) and (F,Φ_F) are F-crystals relative to the Witt vector
Frobenius σ in the sense of *Semilinear crystalline Frobenius and linearization*.

*Proof sketch.* The map is the external product of *Crystalline cup products*. Compatibility with
cup products and reductions follows from naturality of the cup product under pullback and base
change; compatibility with Frobenius from naturality of the Frobenius map and F_(X×Y)=F_X×F_Y. Both
sides are perfect complexes of W-modules (*Proper smooth crystalline perfectness and reductions*),
hence derived p-complete; by derived Nakayama it suffices to prove that the map is an isomorphism
after ⊗^L_W k. After ⊗^L_W k both sides are de Rham cohomology (*Proper smooth crystalline
perfectness and reductions* (3), *Smooth-lift comparison and PD filtration* (Layer CR.2)), and the
map is RΓ(X,E_X⊗Ω^•_X)⊗_k RΓ(Y,F_Y⊗Ω^•_Y)→RΓ(X×Y,(pr₁^*E_X⊗pr₂^*F_Y)⊗Ω^•_(X×Y)), induced by the
wedge product. Ω^n_(X×Y/k)=⊕_(a+b=n)pr₁^*Ω^a_X⊗pr₂^*Ω^b_Y compatibly with the differentials, and
RΓ(X,G)⊗_k RΓ(Y,H)≅RΓ(X×Y,pr₁^*G⊗pr₂^*H) for quasi-coherent G, H on the quasi-compact separated
k-schemes X, Y; filter both sides by form degree. The exact sequences are the Künneth sequences of
the derived tensor product of two perfect complexes over the discrete valuation ring W. The coherent
Künneth isomorphism is proved directly by finite affine covers: on a product of affine intersections
sections are the tensor product over k, which is exact over a field; the two alternating Čech
complexes tensor to the product double complex. Thus no general K-theory projection formula is used.
([Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.24, Remark 60.24.9
(tag 07MU), Base change isomorphism, and Remark 60.24.12 (tag 07MX), Perfectness; [Stacks
Project](https://stacks.math.columbia.edu), de Rham Cohomology, de Rham Cohomology, Section "Künneth
formula" (tag 0FM9), Lemma 0FMB.) *Needs:* *Crystalline cup products*; *Proper smooth crystalline
perfectness and reductions*; *Derived crystalline base change*; *Semilinear crystalline Frobenius
and linearization*; *Smooth-lift comparison and PD filtration* (Layer CR.2);
SchemeAndStackFoundations Layer 2 (*Tor-independent base change for quasi-coherent complexes*);
DerivedModuleAlgebra (§1.3 *The derived completion reflector*); DerivedDeRhamCohomology
Layer 1 (§1.22 *Valid exchanges of completion and derived operations*); *Crystalline cohomology from
a finite affine cover: the alternating Čech complex*.

**Checks.**

- H^*_crys(P¹×P¹/W)=W[h₁,h₂]/(h₁²,h₂²), h_a=pr_a^*h.
- The tensor product must be derived: for the surface H_k of BMS1 Theorem 2.10, the cokernel of
  ⊕_(i+j=3)H^i⊗_W H^j→H³_crys(H_k×H_k/W), H^i=H^i_crys(H_k/W), contains
  Tor₁^W(H²,H²)≅Tor₁^W(k²,k²)≅k⁴, so this map is not surjective.

### CR.3.5 Computations and tests

**Crystalline weak Lefschetz with bounded line-bundle cohomology.** Let k be a perfect field of
characteristic p, X a smooth projective variety of dimension d over k and L an invertible
O_X-module. Let i_L≥0 be an integer such that for every coherent O_X-module F one has H^i(X,F⊗L^n)=0
for all i>i_L and all sufficiently large n. Then there is an integer n₀ such that for every n≥n₀ and
every smooth H⊂X that is the zero scheme of a section of L^n, the restriction map
H^j_crys(X/W(k))→H^j_crys(H/W(k)) is an isomorphism for j<d−i_L−1 and is injective with torsion-free
cokernel for j=d−i_L−1. If L is ample one can take i_L=0.

*Hypotheses.* k is a perfect field of characteristic p; X is a smooth projective variety of
dimension d over k; L is an invertible O_X-module. i_L≥0 is an integer such that for every coherent
O_X-module F there is n(F) with H^i(X,F⊗L^n)=0 for all i>i_L and all n≥n(F). H is the zero scheme of
a section of L^n and is smooth over k; n≥n₀, where n₀ depends on X and L only.

*Proof sketch.* Let K be the cone of RΓ_crys(X/W)→RΓ_crys(H/W). It is a perfect, hence derived
p-complete, complex of W-modules; for such K, K∈D^(≥m) with H^m(K) torsion-free is equivalent to
K⊗^L_W k∈D^(≥m). With m=d−i_L−1 the long exact cohomology sequence gives the statement. K⊗^L_W k is
the cone of RΓ_dR(X/k)→RΓ_dR(H/k) (*Proper smooth crystalline perfectness and reductions* (3),
*Smooth-lift comparison and PD filtration* (Layer CR.2)). By the filtrations by form degree it
suffices that the cone K_j of RΓ(X,Ω^j_X)→RΓ(H,Ω^j_H) lies in D^(≥d−i_L−j−1) for every j≥0. Let
I≅L^(−n) be the ideal sheaf of H. By Serre duality, for a finite locally free G and r≥1, RΓ(X,I^r⊗G)
is dual to RΓ(X,L^(rn)⊗G^∨⊗Ω^d_X) shifted by d, so it lies in D^(≥d−i_L) for n large. For fixed r≥1
prove RΓ(X,I^r⊗Ω^(j−1)_H)∈D^(≥d−i_L−j) for n large, by induction on j≥1: for j=1 use
0→I^(r+1)→I^r→I^r⊗O_H→0; for j>1 use
0→I^(r+1)⊗Ω^(j−2)_H→I^r⊗(Ω^(j−1)_X/I·Ω^(j−1)_X)→I^r⊗Ω^(j−1)_H→0, where RΓ of the middle term lies in
D^(≥d−i_L−1) by 0→I^(r+1)⊗Ω^(j−1)_X→I^r⊗Ω^(j−1)_X→I^r⊗(Ω^(j−1)_X/I·Ω^(j−1)_X)→0. The kernel of
Ω^j_X→Ω^j_H is an extension of I⊗Ω^(j−1)_H by I⊗Ω^j_X, so RΓ of it lies in D^(≥d−i_L−j) and
K_j∈D^(≥d−i_L−j−1). Only the sheaves Ω^j_X, 0≤j≤d, and the exponents r≤d+1 occur, so one n₀ serves
for all. ([Bhatt–Morrow–Scholze, *Integral p-adic Hodge
theory*](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §2.2, Lemma 2.12 and its
proof, pp. 17–18.) *Needs:* *Proper smooth crystalline perfectness and reductions*; *Derived
crystalline base change*; *Smooth-lift comparison and PD filtration* (Layer CR.2);
SchemeAndStackFoundations Layer 2 (*Proper coherent Serre duality*); SchemeAndStackFoundations
Layer 2 (*Coherent Grothendieck duality*: f^! ≅ f^*(−) ⊗ Ω^d[d] for smooth f);
DerivedModuleAlgebra (§1.2 *Derived ideal completeness*); DerivedModuleAlgebra (§1.3 *The derived completion reflector*); AdicSpacesPartIII F0.6 (*Finiteness and uniform Serre
vanishing for graded coherent modules over a proper scheme*).

**Checks.**

- L ample: i_L=0 by Serre vanishing, so for a smooth hypersurface section H of sufficiently large
  degree the restriction is an isomorphism in degrees j<d−1 and injective with torsion-free cokernel
  in degree d−1.
- For a smooth plane curve C⊂P² of sufficiently large degree: H⁰_crys(P²/W)≅H⁰_crys(C/W), and
  H¹_crys(C/W), the cokernel of 0=H¹_crys(P²/W)→H¹_crys(C/W), is torsion-free.
- In BMS1 §2.2 the lemma is applied with i_L=1 to the pullback L_E to X_E=(P×E)/G of an ample
  invertible module on X=P/G.

**Vanishing of the top coherent de Rham differential.** If X is smooth proper equidimensional of
dimension d over a field k of positive characteristic, d:H^d(X,Ω^(d−1)_(X/k))→H^d(X,Ω^d_(X/k)) is
zero. Thus the coherent trace factors through top de Rham cohomology. For a geometrically connected
smooth proper curve this gives H¹_dR dimension 2g.

*Hypotheses.* k has positive characteristic; X smooth proper of pure dimension d.

*Proof sketch.* Reduce to a connected component and to its finite separable constant field, so the
top Hodge cohomology is one dimensional. Use the trace of the finite syntomic relative Frobenius on
forms: it commutes with d, is zero in degree d−1 and surjective in degree d. Finite pushforward
preserves cohomology; H^d is right exact by cohomological dimension, so the top trace is nonzero.
The commuting square forces the displayed differential to be zero. For a curve, combine this with
d:H⁰(O)→H⁰(Ω¹)=0 and the coherent dimensions from JacobianChallenge Layer B. The finite syntomic
trace on the de Rham complex of relative Frobenius, zero below top degree and surjective in top
degree ([Stacks Project](https://stacks.math.columbia.edu), de Rham Cohomology, Lemma 50.19.5), is
part of this target. ([Stacks Project](https://stacks.math.columbia.edu), de Rham Cohomology,
§50.20, Lemma 50.20.3 (0FW6), positive-characteristic proof; §50.19, Lemma 50.19.5.) *Needs:*
SchemeAndStackFoundations Layer 2 (*Proper coherent Serre duality*); DerivedDeRhamCohomology
Layer 3 (§3.6 *The classical smooth Cartier isomorphism*).

**Checks.**

- The map on forms is k-linear; its vanishing cannot be obtained by treating it as an O_X-linear map
  in Serre duality.

**Smooth proper lifts of curves over Witt vectors.** For a geometrically connected smooth proper
curve C over a perfect field k of characteristic p, there exists a smooth proper projective
W(k)-scheme C̃ with C̃⊗k≅C. A lift is chosen, not canonical. For every n, coherent cohomology of O
and Ω¹ on C̃_n has ranks 1,g,g,1 and is free over W_n(k); the Hodge–de Rham spectral sequence
degenerates and H²_dR(C̃_n/W_n(k)) is free of rank one.

*Hypotheses.* k perfect of characteristic p; C smooth proper geometrically connected, genus g.

*Proof sketch.* Use SchemeAndStackFoundations Layer 4 (*Deformations of smooth schemes and of
line bundles*): the obstruction H²(C,T_C) vanishes by dimension one, so lift successively to W_n.
Lift an ample bundle because H²(C,O_C)=0. AdicSpacesPartIII §F0.8 (`grothendieck-algebraization`) algebraizes the compatible polarized system; smoothness follows
from the local lifting criterion and properness. Apply the relative coherent cohomology and base
change of JacobianChallenge Layer C, together with Serre duality for smooth proper curves, to obtain
the free Hodge groups and their ranks. The differential on H⁰(O) is zero. Vanishing on H¹(O)
requires the relative trace/residue calculation, not just O-linear Serre duality; the field version
is *Vanishing of the top coherent de Rham differential* and the Witt-thickening version is proved
here. With that input the two-column spectral sequence degenerates. The vanishing of d : H¹(O) →
H¹(Ω¹) for a smooth proper geometrically connected curve over W_n(k), by an integral trace and
residue calculation compatible with reduction, is part of this target; coherent base change alone
does not give it. ([Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology,
§60.24, Remark 60.24.11 (07MW); [Stacks Project](https://stacks.math.columbia.edu), de Rham
Cohomology, §50.20, Lemma 50.20.3 (0FW6).) *Needs:* SchemeAndStackFoundations Layer 4
(*Deformations of smooth schemes and of line bundles*); AdicSpacesPartIII §F0.8 (`grothendieck-algebraization`);
JacobianChallenge Layer C (*Relative coherent cohomology and base change*);
SchemeAndStackFoundations Layer 2 (*Proper coherent Serre duality*); *Vanishing of the top
coherent de Rham differential*.

**Checks.**

- For C=P¹_k take P¹_W; for a nonsingular Weierstrass curve lift its coefficients and unit
  discriminant.
- At genus zero the Hodge ranks are 1,0,0,1; H¹_dR of the lift vanishes and H²_dR is W_n.
- For a smooth genus-one Weierstrass lift, the four Hodge groups have rank one and
  H¹_dR has rank two; a cubic with nonunit discriminant fails the smooth-lift hypothesis.

**Crystalline Leray spectral sequence.** For a morphism f:Y→X of schemes over a PD base S and a
bounded-below crystalline coefficient complex E, the morphism of crystalline topoi gives
E₂^(a,b)=H^a_crys(X/S,R^b f_crys,*E)⇒H^(a+b)_crys(Y/S,E). For a proper smooth f whose relative
cohomology is finite locally free and commutes with PD base change, the R^b f_crys,*E are finite
locally free crystals. For an étale-locally trivial E₀-torsor with E₀ a smooth proper elliptic
curve, R¹ f_crys,*O is the constant rank-two crystal H¹_crys(E₀/S); its descent transition maps are
trivial because translations act trivially on H¹.

*Hypotheses.* E bounded below; use the finite-level PD sites first and a derived limit for p-adic
cohomology. Finite local freeness of higher direct images is asserted only with the displayed
flatness and base-change conditions, not for every proper smooth family.

*Proof sketch.* Compose derived direct images for the crystalline site morphisms. Filter the
bounded-below derived pushforward by its Postnikov truncations and apply RΓ on the base; the
Grothendieck spectral sequence of a composite of derived functors
(SchemeAndStackFoundations §2.2, `leray_spectral_sequence`; EnhancedDerivedSheaves E1 supplies the
coherent composition comparison) gives convergence after shifting the lower bound. For the
underlying abelian sheaves, inverse image is exact, so direct image preserves injectives; this
verifies the acyclicity condition for its composite with global sections. Transport the resulting
spectral sequence and coefficient structure through the ringed-site derived comparison.
Restriction to fibres gives the edge maps. Under the relative perfectness and base-change conditions, evaluate on each PD thickening
and descend the relative cohomology modules as crystals. In the torsor case étale local sections
reduce to the product with E₀; the needed elliptic Hodge ranks and relative degeneration are the
smooth-curve-lift calculation. This invokes only the curve part, not the torsion surface that
consumes Leray. Translations on E₀ act identically on H¹: Künneth gives H¹(E₀×E₀)=H¹(E₀)⊕H¹(E₀), and
addition pulls a class back to the sum of its two components, as seen by restriction to the axes. A
constant section has zero positive-degree pullback. This makes torsor descent constant.
The relative proper smooth base change on all PD thickenings for the elliptic torsor of Bhatt–Morrow–Scholze §2.2,
identifying R¹ with the constant crystal, is part of this target. ([Bhatt–Morrow–Scholze, *Integral
p-adic Hodge theory*](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §2.2, proof
of Theorem 2.10, pp.17–19.) *Needs:* *Morphisms and comparisons of crystalline sites* (Layer CR.1);
*Change of topology for quasi-coherent crystals* (Layer CR.2); DerivedModuleAlgebra §S.1
(*The spectral sequence of a first-quadrant double complex*); SchemeAndStackFoundations §2.2
(`leray_spectral_sequence`); EnhancedDerivedSheaves Layer E1 (coherent composition);
*Smooth proper lifts of curves over Witt vectors*.

**Checks.**

- For f=id the spectral sequence has only b=0.
- For f:E₀×X→X the edge map H¹(E₀×X)→H⁰(X,H¹(E₀)) is restriction to a fibre.
- For f:P¹_k→Spec k over W_n(k) and E=O_crys, E₂ has W_n(k) in b=0,2 and a=0,
  with all other entries zero; it recovers the two nonzero projective-line groups.

**Proper smooth tests and a crystalline torsion surface.** Let k be a perfect field of
characteristic p, W=W(k), σ its Frobenius and F the semilinear Frobenius of *Semilinear crystalline
Frobenius and linearization*. (a) For d≥0: H^*_crys(P^d_k/W)=W[h]/(h^(d+1)) as a graded W-algebra,
with h=c₁(O(1)) in degree 2; thus H^(2i)=W·h^i for 0≤i≤d, the odd groups vanish, and F(h)=p·h. (b)
For a geometrically connected smooth proper curve C of genus g over k: H⁰_crys(C/W)=W, H¹_crys(C/W)
is free of rank 2g, H²_crys(C/W) is free of rank 1, and F(H²_crys(C/W))=p·H²_crys(C/W). (c) For an
elliptic curve E over k with origin 0: H¹_crys(E/W) is free of rank 2 and H²_crys(E/W)=W·e with
e=c₁(O_E([0])) and F(e)=p·e. (d) Let O be the ring of integers of a complete algebraically closed
non-archimedean extension C of Q_p, with residue field k. The smooth projective surface H over O
constructed in BMS1 §2.2 satisfies H¹_crys(H_k/W(k))=0 and H²_crys(H_k/W(k))_tors≅k⊕k, while
H²_ét(H_C,Z_p)_tors≅Z/p².

*Hypotheses.* k is a perfect field of characteristic p; W=W(k) with PD ideal (p); σ is the Witt
vector Frobenius. (b): C is a smooth proper geometrically connected curve over k and g=dim_k
H¹(C,O_C). (c): E is an elliptic curve over k: a smooth proper geometrically connected curve of
genus 1 with a rational point 0. (d): O is the ring of integers of a complete algebraically closed
non-archimedean extension C of Q_p and k is its residue field. E/O is an elliptic curve with
supersingular reduction, G⊂E the flat closure of the subgroup generated by a point of exact order
p², P/O a projective space with a G-action whose locus of non-trivial stabilisers has codimension >2
on the special fibre, and H a smooth complete intersection of hypersurfaces of sufficiently large
degree in P/G contained in the image of the free locus (BMS1 Lemmas 2.5, 2.7, 2.9).

*Proof sketch.* (a): P^d_k lifts to P^d over W_n. By *Smooth-lift comparison and PD filtration*
(Layer CR.2) and the de Rham description of the cup product, H^*_crys(P^d_k/W_n) is the de Rham
cohomology ring of P^d over W_n, which is W_n[h]/(h^(d+1)) with h=c₁(O(1)), because H^q(P^d,Ω^p)
vanishes for p≠q and is free of rank one generated by the p-th power of the Hodge class of O(1) for
p=q≤d. Pass to the limit over n by *Proper smooth crystalline perfectness and reductions* (2).
F(h)=p·h by *Semilinear crystalline Frobenius and linearization*. (b), (c): K=RΓ_crys(C/W) is
perfect of Tor-amplitude in [0,2] with K⊗^L_W k=RΓ_dR(C/k) (*Proper smooth crystalline perfectness
and reductions*). The Hodge–de Rham spectral sequence of C degenerates (d vanishes on H⁰(C,O) and on
H¹(C,O)), so dim_k H^i_dR(C/k)=1, 2g, 1. Hence H⁰(K) is free with H⁰(K)/p⊂k, so H⁰(K)=W;
H¹(K)[p]=coker(H⁰(K)/p→H⁰_dR)=0; and H²(K)/p≅H²_dR(C/k)=k. H²(K) is torsion-free: C has a smooth
proper lift C̃ over W (for an elliptic curve, a Weierstrass equation with lifted coefficients);
K⊗^L_W W_n≅RΓ_dR(C̃_n/W_n) by *Smooth-lift comparison and PD filtration* (Layer CR.2); the modules
H^q(C̃_n,Ω^p) are free over W_n of ranks 1, g, g, 1 and the relative Hodge–de Rham spectral sequence
degenerates, so H²_dR(C̃_n/W_n)≅W_n for all n. Then rank H¹(K)=2g by the Euler characteristic 2−2g.
Frobenius on H²: after a finite extension of k, which changes W by a faithfully flat base change
(*Derived crystalline base change*), C has a rational point x. The class e=c₁(O(x)) reduces to the
image of the Hodge class of O(x) in H²_dR(C/k)=H¹(C,Ω¹), which is non-zero: Riemann–Roch gives
H⁰(C,Ω¹)=H⁰(C,Ω¹(x)), so the connecting map k→H¹(C,Ω¹) of 0→Ω¹→Ω¹(x)→k_x→0 is injective. So e is a
basis of H²(K), and F(e)=p·e. For an elliptic curve take x=0. (d): by *Crystalline weak Lefschetz
with bounded line-bundle cohomology* and the Leray spectral sequence of
X_(E,k)=(P_k×E_k)/G_k→E_k/G_k≅E_k, with fibres P_k, the maps H^i_crys(E_k/W)→H^i_crys(H_(E,k)/W) are
isomorphisms for i=0,1 and H²_crys(H_(E,k)/W) is torsion-free. In the exact sequence of low degree
of the Leray spectral sequence of the E_k-torsor f:H_(E,k)→H_k,
0→H¹(H_k)→H¹(H_(E,k))→H⁰(H_k,R¹f_crys*O)→H²(H_k)→H²(H_(E,k)), restriction to a fibre identifies the
middle map with the endomorphism of H¹_crys(E_k/W) induced by E_k→E_k/E_k[p]≅E_k, which is
multiplication by p. Hence H¹_crys(H_k/W)=0 and H²_crys(H_k/W)_tors≅H¹_crys(E_k/W)/p≅k⊕k (BMS1,
proof of Theorem 2.10). The geometric quotient and torsor construction of Bhatt–Morrow–Scholze §2.2,
Lemmas 2.5–2.9, and its finite-group specialisation are part of this target; the spectral sequence
alone does not replace them.

For the étale calculation in (d), put `Y=H̃_C⊂P_C` and `G_C=Z/p²`. Choose a smooth
partial-intersection flag for Y in the sufficiently general Bertini construction; each step
is an ample hypersurface section. Since C is algebraically closed of characteristic zero,
p is invertible. EtaleCohomologyFoundations §F.7, `VanishingCycles.etaleWeakLefschetz`,
and its projective-space calculation give `H⁰_ét(Y,Z/p^r)=Z/p^r` and
`H¹_ét(Y,Z/p^r)=0` for every `r≥1`, compatibly with reduction. Its §§F.4.1–F.4.4
realize this normalized tower: the H⁰ transitions are surjective, so the Milnor sequence
has no `lim¹ H⁰` term and gives `H⁰_ét(Y,Z_p)=Z_p`, `H¹_ét(Y,Z_p)=0`.
For `K_Y=RΓ_ét(Y,Z_p)`, derived reduction gives the triangle
`K_Y →[p] K_Y → RΓ_ét(Y,Z/p) → K_Y[1]`.
Its exact sequence gives `H²_ét(Y,Z_p)[p]=0` from `H¹_ét(Y,Z/p)=0`.
Integral finiteness then makes `H²_ét(Y,Z_p)` a finite free Z_p-module. The middle-degree
injection of weak Lefschetz by itself does not imply this torsion-freeness.

Apply SchemeAndStackFoundations §2.15, `hochschildSerre_galois_covering`, to
`Y→H_C` with coefficients Z/p^r. Through the same §F.4 realization and finite-group
compatibilities, its integral spectral sequence is
`H^a(G_C,H^b_ét(Y,Z_p)) ⇒ H^(a+b)_ét(H_C,Z_p)`.
Finite-group cochains use finite products, which commute with the derived coefficient
limit; the finite-level finiteness and Milnor identifications are those of §F.4.
In total degree two, `E∞^(2,0)=H²(G_C,Z_p)=Z_p/p²`, since the b=1 row vanishes
and no other differential can enter or leave this position. For the trivial action the norm
is multiplication by p², so Mathlib's `Rep.FiniteCyclicGroup.groupCohomologyIsoEven`
gives this cyclic-group calculation. Also `E∞^(1,1)=0`, and `E∞^(0,2)` is a submodule
of the torsion-free `H²_ét(Y,Z_p)^G_C`. Thus the filtration gives
`0 → Z/p² → H²_ét(H_C,Z_p) → E∞^(0,2) → 0`, identifying its whole torsion subgroup
with Z/p². Part (a) uses the Hodge and de Rham cohomology of projective space:
H^q(ℙⁿ_A, Ω^p) = 0 unless 0 ≤ p = q ≤ n, H^p(ℙⁿ_A, Ω^p) free of rank one on the p-th power of the
Hodge class of O(1), and `H^{2i}_dR(ℙⁿ_A/A)` free of rank one on c₁^dR(O(1))^i for 0 ≤ i ≤ n ([Stacks
Project](https://stacks.math.columbia.edu), de Rham Cohomology, Lemmas 50.11.3 and 50.11.4, tags
0FMI and 0FMJ), which is part of this target. ([Bhatt–Morrow–Scholze, *Integral p-adic Hodge
theory*](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §2.2, pp. 15–17: Lemmas
2.5, 2.7 and 2.9 (the construction), Theorem 2.10 (p. 16) and its proof (pp. 16–17); [Stacks
Project](https://stacks.math.columbia.edu), de Rham Cohomology, de Rham Cohomology, Lemmas 0FMI and
0FMJ (Hodge and de Rham cohomology of projective space).) *Needs:* *Crystalline weak Lefschetz with
bounded line-bundle cohomology*; *Proper smooth crystalline perfectness and reductions*; *Semilinear
crystalline Frobenius and linearization*; *Crystalline cup products*; *The crystalline first Chern
class and the hyperplane class*; *Derived crystalline base change*; *Smooth-lift comparison and PD
filtration* (Layer CR.2);
TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality;
DerivedModuleAlgebra §S.1 (*The spectral sequence of a first-quadrant double complex*);
SchemeAndStackFoundations §§2.1–2.2 (`cech_to_cohomology`, `leray_spectral_sequence`); *Smooth proper lifts of curves over Witt vectors*; *Crystalline
Leray spectral sequence*; *Vanishing of the top coherent de Rham differential*;
EtaleCohomologyFoundations §F.7 (`VanishingCycles.etaleWeakLefschetz` and the projective-bundle
formula), §§F.4.1–F.4.4 (`VanishingCycles.normalizedAdicSystems`,
`VanishingCycles.classicalAdicRealization`, `VanishingCycles.etaleProetaleAdicComparison`,
`VanishingCycles.adicFiniteness`); SchemeAndStackFoundations §2.15
(`hochschildSerre_galois_covering`); Mathlib `Rep.FiniteCyclicGroup.groupCohomologyIsoEven`.

**Checks.**

- d=1: H^*_crys(P¹_k/W)=W⊕W·h with h∪h=0 and F(h)=p·h.
- At d=0 the projective-space computation is W in degree zero with the unit cup product;
  its finite-level reductions are W_n, without higher classes.
- For the covering surface Y in (d), `H¹_ét(Y,Z/p)=0` forces `H²_ét(Y,Z_p)[p]=0` by
  derived reduction. For a smooth plane cubic `D⊂P²_C`, weak Lefschetz gives only an
  injection in degree one: `H¹_ét(D,Z/p)=(Z/p)²`, so the surface vanishing argument
  does not extend to complete-intersection curves.
- For the surface of (d): length_W H²_crys(H_k/W)_tors=2=length_(Z_p) H²_ét(H_C,Z_p)_tors, but
  Z/p²⊗_(Z_p)W=W/p² is not isomorphic to k⊕k; K=RΓ_crys(H_k/W) is perfect although H² is not free.

**Ordinary and supersingular elliptic crystalline Frobenius.** For an elliptic curve E/F_p with
a=p+1−#E(F_p), H¹_crys(E/Z_p) is free of rank two and its Frobenius has characteristic polynomial
T²−aT+p. For E:y²=x³+x over F_5 the point count is 4, a=2, and the Newton slopes are 0 and 1; E is
ordinary. For E:y²=x³−x over F_3 the point count is 4, a=0, and the polynomial is T²+3 with both
slopes 1/2; E is supersingular. The slopes describe rational cohomology and do not assert a diagonal
integral basis.

*Hypotheses.* E is elliptic, not a singular Weierstrass cubic; the displayed Frobenius is linear
because σ on W(F_p)=Z_p is the identity.

*Proof sketch.* Use torsion-and-models for rank two, H²=Z_p·c₁(0), and F on H² equal to p. The cup
pairing on H¹ is perfect: modulo p this is Serre duality on the two Hodge pieces, and freeness plus
Nakayama lifts its nondegeneracy. This curve-case pairing uses *Vanishing of the top coherent de
Rham differential* and does not use Layer CR.3:duality. The pairing is alternating even at p=2:
graded commutativity gives 2(x∪x)=0, and H² is torsion-free over Z_p, hence x∪x=0. Künneth and
restriction to the two axes show that addition on E pulls H¹ back by the sum. Hence the
endomorphism-to-cohomology action is additive. Use the identity of TauCetiRoadmap EllipticCurves
Layer 3, π²−[a]π+[p]=0, giving F²−aF+p=0. The alternating cup form scales by p under F, so det(F)=p.
Cayley–Hamilton then gives tr(F)=a, since F is invertible after inverting p. Enumerate the affine
points: for F_5 the only x with x³+x a square are 0,2,3, each with y=0; for F_3 every x has x³−x=0,
each with y=0. Add the point at infinity. The valuation polygons of T²−2T+5 and T²+3 give the stated
slopes. Ordinary and supersingular agree with the geometric predicates by the finite-field criterion
p ∣ a of TauCetiRoadmap EllipticCurves Layer 3. ([Bhatt–Morrow–Scholze, *Integral p-adic Hodge
theory*](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §2.2, proof of Theorem
2.10, pp.17–19; [Stacks Project](https://stacks.math.columbia.edu), Weil Cohomology Theories, §45.4,
Definition 45.4.1, cup-product and duality conventions.) *Needs:* *Proper smooth tests and a
crystalline torsion surface*; *Vanishing of the top coherent de Rham differential*; *Crystalline cup
products*; *Proper smooth crystalline Künneth formula*; *The crystalline first Chern class and the
hyperplane class*;
TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1;
SchemeAndStackFoundations Layer 2 (*Proper coherent Serre duality*).

**Checks.**

- The affine counts are 3 in both cases; counting only affine points would give the wrong Frobenius
  trace.
- The ordinary polynomial has det=5 and trace=2; the supersingular polynomial has det=3 and trace=0.

### Examples

- For an elliptic curve `E/𝔽_p` with `a = p + 1 − #E(𝔽_p)`, crystalline Frobenius on
  `H¹_crys(E/ℤ_p)` has characteristic polynomial `T² − aT + p` (*Ordinary and supersingular elliptic
  crystalline Frobenius*): for `y² = x³ + x` over `𝔽₅`, `#E(𝔽₅) = 4` and `a = 2`; for `y² = x³ − x`
  over `𝔽₃`, `#E(𝔽₃) = 4` and `a = 0`, a supersingular curve.

### Dependencies

Layers CR.1, CR.2; EnhancedDerivedSheaves (Layer E1, Layer E2, Layer E3); DerivedDeRhamCohomology
(Layer 1, Layer 3); EnhancedDerivedSheaves (§E1.9); SchemeAndStackFoundations (Layer 2, Layer 4);
AdicSpacesPartIII (F0.6); TauCetiRoadmap JacobianChallenge (Layer B, Layer C); DerivedModuleAlgebra
(§S.1); SchemeAndStackFoundations (§§2.1–2.2, `cech_to_cohomology`, `leray_spectral_sequence`);
TauCetiRoadmap EllipticCurves (Layer 3); EtaleCohomologyFoundations (§F.7,
`VanishingCycles.etaleWeakLefschetz`; §§F.4.1–F.4.4, normalized adic realization and derived
reduction); SchemeAndStackFoundations (§2.15, `hochschildSerre_galois_covering`); Mathlib.

## Layer CR.3:Frobenius-isogeny: The Frobenius isogeny

This layer proves that crystalline Frobenius of a nondegenerate F-crystal on a proper smooth scheme
becomes an isomorphism after inverting p, through a p-power bound for purely inseparable pullback.

### CR.3:Frobenius-isogeny.1 Purely inseparable pullback and the rational Frobenius isogeny

**p-power control for purely inseparable pullback.** Let (S,I,γ) be a PD scheme over Z_(p) with p∈I,
S₀=V(I), and f:X′→X a morphism of S₀-schemes which, locally on X, is a composite of finitely many
morphisms of the form Spec C[z]/(z^p−c)→Spec C (an iterated α_p-cover), of constant degree q. Let E
be a crystal in quasi-coherent O_crys-modules on X/S and E′=f_crys^*E. Then the cone Q of
Ru_(X/S,*)E→f_*Ru_(X′/S,*)E′ in the derived category of X_Zar has cohomology sheaves annihilated by
q, and f^*:H^i_crys(X/S,E)→H^i_crys(X′/S,E′) has kernel and cokernel annihilated by q^(i+1). If X→S₀
is smooth of relative dimension d and X^(1)=X×_(S₀,F_(S₀))S₀, the relative Frobenius
F_(X/S₀):X→X^(1) is an iterated α_p-cover of degree p^d; hence for every crystal G in quasi-coherent
modules on X^(1)/S the map F_(X/S₀)^*:H^i_crys(X^(1)/S,G)→H^i_crys(X/S,(F_(X/S₀))_crys^*G) has
kernel and cokernel annihilated by p^(d(i+1)).

*Hypotheses.* (S,I,γ) is a PD scheme over Z_(p) with p∈I; S₀=V(I). f:X′→X is a morphism of
S₀-schemes such that every point of X has an open neighbourhood over which f is a composite of
finitely many morphisms Spec C[z]/(z^p−c)→Spec C, with C an F_p-algebra and c∈C; f is then finite
locally free, and its degree q is assumed constant. E is a crystal in quasi-coherent O_crys-modules
on X/S and E′=f_crys^*E. For the last assertion: X→S₀ is smooth of relative dimension d, and G is a
crystal in quasi-coherent O_crys-modules on X^(1)/S.

*Proof sketch.* Reduce to S=Spec A, X=Spec C and one cover C′=C[z]/(z^p−c). With P→C a surjection
from a polynomial A-algebra, D its p-adically completed PD envelope and λ∈D a lift of c, the
completed envelope for P[z]→C′ is D′, the p-adic completion of D[z]⟨ξ⟩/(ξ−(z^p−λ)); it is the
completion of the free D-module on z^j·ξ^[n], 0≤j<p, n≥0, and Ω_(D′)=Ω_D⊗D′⊕D′·dz, completed
(*Differentials of a smooth envelope* (Layer CR.1)). Define a continuous D-linear θ:D′→D′ by
θ(z^j)=p·z^(j+1)/(j+1) for 0≤j≤p−1, θ(z^(p−1)·ξ^[m])=ξ^[m+1] for m≥1, and
θ(z^j·ξ^[m])=(p·z^(j+1)·ξ^[m]−θ(p·λ·z^j·ξ^[m−1]))/(j+1+p·m) for 0≤j<p−1, m≥1; then ∂_z∘θ=p. That
p·g−θ(∂_z g)∈D and (θ⊗1)(d₁g)−d₁θ(g)∈Ω_D for all g∈D′ is checked in the universal case D₀=Z_(p)[λ],
where D₀′ is torsion-free and D₀ is the kernel of ∂_z. Let c:M⊗Ω^•_D→M⊗Ω^•_(D′) be the comparison
map for the module with connection (M,∇) of E. With h(g·ω)=0, h(g·dz∧η)=θ(g)·η, e(g·ω)=(p·g−θ(∂_z
g))·ω and e(g·dz∧η)=((θ⊗1)(d₁g)−d₁θ(g))∧η one has d∘h+h∘d=p−c∘e and e∘c=p. The map c is termwise
injective, because D→D′ has a continuous D-linear retraction, and h vanishes on the image of c; so h
induces a homotopy between multiplication by p and 0 on coker(c), which is quasi-isomorphic to the
cone of c. Hence the cone has cohomology annihilated by p and none in degree −1. For a composite of
m covers Q is a successive extension of m such cones (octahedral axiom), so its cohomology sheaves
are annihilated by q=p^m and vanish in negative degrees. Then H^n(X,Q) is filtered with graded
pieces subquotients of H^a(X,H^b(Q)), a+b=n, b≥0, hence is annihilated by q^(n+1); the kernel of f^*
on H^i is a quotient of H^(i−1)(X,Q) and its cokernel a subgroup of H^i(X,Q). If X→S₀ is smooth of
relative dimension d then, locally, X is étale over affine d-space over S₀ and the relative
Frobenius of X is the base change of that of affine space, which raises the d coordinates to the
p-th power and is a composite of d covers of the form above, one for each coordinate; so F_(X/S₀) is
an iterated α_p-cover of degree p^d. ([Stacks Project](https://stacks.math.columbia.edu),
Crystalline Cohomology, §60.25 (tag 07PZ): Lemma 60.25.1 (tag 07Q7), Lemma 60.25.3 (tag 07N1), Lemma
60.25.4 (tag 07Q9), Lemma 60.25.5 (tag 07QA), Lemma 60.25.6 (tag 07QB).) *Needs:* *Crystalline
cohomology from an embedding* (Layer CR.2); *The relative PD Poincaré lemma* (Layer CR.2);
*Differentials of a smooth envelope* (Layer CR.1); *Relative divided power polynomial algebras*
(DerivedDeRhamCohomology §PD.5); *Envelopes of regular immersions* (DerivedDeRhamCohomology §PD.6);
Mathlib `DerivedCategory.TStructure.t`; Mathlib
`CategoryTheory.Triangulated.TStructure.triangleLEGE`.

**Checks.**

- For X=P¹_k over a perfect field k and S=Spec W(k): F_(X/k)^* is the identity W→W on H⁰ and
  multiplication by p on H²≅W, because F_(X/k)^*O(1)=O(p); its cokernel W/p is annihilated by p,
  within the bound p^(1·(2+1)), so the pullback is not an isomorphism and the bound is not sharp.

**Rational crystalline Frobenius isogeny.** Let (A,I,γ) be a PD ring with A Noetherian and
p-adically complete and p∈I, σ:A→A a homomorphism of PD rings with σ(x)≡x^p modulo pA, X a proper
smooth scheme over A/I, and (E,Φ) a nondegenerate F-crystal on X/Spec A relative to σ: E is a
crystal in finite locally free O_crys-modules, Φ:(F_X)_crys^*E→E, and there are an integer i≥0 and a
map V:E→(F_X)_crys^*E with V∘Φ=p^i. Then the linearised Frobenius F_K:K⊗^L_(A,σ)A→K of *Semilinear
crystalline Frobenius and linearization* (Layer CR.3), K=RΓ_crys(X/Spec A,E), becomes an isomorphism
after inverting p. In particular, for a perfect field k of characteristic p, A=W(k) and σ the Witt
vector Frobenius, the semilinear Frobenius of H^j_crys(X/W(k),E)[1/p] is bijective for every j. It
need not be bijective on H^j_crys(X/W(k),E).

*Hypotheses.* (A,I,γ) is a PD ring, A is Noetherian and p-adically complete, p∈I. σ:A→A is a
homomorphism of PD rings with σ(x)≡x^p modulo pA. X is proper and smooth over A/I. (E,Φ) is an
F-crystal on X/Spec A relative to σ (a crystal in finite locally free O_crys-modules with
Φ:(F_X)_crys^*E→E) and is nondegenerate: there are an integer i≥0 and a map V:E→(F_X)_crys^*E with
V∘Φ=p^i.

*Proof sketch.* F_K is the composite of the base-change map for Spec(σ), the pullback along the
relative Frobenius F_(X/S₀):X→X^(1) and the map induced by Φ (*Semilinear crystalline Frobenius and
linearization* (Layer CR.3)). The base-change map is an isomorphism: X^(1) is the base change of the
proper smooth X along F_(S₀), source and target are perfect complexes compatible with reduction
modulo p^e (*Proper smooth crystalline perfectness and reductions* (Layer CR.3) (2)), and modulo p^e
the map is an isomorphism by *Derived crystalline base change* (Layer CR.3) (2). The pullback along
F_(X/S₀): X is quasi-compact, so its relative dimensions are bounded by some d, and by *p-power
control for purely inseparable pullback* the kernel and cokernel on H^j are annihilated by
p^(d(j+1)); the cohomology is bounded, so the map is an isomorphism after inverting p. The map
induced by Φ: E has rank bounded by some r on the quasi-compact X, and for N>i·r the map V′=p^N·V
satisfies V′∘Φ=Φ∘V′=p^(N+i) (Stacks Remark 60.26.3); so it is an isomorphism after inverting p.
([Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology, §60.26, Theorem 60.26.4
(tag 07N5) and its proof; Definition 60.26.2 (tag 07N3); Remark 60.26.3 (tag 07N4).) *Needs:*
*Semilinear crystalline Frobenius and linearization* (Layer CR.3); *Proper smooth crystalline
perfectness and reductions* (Layer CR.3); *Derived crystalline base change* (Layer CR.3); *Rational
crystals and nondegenerate F-crystals* (Layer CR.1); *p-power control for purely inseparable
pullback*.

**Checks.**

- For P¹ over a perfect field k: the linearised Frobenius is 1 on H⁰=W and p on H²=W·h; it is an
  isomorphism only after inverting p.
- Nondegeneracy cannot be dropped: for X=Spec k and the F-crystal (O_crys,Φ=0) the map F_K is zero
  on K=W(k).

### Examples

- For `X = ℙ¹` over a perfect field, crystalline Frobenius acts by `1` on `H⁰` and by `p` on `H²`;
  it is not an isomorphism integrally on `H²` but becomes one after inverting `p`.

### Dependencies

Layers CR.1, CR.2, CR.3; Mathlib.

## Layer CR.4: Ordinary and relative de Rham–Witt complexes

This layer builds de Rham–Witt theory. It starts with Dieudonné complexes after Bhatt–Lurie–Mathew
(saturation, the Verschiebung filtration, the finite quotients `W_r(M)`, strict completion and the
description of strict Dieudonné complexes as fixed points of décalage), proves the facts about
Mathlib's Witt vectors that the theory uses, and constructs the saturated de Rham–Witt complex of an
𝔽_p-algebra, Illusie's classical complex and Langer–Zink's relative complex. It ends with the
crystalline comparison, the degree-scaled Frobenius, the slope decomposition and slope spectral
sequence, the Nygaard filtration and logarithmic Hodge–Witt sheaves.

### CR.4.1 Dieudonné complexes, saturation and décalage

**Principal p-décalage on torsion-free complexes.** For a termwise p-torsion-free cochain complex M
of abelian groups define E_p(M)^n={x∈M^n : dx∈pM^(n+1)}, with differential x↦dx/p (the unique
quotient). Multiplication by p^n identifies this normalized complex with η_p(M)^n={z∈p^nM^n⊂M^n[1/p]
: dz∈p^(n+1)M^(n+1)} for every integer n. Chain maps restrict to E_p; identity and composition are
inherited. H^n(E_pM)≅H^n(M)/H^n(M)[p], naturally. E_p commutes with filtered colimits of such
complexes.

*Hypotheses.* p is prime; multiplication by p is injective on every M^n; cochain degrees are
integers.

The API:

- `Crystalline.pDecalage_degree`: E_p(M)^n is the kernel of d followed by reduction modulo p.
- `Crystalline.pDecalage_d`: p·d_E(x)=d_M(x), so d_E²=0.
- `Crystalline.pDecalage_map`: E_p(f)(x)=f(x), with E_p(id)=id and E_p(gf)=E_p(g)E_p(f).
- `Crystalline.pDecalage_cohomology`: H^n(E_pM)=H^n(M)/H^n(M)[p].
- `Crystalline.pDecalage_filtered_colimit`: colim E_p(M_j)≅E_p(colim M_j) for a filtered diagram of
  termwise p-torsion-free complexes.

*Proof sketch.* Existence and uniqueness of dx/p use the defining condition and injectivity. Its
differential is again admissible and squares to zero because p·d(dx/p)=d²x=0. Chain maps commute
with division by p. The maps x↦p^n x in localized terms identify E_p with η_p, including negative n.
A cocycle of E_p is a cocycle of M. Its boundaries are the elements z with pz a boundary of M;
therefore the cohomology quotient kills exactly H^n(M)[p]. Filtered colimits of abelian groups are
exact, preserve injectivity of p, and commute with the kernel of M^n→M^(n+1)/p. Hence they commute
with E_p and its differential. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, Construction 2.1.3 and Remark 2.1.4,
pp.13–14; Proposition 7.2.1 and Corollary 7.2.2, p.84.) *Needs:* Mathlib `CochainComplex`; Mathlib
`ModuleCat`.

**Checks.**

- `test_pDecalage_zero`: E_p of the zero complex is zero.
- `test_pDecalage_two_term`: For [Z --p--> Z] in degrees 0,1 the normalized E_p is [Z --1--> Z], so
  its cohomology vanishes.
- `test_pDecalage_negative`: For Z in degree −1 with zero differential, E_p is Z in degree −1,
  identified with p^(−1)Z in η_p.
- Negative cochain degrees use p^n in the localization, rather than a natural-degree truncation.

**Dieudonné complexes.** A Dieudonné complex is a cochain complex of abelian groups (M*,d) with a
map of graded abelian groups F:M*→M* satisfying dF(x)=pF(dx); morphisms commute with d and F. For a
termwise p-torsion-free complex M, η_pM is the principal décalage complex of *Principal p-décalage
on torsion-free complexes* for the ring Z and the element p: as a subcomplex of `M*[p^{-1}]`,
`(η_pM)^n={x∈p^nM^n : dx∈p^{n+1}M^{n+1}}` for every integer n (Construction 2.1.3; for complexes in
nonnegative degrees η_pM⊆M, footnote 1). For termwise p-torsion-free M, a Dieudonné structure F is
equivalent to a map of cochain complexes α_F:M*→(η_pM)*, α_F(x)=p^nF(x) for x∈M^n, with inverse
`F(x)=p^{-n}α(x)`.

`Suggested.lean` declares `Crystalline.DieudonneComplex`.

*Hypotheses.* p is a prime. M is a cochain complex of abelian groups, graded by all integers.
Termwise p-torsion-freeness of M is assumed for η_pM and for the equivalence between F and α_F; it
is not assumed in the definition of a Dieudonné complex.

The API:

- `Crystalline.DieudonneComplex.F_zero`: F is zero preserving in every degree.
- `Crystalline.DieudonneComplex.F_add`: F is additive in every degree.
- `Crystalline.DieudonneComplex.d_F`: The relation is dF=pFd, including negative cochain degrees.
- `Crystalline.DieudonneComplex.alphaF`: For a termwise p-torsion-free Dieudonné complex M,
  α_F:M→η_pM is the cochain map with α_F(x)=p^nF(x) for x∈M^n; in the normalized coordinates of
  *Principal p-décalage on torsion-free complexes* it is F itself, regarded as a cochain map
  M→E_p(M).
- `Crystalline.DieudonneComplex.ofAlpha`: For a termwise p-torsion-free cochain complex M of abelian
  groups and a cochain map α:M→η_pM, the triple (M,d,F) with F(x)=p^(−n)α(x) for x∈M^n is a
  Dieudonné complex.
- `Crystalline.DieudonneComplex.alphaF_ofAlpha`: The two constructions are mutually inverse: the map
  α_F of ofAlpha(α) is α, and ofAlpha(α_F) has Frobenius F.
- `Crystalline.DieudonneComplex.alphaF_natural`: For termwise p-torsion-free Dieudonné complexes M,
  N and a cochain map f:M→N with f∘F=F∘f, η_p(f)∘α_F=α_F∘f.
- `Crystalline.DieudonneComplex.ofEnd`: For an abelian group A and any endomorphism F of A, the
  complex with A in degree 0 and zero elsewhere, with this F, is a Dieudonné complex (BLM Example
  2.5.6).

*Proof sketch.* η_pM and its identification with a subcomplex of `M[p^{-1}]` are those of *Principal
p-décalage on torsion-free complexes* for R=Z, f=p: in normalized coordinates
`E_p(M)^n={x∈M^n : dx∈pM^{n+1}}` with differential x↦dx/p, and x↦p^n x identifies E_p(M)^n with (η_pM)^n. In these
coordinates α_F is F itself, a cochain map M→E_p(M) because d(Fx)/p=F(dx). Use dF=pFd to check that
p^nF lands in the η_p submodule and commutes with the differentials. Conversely divide α(x) by p^n
inside the localization; membership in η_p makes the result an element of M. Check the two
constructions are inverse; for a cochain map f commuting with F, η_p(f)∘α_F=α_F∘f, with η_p(f) as in
*Principal p-décalage on torsion-free complexes*. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.1, Definition 2.1.1, Construction 2.1.3
with footnote 1, Remark 2.1.4; pp.13–14 in arXiv v3 and in the published version.) *Needs:*
*Principal p-décalage on torsion-free complexes*; Mathlib `CochainComplex`; Mathlib `ModuleCat`.

**Checks.**

- `test_dieudonne_degree_zero`: Z concentrated in degree zero permits any Frobenius multiplication
  a.
- `test_dieudonne_not_chain`: For p=2 there is a Dieudonné complex with dF≠Fd: Z→Z with d=id, F₀=2
  and F₁=1.
- `test_dieudonne_factor_p`: On the complex [Z --id--> Z] in degrees 0 and 1, the maps F_0=id,
  F_1=id do not form a Dieudonné structure for any prime p: d(F_0(1))=1 while p·F_1(d(1))=p.
- For the same T: (η_pT)^0={x∈Z : dx∈pZ}=pZ and (η_pT)^1=pZ, and α_F is x↦px in both degrees, a
  cochain map T→η_pT (here an isomorphism).
- Negative degrees: for Z in degree −1 (zero elsewhere) with F=id, (η_pM)^(−1)=p^(−1)Z inside Q and
  α_F(x)=p^(−1)x.

**Saturated Frobenius.** A Dieudonné complex M is saturated when it is termwise p-torsion-free and
`F:M^n→{x∈M^n:dx∈pM^{n+1}}` is bijective in every degree. For a termwise p-torsion-free Dieudonné
complex M, this holds iff α_F:M→η_pM is an isomorphism of cochain complexes.

`Suggested.lean` declares `Crystalline.DieudonneComplex.IsSaturated`.

*Hypotheses.* p is a prime; M is a Dieudonné complex. The equivalence with α_F being an isomorphism
is stated for termwise p-torsion-free M, where α_F and η_pM are defined.

The API:

- `Crystalline.IsSaturated.p_injective`: Multiplication by p is injective in every degree.
- `Crystalline.IsSaturated.F_injective`: The graded Frobenius is injective.
- `Crystalline.IsSaturated.F_range`: The image of F in degree n consists exactly of elements whose
  differential is p-divisible.
- `Crystalline.DieudonneComplex.IsSaturated.smul_mem_range`: For every integer n and x∈M^n,
  p·x belongs to the image of F_n, since d(p·x)=p·d(x).

*Proof sketch.* Identify p^n times the target of F with (η_p M)^n. Use the established α_F
dictionary to transport bijectivity to a chain isomorphism. ([Bhatt–Lurie–Mathew, *Revisiting the de
Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.2, Definition 2.2.1 and Remark
2.2.2; p.14 in arXiv v3 and in the published version.) *Needs:* *Dieudonné complexes*.

**Checks.**

- `test_saturated_zero`: Every complex whose groups are zero is saturated.
- `test_saturated_zero_d`: For zero differential and termwise p-torsionfree groups, saturation is
  equivalent to bijectivity of F.
- `test_saturated_multiplication_two`: The degree-zero group Z with F=2 is not saturated at p=2.
- `test_saturated_two_term`: For every prime p, the complex [Z --id--> Z] in degrees 0 and 1 with
  F_0=p and F_1=id is a saturated Dieudonné complex, although F_0 is not surjective.
- `test_saturated_divisible_differential`: For every prime p, the complex [Z --p--> Z] (d is
  multiplication by p) in degrees 0 and 1 with F_0=p and F_1=id is a termwise p-torsion-free
  Dieudonné complex with F injective in both degrees that is not saturated: every x∈M^0 has dx∈pM^1,
  but F_0(M^0)=pZ.
- T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id is saturated: F_0(Z)=pZ={x : dx∈pT^1}, F_1
  is bijective, and correspondingly α_F:T→η_pT is x↦px onto pZ in both degrees.
- A in degree 0 with an endomorphism F is saturated iff A is p-torsion-free and F is an automorphism
  (BLM Example 2.5.6): (Z,F=id) and (Q,F=id) are saturated; (Z/p,F=id) and (Z,F=p) are not.

**Verschiebung and the differential.** On a saturated Dieudonné complex define V uniquely by
F(Vx)=px. It is injective and satisfies FV=VF=p, FdV=d and Vd=p dV.

The intended operator is `Crystalline.DieudonneComplex.verschiebung M hM n :
Module.End ℤ (M.complex.X n)`, for `hM : M.IsSaturated`. Its defining equation is
`F_n(V_n x) = p • x`; existence, uniqueness, additivity and the differential identities
are targets of this subsection. The intended theorem names are
`Crystalline.DieudonneComplex.F_verschiebung`, `Crystalline.DieudonneComplex.verschiebung_F`
and `Crystalline.DieudonneComplex.F_d_verschiebung`.

*Hypotheses.* The complex is saturated; in particular F is injective and M is p-torsion-free.

The API:

- `Crystalline.verschiebung_FV`: F(Vx)=px in every degree.
- `Crystalline.verschiebung_VF`: V(Fx)=px in every degree.
- `Crystalline.verschiebung_d`: Vd=p dV; V is not assumed to be a chain map.
- `Crystalline.verschiebung_FdV`: FdV=d in each degree.
- `Crystalline.verschiebung_injective`: V is injective in each degree.

*Proof sketch.* Since d(px) belongs to pM, saturation puts px in the image of F; injectivity gives
existence and uniqueness of V. FV=p implies injectivity of V. Precompose with F and cancel F to
obtain VF=p. Combine dF=pFd and FV=p, cancel p, and then postcompose with V to obtain the
differential identities. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.2, Remark 2.2.3 and Proposition 2.2.4
with proof, identities (4)–(6); arXiv v3 p.14; published p.14 (statement) and p.15 (proof).)
*Needs:* *Saturated Frobenius*.

**Checks.**

- `test_V_F_identity`: If F is identity in a degree, V is multiplication by p there.
- `test_V_F_p`: If F is multiplication by p in a degree, V is identity there; e.g. a rational
  degree-zero group.
- `test_V_not_chain`: On the saturated Dieudonné complex [Z --id--> Z] in degrees 0 and 1 with
  F_0=p, F_1=id one has V_0=id and V_1=p; hence V_1(d(1))=p=p·d(V_0(1)) and V_1∘d≠d∘V_0.
- For a p-torsion-free group A in degree 0 with an automorphism F, V=p·F^(−1); for F=id, V=p, and
  for A=Q with F=p, V=id.

**FV=p.** Let M be a saturated Dieudonné complex. For every integer n and every x∈M^n: F(Vx)=px.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer.

*Proof sketch.* This is the defining property of V: Vx is the unique element of M^n with F(Vx)=px;
it exists because d(px)∈pM^(n+1) puts px in the image of F, and it is unique because F is injective
(BLM Remark 2.2.3). ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.2, Remark 2.2.3; p.14 in arXiv v3 and in
the published version.) *Needs:* *Verschiebung and the differential*.

**Checks.**

- On T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: V_0=id, V_1=p and F_0V_0=p=F_1V_1.
- For Z in degree 0 with F=id: V=p and FV=p.

**Iterated Frobenius divisibility.** For a saturated Dieudonné complex and every r≥0, F^r identifies
M^n with `{x∈M^n:dx∈p^rM^{n+1}}`. Consequently every cocycle belongs to the image of every iterate
F^r.

`Suggested.lean` declares `Crystalline.DieudonneComplex.range_F_iterate`.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; r≥0 and n are integers.

*Proof sketch.* The forward inclusion follows from dF^r=p^rF^rd. For dx=p^r y with r>0,
p-torsion-freeness gives dy=0. Write x=F(x′) and y=F(y′) by saturation, cancel pF to obtain
`dx′=p^{r−1}y′`, and apply induction. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.2, Proposition 2.2.5 with proof and
Remark 2.2.6; p.15 in arXiv v3 and in the published version.) *Needs:* *Saturated Frobenius*.

**Checks.**

- r=0 is trivial and r=1 is condition (ii) of saturation.
- On T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: F_0^r(Z)=p^rZ={x : dx∈p^rT^1}; in degree
  1 every element is a cocycle and F_1^r=id is bijective.

**Image of Frobenius on a saturated complex.** Let M be a saturated Dieudonné complex. For every
integer n, F(M^n)={x∈M^n : dx∈pM^(n+1)}.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer.

*Proof sketch.* This is condition (ii) in the definition of saturation (BLM Definition 2.2.1): F
maps M^n bijectively onto {x∈M^n : dx∈pM^(n+1)}. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.2, Definition 2.2.1(ii) with its
display; p.14 in arXiv v3 and in the published version.) *Needs:* *Saturated Frobenius*.

**Checks.**

- On T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: F_0(Z)=pZ={x : dx∈pT^1} and F_1(Z)=Z={x
  : dx∈pT^2=0}.
- Z in degree 0 with F=p is not saturated: every x has dx=0∈pM^1, but F(Z)=pZ.

**Injectivity of Frobenius on a saturated complex.** Let M be a saturated Dieudonné complex. For
every integer n, F:M^n→M^n is injective.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer.

*Proof sketch.* By condition (ii) in the definition of saturation, F is a bijection of M^n onto the
subgroup {x∈M^n : dx∈pM^(n+1)}; in particular it is injective (BLM Remark 2.2.3).
([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3),
arXiv v3, §2.2, Remark 2.2.3, first sentence (a consequence of Definition 2.2.1(ii)); p.14 in arXiv
v3 and in the published version.) *Needs:* *Saturated Frobenius*.

**Checks.**

- On T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id, F_0=p and F_1=id are injective.
- Z in degree 0 with F=0 is termwise p-torsion-free and not saturated, since F is not injective.

**VF=p.** Let M be a saturated Dieudonné complex. For every integer n and every x∈M^n: V(Fx)=px.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer.

*Proof sketch.* F(V(Fx))=p·Fx=F(px), by F(Vy)=py for y=Fx; cancel the injective F (BLM, proof of
Proposition 2.2.4). ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.2, Proposition 2.2.4, identity (4), and
its proof; arXiv v3 p.14; published p.14 (statement) and p.15 (proof).) *Needs:* *Verschiebung and
the differential*; *FV=p*; *Injectivity of Frobenius on a saturated complex*.

**Checks.**

- On T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: V_0F_0=p and V_1F_1=p.
- For Q in degree 0 with F=p (saturated): V=id and VF=p.

**p-torsion-freeness of a saturated complex.** Let M be a saturated Dieudonné complex. For every
integer n, multiplication by p on M^n is injective.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer.

*Proof sketch.* This is condition (i) in the definition of saturation (BLM Definition 2.2.1): M is
termwise p-torsion-free. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.2, Definition 2.2.1(i); p.14 in arXiv v3
and in the published version.) *Needs:* *Saturated Frobenius*.

**Checks.**

- Z in degree 0 with F=id is saturated, and multiplication by p on Z is injective.
- Z/p in degree 0 with any F is a Dieudonné complex that is not saturated, since p·1=0.

**Morphisms of Dieudonné complexes.** For two existing Dieudonné complexes M,N with the same p, a
morphism is an ordinary cochain map f:M→N satisfying f_n F_M=F_N f_n in every integer degree. The
cochain map is Mathlib’s HomologicalComplex.Hom; only its Frobenius compatibility is added.

*Hypotheses.* p is a prime; M and N are Dieudonné complexes for p, graded by all integers. No
saturation is assumed.

The API:

- `Crystalline.DieudonneHom.id`: The identity cochain map with its Frobenius compatibility.
- `Crystalline.DieudonneHom.comp`: For f:M→N and g:N→P, g.comp(f) has degree map g_n∘f_n.
- `Crystalline.DieudonneHom.ext`: Two morphisms equal on all elements in every degree are equal.
- `Crystalline.DieudonneHom.id_apply`: The identity evaluates to x in each degree.
- `Crystalline.DieudonneHom.comp_apply`: Composition evaluates to g_n(f_n(x)).
- `Crystalline.DieudonneComplex.category`: For a fixed prime p, Dieudonné complexes with
  DieudonneHom as morphisms, DieudonneHom.id and DieudonneHom.comp form a category DC.
- `Crystalline.DieudonneHom.comm_F`: For a morphism f:M→N, every integer n and x∈M^n: f_n(F_M
  x)=F_N(f_n x).
- `Crystalline.DieudonneHom.isIso_iff_bijective`: A morphism f:M→N of Dieudonné complexes is an
  isomorphism in DC iff f_n:M^n→N^n is bijective for every integer n.

*Proof sketch.* Bundle the ordinary cochain map and the displayed compatibility equation. Use
ordinary identity/composition for the API; Frobenius compatibility follows by substitution.
Extensionality is HomologicalComplex.hom_ext plus proof irrelevance. ([Bhatt–Lurie–Mathew,
*Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.1,
Definition 2.1.1, second paragraph (the category DC); p.13 in arXiv v3 and in the published
version.) *Needs:* *Dieudonné complexes*; Mathlib `HomologicalComplex.Hom`; Mathlib
`HomologicalComplex.hom_ext`.

**Checks.**

- `hom_test_zero`: The zero cochain map is a Dieudonné morphism.
- `hom_test_scalar`: Multiplication by any integer a is a Dieudonné endomorphism.
- `hom_test_composition`: Composition with the identity of the target returns the original morphism.
- `hom_test_F_compatibility`: A morphism between degree-zero Z groups with F source identity and F
  target multiplication by2 has zero degree-zero map. Ordinary cochain maps alone would allow
  identity.
- For M=Z in degree 0 with F=id and N=Z in degree 0 with F=p, the only morphism M→N is 0, because
  f(1)=f(F(1))=F(f(1))=p·f(1); as cochain complexes there are the maps of multiplication by any
  integer.

**Morphisms commute with Verschiebung.** A Dieudonné morphism f between saturated M,N commutes with
V in every degree.

*Hypotheses.* p is a prime; M and N are saturated Dieudonné complexes and f:M→N is a morphism of
Dieudonné complexes; n is any integer.

*Proof sketch.* Apply F_N to both f(V_M x) and V_N(fx). Frobenius compatibility and FV=p identify
both images with p f(x). Cancel F_N, which is injective because N is saturated; no surjectivity of f
is needed. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.2, Remark 2.2.3 (uniqueness of Vx), p.14
in arXiv v3 and in the published version; used without statement in Remark 2.5.3 (arXiv v3 pp.19–20;
published p.20).) *Needs:* *Morphisms of Dieudonné complexes*; *FV=p*; *Injectivity of Frobenius on
a saturated complex*.

**Checks.**

- For M=N=Z in degree 0 with F=id and f multiplication by an integer a: f(Vx)=a·px=V(fx).
- For the inclusion Z→Z_p (both in degree 0 with F=id), V=p on both sides and the inclusion commutes
  with it.

**Frobenius relation dF=pFd.** For a Dieudonné complex (M,d,F), every integer n and every x∈M^n:
d(Fx)=p·F(dx) in M^(n+1).

*Hypotheses.* p is a prime; M is a Dieudonné complex, graded by all integers; n is any integer.
Neither saturation nor torsion-freeness is assumed.

*Proof sketch.* This is the defining identity of a Dieudonné complex (BLM Definition 2.1.1); it
holds in every integer degree because the complex is graded by all integers. ([Bhatt–Lurie–Mathew,
*Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.1,
Definition 2.1.1; p.13 in arXiv v3 and in the published version.) *Needs:* *Dieudonné complexes*.

**Checks.**

- On T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: d(F_0x)=px=p·F_1(dx).
- In a negative degree: for Z in degrees −1 and 0 with d=id, F_(−1)=p and F_0=id,
  d(F_(−1)x)=px=p·F_0(dx).

**FdV=d.** Let M be a saturated Dieudonné complex. For every integer n and every x∈M^n: F(d(Vx))=dx
in M^(n+1).

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer.

*Proof sketch.* p·dx=d(px)=d(F(Vx))=p·F(d(Vx)), by F(Vx)=px and dF=pFd; cancel p, which is injective
on M^(n+1) (BLM, proof of Proposition 2.2.4). ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.2, Proposition 2.2.4, identity (5), and
its proof; arXiv v3 p.14; published p.14 (statement) and p.15 (proof).) *Needs:* *Verschiebung and
the differential*; *FV=p*; *Frobenius relation dF=pFd*; *p-torsion-freeness of a saturated complex*.

**Checks.**

- On T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: F_1(d(V_0(1)))=1=d(1).

**Vd=p dV.** Let M be a saturated Dieudonné complex. For every integer n and every x∈M^n:
V(dx)=p·d(Vx) in M^(n+1). In particular V is not a cochain map in general.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer.

*Proof sketch.* V(dx)=V(F(d(Vx)))=p·d(Vx): first FdV=d applied to x, then VF=p applied to d(Vx)
(BLM, proof of Proposition 2.2.4). ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.2, Proposition 2.2.4, identity (6), and
the last sentence of its proof; arXiv v3 p.14; published p.14 (statement) and p.15 (proof).)
*Needs:* *Verschiebung and the differential*; *FdV=d*; *VF=p*.

**Checks.**

- On T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: V_1(d(1))=p=p·d(V_0(1)), while
  d(V_0(1))=1≠p.

**Bockstein reduction of principal p-décalage.** For termwise p-torsion-free M, the connecting map
of 0→M/p→M/p²→M/p→0 is β:H^n(M/p)→H^(n+1)(M/p). If dx=py then β([x])=[y]. It squares to zero. The
map E_p(M)/pE_p(M)→(H^*(M/p),β), x↦[x], is a natural quasi-isomorphism of cochain complexes.

*Hypotheses.* p is prime and the terms of M are p-torsion-free; the left injection of the short
exact sequence is multiplication by p.

The API:

- `Crystalline.pBockstein_lift`: If dx=py then β([x])=[y].
- `Crystalline.pBockstein_square`: β∘β=0 in every degree.
- `Crystalline.pBockstein_decalage`: x↦[x] gives E_p(M)/p≃(H^*(M/p),β), naturally in M.

*Proof sketch.* Changing a lift x changes y by a boundary or a multiple of p. Since p·dy=d²x=0, dy=0
and β²=0. The formula gives a chain map from E_p/p. It is degreewise surjective: every mod-p cocycle
has a lift whose differential lies in pM. Its kernel in degree n consists of classes of dy+pz inside
E_p^n modulo pE_p^n. If dy+pz represents a cocycle in that kernel, then d(dy+pz)/p=dz lies in
pE_p^(n+1); hence dz∈pM and z∈E_p^n. The term pz is zero in E_p/p. The remaining dy is a boundary in
the kernel, represented as d_E(py). Thus the kernel is acyclic. ([Bhatt–Lurie–Mathew, *Revisiting
the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, Construction 2.4.4 and
Proposition 2.4.5 with proof, pp.17–18.) *Needs:* *Principal p-décalage on torsion-free complexes*.

**Checks.**

- `test_pBockstein_p`: For [Z --p--> Z], both mod-p cohomology groups are F_p and β:F_p→F_p is the
  identity.
- `test_pBockstein_p_squared`: For [Z --p²--> Z], β=0 although the integral differential is nonzero.
- `test_pBockstein_degree_zero`: For Z in degree zero, β is zero and E_p/p=F_p in degree zero.
- The target differential is β, not zero.

**Derived p-décalage and completion.** The functor E_p on termwise p-torsion-free complexes descends
through quasi-isomorphisms to Lη_p:D(Z)→D(Z), and to its enhanced derived category.
H^n(Lη_pK)≅H^n(K)/H^n(K)[p]. There is a natural equivalence (Lη_pK)^∧_p≅Lη_p(K^∧_p). In particular
Lη_p preserves derived p-completeness. This is an endofunctor, without a claim that it is exact or
preserves arbitrary limits.

*Hypotheses.* p is prime; derived p-completion means Rlim_r(K⊗^L_Z Z/p^r).

The API:

- `Crystalline.derivedPDecalage_model`: For a torsion-free model M of K, Lη_pK is represented by
  E_p(M).
- `Crystalline.derivedPDecalage_cohomology`: H^n(Lη_pK)≅H^n(K)/H^n(K)[p], naturally.
- `Crystalline.derivedPDecalage_completion`: (Lη_pK)^∧_p≅Lη_p(K^∧_p), naturally in K.

*Proof sketch.* Resolve K by a complex of free abelian groups. principal-p-decalage computes
cohomology and therefore preserves quasi-isomorphisms between torsion-free models; localize this
functor to obtain Lη_p. Enhanced localization gives the enhanced functor, using the enhanced derived
category of EnhancedDerivedSheaves Layer E1. For a free model M, degreewise p-completion represents
derived completion. Express E_p(M)^n as the kernel of (d,−p):M^n⊕M^(n+1)→M^(n+1). Its cokernel is
killed by p, so completion preserves this kernel by BLM Lemma 7.2.5. Degreewise completion therefore
commutes with E_p on free models, proving the natural equivalence. ([Bhatt–Lurie–Mathew, *Revisiting
the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, Corollaries 7.2.2–7.2.3,
p.84; Proposition 7.2.4 and Lemma 7.2.5 with proofs, pp.84–85.) *Needs:* *Principal p-décalage on
torsion-free complexes*; EnhancedDerivedSheaves Layer E1.

**Checks.**

- `test_derivedPDecalage_p`: Lη_p(Z/p[0])=0, computed on [Z --p--> Z] in degrees −1,0.
- `test_derivedPDecalage_p_squared`: H⁰(Lη_p(Z/p²[0]))=Z/p and all other cohomology is zero.
- `test_derivedPDecalage_complete`: Lη_p(Z_p[0])=Z_p[0] and its derived p-completion map is an
  isomorphism.
- For K=Z/p in degree zero, Lη_pK=0; this functor is not an exact triangulated functor.

**Saturation by iterated décalage.** Every Dieudonné complex M* admits a saturation M*→Sat(M*): a
map to a saturated complex through which every map to a saturated complex factors uniquely. First
quotient by the graded subgroup T* of elements killed by a power of p; on the p-torsion-free
quotient take the direct limit of the sequence M*→(η_pM)*→(η_pη_pM)*→⋯ whose transition maps are
α_F, η_p(α_F), η_p(η_p(α_F)),… (display (8)). Saturation is left adjoint to the inclusion DC_sat↪DC.

*Hypotheses.* A Dieudonné complex; no initial saturation or p-torsion-freeness assumption.

The API:

- `Crystalline.Saturation.unit`: The canonical morphism M→Sat(M) commutes with d and F.
- `Crystalline.Saturation.lift`: For every saturated K, composition with the unit bijects
  Hom(Sat(M),K) with Hom(M,K).
- `Crystalline.Saturation.idempotent`: The unit is an isomorphism when M is saturated; hence
  saturation is idempotent.
- `Crystalline.Saturation.saturated`: Sat(M) is a saturated Dieudonné complex, for every Dieudonné
  complex M.
- `Crystalline.Saturation.isColimit`: For termwise p-torsion-free M, Sat(M) is the colimit in
  cochain complexes of M --α_F--> η_pM --η_p(α_F)--> η_pη_pM --> ⋯, its Frobenius is induced by
  those of the stages, and the unit M→Sat(M) is the canonical map from the first term.
- `Crystalline.Saturation.map`: A morphism f:M→N of Dieudonné complexes induces Sat(f):Sat(M)→Sat(N)
  with Sat(f)∘unit_M=unit_N∘f, Sat(id)=id and Sat(g∘f)=Sat(g)∘Sat(f).

*Proof sketch.* Let T⊆M be the graded subgroup of elements killed by a power of p. T is stable under
d and F, M/T is termwise p-torsion-free, and every morphism from M to a saturated (hence
p-torsion-free) complex kills T; so a saturation of M/T is a saturation of M. For termwise
p-torsion-free M form M→η_pM→η_pη_pM→⋯ with maps α_F, η_p(α_F), η_p(η_p(α_F)),…, using *Principal
p-décalage on torsion-free complexes*, applied to (ℤ, p) with its functoriality for chain maps. Each
η_p^kM is termwise p-torsion-free and is a Dieudonné complex with α=η_p^k(α_F). Let N be the colimit
of the sequence. Since η_p commutes with filtered colimits of termwise p-torsion-free complexes
(*Derived p-décalage and completion*), η_pN is the colimit of the shifted sequence and α_N:N→η_pN is
the induced isomorphism; so N is saturated. Universal property: for a morphism f:M→K with K
saturated, α_K^(−1)∘η_p(f):η_pM→K is a morphism of Dieudonné complexes extending f along α_F, and it
is the only one, because a morphism g with g∘α_F=f satisfies α_K∘g=η_p(g)∘η_p(α_F)=η_p(f). Apply
this at every stage and pass to the colimit. The adjunction of Corollary 2.3.2 restates the
universal property. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.3, definition of a saturation with
display (7), Proposition 2.3.1 with proof and display (8), Corollary 2.3.2; arXiv v3 p.15; published
pp.15–16.) *Needs:* *Saturated Frobenius*; *Morphisms of Dieudonné complexes*; *Principal p-décalage
on torsion-free complexes*; *Derived p-décalage and completion*.

**Checks.**

- `test_saturation_Z_identity`: The degree-zero complex Z with F=id is already saturated at each
  prime p, so its saturation unit is an isomorphism.
- `test_saturation_p_torsion`: The degree-zero group Z/p with F=0 has zero saturation because every
  map to a p-torsionfree group kills it.
- `test_saturation_invert_p`: For Z in degree zero with F multiplication by p, saturation is Z[1/p]
  in degree zero with the same Frobenius.
- Sat of Z in degree 0 with F=p is Z[1/p] with F=p: the sequence is Z --p--> Z --p--> ⋯.
- Sat of Z/p in degree 0 (any F) is 0, and the unit M→Sat(M) is an isomorphism for saturated M, e.g.
  Z in degree 0 with F=id.
- The unit need not be a quasi-isomorphism: for Z in degree 0 with F=p it is Z→Z[1/p].

**Cartier criterion for saturation.** If M is a termwise p-torsion-free Dieudonné complex and F
induces an isomorphism of graded groups M/p→H*(M/p), then M/p→Sat(M)/p is a quasi-isomorphism.

*Hypotheses.* p is a prime; M is a Dieudonné complex of Cartier type (BLM Definition 2.4.1): M is
termwise p-torsion-free, and x↦[Fx] induces an isomorphism of graded abelian groups M/pM→H^*(M/pM).

*Proof sketch.* Bockstein comparison (BLM Proposition 2.4.5): for termwise p-torsion-free M,
γ:(η_pM)/p→(H^*(M/pM),β), γ(x)=[p^(−k)x] for x∈(η_pM)^k, is a quasi-isomorphism of cochain
complexes, natural in M. This is *Bockstein reduction of principal p-décalage* for the one-point
topos with O=Z and I=(p): η_pM is p-torsion-free, so (η_pM)/p represents the derived reduction, and
trivialising (p)^(⊗k) by p^k identifies B_(p)(M) with (H^*(M/pM),β). A map of termwise
p-torsion-free complexes that is a quasi-isomorphism modulo p stays so after η_p (BLM Corollary
2.4.6): it induces an isomorphism on the Bockstein complexes. Factor the Cartier map through
α_F:M/p→(η_pM)/p; the triangle commutes because γ(α_F(x))=[Fx]. The Bockstein comparison and
two-out-of-three make α_F a quasi-isomorphism modulo p. Apply η_p repeatedly: the k-th map of the
sequence defining Sat(M) is η_p^k(α_F), a quasi-isomorphism modulo p by step 2. Passing from the
stages (η_p^k M)/p to Sat(M)/p uses that cohomology and reduction modulo p commute with filtered
colimits. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.4, Definition 2.4.1, Theorem 2.4.2
(Cartier Criterion), Construction 2.4.4, Proposition 2.4.5, Corollary 2.4.6 and proof of Theorem
2.4.2; arXiv v3 pp.16–18; published pp.17–19.) *Needs:* *Saturation by iterated décalage*;
*Bockstein reduction of principal p-décalage*; *Principal p-décalage on torsion-free complexes*.

**Checks.**

- For R=Z[x] with φ(x)=x^p, the p-completed de Rham complex of R with F(x^i dx)=x^(ip+p−1)dx is of
  Cartier type (BLM Corollary 3.3.8(1), by the Cartier isomorphism for F_p[x]); so
  Ω^*_(F_p[x])→Sat/p is a quasi-isomorphism.
- For Z in degree 0 with F=id (Cartier type, already saturated) the map M/p→Sat(M)/p is the identity
  of F_p.
- The hypothesis is needed: for Z in degree 0 with F=p the map M/p→H^0(M/p) is zero, and
  M/p=F_p→Sat(M)/p=Z[1/p]/p=0 is not a quasi-isomorphism.

### CR.4.2 The Verschiebung filtration and the finite quotients

**The Verschiebung filtration.** Set N_r^n(M)=im(V_n^r)+im(d_(n−1) V_(n−1)^r), as the sum of two
existing Z-submodules of M^n. The endomorphism exponent is composition. The zeroth level is all of
M^n.

The intended signature is `Crystalline.DieudonneComplex.vFiltration M hM r n :
Submodule ℤ (M.complex.X n)`, using the additive operator constructed in CR.4.1.
The intended zeroth-level theorem is `Crystalline.DieudonneComplex.vFiltration_zero`.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer.

The API:

- `Crystalline.mem_vFiltration`: x belongs to N_r^n iff x=V_n^r(a)+d V_(n−1)^r(b), for a in M^n and
  b in M^(n−1).
- `Crystalline.vFiltration_zero`: N_0^n=M^n because V^0 is identity.
- `Crystalline.vFiltration_antitone`: For r≤s, N_s^n is contained in N_r^n.
- `Crystalline.vFiltration_d`: d(N_r^n) is contained in N_r^(n+1).

*Proof sketch.* N_r^n is the sum of the image of V^r:M^n→M^n and the image of d∘V^r:M^(n−1)→M^n,
formed with LinearMap.range and the supremum of submodules; V^r is the r-fold composite. The second
summand uses degree n−1 for every integer n. Both summands are images of additive maps and no
closure is taken, as in BLM Construction 2.5.1. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.5, Construction 2.5.1, the subcomplex
im(V^r)+im(dV^r); p.19 in arXiv v3 and in the published version.) *Needs:* *Verschiebung and the
differential*; Mathlib `LinearMap.range`; Mathlib `Submodule.mem_sup`; Mathlib
`Module.End.pow_apply`.

**Checks.**

- `filtration_test_zero`: Zero belongs to N_7^n.
- `filtration_test_V_identity`: If V_n is identity and the incoming differential is zero, N_3^n=M^n.
- `filtration_test_zero_d_F_identity`: If the incoming differential is zero and F_n is identity,
  N_r^n=p^r M^n.
- `filtration_test_d_summand`: At p=2 there is a saturated M and an element of N_1^1 outside
  im(V_1): for M=[Z --id--> Z] in degrees 0 and 1 with F_0=2, F_1=id (so V_0=id, V_1=2), N_1^1=M^1
  while im(V_1)=2M^1, and dV_0(1)=1 is such an element. The same holds for every prime p with F_0=p.
- For M=Z in degree 0 with F=id: N_r^0=p^rZ.
- For T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: N_r^0=T^0 and N_r^1=T^1 for all r,
  while im(V_1^r)=p^rZ; so the summand im(dV^r) cannot be omitted.

**Representatives in the Verschiebung filtration.** x∈N_r^n iff x=V_n^r(a)+d V_(n−1)^r(b) for some
a∈M^n and b∈M^(n−1).

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer.

*Proof sketch.* Unfold the two ranges and apply Submodule.mem_sup. Reverse the displayed sum
equality if necessary. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.5, Construction 2.5.1, the subcomplex
im(V^r)+im(dV^r); p.19 in arXiv v3 and in the published version.) *Needs:* *The Verschiebung
filtration*; Mathlib `Submodule.mem_sup`; Mathlib `LinearMap.mem_range`.

**Checks.**

- For M=Z in degree 0 with F=id: x∈N_r^0 iff x=p^r a for some integer a.
- For T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: 1∈N_1^1, because 1=V_1(0)+d(V_0(1)),
  although 1∉im(V_1)=pZ.

**Zeroth Verschiebung filtration.** N_0^n=M^n for every n.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer.

*Proof sketch.* V^0 is identity, so the first range is top. This holds without any assumption on the
incoming differential. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.5, Construction 2.5.1, the case r=0 (the
displayed tower ends with W_0(M)^*=0); p.19 in arXiv v3 and in the published version.) *Needs:* *The
Verschiebung filtration*; Mathlib `Module.End.pow_apply`.

**Checks.**

- For M=Z in degree 0 with F=id and for T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id:
  N_0^n=M^n in every degree; consequently W_0(M)=0.

**Decreasing Verschiebung filtration.** The sequence r↦N_r^n is antitone.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer; r≤s are
nonnegative integers.

*Proof sketch.* Write V^(r+1)=V^r∘V in both summands. This gives N_(r+1)⊆N_r, then iterate the
inclusion for arbitrary r≤s. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.5, Construction 2.5.1, the natural
quotient maps Res; p.19 in arXiv v3 and in the published version.) *Needs:* *Representatives in the
Verschiebung filtration*; Mathlib `Module.End.pow_apply`; Mathlib `LinearMap.range_comp_le_range`.

**Checks.**

- For M=Z in degree 0 with F=id the chain is Z⊇pZ⊇p²Z⊇⋯, strictly decreasing.
- For Q in degree 0 with F=id it is constant: N_r^0=Q for all r.

**Differential stability of the filtration.** d maps N_r^n into N_r^(n+1).

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer.

*Proof sketch.* For x=V^r a+dV^r b, dx=dV^r a because d²=0. This is exactly the second summand in
degree n+1. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.5, Construction 2.5.1 ("the subcomplex
im(V^r)+im(dV^r)"); p.19 in arXiv v3 and in the published version.) *Needs:* *Representatives in the
Verschiebung filtration*; Mathlib `HomologicalComplex.d_comp_d`.

**Checks.**

- For T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: d(N_r^0)=d(Z)=Z=N_r^1.
- For E, the free strict Dieudonné complex on one generator x in degree 0 (BLM Example 2.5.7):
  Vx∈N_1^0 and d(Vx)=dVx∈N_1^1.

**Frobenius lowers the filtration.** F_n(N_(r+1)^n)⊆N_r^n.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer.

*Proof sketch.* On V^(r+1)a, FV=p gives p V^r a. On dV^(r+1)b, FdV=d gives dV^r b. Both lie in the
required two summands. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.5, Remark 2.5.2, first paragraph; p.19
in arXiv v3 and in the published version.) *Needs:* *Representatives in the Verschiebung
filtration*; *FV=p*; *FdV=d*; Mathlib `Module.End.pow_apply`.

**Checks.**

- For M=Z in degree 0 with F=id: F(N_(r+1)^0)=p^(r+1)Z⊆p^rZ=N_r^0.
- F need not preserve a level: for E, the free strict Dieudonné complex on one generator x in degree
  0 (BLM Example 2.5.7), dVx∈N_1^1 and F(dVx)=dx lies in N_0^1 but not in N_1^1.

**Verschiebung raises the filtration.** V_n(N_r^n)⊆N_(r+1)^n.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer.

*Proof sketch.* The first summand maps to V^(r+1)a. The second maps to p dV^(r+1)b by Vd=p dV.
([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3),
arXiv v3, §2.5, Remark 2.5.2, second paragraph; p.19 in arXiv v3 and in the published version.)
*Needs:* *Representatives in the Verschiebung filtration*; *Vd=p dV*; Mathlib
`Module.End.pow_apply`.

**Checks.**

- For M=Z in degree 0 with F=id: V(N_r^0)=p·p^rZ=N_(r+1)^0.
- For E, the free strict Dieudonné complex on one generator x in degree 0 (BLM Example 2.5.7):
  dx∈N_0^1 and V(dx)=p·dVx∈N_1^1.

**Multiplication by p raises the filtration.** For x∈N_r^n, px∈N_(r+1)^n.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer.

*Proof sketch.* VF=p gives pV^r a=V^r(VFa)=V^(r+1)(Fa) and p·dV^r b=dV^r(VFb)=dV^(r+1)(Fb); so p(V^r
a+dV^r b)∈N_(r+1)^n. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.6, proof of Proposition 2.6.2,
verification of axiom (7), first half; p.22 in arXiv v3 and in the published version.) *Needs:*
*Representatives in the Verschiebung filtration*; *VF=p*; Mathlib `Module.End.pow_apply`.

**Checks.**

- For M=Z in degree 0 with F=id: p·N_r^0=p^(r+1)Z=N_(r+1)^0.

**Frobenius lifting after a divided differential.** If d(V^r x) is divisible by p in M^(n+1), then x
belongs to im(F_n).

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer. x∈M^n.

*Proof sketch.* Iterating FdV=d gives dx=F^r d(V^r x). If d(V^r x)=py then dx=F^r(py)=p·F^r(y), so
dx∈pM^(n+1). Hence x∈F(M^n), by the description of the image of F for saturated M (*Image of
Frobenius on a saturated complex*). ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.6, Lemma 2.6.3 with proof; arXiv v3
p.21; published p.22.) *Needs:* *FdV=d*; *Image of Frobenius on a saturated complex*; Mathlib
`Module.End.pow_apply`.

**Checks.**

- For T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id and x∈T^0: d(V_0^r x)=x is divisible by
  p iff x∈pZ=im(F_0).
- For M=Z in degree 0 with F=id the hypothesis always holds (d=0) and every x lies in im(F)=Z.

**Cancellation across filtration levels.** If px∈N_(r+1)^n, then x∈N_r^n.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer. x∈M^n.

*Proof sketch.* Write px=V^(r+1)a+dV^(r+1)b. Differentiating gives dV^(r+1)a=p dx; the lifting lemma
writes a=Fa′. Substitute and use V^(r+1)F=pV^r. The residual dV^(r+1)b is p-divisible, so b=Fb′ by
the same lemma. The resulting equality is px=p(V^r a′+dV^r b′). Cancel p in M^n.
([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3),
arXiv v3, §2.6, Lemma 2.6.4 with proof; p.22 in arXiv v3 and in the published version.) *Needs:*
*Representatives in the Verschiebung filtration*; *Frobenius lifting after a divided differential*;
*VF=p*; *p-torsion-freeness of a saturated complex*; Mathlib `HomologicalComplex.d_comp_d`.

**Checks.**

- For M=Z in degree 0 with F=id: px∈p^(r+1)Z implies x∈p^rZ.
- The shift is exactly one in that example: for x=p^r, px∈N_(r+1)^0 and x∈N_r^0, but x∉N_(r+1)^0.

**Finite Verschiebung quotient complex.** For saturated M and r≥0 define W_r(M)^n=M^n/N_r^n for
every integer n, with differential [x]↦[dx]; this is a cochain complex of abelian groups graded by
all integers. The notation W_r here is a quotient of a Dieudonné complex, not the ring of truncated
Witt vectors.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer.

The API:

- `Crystalline.Wmk`: The canonical linear quotient projection M^n→W_r(M)^n.
- `Crystalline.Wmk_surjective`: Every class in W_r(M)^n is represented by an element of M^n.
- `Crystalline.Wmk_eq_zero`: The class of x is zero iff x∈N_r^n.
- `Crystalline.Wcomplex_d_mk`: The quotient differential sends the class of x to the class of dx.

*Proof sketch.* d maps N_r^n into N_r^(n+1) (*Differential stability of the filtration*), so it
induces a map of quotients by Submodule.mapQ; the induced map squares to zero because d does,
checked on representatives. The complex is assembled from these groups and maps with
CochainComplex.of; Wmk:M^n→W_r(M)^n is the quotient map Submodule.Quotient.mk. ([Bhatt–Lurie–Mathew,
*Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.5,
Construction 2.5.1; p.19 in arXiv v3 and in the published version.) *Needs:* *Differential stability
of the filtration*; Mathlib `CochainComplex.of`; Mathlib `ModuleCat.ofHom`; Mathlib
`Submodule.mapQ`; Mathlib `Submodule.Quotient.mk`; Mathlib `HomologicalComplex.d_comp_d`.

**Checks.**

- `Wcomplex_test_zero_level`: Every group of W_0(M) is zero.
- `Wcomplex_test_zero_complex`: If M is degreewise zero, so is every W_r(M).
- `Wcomplex_test_V_surjective`: If V is surjective in every degree, all W_r(M) vanish, including
  rational degree-zero M with F identity.
- `Wcomplex_test_Z8`: For M^0 identified with Z, zero incoming differential and F_0 identity at p=2,
  W_3(M)^0 is Z/8 as a Z-module.
- For M=Z in degree 0 with F=id: W_r(M) is Z/p^r in degree 0 (Z/8 for p=2, r=3).
- W_0(M)=0 for every saturated M; for Q in degree 0 with F=id, W_r=0 for all r.
- For T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: W_r(T)^1=0 although T^1/V^r(T^1)=Z/p^r,
  so the summand im(dV^r) matters.

**Surjectivity of the quotient projection.** The degreewise map Wmk:M^n→W_r(M)^n is surjective.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer.

*Proof sketch.* Wmk is the quotient map of M^n by the submodule N_r^n, which is surjective
(Submodule.mkQ_surjective). ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.5, Construction 2.5.1; p.19 in arXiv v3
and in the published version.) *Needs:* *Finite Verschiebung quotient complex*; Mathlib
`Submodule.mkQ_surjective`.

**Checks.**

- For M=Z in degree 0 with F=id, Wmk is the reduction Z→Z/p^r, which is surjective.

**Zero classes in finite quotients.** Wmk(x)=0 iff x∈N_r^n.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer.

*Proof sketch.* The class of x in the quotient M^n/N_r^n is zero iff x∈N_r^n
(Submodule.Quotient.mk_eq_zero). ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.5, Construction 2.5.1; p.19 in arXiv v3
and in the published version.) *Needs:* *Finite Verschiebung quotient complex*; Mathlib
`Submodule.Quotient.mk_eq_zero`.

**Checks.**

- For M=Z in degree 0 with F=id: the class of x in Z/p^r is zero iff x∈p^rZ=N_r^0.
- For T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: the class of 1∈T^1 in W_1(T)^1 is zero,
  because 1=d(V_0(1))∈N_1^1.

**Differential of a quotient representative.** d(Wmk(x))=Wmk(dx) in W_r(M)^(n+1).

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer.

*Proof sketch.* Unfold CochainComplex.of at adjacent indices and use mapQ_apply.
([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3),
arXiv v3, §2.5, Construction 2.5.1; p.19 in arXiv v3 and in the published version.) *Needs:* *Finite
Verschiebung quotient complex*; Mathlib `Submodule.mapQ_apply`.

**Checks.**

- For E, the free strict Dieudonné complex on one generator x in degree 0 (BLM Example 2.5.7):
  d[x]_1=[dx]_1 in W_1(E)^1, and this class is nonzero, because every element of N_1^1 has its
  coefficient of dx divisible by p.

**Projection to the finite quotient.** The degreewise projections Wmk assemble into a cochain map
M→W_r(M).

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer.

The API:

- `Crystalline.Wprojection_apply`: Its degree-n component sends x to Wmk(x).
- `Crystalline.Wprojection_surjective`: Every component is surjective.
- `Crystalline.Wprojection_kernel`: The degree-n kernel is N_r^n.

*Proof sketch.* The components are the maps Wmk; the cochain-map condition is d[x]=[dx]
(*Differential of a quotient representative*). ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.5, Construction 2.5.1 and the displayed
tower M^*→⋯→W_1(M)^*→W_0(M)^* after Remark 2.5.3; arXiv v3 pp.19–20; published pp.19–20.) *Needs:*
*Finite Verschiebung quotient complex*; *Differential of a quotient representative*; *Surjectivity
of the quotient projection*; *Zero classes in finite quotients*; Mathlib `CochainComplex.ofHom`;
Mathlib `Submodule.mkQ`.

**Checks.**

- `projection_test_level_zero`: The projection to W_0 is zero.
- `projection_test_V_power`: The projection kills V^r(x).
- `projection_test_dV_power`: The projection also kills dV^r(y), even when this element is not in
  im(V^r).
- For M=Z in degree 0 with F=id the projection is the reduction Z→Z/p^r, with kernel p^rZ.

**Restriction between finite quotients.** The inclusion N_(r+1)⊆N_r induces a cochain map
R_r:W_(r+1)(M)→W_r(M), represented by the identity on M.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer.

The API:

- `Crystalline.Wrestriction_mk`: R_r([x]_(r+1))=[x]_r.
- `Crystalline.Wrestriction_surjective`: R_r is surjective in each degree.
- `Crystalline.Wprojection_restriction`: Projection to level r+1 followed by R_r equals projection
  to level r.

*Proof sketch.* Apply mapQ to identity degreewise and use d-stability; compatibility with
differentials is checked on representatives. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.5, Construction 2.5.1, the maps Res;
p.19 in arXiv v3 and in the published version.) *Needs:* *Decreasing Verschiebung filtration*;
*Finite Verschiebung quotient complex*; *Surjectivity of the quotient projection*; *Differential of
a quotient representative*; Mathlib `Submodule.mapQ`; Mathlib `CochainComplex.ofHom`.

**Checks.**

- `restriction_test_zero`: R_0 has zero target and sends every class to zero.
- `restriction_test_two_steps`: R_r R_(r+1)([x]_(r+2))=[x]_r.
- `restriction_test_d`: Restriction commutes with the quotient differential.
- For M=Z in degree 0 with F=id, R_r is the reduction Z/p^(r+1)→Z/p^r.
- R_0:W_1(M)→W_0(M)=0 is zero.

**Restriction on representatives.** R_r([x]_(r+1))=[x]_r.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer. x∈M^n.

*Proof sketch.* Use the defining identity lift and mapQ_apply. ([Bhatt–Lurie–Mathew, *Revisiting the
de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.5, Construction 2.5.1, the
maps Res; p.19 in arXiv v3 and in the published version.) *Needs:* *Restriction between finite
quotients*; Mathlib `Submodule.mapQ_apply`.

**Checks.**

- For M=Z in degree 0 with F=id: R_r(x mod p^(r+1))=x mod p^r.

**Frobenius on finite quotients.** The map F induces Z-linear degree maps F_r:W_(r+1)(M)^n→W_r(M)^n
sending [x] to [Fx].

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer.

The API:

- `Crystalline.WF_mk`: F_r([x]_(r+1))=[Fx]_r.
- `Crystalline.WF_d`: d F_r=p F_r d, with the degree and level indices shown.
- `Crystalline.WF_restriction`: R_r F_(r+1)=F_r R_(r+1) from level r+2 to r.

*Proof sketch.* Apply Submodule.mapQ to F, using F(N_(r+1)^n)⊆N_r^n (*Frobenius lowers the
filtration*). The relation d∘F_r=p·F_r∘d follows on representatives from dF=pFd, and
R_r∘F_(r+1)=F_r∘R_(r+1) holds because both send [x]_(r+2) to [Fx]_r. ([Bhatt–Lurie–Mathew,
*Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.5, Remark
2.5.2, first paragraph and diagram, p.19 in arXiv v3 and in the published version; indexing as in
§2.6, Definition 2.6.1, p.21 in both.) *Needs:* *Frobenius lowers the filtration*; *Finite
Verschiebung quotient complex*; *Frobenius relation dF=pFd*; *Surjectivity of the quotient
projection*; *Differential of a quotient representative*; *Restriction on representatives*; Mathlib
`Submodule.mapQ`.

**Checks.**

- `WF_test_zero_level`: F_0 has zero target.
- `WF_test_identity`: If F is identity on M, F_r equals R_r.
- `WF_test_non_chain`: At p=2 there is a saturated M for which F_1:W_2(M)→W_1(M) does not commute
  with d: for M the free strict Dieudonné complex on one generator x in degree 0 (BLM Example
  2.5.7), d(F_1[x]_2)=[2F dx]_1=0 while F_1(d[x]_2)=[F dx]_1≠0 in W_1(M)^1. The same M works for
  every prime p.
- For M=Z in degree 0 with F=id, F_r is the reduction Z/p^(r+1)→Z/p^r; it equals R_r.
- For E, the free strict Dieudonné complex on one generator x in degree 0 (BLM Example 2.5.7):
  d(F_1[x]_2)=[pF dx]_1=0 and F_1(d[x]_2)=[F dx]_1≠0, so F_1 is not a cochain map, while
  d∘F_1=p·F_1∘d holds.

**Frobenius on representatives.** F_r([x]_(r+1))=[Fx]_r.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer. x∈M^n.

*Proof sketch.* Apply mapQ_apply to the defining degree map. ([Bhatt–Lurie–Mathew, *Revisiting the
de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.5, Remark 2.5.2, first
paragraph and diagram; p.19 in arXiv v3 and in the published version.) *Needs:* *Frobenius on finite
quotients*; Mathlib `Submodule.mapQ_apply`.

**Checks.**

- For M=Z in degree 0 with F=id: F_r(x mod p^(r+1))=x mod p^r.
- For Z_p in degree 0 with F multiplication by a p-adic unit u: F_r(x mod p^(r+1))=ux mod p^r.

**Verschiebung on finite quotients.** The map V induces Z-linear degree maps
V_r:W_r(M)^n→W_(r+1)(M)^n sending [x] to [Vx].

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer.

The API:

- `Crystalline.WV_mk`: V_r([x]_r)=[Vx]_(r+1).
- `Crystalline.WV_d`: V_r∘d=p·d∘V_r as maps W_r(M)^n→W_(r+1)(M)^(n+1), for every integer n.
- `Crystalline.WV_restriction`: R_(r+1) V_(r+1)=V_r R_r from level r+1 to itself.

*Proof sketch.* Apply Submodule.mapQ to V, using V(N_r^n)⊆N_(r+1)^n (*Verschiebung raises the
filtration*). The relation V_r∘d=p·d∘V_r follows on representatives from Vd=p dV, and
R_(r+1)∘V_(r+1)=V_r∘R_r holds because both send [x]_(r+1) to [Vx]_(r+1). ([Bhatt–Lurie–Mathew,
*Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.5, Remark
2.5.2, second paragraph and diagram, p.19 in arXiv v3 and in the published version; §2.6, Definition
2.6.1, p.21 in both.) *Needs:* *Verschiebung raises the filtration*; *Finite Verschiebung quotient
complex*; *Vd=p dV*; *Surjectivity of the quotient projection*; *Differential of a quotient
representative*; *Restriction on representatives*; Mathlib `Submodule.mapQ`.

**Checks.**

- `WV_test_zero_level`: V_0 has zero source.
- `WV_test_identity_frobenius`: If F is identity, V_r([x])=p[x] at level r+1.
- `WV_test_non_chain`: At p=2 there is a saturated M for which V_1:W_1(M)→W_2(M) does not commute
  with d: for M the free strict Dieudonné complex on one generator x in degree 0 (BLM Example
  2.5.7), d(V_1[x]_1)=[dVx]_2≠0 while V_1(d[x]_1)=[2dVx]_2=0 in W_2(M)^1, because 2dVx=dV²(Fx). The
  same M works for every prime p.
- For M=Z in degree 0 with F=id, V_r is multiplication by p from Z/p^r to Z/p^(r+1), which is
  injective.
- For E, the free strict Dieudonné complex on one generator x in degree 0 (BLM Example 2.5.7):
  d(V_1[x]_1)=[dVx]_2≠0 and V_1(d[x]_1)=p[dVx]_2=0 in W_2(E)^1 (p·dVx=dV²(Fx)), so V_1 is not a
  cochain map, while V_1∘d=p·d∘V_1 holds.

**Verschiebung on representatives.** V_r([x]_r)=[Vx]_(r+1).

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer. x∈M^n.

*Proof sketch.* Apply mapQ_apply to the defining degree map. ([Bhatt–Lurie–Mathew, *Revisiting the
de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.5, Remark 2.5.2, second
paragraph and diagram; p.19 in arXiv v3 and in the published version.) *Needs:* *Verschiebung on
finite quotients*; Mathlib `Submodule.mapQ_apply`.

**Checks.**

- For M=Z in degree 0 with F=id: V_r(x mod p^r)=px mod p^(r+1).

**Finite Frobenius after Verschiebung.** F_r V_r=p on W_r(M)^n, including r=0.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer.

*Proof sketch.* Lift a class to M, use FV=p there, and apply the quotient map. ([Bhatt–Lurie–Mathew,
*Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.6,
Definition 2.6.1(5), p.21 in arXiv v3 and in the published version; proof of Proposition 2.6.2,
first sentences, p.22 in both.) *Needs:* *Frobenius on representatives*; *Verschiebung on
representatives*; *Surjectivity of the quotient projection*; *FV=p*.

**Checks.**

- For M=Z in degree 0 with F=id: F_rV_r is Z/p^r --p--> Z/p^(r+1) --reduction--> Z/p^r,
  multiplication by p.
- For r=0 both sides are the zero map of W_0(M)=0.

**Finite Verschiebung after Frobenius.** V_r F_r=p on W_(r+1)(M)^n. In particular p annihilates
W_1(M).

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer.

*Proof sketch.* Lift a class to M and use VF=p. For r=0 the intermediate group W_0 is zero.
([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3),
arXiv v3, §2.6, Definition 2.6.1(5), p.21 in arXiv v3 and in the published version; proof of
Proposition 2.6.2, first sentences, p.22 in both.) *Needs:* *Frobenius on representatives*;
*Verschiebung on representatives*; *Surjectivity of the quotient projection*; *VF=p*; *Zeroth
Verschiebung filtration*.

**Checks.**

- For M=Z in degree 0 with F=id: V_rF_r is Z/p^(r+1) --reduction--> Z/p^r --p--> Z/p^(r+1),
  multiplication by p.
- p·W_1(M)=0: for M=Z in degree 0 with F=id, W_1(M)=Z/p.

**Restriction kernel and p-torsion.** For x∈W_(r+1)(M)^n, R_r(x)=0 iff px=0. This is the kernel of
restriction, not the kernel of Frobenius.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer.

*Proof sketch.* Represent x by a∈M^n. R_r(x)=0 means a∈N_r; px=0 means pa∈N_(r+1). Use p-shift and
p-cancellation for the two implications. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.6, Definition 2.6.1(7), p.21 in arXiv v3
and in the published version; proof of Proposition 2.6.2, verification of (7), p.22 in both.)
*Needs:* *Surjectivity of the quotient projection*; *Zero classes in finite quotients*; *Restriction
on representatives*; *Multiplication by p raises the filtration*; *Cancellation across filtration
levels*.

**Checks.**

- For M=Z in degree 0 with F=id: ker(Z/p^(r+1)→Z/p^r)=p^rZ/p^(r+1)Z=(Z/p^(r+1))[p].
- For r=0: R_0=0 and p·W_1(M)=0.

**Finite Frobenius lifting.** If x∈W_r(M)^n has d x divisible by p in W_r(M)^(n+1), then x has a
preimage under F_r:W_(r+1)(M)^n→W_r(M)^n.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer.

*Proof sketch.* For r=0 take the zero preimage, since W_0=0. For r≥1 lift the equation to dx=py+V^r
a+dV^r b. Differentiate: dV^r a is p-divisible, hence a=Fa′. Then d(x−V^r b)=p(y+V^(r−1)a′).
Saturation lifts x−V^r b to Fz. Modulo N_r it has the same class as x, so the class of z at level
r+1 is the required preimage. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.6, Definition 2.6.1(6), p.21 in arXiv v3
and in the published version; proof of Proposition 2.6.2, verification of (6), p.22 in both.)
*Needs:* *Surjectivity of the quotient projection*; *Zero classes in finite quotients*;
*Differential of a quotient representative*; *Frobenius on representatives*; *Representatives in the
Verschiebung filtration*; *Frobenius lifting after a divided differential*; *VF=p*; *Image of
Frobenius on a saturated complex*; *Zeroth Verschiebung filtration*; Mathlib
`HomologicalComplex.d_comp_d`.

**Checks.**

- For M=Z in degree 0 with F=id (d=0): every class of Z/p^r is F_r of a class of Z/p^(r+1), since
  F_r is the surjective reduction.
- For E, the free strict Dieudonné complex on one generator x in degree 0 (BLM Example 2.5.7) and
  the class [Fx]_1∈W_1(E)^0: d[Fx]_1=[pF dx]_1=0 is divisible by p, and [Fx]_1=F_1([x]_2).

**Annihilation at finite level.** Multiplication by p^r annihilates every group W_r(M)^n. No
torsionfreeness of the finite quotient is asserted.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; n is any integer and r≥0 is an
integer.

*Proof sketch.* Start with every a∈N_0 and apply p-shift r times. Then p^r a∈N_r, so its class is
zero. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.8, proof of Corollary 2.8.2, last
sentence; arXiv v3 p.27; published p.27. A consequence of axioms (1) and (7) of Definition 2.6.1
(proof of Proposition 2.6.2, p.22 in both versions).) *Needs:* *Zeroth Verschiebung filtration*;
*Multiplication by p raises the filtration*; *Surjectivity of the quotient projection*; *Zero
classes in finite quotients*.

**Checks.**

- For M=Z in degree 0 with F=id: p^r kills W_r(M)=Z/p^r and, for r≥1, p^(r−1) does not; so the
  exponent is sharp.

**Functorial finite quotients.** A Dieudonné morphism f between saturated M,N induces a cochain map
W_r(f):W_r(M)→W_r(N), represented by f in every degree.

*Hypotheses.* p is a prime; M and N are saturated Dieudonné complexes and f:M→N is a morphism of
Dieudonné complexes; r≥0 is an integer.

The API:

- `Crystalline.DieudonneHom.Wmap_mk`: W_r(f)([x])=[f(x)].
- `Crystalline.DieudonneHom.Wmap_restriction`: R_N∘W_(r+1)(f)=W_r(f)∘R_M as cochain maps
  W_(r+1)(M)→W_r(N), where R_M, R_N are the restriction maps R_r of M and N.
- `Crystalline.DieudonneHom.Wmap_F`: W_r(f)∘F_r=F_r∘W_(r+1)(f) in every degree, as maps
  W_(r+1)(M)^n→W_r(N)^n.
- `Crystalline.DieudonneHom.Wmap_V`: W_(r+1)(f)∘V_r=V_r∘W_r(f) in every degree, as maps
  W_r(M)^n→W_(r+1)(N)^n.
- `Crystalline.DieudonneHom.Wmap_id`: W_r of the identity is identity.
- `Crystalline.DieudonneHom.Wmap_comp`: W_r(g∘f)=W_r(g)∘W_r(f).

*Proof sketch.* Commutation with V gives fV^r=V^r f; the existing cochain-map identity gives f
dV^r=dV^r f. Hence f maps each N_r(M) into N_r(N). Use mapQ and the ordinary cochain-map
constructor. Identity/composition and compatibility with R,F,V are checked on representatives.
([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3),
arXiv v3, §2.5, Remark 2.5.3; arXiv v3 pp.19–20; published p.20.) *Needs:* *Morphisms of Dieudonné
complexes*; *Morphisms commute with Verschiebung*; *Representatives in the Verschiebung filtration*;
*Finite Verschiebung quotient complex*; *Surjectivity of the quotient projection*; *Restriction on
representatives*; *Frobenius on representatives*; *Verschiebung on representatives*; Mathlib
`HomologicalComplex.Hom.comm`; Mathlib `Submodule.mapQ`; Mathlib `Submodule.mapQ_comp`; Mathlib
`Submodule.mapQ_id`; Mathlib `CochainComplex.ofHom`.

**Checks.**

- `Wmap_test_identity`: The induced identity map fixes each quotient class.
- `Wmap_test_zero`: A morphism with zero underlying cochain map induces the zero map.
- `Wmap_test_level_zero`: Every induced map at level zero is zero.
- `Wmap_test_scalar`: For M=N=Z in degree 0 with F=id and f multiplication by an integer a, W_r(f)
  is multiplication by a on W_r(M)^0=Z/p^r, for every r≥0.
- For the inclusion Z→Z_p (both in degree 0 with F=id), W_r(f) is the isomorphism Z/p^r→Z_p/p^rZ_p.

### CR.4.3 Strict Dieudonné complexes, towers and completion

**The finite quotients compute cohomology modulo p^r.** Let M be a saturated Dieudonné complex and
r≥0. (1) For every integer n, x↦F^r x induces an isomorphism of abelian groups
θ_r:W_r(M)^n→H^n(M/p^rM), [x]↦[F^r x], natural in M for morphisms of saturated Dieudonné complexes
(BLM Proposition 2.7.1). (2) The quotient map M/pM→W_1(M) is a quasi-isomorphism of cochain
complexes (BLM Corollary 2.7.2); more generally, M/p^rM→W_r(M) is a quasi-isomorphism for every r≥0
(BLM Remark 2.7.3). (3) For a morphism f:M→N of saturated Dieudonné complexes the following are
equivalent: M/pM→N/pN is a quasi-isomorphism; W_1(f):W_1(M)→W_1(N) is an isomorphism of cochain
complexes; M/p^rM→N/p^rN is a quasi-isomorphism for every r≥0; W_r(f) is an isomorphism of cochain
complexes for every r≥0 (BLM Corollary 2.7.4).

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; r≥0 and n are integers. M/p^rM is
the quotient of M by the subcomplex p^rM, and H^n is its cohomology in degree n; the map
M/p^rM→W_r(M) exists because p^rM^n⊆N_r^n.

*Proof sketch.* θ_r is well defined: d(F^r x)=p^r F^r(dx) by dF=pFd, so F^r x is a cocycle of
M/p^rM; and F^rV^r a=p^r a, F^r dV^r b=db by FV=p and FdV=d, so F^r maps N_r^n to coboundaries of
M/p^rM. It is natural in M because morphisms of Dieudonné complexes commute with F and induce the
maps W_r(f) of *Functorial finite quotients*. θ_r is surjective: a class of H^n(M/p^rM) is
represented by z∈M^n with dz∈p^rM^(n+1), and such z lies in F^r(M^n) by *Iterated Frobenius
divisibility*. θ_r is injective: if F^r x=p^r y+dz, then p^r x=V^rF^r x=p^rV^r y+V^r dz=p^r(V^r
y+dV^r z) by VF=p and Vd=p dV; cancel p^r, so x∈N_r^n. p^rM^n⊆N_r^n because p^r x=V^rF^r x, so
M/p^rM→W_r(M) is defined. It is surjective on H^n: a cocycle of W_r(M) is the class of x∈M^n with
dx=V^r y+dV^r z; then dV^r y=0, so dy=F^r dV^r y=0, y=F^r y′ by *Iterated Frobenius divisibility*,
V^r y=p^r y′, and x−V^r z is a cocycle of M/p^rM with the same class in W_r(M). It is injective on
H^n: if w∈M^n has dw∈p^rM^(n+1) and w=dw′+V^r u+dV^r v, then dV^r u=dw∈p^rM^(n+1), so du=F^r dV^r
u∈p^rM^(n+1) and u=F^r u′; hence w=d(w′+V^r v)+p^r u′ is a coboundary of M/p^rM. (3): by (1) and its
naturality, W_r(f) is an isomorphism if and only if M/p^rM→N/p^rN is a quasi-isomorphism. The case
r=1 implies all r by induction, using the exact sequences 0→M/p^(r−1)M→M/p^rM→M/pM→0 (multiplication
by p is injective on M) and the five lemma. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.7, Proposition 2.7.1 with proof,
Corollaries 2.7.2 and 2.7.4, Remark 2.7.3; arXiv v3 pp.23–24;
[Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3),
arXiv v3, §2.7, Corollary 2.7.2 (arXiv v3 pp.23–24) and Remark 2.7.3 (arXiv v3 p.24).) *Needs:* *Iterated Frobenius divisibility*; *Finite Verschiebung quotient complex*;
*Surjectivity of the quotient projection*; *Zero classes in finite quotients*; *Differential of a
quotient representative*; *Representatives in the Verschiebung filtration*; *Frobenius relation
dF=pFd*; *FV=p*; *VF=p*; *FdV=d*; *Vd=p dV*; *p-torsion-freeness of a saturated complex*;
*Functorial finite quotients*; Mathlib `HomologicalComplex.homology`; Mathlib `QuasiIso`; Mathlib
`HomologicalComplex.d_comp_d`.

**Checks.**

- For M=Z in degree 0 with F=id: W_r(M)^0=Z/p^r=H^0(Z/p^r), θ_r is the identity, and Z/p^r→W_r(M) is
  an isomorphism.
- For T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id: W_r(T)=0, and T/p^rT=[Z/p^r --id-->
  Z/p^r] is acyclic.
- For Q in degree 0 with F=id: W_r(Q)=0=H^*(Q/p^rQ).

**Completion of a saturated Dieudonné complex.** For saturated M* form W_r(M)*=M*/(im V^r+im dV^r)
for r≥0 (W_0(M)*=0), the restriction maps `Res:W_{r+1}(M)*→W_r(M)*`, and the completion W(M)*=lim_r
W_r(M)*. For every r≥0, F descends to `F:W_{r+1}(M)*→W_r(M)*` and V to `V:W_r(M)*→W_{r+1}(M)*`; passing
to the limit makes W(M)* a Dieudonné complex, the construction is functorial, and the tautological
map ρ_M:M*→W(M)* is a map of Dieudonné complexes (Remark 2.5.3).

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex; r≥0 is an integer.

The API:

- `Crystalline.Completion.restriction`: Res:W_(r+1)(M)→W_r(M) is the cochain map R_r of *Restriction
  between finite quotients*: it is surjective in every degree and Res([x]_(r+1))=[x]_r.
- `Crystalline.Completion.F`: F descends from `W_{r+1}M` to W_rM; on the inverse limit it satisfies
  dF=pFd.
- `Crystalline.Completion.V`: V descends to V_r:W_r(M)→W_(r+1)(M) with V_r∘d=p·d∘V_r; on W(M)^n,
  viewed as compatible families (x_r)_r, it defines V(x) by V(x)_(r+1)=V_r(x_r) and V(x)_0=0.
- `Crystalline.Completion.unit`: The natural map ρ:M→lim_r W_rM is a morphism of Dieudonné
  complexes.
- `Crystalline.Completion.projection`: For every r≥0 there is a cochain map π_r:W(M)→W_r(M), with
  Res∘π_(r+1)=π_r.
- `Crystalline.Completion.unit_projection`: π_r∘ρ_M is the quotient map M→W_r(M) of *Projection to
  the finite quotient*, for every r≥0.
- `Crystalline.Completion.ext`: Two elements x, y of W(M)^n are equal iff π_r(x)=π_r(y) for every
  r≥0.
- `Crystalline.Completion.lift`: For a cochain complex K of abelian groups and cochain maps
  g_r:K→W_r(M) with Res∘g_(r+1)=g_r for all r, there is a unique cochain map g:K→W(M) with π_r∘g=g_r
  for all r.
- `Crystalline.Completion.F_coordinate`: π_r(F x)=F_r(π_(r+1) x) for x∈W(M)^n and r≥0, where
  F_r:W_(r+1)(M)→W_r(M) is the map of *Frobenius on finite quotients*.
- `Crystalline.Completion.map`: A morphism f:M→N of saturated Dieudonné complexes induces a morphism
  of Dieudonné complexes W(f):W(M)→W(N) with π_r∘W(f)=W_r(f)∘π_r for all r; W(id)=id,
  W(g∘f)=W(g)∘W(f), and W(f)∘ρ_M=ρ_N∘f.

*Proof sketch.* The denominator is a subcomplex because d²=0. Use FdV=d and FV=p to show F lowers
the level. Use Vd=p dV to show V raises the level. Pass the compatible graded maps and the
differential to the inverse limit; check naturality under maps of saturated complexes.
([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3),
arXiv v3, §2.5, Construction 2.5.1 (Completion), Remarks 2.5.2 and 2.5.3; arXiv v3 pp.19–20;
published p.19 (2.5.1, 2.5.2) and p.20 (2.5.3).) *Needs:* *Verschiebung and the differential*;
*Projection to the finite quotient*; *Restriction between finite quotients*; *Frobenius on finite
quotients*; *Verschiebung on finite quotients*; *Functorial finite quotients*.

**Checks.**

- `test_completion_W0`: W₀M is the zero complex, since V⁰ is identity.
- `test_completion_Z`: For M=Z in degree zero with F=id, V=p, W_rM=Z/p^r and W(M)=Z_p.
- `test_completion_rational`: For M=Q in degree zero with F=id, V=p is bijective, all W_rM vanish
  and the completion is zero.
- For M=Z in degree 0 with F=id: W_r(M)=Z/p^r, Res and F are the reduction Z/p^(r+1)→Z/p^r, V is
  multiplication by p from Z/p^r to Z/p^(r+1), W(M)=Z_p and ρ_M is Z→Z_p.
- For T=[Z --id--> Z] in degrees 0 and 1 with F_0=p, F_1=id every W_r(T) is 0, because V_0=id.

**Strict Dieudonné complexes.** A Dieudonné complex M is strict if it is saturated and the canonical
map ρ_M:M→W(M) to its completion is an isomorphism of Dieudonné complexes; equivalently, M is
saturated and ρ_M:M^n→W(M)^n=lim_r M^n/N_r^n is bijective for every integer n. DC_str is the full
subcategory of DC on the strict Dieudonné complexes.

*Hypotheses.* p is a prime; M is a Dieudonné complex. The completion W(M) and the map ρ_M are
defined for saturated M, so saturation is part of the definition.

The API:

- `Crystalline.IsStrict.unit_bijective`: A saturated Dieudonné complex M is strict iff
  ρ_M:M^n→W(M)^n is bijective for every integer n; equivalently, iff ρ_M is an isomorphism in DC.
- `Crystalline.IsStrict.iff_separated_complete`: For saturated M and every integer n, ker(ρ_M) in
  degree n is ⋂_(r≥0) N_r^n, and ρ_M is surjective in degree n iff every sequence (x_r)_r in M^n
  with x_(r+1)−x_r∈N_r^n for all r has an x∈M^n with x−x_r∈N_r^n for all r. So M is strict iff every
  M^n is separated and complete for the filtration (N_r^n)_r.
- `Crystalline.IsStrict.of_iso`: If f:M→N is an isomorphism of saturated Dieudonné complexes and M
  is strict, then N is strict.
- `Crystalline.IsStrict.degreeZero_iff`: For an abelian group A with an endomorphism F, the
  Dieudonné complex with A in degree 0 and zero elsewhere is saturated iff A is p-torsion-free and F
  is an automorphism; if so, it is strict iff A is p-adically complete, i.e. A→lim_r A/p^rA is an
  isomorphism (BLM Example 2.5.6).

*Proof sketch.* For saturated M, ρ_M:M→W(M) is the morphism of Dieudonné complexes of *Completion of
a saturated Dieudonné complex*; strictness is the condition that it is an isomorphism. A morphism of
Dieudonné complexes is an isomorphism iff it is bijective in every degree, since the inverse maps
then commute with d and F; this gives the degreewise form. In degree n the kernel of ρ_M is the
intersection of the N_r^n (*Zero classes in finite quotients*), and ρ_M is surjective iff every
sequence (x_r) in M^n with x_(r+1)−x_r∈N_r^n has a limit x with x−x_r∈N_r^n for all r; so strictness
is separatedness and completeness of each M^n for the filtration (N_r^n)_r. For a p-torsion-free
group A in degree 0 with an automorphism F: V=p·F^(−1), N_r^0=p^rA, W_r=A/p^rA, and ρ is A→lim_r
A/p^rA (BLM Example 2.5.6). ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.5, Definition 2.5.4; p.20 in arXiv v3
and in the published version; [Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.5, Example 2.5.6; p.20 in arXiv v3 and
in the published version.) *Needs:* *Saturated Frobenius*; *Completion of a saturated Dieudonné
complex*; *Morphisms of Dieudonné complexes*; *The Verschiebung filtration*; *Zero classes in finite
quotients*.

**Checks.**

- `test_strict_Zp`: Z_p in degree 0 with F=id is strict: V=p, W_r=Z_p/p^rZ_p=Z/p^r, and ρ:Z_p→lim_r
  Z/p^r is an isomorphism.
- `test_strict_Z`: Z in degree 0 with F=id is saturated and not strict: ρ:Z→W(Z)=Z_p is injective
  and not surjective.
- `test_strict_Q`: Q in degree 0 with F=id is saturated and not strict: V=p is bijective, W(Q)=0,
  and ρ:Q→0 is not injective.
- `test_strict_unit`: For a p-adic unit u, Z_p in degree 0 with F multiplication by u is strict;
  with F multiplication by p it is not saturated, hence not strict.
- For a p-torsion-free group A in degree 0 with an automorphism F, strictness is p-adic completeness
  of A (BLM Example 2.5.6).

**Strict Dieudonné towers.** A strict Dieudonné tower is an inverse system ⋯→X_3→X_2→X_1→X_0 of
cochain complexes of abelian groups, with transition maps R:X_(r+1)→X_r, equipped with maps of
graded abelian groups F:X_(r+1)→X_r and V:X_r→X_(r+1) for every r≥0, such that: (1) X_0=0; (2)
R:X_(r+1)→X_r is surjective for every r≥0; (3) F:X_(r+1)→X_r satisfies dF=pFd for every r≥0; (4) F,
R and V commute with each other; (5) F(V(x))=p·x=V(F(x)) for every x∈X_r; (6) every x∈X_r such that
dx is divisible by p lies in the image of F:X_(r+1)→X_r; (7) the kernel of R:X_(r+1)→X_r is the
subgroup X_(r+1)[p] of elements x with p·x=0; (8) the kernel of R:X_(r+1)→X_r is the span of the
images of V^r:X_1→X_(r+1) and dV^r:X_1→X_(r+1). A morphism of strict Dieudonné towers is a morphism
of towers of cochain complexes compatible with F and V; TD denotes the category of strict Dieudonné
towers. (a) For a saturated Dieudonné complex M, the tower (W_r(M))_(r≥0) with the maps Res, F and V
of *Completion of a saturated Dieudonné complex* is a strict Dieudonné tower. (b) For a strict
Dieudonné tower (X_r), the inverse limit X=lim_r X_r, with F the inverse limit of the maps
F:X_(r+1)→X_r, is a saturated Dieudonné complex; for every r≥0 the projection X→X_r induces an
isomorphism of cochain complexes W_r(X)=X/(im V^r+im dV^r)≅X_r; these isomorphisms form an
isomorphism of strict Dieudonné towers (W_r(X))_r≅(X_r)_r; and X is a strict Dieudonné complex. (c)
The functor M↦(W_r(M))_(r≥0) from the category DC_str of strict Dieudonné complexes to TD is an
equivalence of categories, with inverse (X_r)_(r≥0)↦lim_r X_r.

*Hypotheses.* p is a prime. Cochain complexes are complexes of abelian groups graded by all
integers, as in *Dieudonné complexes*. The maps R are maps of cochain complexes; F and V are
additive and preserve the degree, and are not assumed to commute with d. The index r runs over all
integers r≥0 in axioms (2), (3), (6), (7), (8). In (5), F(V(x))=p·x holds in X_r for r≥0 and
V(F(x))=p·x holds in X_r for r≥1. In (4): R∘F=F∘R as maps X_(r+2)→X_r, R∘V=V∘R as maps
X_(r+1)→X_(r+1), and F∘V=V∘F as maps X_(r+1)→X_(r+1). In (8), V^r:X_1^n→X_(r+1)^n and
d∘V^r:X_1^(n−1)→X_(r+1)^n, and the span is taken in each degree n. In (a), M is a saturated
Dieudonné complex. In (b), W_r(X) is formed with the Verschiebung of the saturated complex X, which
is the inverse limit of the maps V:X_r→X_(r+1). In (c), DC_str is the full subcategory of strict
Dieudonné complexes in the category of Dieudonné complexes.

The API:

- `Crystalline.StrictDieudonneTower.ofSaturated`: For a saturated Dieudonné complex M, the complexes
  W_r(M) (r≥0) with Res:W_(r+1)(M)→W_r(M), F:W_(r+1)(M)→W_r(M) and V:W_r(M)→W_(r+1)(M) form a strict
  Dieudonné tower (BLM Proposition 2.6.2).
- `Crystalline.StrictDieudonneTower.limit`: For a strict Dieudonné tower X, the inverse limit lim_r
  X_r with (Fx)_r=F(x_(r+1)) is a saturated Dieudonné complex, and its Verschiebung is given by
  (Vx)_(r+1)=V(x_r), (Vx)_0=0 (BLM Proposition 2.6.5).
- `Crystalline.StrictDieudonneTower.limitWIso`: For a strict Dieudonné tower X and every r≥0, the
  projection lim_s X_s→X_r is surjective with kernel im V^r+im dV^r; so it induces an isomorphism of
  cochain complexes W_r(lim_s X_s)≅X_r, and these isomorphisms commute with R, F and V (BLM
  Proposition 2.9.1, Corollary 2.9.2).
- `Crystalline.StrictDieudonneTower.limit_isStrict`: For a strict Dieudonné tower X, lim_r X_r is a
  strict Dieudonné complex in the sense of *Strict Dieudonné complexes* (BLM Corollary 2.9.3).
- `Crystalline.StrictDieudonneTower.Hom`: A morphism X→Y of strict Dieudonné towers is a family of
  maps of cochain complexes f_r:X_r→Y_r with R∘f_(r+1)=f_r∘R, F∘f_(r+1)=f_r∘F and V∘f_r=f_(r+1)∘V.
  It induces a morphism of Dieudonné complexes lim f:lim_r X_r→lim_r Y_r, with lim(id)=id and
  lim(g∘f)=lim(g)∘lim(f); a morphism f:M→N of saturated Dieudonné complexes induces the morphism
  (W_r(f))_r of towers, compatibly with identities and composition.
- `Crystalline.StrictDieudonneTower.equivalence`: M↦(W_r(M))_r, from strict Dieudonné complexes to
  strict Dieudonné towers, and X↦lim_r X_r are inverse equivalences of categories: ρ_M:M→lim_r
  W_r(M) is a natural isomorphism for strict M, and W_r(lim_s X_s)≅X_r is a natural isomorphism of
  towers (BLM Corollary 2.9.4).
- `Crystalline.StrictDieudonneTower.relations`: In a strict Dieudonné tower: p^r·X_r=0 for every r≥0
  (by (1) and (7), by induction on r); and V∘d=p·d∘V:X_r^n→X_(r+1)^(n+1) and
  F∘d∘V=d:X_r^n→X_r^(n+1). The last two are not axioms; they follow from X_r≅W_r(lim X) and the
  identities Vd=p·dV, FdV=d on the saturated complex lim X.

*Proof sketch.* (a) (BLM Proposition 2.6.2). Axioms (1)–(4) hold by the construction of W_r(M), Res,
F and V (*Completion of a saturated Dieudonné complex*): W_0(M)=0, Res is surjective, dF=pFd, and
all maps are induced by the identity, F and V of M. Axiom (5) is *Finite Frobenius after
Verschiebung* and *Finite Verschiebung after Frobenius*. Axiom (8) holds because the kernel of
Res:W_(r+1)(M)→W_r(M) is (im V^r+im dV^r)/(im V^(r+1)+im dV^(r+1)), the image of W_1(M) under V^r
and dV^r. Axiom (6) is *Finite Frobenius lifting* and axiom (7) is *Restriction kernel and
p-torsion* (BLM Lemmas 2.6.3, 2.6.4). A morphism of saturated Dieudonné complexes induces a morphism
of towers (*Functorial finite quotients*). (b), saturation (BLM Proposition 2.6.5). Write x∈X as a
compatible family (x_r), with (Fx)_r=F(x_(r+1)). By (3), dF=pFd on X. If p·x=0 then p·x_r=0, so
x_(r−1)=R(x_r)=0 by (7), for every r; hence X is p-torsion-free. The inverse limit of the maps V,
(Vx)_(r+1)=V(x_r), satisfies FV=VF=p by (5), so F is injective. If dx∈pX, choose by (6) elements
y_(r+1)∈X_(r+1) with F(y_(r+1))=x_r; then R(y_(r+1))−y_r is killed by F, hence by p=VF, hence by R,
by (7); so (R(y_(r+1)))_r is a compatible family y with Fy=x. Thus X is saturated (*Saturated
Frobenius*), and its Verschiebung, the unique map with FV=p (*Verschiebung and the differential*),
is the inverse limit of the maps V. (b), finite levels (BLM Proposition 2.9.1, Corollary 2.9.2). The
projection θ:X→X_r is surjective by (2). Its kernel contains im V^r+im dV^r, because (V^r
y)_r=V^r(y_0) and X_0=0. Conversely let x∈ker θ, written (x_k∈X_(r+k))_(k≥0) with x_0=0; one
constructs compatible y_k, z_k∈X_k with x_k=V^r(y_k)+dV^r(z_k) by induction on k: lift y_(k−1),
z_(k−1) to ȳ_k, z̄_k∈X_k by (2); then e=x_k−V^r(ȳ_k)−dV^r(z̄_k) lies in the kernel of
R:X_(r+k)→X_(r+k−1), so e=V^(r+k−1)(e′)+dV^(r+k−1)(e″) with e′, e″∈X_1 by (8); put
y_k=ȳ_k+V^(k−1)(e′) and z_k=z̄_k+V^(k−1)(e″), which still lift y_(k−1), z_(k−1) because R∘V^(k−1)
vanishes on X_1. The resulting isomorphisms W_r(X)≅X_r commute with R, F and V, since these are
computed on compatible families. (b), strictness (BLM Corollary 2.9.3). Under the isomorphisms
W_r(X)≅X_r the canonical map ρ_X:X→W(X)=lim_r W_r(X) becomes the identity of lim_r X_r, so ρ_X is an
isomorphism and X is strict (*Strict Dieudonné complexes*). The source argues through Corollary
2.9.2 and the strictness of W(M) for saturated M (BLM Corollary 2.7.6). (c) (BLM Corollary 2.9.4).
Both constructions are functorial: a morphism of towers induces a map of the limits commuting with d
and F, and a morphism of Dieudonné complexes between strict complexes induces a morphism of towers
(*Morphisms of Dieudonné complexes*, *Functorial finite quotients*). For strict M the map
ρ_M:M→lim_r W_r(M) is an isomorphism by definition, and for a tower the maps W_r(lim X)→X_r are
isomorphisms by the third step; both are natural, which gives the equivalence. ([Bhatt–Lurie–Mathew,
*Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.6,
Definition 2.6.1, p.21; [Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.6, Proposition 2.6.2 with proof (Lemmas
2.6.3, 2.6.4), pp.21–22, and Proposition 2.6.5 with proof, pp.22–23; [Bhatt–Lurie–Mathew,
*Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.9,
Proposition 2.9.1 with proof and Corollaries 2.9.2, 2.9.3, 2.9.4 with proofs, pp.27–28;
[Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3),
arXiv v3, §2.5, Example 2.5.7 (Free Strict Dieudonné Complexes), pp.20–21.) *Needs:* *Dieudonné
complexes*; *Saturated Frobenius*; *Morphisms of Dieudonné complexes*; *Verschiebung and the
differential*; *Completion of a saturated Dieudonné complex*; *Finite Frobenius after Verschiebung*;
*Finite Verschiebung after Frobenius*; *Finite Frobenius lifting*; *Restriction kernel and
p-torsion*; *Functorial finite quotients*; *Strict Dieudonné complexes*.

**Checks.**

- `test_tower_Zp`: The tower of Z_p (degree 0, F=id) is X_r=Z/p^r with R and F the projections
  Z/p^(r+1)→Z/p^r and V multiplication by p, Z/p^r→Z/p^(r+1). It satisfies the eight axioms:
  ker(R:X_(r+1)→X_r)=p^r·Z/p^(r+1)=X_(r+1)[p]=V^r(X_1), and F is surjective. Its limit is Z_p with
  F=id and V=p.
- `test_tower_constant_Fp`: Let X_0=0 and X_r=F_p in degree 0 for r≥1, with R:X_(r+1)→X_r and
  F:X_(r+1)→X_r the identity for r≥1 and zero for r=0, and V=0. Axioms (1)–(6) and (8) hold, and (7)
  fails: for r≥1, ker(R:X_(r+1)→X_r)=0 and X_(r+1)[p]=F_p. The limit F_p is not p-torsion-free.
- `test_tower_rational`: The zero tower (X_r=0 for all r) is a strict Dieudonné tower with limit 0.
  It is the tower of the saturated complex Q (degree 0, F=id), for which V=p is bijective and
  W_r(Q)=0; so lim_r W_r(M)≅M fails for the non-strict saturated complex M=Q.
- `test_tower_localization`: The saturated complexes Z_(p) and Z_p (degree 0, F=id) have the same
  tower (Z/p^r)_r, and its limit Z_p is the completion W(Z_(p)) of *Completion of a saturated
  Dieudonné complex*; for a saturated M, lim_r of the tower (W_r(M))_r is W(M).
- `test_tower_free`: Let X_r⁰=⊕_(m≥0)(Z/p^r)·e_m ⊕ ⊕_(0<n<r)(Z/p^(r−n))·v_n and
  X_r¹=⊕_(m≥0)(Z/p^r)·f_m ⊕ ⊕_(0<n<r)(Z/p^(r−n))·w_n, with d(e_m)=p^m·f_m, d(v_n)=w_n, R the
  projections, F(e_m)=e_(m+1), F(v_n)=p·v_(n−1), F(f_m)=f_(m+1), F(w_n)=w_(n−1), V(e_m)=p·e_(m−1)
  for m≥1, V(e_0)=v_1, V(v_n)=v_(n+1), V(f_m)=p·f_(m−1) for m≥1, V(f_0)=p·w_1, V(w_n)=p·w_(n+1),
  where v_0=e_0 and w_0=f_0. This is a strict Dieudonné tower with nonzero differential (d(e_0)=f_0
  in X_1); it is the tower of the free strict Dieudonné complex on x=e_0 of BLM Example 2.5.7, with
  e_m=F^m x, v_n=V^n x, f_m=F^m dx, w_n=dV^n x.
- For M=Z_p in degree 0 with F=id: X_r=Z/p^r, R and F are the projections Z/p^(r+1)→Z/p^r and
  V:Z/p^r→Z/p^(r+1) is multiplication by p. All eight axioms hold; the kernel of R is p^r·Z/p^(r+1),
  which is both the p-torsion of X_(r+1) and V^r(X_1); the limit is Z_p with F=id.
- The constant tower X_0=0, X_r=F_p in degree 0 for r≥1, with R=id and F=id between the levels r≥1
  and V=0, satisfies axioms (1)–(6) and (8), and not (7): for r≥1 the kernel of R:X_(r+1)→X_r is 0
  while X_(r+1)[p]=F_p. Its limit F_p is not p-torsion-free, hence not a saturated Dieudonné
  complex.
- For the free strict Dieudonné complex on a generator x of degree 0 (BLM Example 2.5.7):
  X_r⁰=⊕_(m≥0)(Z/p^r)·F^m x ⊕ ⊕_(0<n<r)(Z/p^(r−n))·V^n x and X_r¹=⊕_(m≥0)(Z/p^r)·F^m dx ⊕
  ⊕_(0<n<r)(Z/p^(r−n))·dV^n x, with d(F^m x)=p^m·F^m dx and d(V^n x)=dV^n x. For r=1 this is
  ⊕F_p·F^m x→⊕F_p·F^m dx with d(x)=dx and d(F^m x)=0 for m≥1, and the kernel of R:X_2→X_1 is spanned
  by p·F^m x, Vx, p·F^m dx and dVx, which is X_2[p] and also V(X_1)+dV(X_1).

**Strict completion and its adjunction.** For a saturated Dieudonné complex M, W(M)=lim_r W_r(M) is
saturated, W_r(M)→W_r(W(M)) is an isomorphism for every r, and the canonical map ρ_M:M→W(M) is
universal for maps from M to strict complexes. Strict means precisely that ρ_M is an isomorphism;
W(M) is strict, and W is left adjoint to the inclusion of strict into saturated Dieudonné complexes.
Each W(M)^n is p-adically complete, M/p^rM→W(M)/p^rW(M) is a quasi-isomorphism for every r, and ρ_M
exhibits W(M) as the derived p-completion of M. For a Dieudonné complex M of Cartier type (termwise
p-torsion-free, with F inducing an isomorphism M/pM→H^*(M/pM)), M→W(Sat M) exhibits W(Sat M) as the
derived p-completion of M; if moreover every M^n is p-adically complete, this map is a
quasi-isomorphism.

*Hypotheses.* p is a prime. M is a saturated Dieudonné complex in all statements about W(M); in the
last sentence M is a Dieudonné complex of Cartier type (BLM Definition 2.4.1), which includes
termwise p-torsion-freeness.

*Proof sketch.* W(M) is saturated: define F and V on compatible sequences, prove p-torsion-freeness
and that x with dx divisible by p lies in the image of F by lifting through the finite levels
(*Restriction kernel and p-torsion*, *Finite Frobenius lifting*; BLM Propositions 2.6.2, 2.6.5). F^r
induces an isomorphism W_r(M)≅H^*(M/p^rM), so a map of saturated complexes is an isomorphism on all
W_r as soon as it is one on W_1 (BLM Proposition 2.7.1, Corollary 2.7.4). For r=1, W_1(M)→W_1(W(M))
is injective and surjective by writing a compatible sequence as x_(m+1)=x_m+V^m y_m+dV^m z_m (BLM
Proposition 2.7.5). ρ_(W(M)) coincides with W(ρ_M), which is an isomorphism by the previous step, so
W(M) is strict (BLM Corollary 2.7.6). A map M→N to a strict N factors uniquely through W(M): pass to
the finite quotients W_r and take the limit (BLM Proposition 2.7.7, Corollary 2.7.8). M/p^r→W(M)/p^r
is a quasi-isomorphism by the first two steps (BLM Proposition 2.8.1), and each W(M)^n is an inverse
limit of groups killed by p^r, hence p-adically complete; this gives the derived p-completion (BLM
Corollary 2.8.2). For M of Cartier type, M/p→Sat(M)/p is a quasi-isomorphism (*Cartier criterion for
saturation*); combine with the previous step for Sat(M); when the M^n are p-adically complete both
sides are termwise p-complete and p-torsion-free, so a quasi-isomorphism modulo p is a
quasi-isomorphism (BLM Corollary 2.8.5). ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.6 (Propositions 2.6.2, 2.6.5), §2.7
(Proposition 2.7.1, Corollary 2.7.4, Proposition 2.7.5, Corollary 2.7.6, Proposition 2.7.7,
Corollary 2.7.8), §2.8 (Proposition 2.8.1, Corollaries 2.8.2, 2.8.3), pp.21–27; [Bhatt–Lurie–Mathew,
*Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §2.4
Definition 2.4.1 and §2.8 Corollary 2.8.5, pp.16–17 and 27.) *Needs:* *Completion of a saturated
Dieudonné complex*; *Restriction kernel and p-torsion*; *Finite Frobenius lifting*; *Cartier
criterion for saturation*; *Finite Verschiebung after Frobenius*; *Annihilation at finite level*;
*Finite Frobenius after Verschiebung*; *Strict Dieudonné complexes*; *The finite quotients compute
cohomology modulo p^r*; DerivedModuleAlgebra (§1.2 *Derived ideal completeness*);
DerivedModuleAlgebra (§1.3 *The derived completion reflector*); DerivedModuleAlgebra (§1.5 *When ordinary quotient towers compute completion*); *Strict Dieudonné towers*.

**Checks.**

- For M=Z_(p) in degree 0 with F=id (saturated, V=p): W_r(M)=Z/p^r and W(M)=Z_p, so M is saturated
  but not strict and M→W(M) is the p-completion.
- For M=Z_p in degree 0 with F=id the map M→W(M) is an isomorphism: M is strict.
- For the p-completed de Rham complex M of Z_p[t] with φ(t)=t^p (Cartier type, termwise p-complete),
  M→W(Sat M) is a quasi-isomorphism but not an isomorphism: M is not saturated, since d(p·t)∈pM¹
  while p·t is not in the image of F (which consists of series in t^p), whereas W(Sat M) is
  saturated.

**Strict Dieudonné complexes as décalage fixed points.** Let D(Z)^_p be the full subcategory of
derived p-complete objects of D(Z); Lη_p preserves it. Sending a strict Dieudonné complex M to the
pair (M,α_F:M≅Lη_pM) is an equivalence from the category of strict Dieudonné complexes to the
fixed-point category of Lη_p on D(Z)^_p, whose objects are pairs (X,φ:X≅Lη_pX) and whose morphisms
are the maps X→X′ in D(Z) commuting with φ, φ′. The fixed-point ∞-category, defined as the equalizer
of the identity and Lη_p on the ∞-category of derived p-complete objects of the derived ∞-category
of Z (so that objects carry a specified equivalence and morphisms a specified homotopy), has
discrete mapping spaces, and the forgetful functor from it to the ordinary fixed-point category is
an equivalence. For strict M, F^r induces isomorphisms W_r(M)≅H^*(M/p^rM), so M=lim_r W_r(M) is
recovered from the cohomology of the reductions M⊗^L Z/p^r.

*Hypotheses.* p is a prime; for a p-torsion-free complex M, (η_pM)^n={x∈p^nM^n: dx∈p^(n+1)M^(n+1)}
in every integer degree n, and Lη_p is the induced functor on D(Z). An object of the fixed-point
category is a derived p-complete X with a chosen isomorphism φ:X≅Lη_pX; morphisms commute with the
chosen isomorphisms (in the ∞-categorical version, up to a specified homotopy).

*Proof sketch.* Functor: for saturated M, α_F:M→η_pM is an isomorphism of complexes (*Saturated
Frobenius*); strict complexes are derived p-complete (*Strict completion and its adjunction*); Lη_p
preserves derived p-complete objects (BLM Proposition 7.2.4). Full faithfulness: the terms of a
strict complex are p-torsion-free and p-adically complete, so maps in D(Z) between strict complexes
are chain homotopy classes of chain maps (BLM Proposition 7.1.16). A chain map f with
F⁻¹∘f∘F=f+dh+hd is homotopic to the map of Dieudonné complexes f+du+ud, u=Σ_(n≥0)V^n∘h∘F^n, which
converges because the target is strict; a map of Dieudonné complexes homotopic to zero has image in
dV^r+V^r for every r and so vanishes (BLM Proposition 7.3.6). Essential surjectivity: represent
(X,φ) by a complex X^* of free abelian groups and a chain map α:X^*→η_pX^* representing φ; this
makes X^* a Dieudonné complex. η_p preserves quasi-isomorphisms of p-torsion-free complexes (BLM
Corollary 7.2.2), so X^*→Sat(X^*) is a quasi-isomorphism, and since X is derived p-complete
Sat(X^*)→W(Sat X^*) is one too (BLM Corollary 2.8.3). ∞-categorical version: the mapping space
between fixed points (X,φ_X), (Y,φ_Y) is the fibre of f−g:Hom(X,Y)→Hom(X,Lη_pY), where f is
composition with φ_Y, an equivalence, and g is Lη_p followed by composition with φ_X. Lη_p acts on
π_r of mapping spaces by a map divisible by p^r (BLM Proposition 7.5.3, Corollary 7.5.4), and for a
derived p-complete abelian group an automorphism plus p times an endomorphism is an automorphism
(BLM Lemma 7.5.6). So f−g is an isomorphism on π_r for r>0 and the fibre is discrete, equal to the
set of morphisms of the ordinary fixed-point category (BLM Theorem 7.4.7, Corollary 7.4.8). For an
∞-category 𝒞 and T : 𝒞 → 𝒞, the fixed-point ∞-category 𝒞^T is the equalizer of id and T, and Map((X,
φ_X), (Y, φ_Y)) is the equalizer of the two maps Map(X, Y) ⇉ Map(X, TY) (Bhatt–Lurie–Mathew,
Definition 7.4.3 and Remark 7.4.4, after Nikolaus–Scholze II.1.5); this construction is part of this
target, built on the quasicategories of EnhancedDerivedSheaves Layer E0. ([Bhatt–Lurie–Mathew,
*Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §7.1
Proposition 7.1.16; §7.2 Corollary 7.2.2, Proposition 7.2.4; §7.3 Definition 7.3.1, Theorem 7.3.4
with proof, Proposition 7.3.6; §7.4 Definition 7.4.3, Theorem 7.4.7, Corollary 7.4.8; §7.5
Proposition 7.5.3, Corollary 7.5.4, Lemma 7.5.6 and the proof of Theorem 7.4.7, pp.82–94.) *Needs:*
*Dieudonné complexes*; *Saturated Frobenius*; *Saturation by iterated décalage*; *Strict completion
and its adjunction*; *Derived p-décalage and completion*; DerivedModuleAlgebra (§1.2
*Derived ideal completeness*); DerivedModuleAlgebra (§1.3 *The derived completion
reflector*); EnhancedDerivedSheaves Layer E1 (*The enhanced derived
category*); EnhancedDerivedSheaves Layer E0 (*Dold–Kan mapping-space comparison*); *The finite
quotients compute cohomology modulo p^r*.

**Checks.**

- Z_p in degree 0 with F=id corresponds to the fixed point (Z_p,id:Z_p≅Lη_pZ_p).
- Z/p in degree 0 is derived p-complete but has no fixed-point structure:
  H⁰(Lη_p(Z/p))=(Z/p)/(Z/p)[p]=0.
- For strict M and N, the set of maps of Dieudonné complexes M→N is π₀ of the mapping space of the
  fixed-point ∞-category, and the higher homotopy groups of that space vanish.

### CR.4.4 Inputs on Witt vectors

**Finite-length Witt operators and their identities.** On Mathlib's
`TruncatedWittVector p r R`, construct the induced ring map
`Crystalline.truncatedFrobenius : W_(r+1)(R) →+* W_r(R)` and additive map
`Crystalline.truncatedVerschiebung : W_r(R) →+ W_(r+1)(R)`. The latter is the coordinate shift;
restriction is the existing `TruncatedWittVector.truncate`. Prove that finite Verschiebung is
injective, `F_r V_r = p`, and `V_r(x) y = V_r(x F_r(y))`. The kernel of restriction
`W_(r+1)(R) → W_r(R)` is the image of the r-fold shift from `W_1(R) = R`. For `R` of
characteristic p and `r ≥ 1`, also prove `V_(r−1) F_(r−1) = p` on `W_r(R)`. These are
finite-length extensions of the infinite-vector identities supplied in *Exact supplier contracts*.
For reduced characteristic-p `R`, prove injectivity of Witt Frobenius and p-torsion-freeness
of `W(R)`; this extends the perfect-ring scope of Mathlib's existing p-torsion-freeness theorem.
For p-torsion-free R, prove joint injectivity of the first r ghost components on W_r(R).

*Hypotheses.* p is prime and R is a commutative ring; the last two assertions require
`CharP R p` and reduced R. Ghost injectivity requires injectivity of multiplication by p on R.
The finite projection identities have no characteristic-p hypothesis.

The API comprises `Crystalline.truncatedFrobenius_truncate` and
`Crystalline.truncatedVerschiebung_truncate` (agreement with the infinite operators),
`Crystalline.truncatedVerschiebung_injective`, `Crystalline.truncatedFrobenius_V`,
`Crystalline.truncatedVerschiebung_projection`, `Crystalline.truncatedRestriction_kernel`,
`Crystalline.truncatedVerschiebung_F_charP`, `Crystalline.wittFrobenius_injective_of_reduced`
and `Crystalline.witt_p_torsionFree_of_reduced`.
`Crystalline.truncatedGhost_injective` states injectivity of
x↦(WittVector.ghostComponent i x.out)_(i<r) under the p-torsion-free hypothesis.

*Proof sketch.* Descend the infinite operators along truncation using their coordinate dependence.
Use the supplier projection identities and coordinate shift to identify the kernel; in characteristic
p use coordinate Frobenius. Reducedness makes coordinate p-th powers injective, and Verschiebung
injectivity then proves p-torsion-freeness. For ghost injectivity, compare coefficients
inductively in w_n(x)=Σ_(i≤n)p^i x_i^(p^(n−i)); equality of earlier coefficients leaves
p^n(x_n−y_n)=0, and repeated cancellation of p gives x_n=y_n.
([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3),
§3.6, proof of Proposition 3.6.2, pp.39–40;
[Langer–Zink, *De Rham–Witt cohomology for a proper and smooth morphism*](https://www.math.uni-bielefeld.de/~zink/dRW.pdf),
Introduction, printed pp.3–5; §1.2, Definition 1.4, printed pp.17–18.) *Needs:* the Witt-vector
suppliers in *Exact supplier contracts*.

**Checks.**

- For R=Z and r=2 the ghost map is (a,b)↦(a,a^p+pb), injective although p is not
  a unit. For R=F_p at length two, (0,1) and zero have identical ghost components;
  p-torsion-freeness cannot be removed. Length zero has a one-element carrier.
- `W_0(R) = 0` and `W_1(R) = R`; finite Verschiebung stays injective when R has p-torsion.
- For `R = F_p`, finite Verschiebung is multiplication by p under `W_r(F_p) ≅ Z/p^r`;
  no such identification is asserted for arbitrary `Z_(p)`-algebras.
- For `R = F_p[t]`, coordinate Frobenius is injective but not surjective, and `W(R)` is
  p-torsion-free; the reduced-ring result does not silently assume perfection.

**Witt lifting from a torsion-free Frobenius lift.** Let A be a p-torsion-free commutative ring with
a ring endomorphism φ satisfying φ(a)≡a^p mod p. Let S be a reduced F_p-algebra and f:A→S a ring
map. There is a unique ring map u:A→W(S) with w₀u=f and F_Wu=uφ. Here F_W is injective because S is
reduced. This is the special Witt lifting property needed to identify degree zero of a strict
Dieudonné algebra.

*Hypotheses.* p is prime; A is p-torsion-free; S is reduced of characteristic p; φ is a Frobenius
lift.

*Proof sketch.* Construct a map A→W(A) whose n-th ghost coordinate is φ^n(a): recursively define the
Witt coordinates by dividing φ^n(a)−Σ_(i<n)p^i u_i(a)^(p^(n−i)) by p^n. The Frobenius-lift
congruences imply divisibility, and torsion-freeness gives uniqueness. Universal Witt polynomial
identities show that this map is a ring map and is Frobenius compatible. Compose with
W(f):W(A)→W(S). For uniqueness, any ring map u with F_Wu=uφ commutes with the p-derivation
δ=(φ−(·)^p)/p, since source and target are p-torsion-free. Successive Witt coordinates are universal
polynomials in w₀ and the iterates of δ, so they are forced by f. The integrality and
coordinate-reconstruction steps are proved here; Bhatt–Lurie–Mathew cite Joyal for them. Integrality
of the recursive Witt coordinates for the ghost sequence φⁿ(a), their universal polynomial
identities, and uniqueness after reduction to a reduced 𝔽_p-algebra (the input Bhatt–Lurie–Mathew
Proposition 3.6.2 attribute to Joyal) are part of this target. ([Bhatt–Lurie–Mathew, *Revisiting the
de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §3.6, Proposition 3.6.2 and
its proof; Definition 3.7.1, pp.39–42.) *Needs:* Mathlib `WittVector.frobenius`, `WittVector.verschiebung`,
`WittVector.frobenius_verschiebung` and `WittVector.verschiebung_mul_frobenius`, as listed in
*Exact supplier contracts*; *Finite-length Witt operators and their identities*.

**Checks.**

- For A=Z with φ=id and S=F_p, u is the canonical Z→W(F_p).
- For S=F_p[t] and A=Z[t] with φ(t)=t^p and reduction f, u(t)=[t].
- If A=Z/p² and φ=id, reduction to S=F_p cannot lift to a unital map A→W(F_p)=Z_p;
  the p-torsion-free source hypothesis is essential.

**Canonical divided powers on the Verschiebung ideal of W_r(R).** Let R be a Z_(p)-algebra and r≥1,
and let I_r=V W_(r−1)(R)⊂W_r(R) be the image of Verschiebung, which is the kernel of the projection
W_r(R)→R (W_0=0, so I_1=0). Then W_r(R) is a Z_(p)-algebra and I_r carries a divided power structure
γ with γ_n(Vξ)=(p^(n−1)/n!)·V(ξ^n) for all ξ∈W_(r−1)(R) and n≥1, where p^(n−1)/n!∈Z_(p). It
satisfies n!·γ_n(x)=x^n and (p−1)!·γ_p(Vξ)=p^(p−2)·V(ξ^p). The restriction maps W_(r+1)(R)→W_r(R)
and the maps W_r(R)→W_r(R′) induced by a homomorphism R→R′ of Z_(p)-algebras are divided power
morphisms. If R is p-torsion-free, γ is the only divided power structure on I_r.

*Hypotheses.* p is a prime; R is a commutative Z_(p)-algebra (every integer prime to p is invertible
in R); r≥1. W_r(R) is Mathlib's TruncatedWittVector p r R, and V:W_(r−1)(R)→W_r(R) is induced by
WittVector.verschiebung, as constructed in *Finite-length Witt operators and their identities*.

The API:

- `Crystalline.wittVerschiebungIdeal`: I_r=V W_(r−1)(R), the ideal of W_r(R) equal to the kernel of
  W_r(R)→R (for every commutative ring R).
- `Crystalline.wittVerschiebung_pow`: For every commutative ring R, ξ∈W_(r−1)(R) and n≥1:
  (Vξ)^n=p^(n−1)·V(ξ^n) in W_r(R).
- `Crystalline.wittVerschiebungDividedPowers_dpow`: For a Z_(p)-algebra R:
  γ_n(Vξ)=(p^(n−1)/n!)·V(ξ^n) for n≥1; in particular (p−1)!·γ_p(Vξ)=p^(p−2)·V(ξ^p).
- `Crystalline.wittVerschiebungDividedPowers_map`: The restriction W_(r+1)(R)→W_r(R) and
  W_r(f):W_r(R)→W_r(R′) for a homomorphism f of Z_(p)-algebras are divided power morphisms (Mathlib
  `DividedPowers.IsDPMorphism`).
- `Crystalline.wittVerschiebungDividedPowers_unique`: If R is a p-torsion-free Z_(p)-algebra, any
  divided power structure on I_r equals γ.
- `Crystalline.wittVerschiebungDividedPowers_Fp`: Under Z/p^r≅W_r(F_p) (Mathlib
  `TruncatedWittVector.zmodEquivTrunc`) the ideal I_r is (p) and γ_n(px)=p^n·x^n/n!, the canonical
  divided powers on (p).

*Proof sketch.* For every commutative ring R: V(x)·V(y)=V(x·FV(y))=p·V(xy) by the projection formula
and FV=p (Mathlib `WittVector.verschiebung_mul_frobenius`, Mathlib
`WittVector.frobenius_verschiebung`, passed to truncations); hence (Vξ)^n=p^(n−1)·V(ξ^n) for n≥1. V
is injective on truncated Witt vectors, so γ_n(Vξ) is well defined; p^(n−1)/n! lies in Z_(p) because
v_p(n!)≤(n−1)/(p−1). W_r(R) is a Z_(p)-algebra: for an integer m prime to p,
m·V^i(x)=V^i(F^i(m)·x)=V^i(mx), so multiplication by m is bijective on each quotient
V^iW_(r−i)(R)/V^(i+1)W_(r−i−1)(R)≅R and hence on W_r(R). p-torsion-free R: the ghost map W_r(R)→R^r
is injective, so W_r(R) is torsion-free and embeds in the Q-algebra W_r(R)⊗Q, in which the ideal
generated by I_r has the divided powers x^n/n! (Mathlib `DividedPowers.RatAlgebra.dividedPowers`).
Since (Vξ)^n/n!=(p^(n−1)/n!)·V(ξ^n) lies in I_r, this structure restricts to I_r (Mathlib
`DividedPowers.ofInjective`); it is unique because n!·γ_n(x)=x^n in a torsion-free ring. General R:
write R=P/𝔞 with P a polynomial algebra over Z_(p). W_r(P)→W_r(R) is surjective with kernel W_r(𝔞),
I_r(P) maps onto I_r(R), and W_r(𝔞)∩I_r(P)=V W_(r−1)(𝔞) is stable under the γ_n, because
ξ∈W_(r−1)(𝔞) implies ξ^n∈W_(r−1)(𝔞). So γ descends to I_r(R) with the same formula (Mathlib
`DividedPowers.Quotient.OfSurjective.dividedPowers`). The formula shows independence of the
presentation and compatibility with restriction and with maps R→R′. ([Langer–Zink, *De Rham–Witt
cohomology for a proper and smooth morphism*](https://www.math.uni-bielefeld.de/~zink/dRW.pdf),
§1.1, paragraph after the proof of Lemma 1.2, printed p.13.) *Needs:* Mathlib
`WittVector.frobenius`, `WittVector.verschiebung`, `WittVector.frobenius_verschiebung` and
`WittVector.verschiebung_mul_frobenius`, as listed in *Exact supplier contracts*; *Finite-length
Witt operators and their identities*; *Canonical divided powers on the ideal generated by p*
(DerivedDeRhamCohomology §PD.5); Mathlib `TruncatedWittVector`; Mathlib `WittVector.truncate`;
Mathlib `WittVector.verschiebung`; Mathlib `WittVector.frobenius_verschiebung`; Mathlib
`WittVector.verschiebung_mul_frobenius`; Mathlib `WittVector.ghostComponent`; Mathlib
`DividedPowers`; Mathlib `DividedPowers.RatAlgebra.dividedPowers`; Mathlib
`DividedPowers.ofInjective`; Mathlib `DividedPowers.Quotient.OfSurjective.dividedPowers`.

**Checks.**

- `test_wittPD_Fp`: For R=F_p and r=2: W_2(F_p)=Z/p², I_2=(p) and γ_n(p)=p^n/n! in Z/p² for all n≥1;
  these are the canonical divided powers on (p).
- `test_wittPD_two`: For p=2, in W_2(F_2)=Z/4: γ_2(2)=2, γ_3(2)=0 and γ_(2^k)(2)=2 for every k≥0.
- `test_wittPD_factorial`: For a Z_(p)-algebra R, ξ∈W_(r−1)(R) and n≥1: n!·γ_n(Vξ)=(Vξ)^n.
- `test_wittPD_integers`: For p=3 and R=Z: in W_2(Z)⊂Z×Z (ghost components) (V1)²=3·V(1)=(0,9) is
  not 2·y for any y∈W_2(Z), so the ideal V W_1(Z) admits no divided power structure.

**Finite Witt base change for integral perfectoid rings.** Let S→S′ be a map of integral perfectoid
rings in the sense of BMS1 Definition 3.5. For 1≤j≤r the canonical maps
W_j(S)⊗^L_(A_inf(S))A_inf(S′)→W_j(S′) and W_j(S)⊗^L_(W_r(S))W_r(S′)→W_j(S′) are isomorphisms, using
either restriction or Frobenius for the W_r-module structure. For 1≤j<r,
Ann_(W_r(S))(V^j(1))=ker(F^j:W_r(S)→W_(r−j)(S)), V^j(1)W_r(S)=V^jW_(r−j)(S), and F^j and
multiplication by V^j(1) identify W_r(S)/Ann(V^j(1)) with W_(r−j)(S) and V^jW_(r−j)(S),
respectively.

*Hypotheses.* S,S′ integral perfectoid in the sense of PerfectoidSpaces §P1.24
(`IsIntegralPerfectoid`, Bhatt–Morrow–Scholze Definition 3.5), including discrete perfect
𝔽_p-algebras; no p-torsion-free or roots-of-unity assumption is added. For a perfectoid Tate pair
(S,S⁺) the ring S⁺ satisfies this by PerfectoidSpaces §P1.25 with no further hypothesis.

*Proof sketch.* Use, for integral perfectoid S, A_inf(S)=W(S♭), functorial surjective maps θ_j and
θ̃_j to W_j(S), and principal kernels generated by the non-zero-divisors ξ_j and ξ̃_j of BMS1 Lemma
3.12. A map S→S′ takes these generators to generators up to a unit, hence to non-zero-divisors.
The predicate, the compatible p-power roots of a unit multiple of π and the Frobenius criterion are
PerfectoidSpaces §P1.24 (BMS1 Lemmas 3.9, 3.10). The two-term resolution for this quotient has no higher Tor after base change
because the image remains a non-zero-divisor. Apply it at lengths j and r and use associativity of
derived tensor to obtain the two base-change maps. The formula xV^j(1)=V^j(F^j(x)), injectivity of
V^j and surjectivity of F^j for perfectoid S give both annihilator and image identities. The first
isomorphism theorem gives the two quotient identifications. For every ring of §P1.24 the following
are part of this target: a generator of ker θ is a non-zero-divisor, and the generators are exactly
the distinguished elements (Lemma 3.10(i) and its proof, Remark 3.11); the kernels ξ_j, ξ̃_j of θ_j,
θ̃_j : A_inf(S) → W_j(S) (Lemma 3.12); their behaviour under S → S′ (Lemma 3.13); and Remark 3.19.
([Bhatt–Morrow–Scholze, *Integral p-adic Hodge
theory*](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), Definition 3.5, p.21;
Lemma 3.10(i), Remark 3.11, Lemmas 3.12–3.13 and proofs, pp.22–24; Remark 3.19 and proof, p.26.)
*Needs:* PerfectoidSpaces §P1.24 (*Integral perfectoid rings*); PerfectoidSpaces §P1.25 (*R
perfectoid Tate ⇔ R⁺ integral perfectoid and bounded*); Mathlib `WittVector.frobenius`, `WittVector.verschiebung`,
`WittVector.frobenius_verschiebung` and `WittVector.verschiebung_mul_frobenius`, as listed in
*Exact supplier contracts*; *Finite-length Witt operators and their identities*; TauCetiRoadmap DerivedModuleAlgebra §0.K.1 (*Koszul
complexes*).

**Checks.**

- For perfect F_p-algebras, ξ=p and W_j=W/p^j; the statement is the familiar truncated-Witt base
  change.
- The annihilator formulas use 1≤j<r and do not identify finite Witt rings with p-torsion-free
  rings.
- For S=O_C→S′=k̄, its residue field, a generator ξ of ker θ is distinguished, so it maps to p
  times a unit of W(k̄), and W_j(O_C)⊗^L_(A_inf(O_C))W(k̄)=W(k̄)/p^j=W_j(k̄).

### CR.4.5 Dieudonné algebras and the saturated de Rham–Witt complex

**Dieudonné algebras and multiplicative quotients.** A Dieudonné algebra is a nonnegatively graded
commutative differential graded Z-algebra A with x²=0 for every homogeneous odd-degree x (also at
p=2), a multiplicative unital graded Frobenius F, dF=pFd, and F(a)≡a^p modulo p in degree 0.
Saturated and strict refer to its underlying Dieudonné complex. On a saturated algebra the
Verschiebung V (the map with FV=VF=p of *Verschiebung and the differential*) satisfies
x·V(y)=V(F(x)·y); N_r=im V^r+im dV^r is a differential graded ideal, so W_r(A) and W(A) are
commutative differential graded algebras, and Sat(A) and W(A) are again Dieudonné algebras, initial
among maps from A to saturated, respectively (for saturated A) strict, Dieudonné algebras.

*Hypotheses.* p is a prime; A^n=0 for n<0; x²=0 for every homogeneous x of odd degree, also when
p=2. F is a homomorphism of graded rings with dF=pFd and F(x)≡x^p mod p for x∈A⁰; F is not a map of
complexes. The projection formula and the ideal property of im V^r+im dV^r are statements about
saturated Dieudonné algebras.

The API:

- `Crystalline.DieudonneAlgebra.odd_sq`: An odd homogeneous element has square0, even for p=2.
- `Crystalline.DieudonneAlgebra.projection`: x·V(y)=V(F(x)·y) on a saturated algebra.
- `Crystalline.DieudonneAlgebra.W_mul`: Finite-quotient projections and restriction preserve
  products, d and units.
- `Crystalline.DieudonneAlgebra.ofDeRham`: For a p-torsion-free ring R with a ring endomorphism φ,
  φ(x)≡x^p mod p: the absolute de Rham complex Ω^*_R with F(x)=φ(x) and
  F(dx)=x^(p−1)dx+d((φ(x)−x^p)/p) is a Dieudonné algebra; the same holds for the p-completed de Rham
  complex Ω̂^*_R=lim_n Ω^*_R/p^n (BLM Proposition 3.2.1, Variant 3.3.1).
- `Crystalline.DieudonneAlgebra.ofDeRham_lift`: For a p-torsion-free Dieudonné algebra A,
  restriction to degree 0 is a bijection from maps of Dieudonné algebras Ω^*_R→A to ring maps f:R→A⁰
  with f∘φ=F∘f; if A is moreover termwise p-adically complete, the same holds for Ω̂^*_R (BLM
  Proposition 3.2.3, Variant 3.3.1).
- `Crystalline.DieudonneAlgebra.sat_lift`: A→Sat(A) is a map of Dieudonné algebras, and every map
  from A to a saturated Dieudonné algebra factors uniquely through it (BLM Proposition 3.4.3).
- `Crystalline.DieudonneAlgebra.W_lift`: For saturated A, ρ_A:A→W(A) is a map of Dieudonné algebras
  into a strict one, and every map from A to a strict Dieudonné algebra factors uniquely through it;
  hence W∘Sat is left adjoint to the inclusion of strict Dieudonné algebras (BLM Propositions 3.5.5,
  3.5.8, Corollaries 3.5.9, 3.5.10).

*Proof sketch.* Definition: a Dieudonné algebra is a commutative algebra object of Dieudonné
complexes (tensor product of BLM Remark 2.1.5) with A^n=0 for n<0, F(x)≡x^p mod p on A⁰ and x²=0 for
odd x (BLM Definition 3.1.2, Remark 3.1.5). Saturation: after dividing by p-power torsion,
η_pA⊂A[1/p] is a subalgebra stable under F and again a Dieudonné algebra (the congruence for η_pA is
BLM Remark 3.1.7); Sat(A) is the colimit of A→η_pA→η_pη_pA→⋯ and is the saturation among Dieudonné
algebras (BLM Proposition 3.4.3). Projection formula: F(x·V(y))=F(x)·p·y=F(V(F(x)·y)) and F is
injective. Then x·V^r(y)=V^r(F^r(x)·y) and (−1)^(deg x)·x·dV^r(y)=d(V^r(F^r(x)·y))−V^r(F^r(dx)·y)
show that im V^r+im dV^r is a differential graded ideal (BLM Proposition 3.5.1, Corollary 3.5.2).
W(A)=lim_r W_r(A) is a commutative differential graded algebra on which F is a ring map; F(x)≡x^p
modulo V W(A)⁰ because W_1(A)≅W_1(W(A)) (*Strict completion and its adjunction*), and for a
saturated complex with ring structure the congruence modulo V A⁰ implies the congruence modulo p
(BLM Proposition 3.4.2, using Lemma 2.6.3). The universal property of A→W(A) among strict Dieudonné
algebras follows from that for complexes (BLM Propositions 3.5.5, 3.5.8). De Rham example: for
p-torsion-free R with a ring endomorphism φ, φ(x)=x^p+p·δ(x), the map x↦x^(p−1)dx+dδ(x) is a
derivation R→Ω¹_R over φ, so F(x)=φ(x), F(dx)=x^(p−1)dx+dδ(x) extends to a ring endomorphism of
Ω^*_R with dF=pFd (BLM Proposition 3.2.1); a map of Dieudonné algebras from Ω^*_R to a
p-torsion-free A is determined by f:R→A⁰ and exists exactly when f∘φ=F∘f (BLM Proposition 3.2.3).
([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3),
arXiv v3, §3.1 (conditions (a)–(c), Remark 3.1.1, Definition 3.1.2, Remarks 3.1.5–3.1.7), §3.2
(Propositions 3.2.1, 3.2.3), §3.4 (Definition 3.4.1, Propositions 3.4.2, 3.4.3), §3.5 (Proposition
3.5.1, Corollary 3.5.2, Propositions 3.5.5, 3.5.8, Definition 3.5.6), pp.29–38.) *Needs:* *Dieudonné
complexes*; *Saturation by iterated décalage*; *The Verschiebung filtration*; *Strict completion and
its adjunction*; DerivedDeRhamCohomology Layer 2 (§2.12 *The ordinary algebraic de Rham complex*);
DerivedDeRhamCohomology Layer 2 (§2.21 *The universal differential graded algebra*); *Verschiebung
and the differential*; *Frobenius lifting after a divided differential*; Mathlib `DirectSum.GRing`.

**Checks.**

- `test_DA_Zp`: Z_p in degree0 with F=id is strict, with V multiplication by p.
- `test_DA_p2_exterior`: For p=2 every element x of degree 1 of a Dieudonné algebra satisfies x²=0.
  The graded-commutative F_2-algebra F_2[x] with x in degree 1, d=0 and F=id satisfies all the other
  axioms and has x²≠0, so it is not a Dieudonné algebra.
- `test_DA_Fd`: For a saturated Dieudonné algebra A and x∈A⁰ with F(x)=x^p: F(dx)=x^(p−1)·dx and
  d(F(x))=p·F(dx). Example: A=Sat(Ω^*_(Z[t])) with φ(t)=t^p and x=t.
- W(k) in degree 0 with the Witt vector Frobenius is a Dieudonné algebra for every F_p-algebra k; it
  is saturated, and then strict, exactly when k is perfect (BLM Example 3.1.8).
- For R=Z[t] with φ(t)=t^p, the Dieudonné algebra Ω^*_R has F(dt)=t^(p−1)dt and
  d(F(t))=p·t^(p−1)dt=p·F(dt).

**Universal saturated de Rham–Witt complex.** For an F_p-algebra R, a saturated de Rham–Witt complex
of R is a strict Dieudonné algebra WsatΩ_R with a ring map e:R→WsatΩ_R⁰/V WsatΩ_R⁰ such that, for
every strict Dieudonné algebra A, composition with e is a bijection
Hom_DA(WsatΩ_R,A)≅Hom_Fp(R,A⁰/VA⁰). It exists, is unique up to unique isomorphism, and R↦WsatΩ_R is
left adjoint to A↦A⁰/VA⁰. Construct it as W(Sat Ω^*_(W(R_red))), where W(R_red) is the existing ring
of Witt vectors (p-torsion-free because R_red is reduced) with its Witt vector Frobenius and Ω^* is
its absolute de Rham complex with the divided Frobenius. For a strict Dieudonné algebra A with
S=A⁰/VA⁰, the ring S is reduced and there is a unique ring isomorphism A⁰≅W(S) lifting the identity
of S and carrying F to the Witt vector Frobenius; it also carries V to Verschiebung. Hence, writing
S_R=WsatΩ_R⁰/V WsatΩ_R⁰, the degree-zero ring of WsatΩ_R is W(S_R). S_R is reduced and seminormal
(x²=y³ in S_R implies x=t³, y=t² for some t∈S_R), and WsatΩ_R→WsatΩ_(R_red) is an isomorphism. For
R=F_p[t²,t³]⊂F_p[t] the inclusion induces an isomorphism WsatΩ_R≅WsatΩ_(F_p[t]). For a
p-torsion-free ring B with a ring endomorphism φ, φ(x)≡x^p mod p, there is a unique map of Dieudonné
algebras μ from the p-completed de Rham complex Ω̂^*_B to WsatΩ_(B/pB) lifting B→B/pB→S_(B/pB), and
it induces an isomorphism W(Sat Ω̂^*_B)≅WsatΩ_(B/pB).

*Hypotheses.* p is a prime; R is a commutative F_p-algebra. In the universal property A ranges over
strict Dieudonné algebras. For μ: B is a p-torsion-free ring with a ring endomorphism φ such that
φ(x)≡x^p mod p; B need not be smooth or p-adically complete.

The API:

- `Crystalline.satDRW_lift`: For every strict Dieudonné algebra A and every ring map g:R→A⁰/VA⁰
  there is a unique map of Dieudonné algebras f:WsatΩ_R→A such that the map S_R→A⁰/VA⁰ induced by f,
  composed with e_R:R→S_R, equals g.
- `Crystalline.satDRW_degree0`: A ring isomorphism WsatΩ_R⁰≅W(S_R), S_R=WsatΩ_R⁰/V WsatΩ_R⁰, whose
  Witt coordinate of index 0 is the projection WsatΩ_R⁰→S_R (BLM Proposition 3.6.2).
- `Crystalline.satDRW_map`: Ring maps induce maps preserving d,F,V and all finite quotients.
- `Crystalline.satDRW_degree0_F`: The isomorphism WsatΩ_R⁰≅W(S_R) carries F and V of WsatΩ_R⁰ to the
  Witt vector Frobenius and Verschiebung of W(S_R).
- `Crystalline.satDRW_unit`: e_R:R→S_R, the unit of the adjunction; e_R factors through R_red.
- `Crystalline.satDRW_residue_seminormal`: `DiamondsAndVStacks.IsSeminormalRing S_R`;
  thus S_R is reduced and x³=y² has a unique root t with x=t² and y=t³
  (BLM Lemma 3.6.1, Proposition 6.5.1; DiamondsAndVStacks D6.9).
- `Crystalline.satDRW_red`: WsatΩ_R→WsatΩ_(R_red) is an isomorphism of strict Dieudonné algebras
  (BLM Warning 4.1.3).
- `Crystalline.satDRW_ofLift`: For a p-torsion-free ring B with an endomorphism φ lifting Frobenius:
  maps of Dieudonné algebras Ω̂^*_B→A into a strict A correspond bijectively to ring maps B→A⁰/VA⁰;
  the map μ:Ω̂^*_B→WsatΩ_(B/pB) corresponding to B→B/pB→S_(B/pB) induces W(Sat Ω̂^*_B)≅WsatΩ_(B/pB)
  (BLM Proposition 4.2.1, Corollary 4.2.3).

*Proof sketch.* Reducedness: for a saturated Dieudonné algebra A, V A⁰ is an ideal containing
p=V(1), and A⁰/VA⁰ is reduced: if x^p∈VA⁰ then F(x)=V(y), d(Vy)=p·F(dx), so y=F(z) by BLM Lemma
2.6.3 and x=V(z) (BLM Lemma 3.6.1). Degree zero: for strict A with S=A⁰/VA⁰, W(S) is p-torsion-free
and is the cofree δ-ring on S, which gives a unique ring map u:A⁰→W(S) lifting the identity of S and
commuting with F; u commutes with V because F is injective on W(S); u is an isomorphism by induction
on r along 0→A⁰/VA⁰→A⁰/V^rA⁰→A⁰/V^(r−1)A⁰→0 and the corresponding sequences of truncated Witt
vectors (BLM Proposition 3.6.2). Consequently a ring map R→A⁰/VA⁰ lifts uniquely to a ring map
W(R)→A⁰ commuting with F (BLM Proposition 3.6.3, Lemma 3.6.4). Existence: by step 1 every map
R→A⁰/VA⁰ factors through R_red, so assume R reduced. Then Hom_DA(W Sat Ω^*_(W(R)),A)≅Hom_DA(Sat
Ω^*_(W(R)),A)≅Hom_DA(Ω^*_(W(R)),A)≅{f:W(R)→A⁰ with f∘F=F∘f}≅Hom(R,A⁰/VA⁰), by the universal
properties of W, Sat and the de Rham Dieudonné algebra (*Dieudonné algebras and multiplicative
quotients*) and step 2 (BLM Proposition 4.1.4, Corollary 4.1.5). Functoriality and
WsatΩ_R≅WsatΩ_(R_red) follow from the universal property. The map μ: a strict Dieudonné algebra A is
termwise p-adically complete and p-torsion-free, so Hom_DA(Ω̂^*_B,A)≅{f:B→A⁰ with
f∘φ=F∘f}≅Hom(B,A⁰/VA⁰) by step 2; this gives μ and W(Sat Ω̂^*_B)≅WsatΩ_(B/pB) (BLM Proposition
4.2.1, Corollary 4.2.3). Cusp and seminormality: for R=F_p[t²,t³] take B=Z_p[t²,t³]⊂Z_p[t] with
φ(t)=t^p. The inclusion is an isomorphism in all degrees ≠1 of the grading by powers of t, which
gives Sat Ω^*_B≅Sat Ω^*_(Z_p[t]) (BLM Proposition 6.1.2), hence WsatΩ_R≅WsatΩ_(F_p[t]) by step 4
(BLM Proposition 6.2.1). If x²=y³ in A⁰/VA⁰ for a strict A, the corresponding map WsatΩ_R→A factors
through WsatΩ_(F_p[t]), and the image of t is the required element (BLM Proposition 6.5.1).
([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3),
arXiv v3, §3.6 (Lemma 3.6.1, Propositions 3.6.2, 3.6.3, Lemma 3.6.4), §4.1 (Definition 4.1.1,
Warning 4.1.3, Proposition 4.1.4, Corollary 4.1.5), §4.2 (Proposition 4.2.1, Corollary 4.2.3),
pp.38–45; [Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §6.1 Proposition 6.1.2, §6.2 Proposition
6.2.1, §6.3 Proposition 6.3.1, §6.5 Proposition 6.5.1, pp.70–74.) *Needs:* DiamondsAndVStacks
D6.9 (`IsSeminormalRing`); *Dieudonné algebras and multiplicative quotients*; *Strict completion
and its adjunction*; DerivedDeRhamCohomology Layer 2
(§2.12 *The ordinary algebraic de Rham complex*); DerivedDeRhamCohomology Layer 2 (§2.21 *The
universal differential graded algebra*); *Witt lifting from a torsion-free Frobenius lift*;
*Frobenius lifting after a divided differential*; Mathlib `WittVector`; Mathlib
`WittVector.frobenius`; Mathlib `WittVector.verschiebung`; Mathlib `WittVector.teichmuller`; Mathlib
`WittVector.frobenius_verschiebung`; Mathlib `WittVector.truncate`; Mathlib `TruncatedWittVector`;
Mathlib `WittVector.verschiebung_frobenius`.

**Checks.**

- `test_satDRW_perfect`: For perfect k, WsatΩ_k=W(k) in degree0 with higher forms0.
- `test_satDRW_polynomial`: For R=F_p[t]: d[t]≠0 in WsatΩ¹_R and F(d[t])=[t]^(p−1)·d[t], where
  [t]∈WsatΩ⁰_R=W(S_R) is the Teichmüller lift of e_R(t).
- `test_satDRW_dual_numbers`: For R=F_p[ε]/ε²: e_R(ε)=0 in S_R and the map WsatΩ_R→WsatΩ_(F_p)=Z_p
  induced by ε↦0 is an isomorphism, whereas the Teichmüller lift [ε] is nonzero in W(R).
- `test_satDRW_cusp`: For R=F_p[t²,t³]⊂F_p[t] the inclusion induces an isomorphism
  WsatΩ_R≅WsatΩ_(F_p[t]); in particular WsatΩ²_R=0, although Ω²_R≠0 (dx∧dy≠0 for x=t³, y=t²), and
  there is s∈S_R, mapping to e(t) under S_R≅S_(F_p[t])=F_p[t], with e_R(x)=s³ and e_R(y)=s².
- Singular inputs: for R=F_p[ε]/ε², WsatΩ_R=WsatΩ_(F_p)=Z_p although [ε]≠0 in W(R); for the cusp
  R=F_p[t²,t³], WsatΩ_R≅WsatΩ_(F_p[t]), so WsatΩ²_R=0 although Ω²_R≠0.

### CR.4.6 The classical and the relative de Rham–Witt complex

**Relative Frobenius–Verschiebung procomplexes.** For a map A→R of Z_(p)-algebras, an F–V procomplex
for R/A consists of: for each r≥1 a commutative differential graded W_r(A)-algebra P_r=⊕_(n≥0)P_r^n
(strictly commutative: x²=0 for x of odd degree); restriction maps R:P_(r+1)→P_r of differential
graded algebras; maps F:P_(r+1)→P_r of graded rings; additive maps V:P_r→P_(r+1) of graded groups;
and `W_r(A)`-algebra maps `λ_r : W_r(R) → P_r⁰` compatible with R, F and V on Witt vectors.
Thus, for the specified base map `α : A → R`,
`λ_r ∘ W_r(α) = algebraMap(W_r(A), P_r⁰)`.
R commutes with F and V,
and the relations are FV=p, FdV=d, Fdλ_(r+1)([x])=λ_r([x])^(p−1)·dλ_r([x]) for x∈R, and
V(x·F(y))=V(x)·y. Morphisms are families of maps of differential graded W_r(A)-algebras commuting
with R, F, V and λ. Consequently dF=pFd, Vd=p·dV, V(x·dy_1⋯dy_n)=V(x)·dV(y_1)⋯dV(y_n), VF=V(1)·
(which is multiplication by p when V(1)=p in W_(r+1)(A), for instance when A is an F_p-algebra, and
not in general), and d is a PD derivation for the canonical divided powers on V W_(r−1)(R):
dλ(V(ξ^p))=λ(V(ξ^(p−1)))·dλ(V(ξ)).

*Hypotheses.* p is a prime; A is a Z_(p)-algebra and R an A-algebra; p need not be nilpotent in A;
r≥1. W_r(R) is Mathlib's TruncatedWittVector p r R, with the finite operators of
*Finite-length Witt operators and their identities*; restriction R:W_(r+1)(R)→W_r(R) is
TruncatedWittVector.truncate, and F:W_(r+1)(R)→W_r(R), V:W_r(R)→W_(r+1)(R) and the Teichmüller lift
[·]:R→W_r(R) are induced from WittVector.frobenius, WittVector.verschiebung and
WittVector.teichmuller through WittVector.truncate. The differential of P_r is W_r(A)-linear.
Commutative differential graded algebras are strictly commutative (BMS1); for p odd this is
automatic from graded commutativity, for p=2 it is an axiom. The divided-power property of d is a
consequence, not an axiom. Write `Res_A` and `F_A` for Witt restriction and Frobenius on the
base. Restriction and F are over these base maps:
`R(a·x) = Res_A(a)·R(x)` and `F(a·x) = F_A(a)·F(x)` for `a ∈ W_(r+1)(A)` and `x ∈ P_(r+1)`.
V is linear after restriction of scalars along `F_A`:
`V(F_A(a)·y) = a·V(y)` for `a ∈ W_(r+1)(A)` and `y ∈ P_r`.
These scalar identities follow from the algebra-map condition on λ, its compatibility with
R and F, and the projection formula for V.

The API:

- `Crystalline.RelativeWittComplex.FdV`: F_r(d(V_r x))=dx with the correct form degree.
- `Crystalline.RelativeWittComplex.VF`: V_r(F_r y)=V_r(1)·y; p·y follows only under the extra
  characteristic-p identity.
- `Crystalline.RelativeWittComplex.dlog`: For a unit u, dlog[u]=[u]⁻¹d[u] is closed and
  F(dlog[u])=dlog[u].
- `Crystalline.finiteWittF`: F:W_(r+1)(R)→W_r(R), x↦truncate_r(frobenius(x̃)) for any lift x̃∈W(R)
  of x; it is independent of the lift, a ring homomorphism, commutes with restriction, and is the
  operator Crystalline.truncatedFrobenius of *Finite-length Witt operators and their identities*,
  with W_(r+1)(R)=TruncatedWittVector p (r+1) R.
- `Crystalline.finiteWittV`: V:W_r(R)→W_(r+1)(R), x↦truncate_(r+1)(verschiebung(x̃)); it is
  independent of the lift, additive and injective, commutes with restriction, and satisfies
  F(V(x))=p·x and V(x·F(y))=V(x)·y for x∈W_r(R), y∈W_(r+1)(R).
- `Crystalline.finiteTeich`: [·]:R→W_r(R), the truncation of the Teichmüller lift; it is
  multiplicative, commutes with restriction, and F([x])=[x]^p=[x^p].
- `Crystalline.RelativeWittComplex.d_F`: d(F(x))=p·F(dx) for x∈P_(r+1).
- `Crystalline.RelativeWittComplex.V_d`: V(dx)=p·dV(x) and V(x·dy_1⋯dy_n)=V(x)·dV(y_1)⋯dV(y_n) for
  x, y_i∈P_r.
- `Crystalline.RelativeWittComplex.d_pd`: dλ(V(ξ^p))=λ(V(ξ^(p−1)))·dλ(V(ξ)) for ξ∈W_r(R); hence
  d∘λ_(r+1):W_(r+1)(R)→P_(r+1)¹ is a PD derivation over W_(r+1)(A) for the canonical divided powers
  on V W_r(R) (*Canonical divided powers on the Verschiebung ideal of W_r(R)*).

*Proof sketch.* Each λ is the structure map of a differential graded
`W_r(R)/W_r(A)`-algebra, so `d ∘ λ_r` vanishes on the specified base `W_r(A)`.
The data and relations are those of BMS1 Definition 10.5 for a Z_(p)-algebra A;
Langer–Zink Definition 1.4 is the same with graded commutativity in place of strict commutativity
and with the restriction maps as the transition maps of a projective system. Consequences:
V(x·dy)=V(x·FdV(y))=V(x)·dV(y) by FdV=d and the projection formula; V(dx)=V(1)·dV(x)=p·dV(x) since d
is W_r(A)-linear and V(1)·V(x)=V(FV(1)·x)=p·V(x); VF(x)=V(1·F(x))=V(1)·x;
d(Fx)=FdV(Fx)=Fd(V(1)·x)=FV(1)·F(dx)=p·F(dx) (Langer–Zink (1.16)–(1.19)). PD property:
dV(ξ^p)=V(ξ^(p−1))·dV(ξ) is proved for ξ=[x], then for sums, then for ξ=V(η) (Langer–Zink Lemma
1.5). With (p−1)!·γ_p(Vξ)=p^(p−2)·V(ξ^p) from *Canonical divided powers on the Verschiebung ideal of
W_r(R)* this says d(γ_p(Vξ))=γ_(p−1)(Vξ)·d(Vξ), and over a Z_(p)-algebra a derivation with this
property is a PD derivation (Langer–Zink Lemma 1.2). ([Langer–Zink, *De Rham–Witt cohomology for a
proper and smooth morphism*](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §1.2, Definition 1.4,
consequences (1.16)–(1.22) and Lemma 1.5, printed pp.17–20; [Bhatt–Morrow–Scholze, *Integral p-adic
Hodge theory*](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.2, Definition
10.5 and Remark 10.6, p.81.) *Needs:* *Universal PD differentials and the PD de Rham complex* (Layer
CR.1); *Canonical divided powers on the Verschiebung ideal of W_r(R)*; Mathlib `WittVector.frobenius`, `WittVector.verschiebung`,
`WittVector.frobenius_verschiebung` and `WittVector.verschiebung_mul_frobenius`, as listed in
*Exact supplier contracts*; *Finite-length Witt operators and their identities*; DerivedDeRhamCohomology Layer 2 (§2.12 *The ordinary algebraic de
Rham complex*); Mathlib `TruncatedWittVector`; Mathlib `TruncatedWittVector.truncate`; Mathlib
`WittVector.truncate`; Mathlib `WittVector.frobenius`; Mathlib `WittVector.verschiebung`; Mathlib
`WittVector.teichmuller`; Mathlib `WittVector.frobenius_verschiebung`; Mathlib
`WittVector.verschiebung_mul_frobenius`.

**Checks.**

- `test_relativeWitt_units`: On A[t,t⁻¹], dlog[t] is a closed degree-one form fixed by graded F.
- `test_relativeWitt_V1`: Over A=Z/p², V(1) and p differ in W_2(A): the Witt coordinate of index 0
  of V(1) is 0 and that of p is p≠0; so V∘F=V(1)· is not multiplication by p.
- `test_relativeWitt_constant`: For every Z_(p)-algebra A, the tower {W_r(A)}_r placed in degree 0,
  with d=0, λ=id and the Witt vector F, V and restriction, is an F–V procomplex for A/A; if A is an
  F_p-algebra then VF=FV=p on it.
- `test_relativeWitt_base_compatibility`: For `A = R = F_p[t]` with identity base map, take
  `P_r = W_rΩ^*_(F_p[t]/F_p)` with its usual λ and operators, but let `W_r(A)` act through
  evaluation `t ↦ 0` and the constant `W_r(F_p)` action. This has a base-linear differential
  and satisfies the displayed operator relations, but λ is not a `W_r(A)`-algebra map:
  at length one λ sends `t` to `t`, whereas the specified coefficient map sends it to `0`.
  It is excluded from the relative category. A map from the degree-zero tower `W_r(A)`
  preserving λ and d would force `0 = dt` in `Ω¹_(F_p[t]/F_p)`, where `dt ≠ 0` for every prime,
  including `p = 2`.
- In every F–V procomplex dF=pFd, Vd=p·dV and VF=V(1)·; over A=Z/p², V(1)≠p in W_2(A): their Witt
  coordinates of index 0 are 0 and p.
- For a unit u of R and dlog[u]=[u]⁻¹·d[u]: F(dlog[u])=dlog[u] and d(dlog[u])=0; on the torus
  R=A[t,t⁻¹] this applies to u=t.

**Initial relative de Rham–Witt complex.** For any map A→R of Z_(p)-algebras, the category of F–V
procomplexes for R/A has an initial object {W_rΩ^*_(R/A)}_(r≥1), the relative de Rham–Witt complex.
Its degree-zero ring is W_r(R) (λ_r is the identity), its length-one term is the de Rham complex
Ω^*_(R/A), and its differential is W_r(A)-linear. For every r the map of differential graded
algebras from the PD de Rham complex Ω̆^*_(W_r(R)/W_r(A)) (for the canonical divided powers on V
W_(r−1)(R)) to W_rΩ^*_(R/A) is surjective; hence the restriction maps W_(r+1)Ω^q_(R/A)→W_rΩ^q_(R/A)
are surjective. It is constructed by induction on r: W_(r+1)Ω^* is the quotient of
Ω̆^*_(W_(r+1)(R)/W_(r+1)(A)) by the differential graded ideal generated by the elements Σ_l
V(ξ_l)·dV(η_(l,1))⋯dV(η_(l,i)) and Σ_l dV(ξ_l)·dV(η_(l,1))⋯dV(η_(l,i)) for every relation Σ_l
ξ_l·dη_(l,1)⋯dη_(l,i)=0 in W_rΩ^i_(R/A), and then by the differential graded ideal generated by the
elements V(ω·F(η))−V(ω)·η.

*Hypotheses.* p is a prime; A is a Z_(p)-algebra and R an arbitrary A-algebra; p need not be
nilpotent in A and R need not be smooth over A; r≥1. W_r(R), its operators and the notion of F–V
procomplex are those of *Relative Frobenius–Verschiebung procomplexes*; the divided powers on V
W_(r−1)(R) are those of *Canonical divided powers on the Verschiebung ideal of W_r(R)*.

The API:

- `Crystalline.relativeDRW_lift`: Every F–V procomplex P for R/A, with
  `λ_r ∘ W_r(A → R) = algebraMap(W_r(A), P_r⁰)`, receives a unique morphism of F–V
  procomplexes from {W_rΩ^*_(R/A)}_r (maps of differential graded W_r(A)-algebras commuting with R,
  F, V and λ).
- `Crystalline.relativeDRW_zero`: W_rΩ⁰_(R/A)=W_r(R) and W₁Ω^*_(R/A)=Ω^*_(R/A).
- `Crystalline.relativeDRW_map`: A commutative square of ring maps (a:A→A′, f:R→R′ with
  f∘(A→R)=(A′→R′)∘a, all Z_(p)-algebras) induces maps W_rΩ^*_(R/A)→W_rΩ^*_(R′/A′) of differential
  graded algebras over W_r(f), equal to W_r(f) in degree 0 and commuting with restriction, F and V.
- `Crystalline.relativeDRW_generated`: The map of differential graded algebras
  Ω^*_(W_r(R)/W_r(A))→W_rΩ^*_(R/A) is surjective (it factors through the PD de Rham complex); hence
  every element of W_rΩ^q_(R/A) is a sum of elements ξ·dη_1⋯dη_q with ξ, η_i∈W_r(R), and restriction
  W_(r+1)Ω^q_(R/A)→W_rΩ^q_(R/A) is surjective.
- `Crystalline.relativeDRW_base_quotient`: If A→A′ is a surjective map of Z_(p)-algebras and R is an
  A′-algebra, then W_rΩ^*_(R/A)=W_rΩ^*_(R/A′), because W_r(A)→W_r(A′) is surjective and the two
  categories of F–V procomplexes coincide.
- `Crystalline.relativeDRW_lift_noRestriction`: Let Q be a family of commutative differential graded
  W_r(A)-algebras Q_r (r≥1) with maps F:Q_(r+1)→Q_r, V:Q_r→Q_(r+1) and
  `W_r(A)`-algebra maps `λ_r : W_r(R) → Q_r⁰`, so
  `λ_r ∘ W_r(A → R) = algebraMap(W_r(A), Q_r⁰)`, satisfying all axioms of an F–V procomplex
  except those involving restriction maps. In particular F is over `F_A` and
  `V(F_A(a)·y) = a·V(y)`. Then there is a unique family of maps of differential graded
  `W_r(A)`-algebras `W_rΩ^*_(R/A) → Q_r` commuting with F, V and λ.

*Proof sketch.* Frobenius on PD forms: for a W_r(A)-linear PD derivation ν:W_r(R)→M, the map
ξ=[x]+V(ρ)↦[x]^(p−1)·ν([x])+ν(ρ) is a W_(r+1)(A)-linear PD derivation W_(r+1)(R)→M_[F]. Its
additivity uses the identity Σ((p−1)!/(i!j!k!))·[x]^i[y]^j(Vτ)^k+α_p(Vτ)=τ (sum over i+j+k=p with
i,j,k≠p) for [x+y]=[x]+[y]+V(τ), α_p=(p−1)!·γ_p, checked in Z_(p)[x,y], and the PD property of ν
(Langer–Zink Proposition 1.3). Applied to the universal PD derivation it gives
F:Ω̆^*_(W_(r+1)(R)/W_(r+1)(A))→Ω̆^*_(W_r(R)/W_r(A)) with F(dV(η))=dη, F(d[x])=[x]^(p−1)·d[x] and
d(Fξ)=p·F(dξ) (Langer–Zink (1.14)–(1.15)). Induction: W_1Ω^*=Ω^*_(R/A). Given the levels ≤r with
surjections from the PD forms compatible with restriction and F, let I be the ideal of
Ω̆^*_(W_(r+1)(R)/W_(r+1)(A)) generated by the elements of the statement attached to relations in
W_rΩ^i; F maps I to zero in W_rΩ^* because FV=p on W_r(R) and FdV=d. On the quotient,
V(ξ·dη_1⋯dη_i)=V(ξ)·dV(η_1)⋯dV(η_i) is well defined; divide further by the differential graded ideal
generated by V(ω·F(η))−V(ω)·η, which F also kills (Langer–Zink §1.3). Initiality: for an F–V
procomplex P the map Ω̆^*_(W_r(R)/W_r(A))→P_r exists because λ is a `W_r(A)`-algebra map
and `d ∘ λ` is a PD derivation over that base (*Relative
Frobenius–Verschiebung procomplexes*, d_pd) and it commutes with F; by induction on r it kills both
ideals, by V(x·dy_1⋯dy_n)=V(x)·dV(y_1)⋯dV(y_n) and the projection formula in P. Uniqueness holds
because W_rΩ^* is generated by W_r(R) and dW_r(R). The argument uses F, V and λ of P at levels r and
r+1 but never its restriction maps (Langer–Zink Proposition 1.6). ([Langer–Zink, *De Rham–Witt
cohomology for a proper and smooth morphism*](https://www.math.uni-bielefeld.de/~zink/dRW.pdf),
§1.1, Proposition 1.3 and (1.14)–(1.15), printed pp.14–17; §1.3, construction (1.26)–(1.31) and
Proposition 1.6, printed pp.21–23; [Bhatt–Morrow–Scholze, *Integral p-adic Hodge
theory*](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.2, Theorem 10.7,
p.82.) *Needs:* *Relative Frobenius–Verschiebung procomplexes*; *Universal PD differentials and the
PD de Rham complex* (Layer CR.1); *Canonical divided powers on the Verschiebung ideal of W_r(R)*.

**Checks.**

- `test_relativeDRW_identity`: For R=A all positive forms vanish and degree0 is W_r(A).
- `test_relativeDRW_torus`: For R=A[t,t⁻¹] with A≠0: dlog[t]=[t]⁻¹·d[t]∈W_rΩ¹_(R/A) is nonzero (its
  image in W_1Ω¹=Ω¹_(R/A) is dt/t), F(dlog[t])=dlog[t] and d(dlog[t])=0.
- `test_relativeDRW_nonsmooth`: For R=F_p[ε]/ε² over A=F_p the relative de Rham–Witt complex has
  W_rΩ⁰=W_r(R) with [ε]≠0 and W_1Ω¹=Ω¹_(R/F_p)≠0; it is therefore not the saturated complex
  WsatΩ_R=Z_p.
- `test_relativeWitt_length1`: For every map A→R of Z_(p)-algebras, the length-one term of the
  initial F–V procomplex of R/A (*Initial relative de Rham–Witt complex*) is the de Rham complex
  Ω^*_(R/A); in particular its degree-zero ring is R.
- W_rΩ⁰_(R/A)=W_r(R) and W_1Ω^*_(R/A)=Ω^*_(R/A); for R=A, W_rΩ^q_(A/A)=0 for q>0.
- The complex is defined when p is not nilpotent (A=Z_(p)) and for non-smooth R: for R=F_p[ε]/ε²
  over F_p, W_1Ω¹=Ω¹_(R/F_p)≠0 and [ε]≠0 in W_rΩ⁰.

**Classical de Rham–Witt complex as the initial V-pro-complex.** Let R be a commutative F_p-algebra.
An R-framed V-pro-complex consists of an inverse system ⋯→A_3→A_2→A_1→A_0 of commutative
differential graded algebras (transition maps Res, inverse limit A_∞), maps V:A_r→A_(r+1) of graded
abelian groups, and a ring homomorphism β:W(R)→A_∞⁰ with components β_r:W(R)→A_r⁰, such that: (a)
A_r^n=0 for n<0 and for r=0; (b) Res∘V=V∘Res; (c) β∘V=V∘β; (d) V(x·dy)=V(x)·dV(y); (e)
(Vx)·dβ_(r+1)([λ])=V(x·β_r([λ])^(p−1)·dβ_r([λ])) for λ∈R and x∈A_r. Morphisms are families of maps
of differential graded algebras commuting with Res, V and β. This category has an initial object
{W_rΩ^*_R}_(r≥0), the classical de Rham–Witt complex of R, and WΩ^*_R=lim_r W_rΩ^*_R. Each W_rΩ^*_R
is a quotient of the absolute de Rham complex Ω^*_(W_r(R)); the restriction maps are surjective; β_r
induces an isomorphism W_r(R)≅W_rΩ⁰_R; and Ω^*_R→W_1Ω^*_R is an isomorphism.

*Hypotheses.* p is a prime; R is a commutative F_p-algebra, with no regularity, reducedness or
finiteness assumption. Commutative differential graded algebras are strictly commutative (x²=0 for x
of odd degree) and concentrated in degrees ≥0; differentials are additive. A Frobenius operator is
not part of the structure of an R-framed V-pro-complex.

The API:

- `Crystalline.classicalDRW_lift`: Every R-framed V-pro-complex {A_r} receives a unique morphism of
  R-framed V-pro-complexes from {W_rΩ^*_R}.
- `Crystalline.classicalDRW_zero`: β_r induces a ring isomorphism W_r(R)≅W_rΩ⁰_R for r≥1, and
  W_0Ω^*_R=0.
- `Crystalline.classicalDRW_one`: The map Ω^*_R→W_1Ω^*_R extending R=W_1(R)→W_1Ω⁰_R is an
  isomorphism of differential graded algebras.
- `Crystalline.classicalDRW_generated`: Ω^*_(W_r(R))→W_rΩ^*_R is surjective, and
  Res:W_(r+1)Ω^*_R→W_rΩ^*_R is surjective.
- `Crystalline.classicalDRW_map`: A homomorphism f:R→R′ of F_p-algebras induces maps
  W_rΩ^*_R→W_rΩ^*_(R′) of differential graded algebras commuting with Res, V and W(f); identities
  and composites are respected.
- `Crystalline.classicalDRW_toRelative`: The tower {W_rΩ^*_(R/F_p)}_r of *Initial relative de
  Rham–Witt complex* is an R-framed V-pro-complex, and the resulting maps W_rΩ^*_R→W_rΩ^*_(R/F_p)
  are isomorphisms of differential graded algebras commuting with V and restriction, for every
  F_p-algebra R; they carry Illusie's Frobenius F:W_(r+1)Ω^*_R→W_rΩ^*_R (Illusie I.2.17) to the
  Frobenius of the F–V procomplex.
- `Crystalline.classicalDRW_lift_degreeZero`: Illusie's universal property. Let M_• be an inverse
  system of commutative differential graded algebras with M_r=0 for r≤0 and M⁰_r=W_r(M⁰_1) for an
  F_p-algebra M⁰_1 (the restriction maps being the restriction of Witt vectors in degree 0), with
  additive maps V:M_r→M_(r+1) that commute with restriction, are the Verschiebung of Witt vectors in
  degree 0, and satisfy V(x·dy)=V(x)·dV(y) for all x, y∈M_r and (Vy)·d[x]=V([x]^(p−1)·y)·dV[x] for
  x∈M⁰_1, y∈M⁰_r. Then every ring homomorphism f:R→M⁰_1 extends uniquely to maps W_rΩ^*_R→M_r of
  differential graded algebras that commute with restriction and V and are W_r(f) in degree 0.

*Proof sketch.* Call a family of differential graded ideals I_r⊂Ω^*_(W_r(R)), r≥0, good if (i)
restriction carries I_(r+1) into I_r; (ii) V(x_0·dx_1∧⋯∧dx_n)=V(x_0)·dV(x_1)∧⋯∧dV(x_n) is a
well-defined additive map Ω^*_(W_r(R))/I_r→Ω^*_(W_(r+1)(R))/I_(r+1); (iii)
(Vx)·d[λ]−V(x·[λ]^(p−1)·d[λ])∈I_(r+1) for all x and λ∈R. Good families are closed under
intersection, and the quotients by the smallest good family, with β the projections, form an initial
R-framed V-pro-complex (BLM Proposition 4.4.4). The family of all elements of positive degree is
good, so the smallest good family is zero in degree 0 and W_rΩ⁰_R=W_r(R); the relations impose
nothing for r=1, so W_1Ω^*_R=Ω^*_R; restriction is surjective because W_(r+1)(R)→W_r(R) is (BLM
Remarks 4.4.5, 4.4.9, Warning 4.4.8). In any R-framed V-pro-complex the composite Res^r∘V^r:A_r→A_r
vanishes by (a) and (b), so by (c) β_r kills V^rW(R) and factors through W_r(R) (BLM Remark 4.4.3).
Functoriality: for f:R→R′ an R′-framed V-pro-complex is R-framed through W(f), which commutes with V
and Teichmüller lifts; initiality gives W_rΩ^*_R→W_rΩ^*_(R′). The Langer–Zink tower
{W_rΩ^*_(R/F_p)}_r (with W_0=0), with its V and the projections W(R)→W_r(R), satisfies (d) by
V(x·dy)=V(x·FdV(y))=V(x)·dV(y) and (e) by V(x·F(d[λ]))=V(x)·d[λ] with F(d[λ])=[λ]^(p−1)·d[λ]; so it
is an R-framed V-pro-complex and receives a map from the classical complex, surjective because both
are quotients of Ω^*_(W_r(R)). Illusie's universal property (API item classicalDRW_lift_degreeZero).
Let M_• and f:R→M⁰_1 be as there; M_• is a V-pro-complex of DR in the sense of Illusie I.1.1, his
condition (V3) being (e) for x of degree 0 rewritten by (d). Let M′_r⊂M_r be the differential graded
subalgebra generated by M⁰_r. The M′_r are stable under restriction and under V (by (d)), and
satisfy (e) for x of every degree: for x=a·dx_1⋯dx_i with a, x_j∈M⁰_r,
(Vx)·d[λ]=(−1)^i·V(a)·d[λ]·dV(x_1)⋯dV(x_i)=(−1)^i·V([λ]^(p−1)a)·dV[λ]·dV(x_1)⋯dV(x_i)=V(x·[λ]^(p−1)·d[λ]).
So M′_• with β=W(f) is an R-framed V-pro-complex and receives a unique morphism from {W_rΩ^*_R};
every morphism from {W_rΩ^*_R} to M_• lands in M′_• because W_rΩ^*_R is generated as a differential
graded algebra by its degree-zero part W_r(R) (steps 1 and 2). Hence R↦{W_rΩ^*_R} is left adjoint to
M_•↦M⁰_1, which is Illusie's definition of the de Rham–Witt pro-complex (Illusie I.1.3, I.1.4);
conversely Illusie's pro-complex is an R-framed V-pro-complex, (e) in all degrees being his formula
(1.5.2) (BLM Warning 4.4.8). Agreement with the Langer–Zink complex. By step 5 Illusie's theorems
apply to {W_rΩ^*_R}: there are maps F:W_(r+1)Ω^*_R→W_rΩ^*_R of graded rings, compatible with
restriction and equal to F on Witt vectors in degree 0, with F(d[x])=[x]^(p−1)·d[x] and FdV=d
(Illusie, Théorème I.2.17), and FV=VF=p, x·V(y)=V(F(x)·y) (Illusie, Proposition I.2.18). So
{W_rΩ^*_R}_(r≥1) with F and V is an F–V procomplex for R/F_p (*Relative Frobenius–Verschiebung
procomplexes*), and initiality (*Initial relative de Rham–Witt complex*) gives maps
h_r:W_rΩ^*_(R/F_p)→W_rΩ^*_R commuting with d, restriction, F and V. The surjections g_r of step 4
commute with F: g∘F and F∘g are ring maps that agree on W_(r+1)(R), on d[x] and on dV(y), and these
generate. Hence h∘g is an endomorphism of the initial R-framed V-pro-complex and g∘h an endomorphism
of the initial F–V procomplex; both are the identity, so g_r is an isomorphism for every F_p-algebra
R. ([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3),
arXiv v3, §4.4, Definition 4.4.1, Remark 4.4.3, Proposition 4.4.4 with its proof sketch, Remark
4.4.5, Definition 4.4.6, Remark 4.4.7, Warning 4.4.8, Remark 4.4.9, pp.48–51; [Langer–Zink, *De
Rham–Witt cohomology for a proper and smooth
morphism*](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), Introduction, PDF p.4; [Illusie,
*Complexe de de Rham–Witt et cohomologie
cristalline*](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part I, §1: Définition 1.1
((V1)–(V3)), Théorème 1.3 ((1.3.1)), Définition 1.4, Proposition 1.5 ((1.5.2)), Proposition 1.6,
printed pp. 543–545; 1.10 (p. 547); 1.15 (p. 550); [Illusie, *Complexe de de Rham–Witt et
cohomologie cristalline*](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part I, §2 E:
Théorème 2.17, Proposition 2.18 ((2.18.1)–(2.18.6)), printed pp. 562–564.) *Needs:* Mathlib `WittVector.frobenius`, `WittVector.verschiebung`,
`WittVector.frobenius_verschiebung` and `WittVector.verschiebung_mul_frobenius`, as listed in
*Exact supplier contracts*; *Finite-length Witt operators and their identities*; *Initial relative de Rham–Witt complex*;
DerivedDeRhamCohomology Layer 2 (§2.12 *The ordinary algebraic de Rham complex*);
DerivedDeRhamCohomology Layer 2 (§2.21 *The universal differential graded algebra*); *Relative
Frobenius–Verschiebung procomplexes*; Mathlib `WittVector`; Mathlib `TruncatedWittVector`; Mathlib
`WittVector.truncate`; Mathlib `WittVector.verschiebung`; Mathlib `WittVector.teichmuller`.

**Checks.**

- `test_classicalDRW_perfect`: For a perfect F_p-algebra k and r≥1: W_rΩ⁰_k=W_r(k) and W_rΩ^n_k=0
  for all n>0.
- `test_classicalDRW_length_one`: For R=F_p[t]: W_1Ω⁰_R=F_p[t], W_1Ω¹_R=F_p[t]·dt≠0 and W_1Ω^n_R=0
  for n≥2.
- `test_classicalDRW_dual_numbers`: For R=F_p[ε]/ε²: [ε]≠0 in W_rΩ⁰_R=W_r(R) and W_1Ω¹_R=Ω¹_R≠0, so
  W_rΩ^*_R→W_rΩ^*_(F_p) is not an isomorphism, unlike WsatΩ_R→WsatΩ_(F_p).
- `test_classicalDRW_cusp`: For R=F_p[t²,t³] with x=t³, y=t²: dx∧dy≠0 in W_1Ω²_R=Ω²_R, whereas
  WsatΩ²_R=0.
- For a perfect F_p-algebra k: W_rΩ⁰_k=W_r(k) and W_rΩ^n_k=0 for n>0, because every element of
  W_r(k) is a sum of V^i[a]=p^i[a^(1/p^i)] and d[c]=d([c^(1/p^r)]^(p^r)) is divisible by p^r=0.
- For R=F_p[ε]/ε²: [ε]≠0 in W_rΩ⁰_R=W_r(R); for the cusp R=F_p[t²,t³]: W_1Ω²_R=Ω²_R≠0. The classical
  complex is not invariant under R→R_red or under passing to the seminormalisation.

**Polynomial basic Witt differential expansion.** For S=A[T₁,…,T_d], A a Z_(p)-algebra, weights are
k∈Z[1/p]≥0^d; order the support of k by increasing p-valuation, with a fixed tie order that is the
same for k and p^a·k. A partition P of the support is a sequence of intervals I₀,…,I_q in increasing
order, with I₀ allowed empty and the later intervals nonempty. Put t(I)=−min_(i∈I)v_p(k_i),
u(I)=max(0,t(I)) and u(k)=max(0,−min_i v_p(k_i)); the weight k_I (the restriction of k to I) is
integral when t(I)≤0, and the intervals with non-integral k_I come first. For ξ=V^u(k)(η) the basic
form e(ξ,k,P) is the product, in order, of V^u(I₀)(η[T]^(p^u(I₀)k_I₀)) for block 0,
dV^u(I)([T]^(p^u(I)k_I)) for each later block with k_I not integral, and F^(−t(I))d[T]^(p^t(I)k_I)
for each later block with k_I integral. If I₀ is empty, η is placed inside the first factor,
dV^u(I₁)(η[T]^(p^u(I₁)k_I₁)), when k is not integral, and in front of the product when k is
integral. Every element of W_rΩ^q_(S/A) is uniquely a finite sum of basic forms e(ξ_(k,P),k,P) over
weights with p^(r−1)·k integral (that is u(k)<r) and partitions into q+1 intervals, with
ξ_(k,P)∈V^u(k)W_(r−u(k))(A). Every element of WΩ^q_(S/A)=lim_r W_rΩ^q_(S/A) is uniquely a convergent
sum of basic forms, where for each m all but finitely many coefficients lie in V^mW(A).

*Hypotheses.* p is a prime; A is a Z_(p)-algebra, possibly with p-torsion; S=A[T₁,…,T_d], d≥0; r≥1;
q≥0. The expansion describes W_rΩ^q_(S/A) as a W_r(A)-module through the coefficients
ξ∈V^u(k)W_(r−u(k))(A); it is not a basis over W_r(S).

*Proof sketch.* Degree 0 and generators (Langer–Zink Proposition 2.3, Corollary 2.4, display
(2.24)): every element of W(S) is uniquely a convergent sum Σ_k V^u(k)(η_k·[T]^(p^u(k)·k)) over the
weights k, with η_k∈W(A). One subtracts Σ_k[a_k]·[T]^k, where w_0(ξ)=Σ_k a_k·T^k, to land in V W(S),
repeats, and rewrites V^m([a]·[T]^k)=V^(m−ρ)(V^ρ([a])·[T]^(k/p^ρ)) for the largest ρ≤m with k/p^ρ
integral. Since W_rΩ^q_(S/A) is spanned by the products ξ·dη_1⋯dη_q with ξ, η_i∈W_r(S) (*Initial
relative de Rham–Witt complex*), every element of WΩ^q_(S/A) is a convergent sum of products
V^(u_0)(η_0[T]^(a_0))·dV^(u_1)(η_1[T]^(a_1))⋯dV^(u_q)(η_q[T]^(a_q)) with η_j∈W(A) and integral
weights a_j. Operators on basic forms, from the relations V(x·F(y))=V(x)·y, FdV=d, dF=pFd and
V(x·dy_1⋯dy_n)=V(x)·dV(y_1)⋯dV(y_n) (*Relative Frobenius–Verschiebung procomplexes*). Langer–Zink
Proposition 2.5: F e(ξ,k,P)=e(Fξ,pk,P) if I₀≠∅ or k is integral, and =e(ξ′,pk,P) with Vξ′=ξ if I₀=∅
and k is not integral; V e(ξ,k,P)=e(Vξ,k/p,P) if I₀≠∅ or k/p is integral, and =e(p·Vξ,k/p,P) if I₀=∅
and k/p is not integral. Proposition 2.6: d e(ξ,k,I₀,…,I_q)=0 if I₀=∅; =e(ξ,k,∅,I₀,…,I_q) if I₀≠∅
and k is not integral; =p^(−t)·e(ξ,k,∅,I₀,…,I_q) with t=t(Supp k)≤0 if I₀≠∅ and k is integral. Since
α·e(ξ,k,P)=e(αξ,k,P) for α∈W(A), the operators F, V and d carry basic forms to basic forms or to 0.
Integral weights (Langer–Zink Lemmas 2.9, 2.10, Proposition 2.11). Put (df^a/b)=(a/b)·f^(a−1)·df for
f∈W(S) and integers a, b≥1 with ord_p(a/b)≥0; integers prime to p are units of W(A) because A is a
Z_(p)-algebra. For subsets J₀, J₁,…,J_q of {1,…,d} (J₁,…,J_q nonempty, overlaps allowed), exponents
a_(j,i)≥1 for i∈J_j and c_j=gcd_(i∈J_j) a_(j,i), the element
∏_(i∈J₀)[T_i]^(a_(0,i))·∏_(j=1..q)(d(∏_(i∈J_j)[T_i]^(a_(j,i)))/c_j) is a sum of basic forms of
weight k_i=Σ_j a_(j,i). For q=1 and J₀∩J₁=∅ (Lemma 2.9) the variables of J₀ are moved past those of
J₁ by the Leibniz rule; for q=1 in general (Lemma 2.10) one uses
[T_j]^b·(d[T_j]^a/c)=(a/c)·(d[T_j]^(a+b)/(a+b)) when ord_p(a)≥ord_p(c); for q>1 (Proposition 2.11)
one argues by induction on q: when J₀=∅ the element is, up to a unit of Z_(p), F^e∘d applied to an
element with q−1 differentials (e the least ord_p(c_j)), which is a sum of basic forms by induction,
so that step 2 applies; the variables of J₀ are then multiplied in one at a time, using Lemmas 2.9
and 2.10. General products and finite level (Langer–Zink Lemma 2.12; first lines of the proof of
Proposition 2.17). By induction on q, a product as in step 1 is a sum of basic forms. If u_0≥u_j for
all j, then V^(u_0)(x)·dV^(u_j)(y)=V^(u_0)(x·F^(u_0−u_j)(dy)) writes it as V^(u_0) of an element
treated in step 3, and step 2 applies. Otherwise let u_1 be the largest of the u_j, after reordering
the factors dV^(u_j)(…); by the Leibniz rule
V^(u_0)(x)·dV^(u_1)(y)=d(V^(u_0)(x)·V^(u_1)(y))−V^(u_1)(y)·dV^(u_0)(x) the product is the difference
of d of a product with q−1 differentials, to which the induction hypothesis and step 2 apply, and a
product of the first kind. The image of e(ξ,k,P) in W_rΩ^q_(S/A) depends only on the class of ξ in
W_r(A) and is 0 for ξ∈V^rW(A); since WΩ^q_(S/A)→W_rΩ^q_(S/A) is surjective, every element of
W_rΩ^q_(S/A) is a finite sum of basic forms with ξ_(k,P)∈V^u(k)W_(r−u(k))(A), u(k)<r. Phantom
components (Langer–Zink §2.4, Lemma 2.14, Proposition 2.15), for a Z_(p)-algebra A and any A-algebra
S. For m≥0 the map δ_m:W(S)→Ω¹_(S/A), δ_m(x_0,x_1,…)=Σ_(i=0..m) x_i^(p^(m−i)−1)·dx_i, satisfies
p^m·δ_m=d∘w_m and is a W(A)-linear PD derivation into Ω¹_(S/A) with W(S) acting through the ghost
component w_m; this is clear when Ω¹_(S/A) is p-torsion-free and follows in general from the case of
a polynomial ring over a p-torsion-free base. The maps ξ·dη_1⋯dη_q↦w_m(ξ)·δ_m(η_1)⋯δ_m(η_q) on the
PD de Rham complex of W_(m+1)(S) over W_(m+1)(A) factor through ring homomorphisms
ω_m:W_(m+1)Ω^*_(S/A)→Ω^*_(S/A) with ω_m(Vx)=p·ω_(m−1)(x) and ω_m(dVx)=ω_(m−1)(dx) for m≥1,
ω_0(Vx)=ω_0(dVx)=0, ω_m(Fx)=ω_(m+1)(x), and d∘ω_m=p^m·ω_m∘d. Because the tower ⊕_(i<r)Ω^*_(S/A) is
not an F–V procomplex, this is proved by checking that ω_m kills the two families of relations in
the inductive construction of W_(m+1)Ω^*_(S/A) (*Initial relative de Rham–Witt complex*), not by the
universal property. Uniqueness for p-torsion-free A (Langer–Zink Propositions 2.16 and 2.1, first
half of the proof of Proposition 2.17, Corollary 2.18). For S=A[T₁,…,T_d] and m<r:
ω_m(e)=w_m(ξ)·T^(p^m k_I₀)·∏_j(p^(−ord_p(p^m k_I_j))·dT^(p^m k_I_j)) when p^m·k is integral (with
w_(m−u)(η), ξ=V^u(η), u=u(k), in place of w_m(ξ) if I₀ is empty and k is not integral), and ω_m(e)=0
otherwise. Here, for an integral weight k_I with v=min_(i∈I)ord_p(k_i), the symbol (p^(−v)·dT^(k_I))
denotes Z^(p^v−1)·dZ with Z=T^(k_I/p^v), and the right-hand side is w_m(ξ), respectively w_(m−u)(η),
times the p-basic element of Ω^*_(S/A) of weight p^m·k and partition P; the p-basic elements of all
integral weights and partitions form an A-basis of Ω^*_(S/A) for every Z_(p)-algebra A (Proposition
2.1). So a vanishing finite sum Σe(ξ_(k,P),k,P) in W_rΩ^q_(S/A) has w_m(ξ_(k,P))=0 for all m<r
(respectively, all ghost components of η∈W_(r−u)(A) vanish), and the ghost map W_r(A)→A^r is
injective because A, a p-torsion-free Z_(p)-algebra, is torsion-free (*Finite-length Witt operators and their identities*,
Crystalline.truncatedGhost_injective). Hence all ξ_(k,P)=0, and (ω_0,…,ω_(r−1)) is
injective on W_rΩ^*_(S/A). General A (Langer–Zink Proposition 2.17, second half of the proof): write
A=Ã/𝔞 with Ã a p-torsion-free Z_(p)-algebra, for instance a polynomial ring over Z_(p), and put
S̃=Ã[T₁,…,T_d]. The convergent sums of basic forms with coefficients in W(𝔞)=ker(W(Ã)→W(A)) form an
ideal of WΩ_(S̃/Ã) stable under F, V and d (by steps 2–4); the quotient E is an F–V procomplex for
S/A with E⁰=W(S), and by step 6 every element of E_r has a unique expansion with coefficients in
V^u(k)W_(r−u(k))(A). Initiality (*Initial relative de Rham–Witt complex*) gives a map WΩ_(S/A)→E,
and the composite WΩ_(S̃/Ã)→WΩ_(S/A)→E is the quotient map; maps of F–V procomplexes carry basic
forms to basic forms with the same coefficients, so a vanishing sum in W_rΩ^q_(S/A) has vanishing
coefficients. Limit (Langer–Zink Theorem 2.8): an element of WΩ^q_(S/A) is a convergent sum of basic
forms by steps 1–4, and its coefficients are determined modulo V^rW(A) by its image in W_rΩ^q_(S/A)
for every r, hence uniquely. ([Langer–Zink, *De Rham–Witt cohomology for a proper and smooth
morphism*](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §2.2 (weights, definitions of t and u,
basic Witt differentials (2.11)–(2.17), Propositions 2.5, 2.6, Lemma 2.7), printed pp.37–42; §2.3
Theorem 2.8, p.43; §2.5 Proposition 2.17 with proof and Corollary 2.18, pp.55–57; [Langer–Zink, *De
Rham–Witt cohomology for a proper and smooth
morphism*](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §2.2 Proposition 2.3 and Corollary 2.4,
printed pp.37–38; §2.3 Lemmas 2.9, 2.10, Proposition 2.11 and Lemma 2.12 with proofs, Corollary
2.13, pp.43–49; [Langer–Zink, *De Rham–Witt cohomology for a proper and smooth
morphism*](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §2.1 Proposition 2.1 with proof (Lemma
2.2), printed pp.32–37; §2.4 Lemma 2.14, Proposition 2.15 with proof and Proposition 2.16 with
proof, pp.49–54.) *Needs:* *Initial relative de Rham–Witt complex*; *Relative Frobenius–Verschiebung
procomplexes*; *Finite-length Witt operators and their identities*;
DerivedDeRhamCohomology Layer 2 (§2.12 *The ordinary algebraic de Rham complex*); Mathlib
`TruncatedWittVector`; Mathlib `WittVector.ghostComponent`.

**Checks.**

- For d=1 and r=1 the basic forms are η·T^k in degree 0 and η·k′·T^(k−1)dT in degree 1, where
  k=p^a·k′≥1 with k′ prime to p (a unit of A): the expansion is the monomial basis of Ω^*_(A[T]/A).
- For d=1, r=2 and a weight k=m/p with m prime to p: the basic forms are V(η[T]^m) in degree 0 and
  dV(η[T]^m) in degree 1 with η∈W_1(A)=A, and d maps the first to the second (Langer–Zink
  Proposition 2.6).
- For d=1, r=2 and A=F_p: in weight 1 the basic forms are ξ·[T] (degree 0) and ξ·d[T] (degree 1)
  with ξ∈W_2(F_p)=Z/p²; in weight 1/p they are V(η[T]) and dV(η[T]) with η∈F_p. For every weight k>0
  the part of weight k of W_2Ω^q_(F_p[T]/F_p), q=0, 1, is Z/p² if k is integral, Z/p if k=m/p with
  p∤m, and 0 otherwise; d from degree 0 to degree 1 is multiplication by p^(ord_p k) on Z/p² for
  integral k and an isomorphism for k=m/p. Hence H⁰ and H¹ of W_2Ω^*_(F_p[T]/F_p) are the kernel and
  cokernel of f↦f′ on (Z/p²)[T], the de Rham cohomology of the lift.

**Witt schemes on locally p-nilpotent schemes.** For a prime p, `r≥1` and a scheme X on which
p is locally nilpotent, define `Crystalline.wittScheme r X`, written `W_rX`, with ringed-space
carrier `(|X|,W_r(O_X))`. Prove `Crystalline.wittScheme_affine`: on an affine open `Spec R` this
is `Spec W_r(R)`. Prove `Crystalline.wittScheme_one`: `W₁X=X`, and
`Crystalline.wittScheme_perfect`: on perfect `𝔽_p`-schemes it agrees canonically with
SchemeAndStackFoundations §0.26's `wittScheme`. Give functoriality for morphisms and compatibility
of these identifications with open restriction and composition.

*Hypotheses.* p is prime, `r≥1` and p is locally nilpotent on X; perfectness is required only for
the comparison with the supplied perfect-scheme constructor.

*Proof sketch.* The additive truncation sequences give `p^(N*r)=0` in `W_r(R)` if `p^N=0` in R.
The kernel of `W_r(R)→R` is the Verschiebung ideal, and `V(x)V(y)=pV(xy)` makes it nilpotent.
Induction on r gives `W_r(R)[[f]⁻¹]≅W_r(R_f)`; Teichmüller lifts of a family generating the unit
ideal again generate the unit ideal. Thus the affine Witt schemes glue, their underlying spaces
identify with `|X|`, and their structure sheaf is `W_r(O_X)`. The affine identifications also give
functoriality, the length-one law and the perfect-scheme comparison.
([Langer–Zink, *De Rham–Witt cohomology for a proper and smooth
morphism*](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), Appendix A.1, printed pp.92–93;
§1.4 after (1.36), pp.26–27.) *Needs:* *Finite-length Witt operators and their identities*
(CR.4.4); SchemeAndStackFoundations §0.26 (the perfect-scheme comparison); Mathlib
`TruncatedWittVector` and scheme gluing.

**Checks.**

- For `X=Spec 𝔽_p` and `r=2`, `W₂X=Spec ℤ/p²`, agreeing with the perfect-scheme constructor.
- For `X=Spec 𝔽_p[t]`, which is not perfect, the open `t≠0` has ring
  `W_r(𝔽_p[t])[[t]⁻¹]≅W_r(𝔽_p[t,t⁻¹])`.
- For `X=Spec(ℤ/p²)`, which is not an `𝔽_p`-scheme, `W₁X=X` and `p^(2r)=0` in `W_r(ℤ/p²)`, whose
  projection to `ℤ/p²` has nilpotent kernel.
- For `X=Spec ℚ`, the ringed space `(|X|,W₂(O_X))` has one point and ring `ℚ×ℚ`, which is not local.
  It is not a scheme; local p-nilpotence cannot be omitted from this carrier description.

**Witt localization and étale descent.** (1) For a map A→R of Z_(p)-algebras and an étale R-algebra
S, the natural map W_r(S)⊗_(W_r(R))W_rΩ^*_(R/A)→W_rΩ^*_(S/A) is an isomorphism for every r≥1; it is
an isomorphism of differential graded algebras for the unique extension of the derivation to the
tensor product, which is not 1⊗d. In particular W_r(R_f)⊗_(W_r(R))W_rΩ^*_(R/A)≅W_rΩ^*_(R_f/A) for
f∈R. (2) If p^m·W_r(A)=0, then W_(m+r)(S)⊗_(W_(m+r)(R),F^m)W_rΩ^i_(R/A)≅W_rΩ^i_(S/A), and in this
description 1⊗d induces d. (3) For a saturated Dieudonné algebra A and s∈A⁰ with F(s)=s^p, the map
W_r(A)[s̄⁻¹]→W_r(A[s⁻¹]) is an isomorphism of differential graded algebras; hence for an F_p-algebra
R and s∈R, W_r(WsatΩ_R)[[s]⁻¹]≅W_r(WsatΩ_(R[1/s])), and WsatΩ_(R[1/s]) is the strict completion
W(WsatΩ_R[[s]⁻¹]); the localisation WsatΩ_R[[s]⁻¹] itself is in general not strict. For an étale map
R→S of F_p-algebras, W_r(WsatΩ_R)⊗_(W_r(R))W_r(S)≅W_r(WsatΩ_S) for every r. (4) Let X be a scheme
over a Z_(p)-algebra A, with p locally nilpotent on X. Use W_rX=`Crystalline.wittScheme r X`
of *Witt schemes on locally p-nilpotent schemes*, with its affine identifications and
length-one law. On its affine opens Spec W_r(R),
U↦W_rΩ^q_(O(U)/A) is a quasi-coherent sheaf on W_rX and a sheaf for the étale topology. For an F_p-scheme X,
U↦W_r(WsatΩ^q_(O(U))) and U↦WsatΩ^q_(O(U)) are sheaves for the Zariski and the étale topology on
affines, the former quasi-coherent over W_r(O_X), and the Zariski cohomology groups H^n(Spec
R,WsatΩ^q) vanish for n>0.

*Hypotheses.* p is a prime; r≥1. (1): A→R is a map of Z_(p)-algebras and R→S is étale; no nilpotence
or F-finiteness is assumed. (2): in addition p^m·W_r(A)=0, so p is nilpotent in A. (4): p is
locally nilpotent on X; without it (|X|,W_r(O_X)) need not be a locally ringed space. (3) and the
saturated part of (4): F_p-algebras and F_p-schemes.

*Proof sketch.* W_r(R)→W_r(S) is étale and W_r commutes with base change along étale maps (BMS1
Theorem 10.4). So the derivation of W_rΩ^*_(R/A) extends uniquely to W_r(S)⊗_(W_r(R))W_rΩ^*_(R/A),
and F, V extend by F(ξ⊗x)=F(ξ)⊗F(x) and V(ξ⊗x)=ξ⊗V(x), using
W_r(S)⊗_(W_r(R))P_r=W_(r+1)(S)⊗_(W_(r+1)(R))P_(r,[F]); the tensor tower is an F–V procomplex for S/A
(Langer–Zink §1.4). Initiality gives α:W_rΩ^*_(S/A)→W_r(S)⊗W_rΩ^*_(R/A) and a map β in the other
direction; β is surjective because both sides are quotients of
Ω^*_(W_r(S)/W_r(A))=W_r(S)⊗Ω^*_(W_r(R)/W_r(A)), and α∘β is the identity by uniqueness, so both are
isomorphisms (Langer–Zink Proposition 1.7; BMS1 Lemma 10.8). If p^m·W_r(A)=0 then p^m kills
W_rΩ^*_(R/A), its differential is linear over W_(m+r)(R) acting through F^m, and
W_(m+r)(S)⊗_(W_(m+r)(R),F^m)W_r(R)=W_r(S); this gives (2) (Langer–Zink, Remark after Proposition
1.7). Saturated case, localisation: V^r(s^(−n)·x)=s^(−n)·V^r(s^(n(p^r−1))·x) shows
(V^rA+dV^rA)[s⁻¹]=V^r(A[s⁻¹])+dV^r(A[s⁻¹]) (BLM Proposition 5.1.5), and the universal property
identifies W(A[[s]⁻¹]) with WsatΩ_(R[1/s]) (BLM Corollary 5.1.6). Saturated case, étale maps of
F_p-algebras, Witt vector inputs (BLM §5.4, Lemma 5.5.2, Example 5.5.3). For an étale map R→S of
F_p-algebras and n≥1: W_n(R)→W_n(S) is étale; W_n(S)⊗_(W_n(R))W_(n−1)(R)≅W_(n−1)(S) along
restriction; W_n(R″)⊗_(W_n(R))W_n(S)≅W_n(R″⊗_R S) for every ring map R→R″; and
W_n(R)⊗_(F^k,W_n(R))W_n(S)≅W_n(S) along the k-th power of the Witt vector Frobenius (Theorem 5.4.1,
proved in the source for F_p-algebras by induction on n: W_(n+1)(R)→W_n(R) is a square-zero
extension whose kernel V^nR≅R is an R-module through the n-th power of Frobenius, and R⊗_(φ^n,R)S≅S
because R→S is étale; Remark 5.4.2). Consequently, for a W_n(R)-module M, M_S=M⊗_(W_n(R))W_n(S) does
not depend on n and is exact in M; an additive map f:M→N into a W_n(S)-module with
f(F^k(x)·m)=F^l(x)·f(m) for x∈W(R) extends uniquely to a map M_S→N with the same property for
x∈W(S); and an exact sequence M→N→P of such semilinear maps stays exact after (−)_S (Proposition
5.4.7, Corollary 5.4.9, Remark 5.4.10). If p^k·M=0 and D:W_n(R)→M is a derivation, then
D∘F^k:W_(n+k)(R)→M vanishes (Lemma 5.5.2); so the differential of a commutative differential graded
algebra whose degree-0 part is a W_n(R)-algebra satisfies d(F^n(x)·m)=F^n(x)·dm for x∈W(R) (Example
5.5.3). Saturated case, étale maps, construction (BLM Proposition 5.3.2; proof of Theorem 5.3.4(1)
in §5.5). For a commutative differential graded algebra E and an étale E⁰-algebra T, the graded ring
E⊗_(E⁰)T has a unique differential extending that of E (because Ω¹_T≅T⊗_(E⁰)Ω¹_(E⁰)), and maps of
differential graded E-algebras from it to an E-algebra D correspond to E⁰-algebra maps T→D⁰. Let A
be a strict Dieudonné algebra, R′=A⁰/VA⁰, so that W_n(A)⁰≅W_n(R′) (*Universal saturated de Rham–Witt
complex*), and let S′ be an étale R′-algebra. Put B_n=W_n(A)⊗_(W_n(R′))W_n(S′) with this
differential, with restriction and F induced by those of W_n(A) and W_n(S′) (F is a map of graded
rings with dF=pFd, not a map of differential graded algebras), and with V the semilinear extension
of V:W_n(A)→W_(n+1)(A), which satisfies V(F(x)·m)=x·V(m). The tower (B_n)_n satisfies the eight
axioms of a strict Dieudonné tower (BLM Definition 2.6.1). Axioms (1)–(5) are formal: restriction is
surjective by right exactness of the tensor product, and dF=pFd, FV=p=VF and the commutation of
restriction, F and V hold because both sides are semilinear extensions of the same map of the tower
W_n(A), which are unique by step 5. Axioms (6)–(8) hold because the sequences
W_(n+1)(A)→W_n(A)→W_n(A)^(*+1)/p (F, then d), W_(n+1)(A)[p]→W_(n+1)(A)→W_n(A) (inclusion, then
restriction) and W_1(A)⊕W_1(A)^(*−1)→W_(n+1)(A)→W_n(A) ((V^n,dV^n), then restriction) of the tower
W_n(A) are exact (*Finite Frobenius lifting*, *Restriction kernel and p-torsion*, and the definition
of W_n) and, being sequences of semilinear maps, stay exact after (−)_(S′) by step 5. Hence B=lim_n
B_n is a strict Dieudonné algebra with W_n(B)≅B_n (*Strict Dieudonné towers*; BLM Proposition 2.6.5,
Proposition 2.9.1, Corollary 2.9.3); so B⁰=W(S′), B⁰/VB⁰=S′, and W_n(A)→W_n(B) is étale for every n.
Saturated case, étale maps, universal property and conclusion (BLM Proposition 5.5.1, Theorem
5.3.4(2), Corollary 5.3.5). Let C be a strict Dieudonné algebra with a map A→C and let g:S′→C⁰/VC⁰
be a map of R′-algebras. Since W_n(R′)→W_n(S′) is étale and W_n(C)⁰→C⁰/VC⁰ is surjective with
nilpotent kernel, g lifts uniquely to W_n(R′)-algebra maps W_n(S′)→W_n(C)⁰, which extend uniquely to
maps B_n→W_n(C) of differential graded W_n(A)-algebras by step 6; these commute with restriction and
with F (it is enough to compare on W_n(A) and on W_n(S′), which generate B_n as a graded ring; on
W_n(S′) the two maps to W_(n−1)(C)⁰ agree modulo a nilpotent ideal, hence agree), and their limit is
the unique map of Dieudonné algebras B→C over A inducing g. For A=WsatΩ_R and an étale R-algebra S
take S′=S⊗_R R′: then maps B→C correspond to ring maps S→C⁰/VC⁰, so B is WsatΩ_S, and
W_n(WsatΩ_R)⊗_(W_n(R))W_n(S)≅W_n(A)⊗_(W_n(R′))W_n(S′)=B_n≅W_n(WsatΩ_S), the first isomorphism by the
base-change statement of step 5. The carrier, Witt nilpotence and Teichmüller localization
belong to *Witt schemes on locally p-nilpotent schemes*, independently of the differential complexes.
Sheaf property: on affines the presheaves are S↦M⊗_(W_r(R))W_r(S)
for the W_r(R)-module M=W_rΩ^q; the Zariski sheaf property follows since the Teichmüller lifts [s_α]
of elements generating the unit ideal of R generate the unit ideal of W_r(R); when p is nilpotent,
S↦W_r(S) identifies the étale sites of R and W_r(R), which gives étale descent; cohomology vanishes
on affines at each level r and passes to the limit because restriction is surjective (BLM Theorem
5.2.2, Remark 5.2.3, Proposition 5.2.4, Theorem 5.3.7; Langer–Zink Proposition 1.9).
Bhatt–Morrow–Scholze Theorem 10.4 (for an étale A → B and r ≥ 1, W_r(A) → W_r(B) is étale and
`W_r(A′) ⊗_{W_r(A)} W_r(B) ≅ W_r(B ⊗_A A′)` for every A → A′, with no hypothesis on the rings) is part
of this target: reduce by the ghost map over ℤ[1/p] and by localisation to ℤ_(p)-algebras, where the
F-finite case is Langer–Zink Corollary A.18. ([Langer–Zink, *De Rham–Witt cohomology for a proper
and smooth morphism*](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §1.4, Propositions 1.7, 1.8,
the Remarks after them and Proposition 1.9, printed pp.23–27; [Bhatt–Morrow–Scholze, *Integral
p-adic Hodge theory*](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.1 Theorem
10.4 with proof and §10.3 Lemma 10.8 with proof, pp.81–82; [Bhatt–Lurie–Mathew, *Revisiting the de
Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §5.1 Propositions 5.1.4, 5.1.5,
Corollary 5.1.6, pp.55–57; §5.2 Theorem 5.2.2, Remark 5.2.3, Proposition 5.2.4, pp.57–59; §5.3
Definitions 5.3.1, 5.3.3, Proposition 5.3.2, Theorem 5.3.4, Corollary 5.3.5 with proof, Theorem
5.3.7 with proof, pp.59–61; [Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §5.4 Theorem 5.4.1 with its proof for
F_p-algebras, Remark 5.4.2, Definitions 5.4.3, 5.4.4, 5.4.8, Proposition 5.4.7, Corollary 5.4.9,
Remark 5.4.10, pp.61–64; [Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §5.5 Proposition 5.5.1 with proof, Lemma
5.5.2, Example 5.5.3 and the proof of Theorem 5.3.4, pp.65–68; the results on strict Dieudonné
towers it uses: §2.6 Definition 2.6.1, Propositions 2.6.2, 2.6.5, pp.21–23, and §2.9 Proposition
2.9.1, Corollary 2.9.3, pp.27–28.) *Needs:* *Initial relative de Rham–Witt complex*; *Universal
saturated de Rham–Witt complex*; *Strict completion and its adjunction*; *Finite Frobenius lifting*;
*Restriction kernel and p-torsion*; *Strict Dieudonné towers*;
*Witt schemes on locally p-nilpotent schemes*;
Mathlib `Algebra.Etale`.

**Checks.**

- For R=A[T]→S=A[T,T⁻¹]: W_rΩ^n_(S/A)=W_rΩ^n_(R/A)[[T]⁻¹].
- For an F_p-algebra R and s∈R: W_r(WsatΩ_(R[1/s]))=W_r(WsatΩ_R)[[s]⁻¹] for every r.
- For an F_p-algebra R: H⁰(Spec R,WsatΩ^q)=WsatΩ^q_R and H^n(Spec R,WsatΩ^q)=0 for n>0 (BLM
  Proposition 5.2.4).
- For X=Spec F_p, W_rX=`Crystalline.wittScheme r X`=Spec Z/p^r: one point with local ring
  W_r(F_p)=Z/p^r; at r=2 this is the same Spec Z/p² as the perfect-scheme constructor of
  SchemeAndStackFoundations §0.26. At r=1 its module sheaves are the ordinary relative forms.
- For `X=Spec 𝔽_p[t]`, which is smooth over `𝔽_p` but not perfect, the shared carrier has
  `W_r(𝔽_p[t])[[t]⁻¹]≅W_r(𝔽_p[t,t⁻¹])` on `t≠0`. For `X=Spec(ℤ/p²)`, which is not an
  `𝔽_p`-scheme, the same constructor applies and `W₁X=X`; the structure ring of `W_rX` is
  `W_r(ℤ/p²)`, with `p^(2r)=0` and nilpotent kernel of its projection to `ℤ/p²`.
- For A=Q and X=Spec Q, where p is invertible, the ghost map gives W₂(Q)≅Q×Q: the ringed space
  (|X|,W₂(O_X)) has one point and ring Q×Q, which is not local, so it is not a scheme, while
  Spec W₂(Q) has two points. Item (4) does not apply to X.

**Witt differential quotients and completion topologies.** Let A be a ring and r≥1. For an ideal I⊂A
put W_r(I)=ker(W_r(A)→W_r(A/I)) and let [I]⊂W_r(A) be the ideal generated by the Teichmüller lifts
[a], a∈I. (a) For every ideal I and s≥1: [I]^s⊂[I^s]⊂W_r(I^s) and [I]^s⊂W_r(I)^s⊂W_r(I^s). If I is
finitely generated with finite generating set Σ, then moreover W_r(I^(|Σ|·p^r·s))⊂⟨[a^s]:a∈Σ⟩⊂[I]^s;
so the five chains ⟨[a^s]:a∈Σ⟩, [I]^s, [I^s], W_r(I)^s, W_r(I^s) are intertwined. (b)
[p]^(2s)·W_r(A)⊂p^s·W_r(A), p^(rs)·W_r(A)⊂W_r(pA)^s and W_r(pA)^(p^r·s)⊂[p]^s·W_r(A); so the
[p]-adic, W_r(pA)-adic and p-adic topologies of W_r(A) coincide. (c) For a map A→R of Z_(p)-algebras
and an ideal I⊂R, the kernel of W_rΩ^*_(R/A)→W_rΩ^*_((R/I)/A) is the differential graded ideal
generated by W_r(I). If I is finitely generated by Σ, the chains ⟨[a^s]:a∈Σ⟩·W_rΩ^*_(R/A) and
ker(W_rΩ^*_(R/A)→W_rΩ^*_((R/I^s)/A)) are intertwined. (d) For a map A→R of Z_(p)-algebras and a
finitely generated ideal I⊂A, the pro-objects {W_rΩ^*_(R/A)⊗_(W_r(A))W_r(A)/[I^s]}_s and
{W_rΩ^*_((R/I^sR)/(A/I^s))}_s are isomorphic; in particular their inverse limits over s agree.

*Hypotheses.* p is a prime; r≥1; in (a) and (b) A is any commutative ring. In (c) and (d) A→R is a
map of Z_(p)-algebras; the intertwining statements require the ideal to be finitely generated. [I^s]
denotes the ideal of W_r(A) generated by the Teichmüller lifts of the elements of I^s.

*Proof sketch.* Every element of W_r(A) is uniquely Σ_(i<r)V^i[a_i]; W_r(I) consists of the elements
with all a_i∈I, and W_r(J₁+J₂)=W_r(J₁)+W_r(J₂). The inclusions ⟨[a^s]⟩⊂[I]^s⊂[I^s]⊂W_r(I^s) and
[I]^s⊂W_r(I)^s follow; W_r(I)^s⊂W_r(I^s) follows from V^i[a]·V^j[b]=p^j·V^i([a·b^(p^(i−j))]) for
i≥j, a consequence of V(x·F(y))=V(x)·y and FV=p (BMS1 Lemma 10.1; proof of Lemma 3.2). Conversely
I^(|Σ|·p^r·s)⊂⟨a^(p^r·s):a∈Σ⟩, W_r of the latter ideal is Σ_a W_r(a^(p^r·s)A), and
W_r(a^(p^r·s)A)⊂[a]^s·W_r(A) because V^i[f^(p^i)·c]=[f]·V^i[c] for i<r (BMS1 Lemma 10.1, Lemma
3.2(ii)). [p]∈V W_(r−1)(A)+p·W_r(A) and (V W_(r−1)(A))²⊂p·W_r(A) by the identity of step 1, so
[p]²∈p·W_r(A); p^r=0 in W_r(A/pA) because W_r(F_p)=Z/p^r, so p^r∈W_r(pA); the third inclusion is
step 2 for I=pA and Σ={p} (BMS1 Lemma 3.2(ii), Lemma 10.3). Let W′ be the differential graded ideal
of W_rΩ^*_(R/A) generated by W_r(I); its elements are sums of terms a₀·da₁⋯da_n with some
a_j∈W_r(I), and it is stable under R, F and V. The quotients form an F–V procomplex for (R/I)/A with
degree-zero part W_r(R/I), so the universal property gives a section of the surjection onto
W_rΩ^*_((R/I)/A), which is therefore an isomorphism (BMS1 Lemma 10.9(i)). By step 2, for each s
there is t with W_r(I^t)⊂⟨[a^s]:a∈Σ⟩; writing a factor of a generator of W′ for I^t as [a^s]·b and
using the Leibniz rule puts it in ⟨[a^(s−1)]:a∈Σ⟩·W_rΩ^* (BMS1 Lemma 10.9(ii)). For I⊂A apply this
to IR and use W_rΩ^*_((R/I^sR)/A)=W_rΩ^*_((R/I^sR)/(A/I^s)) (*Initial relative de Rham–Witt
complex*; BMS1 Corollary 10.10). ([Bhatt–Morrow–Scholze, *Integral p-adic Hodge
theory*](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.1 Lemma 10.3 with
proof, pp.80–81; §3.1 Lemma 3.2(ii) with proof, pp.19–20; [Bhatt–Morrow–Scholze, *Integral p-adic
Hodge theory*](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.1 Lemma 10.1
with proof, p.80; [Bhatt–Morrow–Scholze, *Integral p-adic Hodge
theory*](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.3 Lemma 10.9 with
proof and Corollary 10.10, pp.82–83.) *Needs:* *Initial relative de Rham–Witt complex*; Mathlib `WittVector.frobenius`, `WittVector.verschiebung`,
`WittVector.frobenius_verschiebung` and `WittVector.verschiebung_mul_frobenius`, as listed in
*Exact supplier contracts*; *Finite-length Witt operators and their identities*; Mathlib `TruncatedWittVector`; Mathlib
`WittVector.teichmuller`; Mathlib `WittVector.verschiebung`; Mathlib
`WittVector.frobenius_verschiebung`; Mathlib `WittVector.verschiebung_mul_frobenius`.

**Checks.**

- For r=1 the kernel of Ω^*_(R/A)→Ω^*_((R/I)/A) is the differential graded ideal generated by I,
  that is by I and dI.
- For I=0 the finite Witt differential quotient map is the identity, with zero kernel;
  completing along the zero ideal leaves every finite-length complex unchanged.
- For A=Z_(p) and r=2: [p]∉p·W_2(A) but [p]²∈p·W_2(A). In ghost components [p]=(p,p^p)=p·(1,p^(p−1))
  and (1,p^(p−1)) is not a ghost vector since p^(p−1)≢1 mod p, whereas
  [p]²=(p²,p^(2p))=p·(p,p^(2p−1)) and p^(2p−1)≡p^p mod p.

**Continuous relative de Rham–Witt complex.** For every map A→R of Z_(p)-algebras and r≥1, define
W_rΩ^(q,cont)_(R/A)=lim_s W_rΩ^q_((R/p^s)/(A/p^s))≅lim_s(W_rΩ^q_(R/A)/p^s). With the induced
differential, product, restriction, F and V, and with λ_r the limit of the maps W_r(R)→W_r(R/p^s),
the tower {W_rΩ^(*,cont)_(R/A)}_r is an F–V procomplex for R/A; hence it receives a unique map of
F–V procomplexes from {W_rΩ^*_(R/A)}_r. In each degree q and for each fixed r it is the p-adic
completion of W_rΩ^q_(R/A).

*Hypotheses.* p is a prime; A is a Z_(p)-algebra, R an A-algebra, r≥1; p need not be nilpotent in A.
The completion is with respect to the ideal pA; the limits are ordinary inverse limits of abelian
groups in each degree q.

The API:

- `Crystalline.continuousWitt_eval`: For q≥0, r≥1 and s≥1,
  ev_s:W_rΩ^(q,cont)_(R/A)→W_rΩ^q_((R/p^s)/(A/p^s)) is the projection. Its image coordinates satisfy
  res_(s+1,s)∘ev_(s+1)=ev_s, and a compatible family of coordinates defines exactly one element of
  the limit.
- `Crystalline.continuousWitt_map`: For ring maps a:A→A′ and b:R→R′ with b∘(A→R)=(A′→R′)∘a, the map
  b_*:W_rΩ^(q,cont)_(R/A)→W_rΩ^(q,cont)_(R′/A′) is induced by the maps modulo p^s and satisfies
  ev_s∘b_*=(b mod p^s)_*∘ev_s. Identity and composition agree coordinatewise.
- `Crystalline.continuousWitt_operators`: For r≥1, restriction and F map
  W_(r+1)Ω^(q,cont)→W_rΩ^(q,cont), V maps W_rΩ^(q,cont)→W_(r+1)Ω^(q,cont), and d maps degree q to
  q+1 at fixed r. Every ev_s intertwines these operators with the operator at base (R/p^s)/(A/p^s).
  Hence FV=p, FdV=d, d²=0 and dF=pFd hold with these domains.
- `Crystalline.continuousWitt_fromRelative`: The unique map of F–V procomplexes
  W_rΩ^*_(R/A)→W_rΩ^(*,cont)_(R/A); in each degree it is the map to the p-adic completion, and it is
  an isomorphism when p is nilpotent in A.

*Proof sketch.* By *Witt differential quotients and completion topologies* (d) for I=pA the
pro-objects {W_rΩ^q_(R/A)⊗_(W_r(A))W_r(A)/[p^sA]}_s and {W_rΩ^q_((R/p^s)/(A/p^s))}_s are isomorphic,
and by (b) the [p]-adic and p-adic topologies of W_r(A) agree; this gives the second description
(BMS1 Corollary 10.10, Lemma 10.3, Definition 10.11). d, the product, restriction, F and V are
compatible with the transition maps in s, being induced by the maps of procomplexes for
(R/p^(s+1))/(A/p^(s+1))→(R/p^s)/(A/p^s); so they pass to the limit and keep the identities FV=p,
FdV=d, V(F(x)·y)=x·V(y) and the Teichmüller identity. ([Bhatt–Morrow–Scholze, *Integral p-adic Hodge
theory*](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.3, Corollary 10.10,
Definition 10.11 and the two sentences after it, p.83.) *Needs:* *Witt differential quotients and
completion topologies*; *Relative Frobenius–Verschiebung procomplexes*; *Initial relative de
Rham–Witt complex*; Mathlib `AdicCompletion`.

**Checks.**

- `test_continuousWitt_p_nilpotent`: If p^N=0 on A and R, the defining tower is eventually constant
  and recovers W_rΩ_(R/A).
- `test_continuousWitt_identity`: For R=A the result has only degree0, the p-completion of W_r(A).
- `test_continuousWitt_length_one`: At r=1 it is the degreewise p-completed ordinary relative de Rham
  complex.
- For R=A only degree 0 remains: W_rΩ^(0,cont)_(A/A)=lim_s W_r(A)/p^s.

**Laurent Witt weights and the integral quasi-isomorphism.** For S=A[T₁^±1,…,T_d^±1], the basic Witt
expansion extends to all weights a∈p^(−r)Z^d, with a fixed total order ≼_a on the coordinate indices
refining the nondecreasing valuations v_p(a_i), including v_p(0)=∞, and resolving every tie.
Partition the ordered indices into consecutive intervals I₀,…,I_q, with I₀ possibly empty and the
others nonempty. Nonintegral blocks use V and dV; integral nonzero blocks use F^v d of the
corresponding divided-weight Teichmüller monomial; zero blocks use dlog of the product of their
coordinates, as in the three cases of BMS1 10.12. The coefficient module for weight a is
V^u(a)W_(r−u(a))(A), u(a)=max(−min_i v_p(a_i),0). The map τ:Ω^*_(W_r(A)[U^±1]/W_r(A))→W_rΩ^*_(S/A),
U_i↦[T_i], is injective and a quasi-isomorphism. Its image is exactly the integral-weight
subcomplex; the fractional-weight complement is acyclic. The image depends on these coordinates.

*Hypotheses.* p is a prime; A is an arbitrary Z_(p)-algebra; S=A[T₁^±1,…,T_d^±1]; r≥1. The expansion
describes W_rΩ^n_(S/A) as a direct sum of the W_r(A)-modules V^u(a)W_(r−u(a))(A) over weights a and
partitions; it is not a basis over W_r(S). Choose the same total order ≼_a for every occurrence of a
weight. Ordered blocks are consecutive intervals in this order; arbitrary ordered set partitions
would overcount the coefficient summands.

*Proof sketch.* Localize the polynomial expansion at [T_i] and take its increasing union; this
permits negative weights and introduces the zero-weight dlog blocks. Retain the fixed total order
refining the valuations and use only consecutive interval partitions, as in BMS1 §10.4, condition
(iii), p.83. Identify the image of τ with the integral-weight terms by the ordinary Laurent monomial
basis. On each fractional weight use its first nonintegral block to give the differential
contraction. This proves acyclicity and the quasi-isomorphism without assuming ghost injectivity for
a torsion base. ([Bhatt–Morrow–Scholze, *Integral p-adic Hodge
theory*](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.4: weights, the
partitions P_a, Cases 1–3, Theorem 10.12 with proof, the integral part, Theorem 10.13 with proof,
pp.83–85.) *Needs:* *Polynomial basic Witt differential expansion*; *Witt localization and étale
descent*; DerivedDeRhamCohomology Layer 2 (§2.12 *The ordinary algebraic de Rham complex*); Mathlib
`KaehlerDifferential.mvPolynomialBasis`; Mathlib `KaehlerDifferential.isLocalizedModule_map`.

**Checks.**

- For d=1 the weight-zero part of W_rΩ^*_(S/A) is W_r(A) in degree 0 and W_r(A)·dlog[T] in degree 1,
  the image under τ of W_r(A)⊕W_r(A)·dlog U.
- For d=1, r=2 and the weight a=1/p the summand is {V(x[T])} in degree 0 and {dV(x[T])} in degree 1,
  x∈W_1(A)=A, and d maps the first isomorphically onto the second; so this fractional summand is
  acyclic.

**Relative Witt forms over perfectoid bases.** For a homomorphism A→A′ of perfectoid rings, a smooth
A-algebra R with base change R′=R⊗_A A′, and r≥1: (i) the W_r(A)-modules W_rΩ^q_(R/A) and W_r(A′)
are Tor-independent for every q≥0; (ii) the canonical map
W_rΩ^*_(R/A)⊗_(W_r(A))W_r(A′)→W_rΩ^*_(R′/A′) is an isomorphism of differential graded
W_r(A′)-algebras.

*Hypotheses.* p is a prime; A and A′ are integral perfectoid rings (PerfectoidSpaces §P1.24, BMS1
Definition 3.5; this includes perfect F_p-algebras); A→A′ is any ring homomorphism. R is a smooth A-algebra; r≥1; q≥0.

*Proof sketch.* Both statements are local for the Zariski topology on Spec R, so assume there is an
étale map A[T₁^±1,…,T_d^±1]→R; then W_rΩ^n_(R/A)=W_r(R)⊗_(W_r(A[T^±1]))W_rΩ^n_(A[T^±1]/A) and
likewise over A′ (*Witt localization and étale descent* (1)). By *Laurent Witt weights and the
integral quasi-isomorphism*, W_rΩ^n_(A[T^±1]/A) is a direct sum of modules V^uW_(r−u)(A), compatibly
with A→A′. For perfectoid A→A′ and 1≤j≤r, W_j(A)⊗^L_(W_r(A))W_r(A′)≅W_j(A′), with W_j(A) a
W_r(A)-module through restriction or Frobenius (BMS1 Lemma 3.13), and V^jW_(r−j)(A)≅W_(r−j)(A) as
W_r(A)-modules through F^j (BMS1 Remark 3.19). So each summand is Tor-independent from W_r(A′) and
base changes to the corresponding summand over A′. W_r(R) is flat over W_r(A[T^±1]), being étale,
and W_r(A′[T^±1])⊗_(W_r(A[T^±1]))W_r(R)=W_r(R′) (BMS1 Theorem 10.4); this gives Tor-independence for
R and the chain of identifications proving (ii). ([Bhatt–Morrow–Scholze, *Integral p-adic Hodge
theory*](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf), §10.5, Proposition 10.14
with proof, p.85; inputs: §3 Lemma 3.13 (p.24), Remark 3.19 (p.26), §10.1 Theorem 10.4 (p.81).)
*Needs:* *Laurent Witt weights and the integral quasi-isomorphism*; *Witt localization and étale
descent*; *Finite Witt base change for integral perfectoid rings*.

**Checks.**

- For the ring of integers O of a perfectoid field with residue field k, A=O→A′=k and R=O[T^±1]:
  W_rΩ^n_(R/O)⊗_(W_r(O))W_r(k)≅W_rΩ^n_(k[T^±1]/k), with no higher Tor.
- For perfect F_p-algebras A→A′ and R=A[T]: each summand V^uW_(r−u)(A)≅W(A)/p^(r−u) satisfies
  W(A)/p^j⊗^L_(W(A)/p^r)W(A′)/p^r=W(A′)/p^j, since p is a nonzerodivisor on W(A) and W(A′).

**Structural properties of the classical complex on smooth F_p-algebras.** Let k be a perfect
F_p-algebra and R a smooth k-algebra (including k=F_p). Construct F on WΩ^*_R=lim_r W_rΩ^*_R and prove FV=VF=p, dF=pFd, injectivity of
p,F,V, the saturation identity d⁻¹(pWΩ^(q+1)_R)=F(WΩ^q_R), and
ker(WΩ^q_R→W_rΩ^q_R)=V^rWΩ^q_R+dV^rWΩ^(q−1)_R. Here q≥0, r≥1, and degree −1 is zero.
Consequently WΩ_R is a strict Dieudonné algebra and its finite Verschiebung quotients are
exactly the classical finite-length complexes. Establish the analogous sheaf identities, the
comparison lim_r W_rΩ^q≃Rlim_r W_rΩ^q on the Zariski site, and higher-cohomology vanishing for WΩ^q on smooth affine schemes over k.

*Hypotheses.* p is prime, k is a perfect commutative F_p-algebra and R is smooth over k.
The assertions about infinite operators are distinct from their finite-level counterparts.

The API:

- `Crystalline.classicalDRW_injective`: Multiplication by p and the infinite F and V are injective.
- `Crystalline.classicalDRW_saturated`: The displayed preimage under d equals the image of F.
- `Crystalline.classicalDRW_restriction_kernel`: The displayed sum is the kernel of restriction.
- `Crystalline.classicalDRW_strict`: The classical inverse limit is a strict Dieudonné algebra
  with the stated finite quotients.
- `Crystalline.classicalDRW_derived_limit`: Ordinary and derived limits of the finite Witt
  q-form sheaves agree, by the affine-basis comparison.

*Proof sketch.* Use the polynomial basic Witt differential expansions and étale descent to prove
the finite-level kernel formulas and Cartier descriptions, then pass to the inverse limit using
surjective restrictions. Injectivity of p,F,V follows from the finite-level kernel transitions;
the Cartier relation identifies d⁻¹(p^rWΩ) with F^rWΩ. Prove the infinite restriction-kernel
formula by the filtration argument of Illusie I.3.31, rather than assuming dV^rWΩ is closed.
The finite Witt sheaves have filtrations with quasi-coherent graded pieces, hence are acyclic
on the smooth affine basis; their restriction maps on affine sections are surjective. Derived
sections commute with Rlim (Stacks 0D6K). On each basis affine U the tower is therefore a
surjective tower of modules in degree zero, so the point-topos theorem gives
RΓ(U,Rlim_r W_rΩ^q)=lim_r Γ(U,W_rΩ^q)[0]. The ordinary sheaf limit has these same sections.
Affine-basis detection of cohomology sheaves identifies lim with Rlim and proves infinite affine
acyclicity. This target owns that local argument; no repleteness of the Zariski or crystalline
topos is assumed. The formulas then prove strictness.
([Illusie, *Complexe de de Rham–Witt et cohomologie
cristalline*](https://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), I.2.17–I.2.19,
pp.562–565; I.3.2–I.3.6, pp.568–570; I.3.21.1.5, p.579; I.3.31–I.3.32, pp.582–583;
[Illusie's errata](https://www.imo.universite-paris-saclay.fr/~luc.illusie/Errdrw2.pdf), entry
for p.579, and the corrected proof of I.3.21 in
[Illusie–Raynaud, *Les suites spectrales associées au complexe de de Rham–Witt*](https://www.numdam.org/item/PMIHES_1983__57__73_0.pdf),
II.1.3, p.125;
[Stacks, Lemma 21.23.2 (0D6K)](https://stacks.math.columbia.edu/tag/0D6K).)
*Needs:* *Classical de Rham–Witt complex as the initial V-pro-complex*; *Polynomial basic Witt
differential expansion*; *Witt localization and étale descent*; *Witt differential quotients and
completion topologies*; DerivedDeRhamCohomology Layer 3 (§3.6, Cartier);
SchemeAndStackFoundations Layer 2 (affine quasi-coherent acyclicity);
EnhancedDerivedSheaves E2:towers.1 (`derivedTowerLimit`) and §E2.2
(`IsReplete.derived_limits`, point topos for affine section modules).

**Checks.**

- For R=F_p, WΩ_R=Z_p[0], F=id, V=p, and the length-r kernel is p^rZ_p.
- For R=F_p[t], d[t] is nonzero, F(d[t])=[t]^(p−1)d[t] and FdV([t])=d[t];
  the dV^r summand is required in the differential restriction kernel.
- For R=F_p[ε]/ε², W(R) has nonzero Witt vectors killed by F; smoothness cannot be removed
  from the injectivity assertion. On F_p[t], dVWΩ⁰ is not generally closed, so the
  inverse-limit kernel formula needs its own argument.

**Classical and saturated de Rham–Witt comparison.** (1) Let R be a regular Noetherian F_p-algebra
and {W_rΩ^*_R}_r its classical de Rham–Witt complex (*Classical de Rham–Witt complex as the initial
V-pro-complex*). The tower {W_r(WsatΩ_R)}_r, with its Verschiebung maps and the map W(R)→WsatΩ_R⁰
lifting e:R→S_R, is an R-framed V-pro-complex, and the resulting maps γ_r:W_rΩ^*_R→W_r(WsatΩ_R) are
isomorphisms for all r≥0; hence γ:WΩ^*_R→WsatΩ_R is an isomorphism of differential graded algebras
compatible with V, restriction and the maps from W(R), and ν:Ω^*_R→W_1(WsatΩ_R) is an isomorphism.
(2) Let k be a perfect F_p-algebra and R a smooth k-algebra; then ν:Ω^*_R→W_1(WsatΩ_R) is an
isomorphism. (3) Let B be a p-torsion-free ring with a ring endomorphism φ, φ(x)≡x^p mod p, such
that B/pB is smooth over a perfect F_p-algebra. Then the p-completed de Rham complex Ω̂^*_B is a
Dieudonné complex of Cartier type, and the map μ:Ω̂^*_B→WsatΩ_(B/pB) of *Universal saturated de
Rham–Witt complex* is a quasi-isomorphism.

*Hypotheses.* p is a prime. (1): R is a regular Noetherian F_p-algebra, for example a smooth algebra
over a perfect field. (2): k is a perfect F_p-algebra, not necessarily Noetherian, and R is a smooth
k-algebra; Ω^*_R denotes absolute differentials, which equal Ω^*_(R/k). (3): B is p-torsion-free
with an endomorphism φ lifting the Frobenius of B/pB, and B/pB is smooth over a perfect F_p-algebra;
B need not be p-adically complete.

*Proof sketch.* Cartier: for A smooth over a perfect F_p-algebra k the Cartier map Ω^*_A→H^*(Ω^*_A),
x↦x^p, dy↦[y^(p−1)dy], is an isomorphism. This is DerivedDeRhamCohomology Layer 3 (§3.6 *The
classical smooth Cartier isomorphism*) for A over k, using Ω^*_(A/k)=Ω^*_A and that the Frobenius
twist of A over k is identified with A by the Frobenius of k (BLM Proposition 3.3.4, Theorem 3.3.6).
(3): first replace B by its p-adic completion B̂. For a p-torsion-free B, B̂ is p-torsion-free,
B̂/pⁿ≅B/pⁿ, and φ extends continuously; Ω̂^*_B≅Ω̂^*_(B̂) by the universal property of continuous
differentials. These completion facts are part of this target. Now use DerivedDeRhamCohomology Layer
2 (§2.27 *The de Rham algebra of a completely smooth formal algebra*) for B̂: Ω̂ is p-torsion-free,
Ω̂/p=Ω^*_(B/pB), and its divided Frobenius induces Cartier modulo p (BLM Remark 3.3.3, Example 3.3.5
and Corollary 3.3.8). The strict-completion theorem makes Ω̂→W(Sat Ω̂) a quasi-isomorphism, and
saturated-de-rham-witt identifies the target with WsatΩ_(B/pB) (BLM Theorem 4.2.4). (2): choose a
p-torsion-free, p-adically complete lift B of R with a Frobenius lift (lift R to W_n(k) for each n).
Then ν is the composite Ω^*_R≅Ω̂^*_B/p→WsatΩ_R/p→W_1(WsatΩ_R); in the square formed with the Cartier
isomorphism, the isomorphism H^*(Ω̂^*_B/p)≅H^*(WsatΩ_R/p) of step 2 and the isomorphism
W_1(M)≅H^*(M/pM) induced by F for saturated M, ν is an isomorphism (BLM Proposition 4.3.2). Filtered
colimits: strict Dieudonné algebras have filtered colimits, computed as the completion of the
colimit of saturated ones, and W_r commutes with them; so R↦W_r(WsatΩ_R) commutes with filtered
colimits (BLM Proposition 4.3.3, Corollary 4.3.5). A regular Noetherian F_p-algebra is a filtered
colimit of smooth F_p-algebras by SchemeAndStackFoundations §0.15, so step 3 gives that ν is an
isomorphism for regular Noetherian R (BLM Theorem 4.3.1). (1), the map: for a strict Dieudonné algebra A with a ring map
R→A⁰/VA⁰, the tower {W_r(A)}_r with V and the lift β:W(R)→A⁰ is an R-framed V-pro-complex; axioms
(c)–(e) are checked after applying the injective map F, for example
F((Vx)·dβ[λ])=x·dβ([λ]^p)=F(V(x·β[λ]^(p−1)·dβ[λ])). Initiality of the classical complex gives γ (BLM
Proposition 4.4.10, Corollary 4.4.11). (1), isomorphism: R↦W_rΩ^*_R (Illusie I.1.10) and
R↦W_r(WsatΩ_R) commute with filtered colimits, so the supplied Popescu presentation reduces to
R smooth over F_p. By *Classical de Rham–Witt complex as the initial V-pro-complex* the classical complex is Illusie's pro-complex,
and Illusie's results on the sheaves WΩ^i_X, X=Spec R, give the following for R on global sections,
because H^j(X,WΩ^i_X)=0 for j>0 and p, F, V are injective on WΩ^i_X. (i) WΩ^*_R=lim_r W_rΩ^*_R
carries an endomorphism F of graded rings with FV=VF=p, dF=pFd and F(x)≡x^p mod p on W(R) (Illusie
I.2.17, I.2.18, I.2.19 and (0.1.4.8)); so it is a Dieudonné algebra. (ii) WΩ^*_R is p-torsion-free
(Illusie, Corollaire I.3.6) and d⁻¹(p·WΩ^(i+1)_R)=F(WΩ^i_R) (Illusie, Remarques I.3.21.1, formula
(3.21.1.5) with n=1); so it is saturated. (iii) ker(WΩ^*_R→W_rΩ^*_R)=V^r(WΩ^*_R)+dV^r(WΩ^(*−1)_R)
(Illusie, Proposition I.3.31; Proposition I.3.2 is the same statement for W_mΩ^*_R with m finite,
and the limit is not formal because dV^r(WΩ^(i−1)_X) is not closed in general, Illusie I.3.32); on
global sections one uses that the kernel of dV^r:WΩ^(i−1)_X→WΩ^i_X/V^r(WΩ^i_X) is F^r(WΩ^(i−1)_X),
by (3.21.1.5). Hence WΩ^*_R is a strict Dieudonné algebra with W_r(WΩ^*_R)=W_rΩ^*_R. γ commutes with
F because V is injective on WsatΩ_R and Vγ(Fx)=γ(VFx)=γ(px)=VFγ(x). Hence γ_r=W_r(γ) is an
isomorphism for all r as soon as it is one for r=1 (*The finite quotients compute cohomology modulo
p^r* (3), BLM Corollary 2.7.4), and γ_1 is ν of step 4 since W_1Ω^*_R=Ω^*_R (BLM Theorem 4.4.12).
Langer–Zink complex: {W_r(WsatΩ_R)}_r is also an F–V procomplex for R/F_p (FV=p, FdV=d and the
projection formula hold in WsatΩ_R, and Fd[x]=[x]^(p−1)d[x] because WsatΩ_R is p-torsion-free), so
there are maps W_rΩ^*_(R/F_p)→W_r(WsatΩ_R). Their composite with the surjection
W_rΩ^*_R→W_rΩ^*_(R/F_p) of *Classical de Rham–Witt complex as the initial V-pro-complex* is a
morphism of R-framed V-pro-complexes, hence equals γ_r; as γ_r is injective, the surjection is an
isomorphism. The smooth classical-complex identities are proved in *Structural properties
of the classical complex on smooth F_p-algebras*. For regular Noetherian R, prove locally that
F_p→R is a regular map: R is flat over F_p, and perfectness of F_p makes its regular fibre
geometrically regular, since finite field extensions are separable and preserve regularity by
étale base change. Apply `popescu_desingularization` from SchemeAndStackFoundations §0.15 to
obtain the filtered presentation by smooth algebras ([Stacks, Theorem 16.12.1 (07GC)](https://stacks.math.columbia.edu/tag/07GC)).
The local work is this specialization and filtered-colimit compatibility of the Witt and
crystalline comparisons. The passage to the p-adic completion B̂ of a p-torsion-free B (B̂ p-torsion-free, B̂/pⁿ ≅ B/pⁿ, extension of a
Frobenius lift, comparison of degreewise p-completed de Rham complexes) is part of this target.
([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3),
arXiv v3, §3.3 (Remark 3.3.3, Proposition 3.3.4, Example 3.3.5, Theorem 3.3.6, Corollary 3.3.8),
pp.34–35; §4.3 (Theorem 4.3.1, Proposition 4.3.3, Corollary 4.3.5), pp.46–48; §4.4 (Proposition
4.4.10, Corollary 4.4.11, Theorem 4.4.12 with proof), pp.51–53; [Shiho, *On logarithmic Hodge–Witt
cohomology of regular schemes*](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms140404.pdf), §2, Theorem
2.1 (Popescu) and Theorem 2.2 (Grothendieck's limit theorem), p.572; [Bhatt–Lurie–Mathew,
*Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §4.2,
Corollary 4.2.3 and Theorem 4.2.4, p.45; [Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §4.3, Proposition 4.3.2 with proof,
pp.46–47; [Illusie, *Complexe de de Rham–Witt et cohomologie
cristalline*](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part I, §3 (X smooth over a
perfect scheme): Proposition 3.2 (p. 568), Proposition 3.31 (p. 582) with its proof and Remarque
3.32 (p. 583); [Illusie, *Complexe de de Rham–Witt et cohomologie
cristalline*](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part I, §3: Corollaire 3.6
(p. 570), Proposition 3.21 and Remarques 3.21.1, formula (3.21.1.5) (p. 579); [Illusie, *Complexe de
de Rham–Witt et cohomologie cristalline*](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf),
Part I, §2 E: Théorème 2.17, Proposition 2.18 and 2.19 ((2.19.1)–(2.19.6)), printed pp. 562–565;
Part 0, (1.4.8), printed p. 511.) *Needs:* *Structural properties of the classical complex
on smooth F_p-algebras*; *Universal saturated de Rham–Witt complex*; *Classical de
Rham–Witt complex as the initial V-pro-complex*; *Initial relative de Rham–Witt complex*; *Strict
completion and its adjunction*; *Cartier criterion for saturation*; DerivedDeRhamCohomology Layer 3
(§3.6 *The classical smooth Cartier isomorphism*); DerivedDeRhamCohomology Layer 3 (§3.4 *The
polynomial Cartier map*); DerivedDeRhamCohomology Layer 2 (§2.12 *The ordinary algebraic de Rham
complex*); DerivedDeRhamCohomology Layer 2 (§2.27 *The de Rham algebra of a completely smooth formal
algebra*); *The finite quotients compute cohomology modulo p^r*; *Dieudonné algebras and
multiplicative quotients*; SchemeAndStackFoundations §0.15 (`popescu_desingularization`) and
§0.21 (regular maps and geometrically regular fibres).

**Checks.**

- For R=F_p[[t]], the map F_p→R is regular and the supplied filtered presentation by smooth algebras gives
  the same finite-length Witt comparison, although R is not of finite type over F_p.
- For a perfect field k: W_rΩ^*_k=W_r(k)=W_r(WsatΩ_k), concentrated in degree 0, and γ_r is the
  identity.
- For R=F_p[t] (smooth over F_p): W_1(WsatΩ_R)=Ω^*_R, so d[t] has nonzero image dt, and
  Ω̂^*_(Z_p[t])→WsatΩ_R (φ(t)=t^p) is a quasi-isomorphism.
- Outside the regular case γ is not an isomorphism: for R=F_p[ε]/ε², [ε]≠0 in W_rΩ⁰_R=W_r(R) while
  WsatΩ_R=Z_p; for the cusp R=F_p[t²,t³], W_1Ω²_R=Ω²_R≠0 while WsatΩ²_R=0 (BLM Proposition 6.3.1).

The generic ring-theoretic interface is supplied by DiamondsAndVStacks D6.9, in namespace
`DiamondsAndVStacks`. Use `IsSeminormalRing`, with convention `x³ = y²`, `x = t²`, `y = t³`
and a unique root (Stacks 0EUL), and `IsSubintegral` for ring maps inducing a universal
homeomorphism and residue-field isomorphisms. Use `snRing R` for `R^sn` and
`snMap R : R →+* snRing R` for its subintegral unit. The supplied `snRing_seminormal`,
`sn_lift` and `sn_compare` give seminormality, the reflection property and its uniqueness;
`subintegral_lift` and `subintegral_bijective_of_seminormal` supply extension and rigidity
for subintegral maps. For an `F_p`-algebra `R`, the structure map of `R^sn` is the composite
`F_p → R → R^sn`.

**Degree zero of the saturated complex and seminormalisation.** For every commutative
F_p-algebra R, identify S_R=WsatΩ_R⁰/V WsatΩ_R⁰ with the supplied seminormal reflection `R^sn` by an
`F_p`-algebra isomorphism carrying `e_R : R → S_R` to `DiamondsAndVStacks.snMap R`.

Consequently e_R is an isomorphism if and only if R is seminormal; a homomorphism R→R′ inducing an
isomorphism of seminormalisations induces an isomorphism WsatΩ_R≅WsatΩ_(R′); and the adjunction
between F_p-algebras and strict Dieudonné algebras restricts to an equivalence between seminormal
F_p-algebras and those strict Dieudonné algebras A for which WsatΩ_(A⁰/VA⁰)→A is an isomorphism.

*Hypotheses.* p is a prime; R is any commutative F_p-algebra. Seminormality means
the supplied `IsSeminormalRing`, with the unique-root convention fixed above.

*Proof sketch.* S_R is seminormal (*Universal saturated de Rham–Witt complex*). Using the supplied
`sn_lift`, if R→R′ induces an isomorphism of seminormalisations,
then Hom(R′,A⁰/VA⁰)→Hom(R,A⁰/VA⁰) is bijective for every strict
A, so WsatΩ_R≅WsatΩ_(R′) (BLM Corollary 6.5.2). Hence one may replace R by R^sn and assume R
seminormal, in particular reduced. Write Ψ(R)=S_R. Ψ commutes with filtered colimits and Ψ(R)=R for
R smooth over a perfect F_p-algebra (*Classical and saturated de Rham–Witt comparison* (2); BLM
Remarks 6.6.2, 6.6.3). The Frobenius of R induces the Frobenius of Ψ(R), because x↦p^nF(x) on
WsatΩ^n_R is a map of Dieudonné algebras inducing it; so R→Ψ(R) becomes an isomorphism on
perfections (BLM Lemma 6.6.4, Corollary 6.6.5). Two R-algebra maps from Ψ(R) to a reduced ring
agree; every homomorphism from R to a field k factors uniquely through Ψ(R), since a field is a
filtered colimit of smooth F_p-algebras; for R reduced and finitely generated Ψ(R) embeds in the
normalisation of R, using that the localisations of the normalisation at height-one primes are
regular, hence filtered colimits of smooth F_p-algebras. It follows that R→Ψ(R) is integral (BLM
Corollary 6.6.6, Propositions 6.6.7, 6.6.8, Corollary 6.6.9). For seminormal R the map R→Ψ(R) is
therefore injective and integral, and the bijections on k-points for every field k give both a
universal homeomorphism and isomorphisms on residue fields. Thus the map is subintegral and
Ψ(R) is reduced. Apply DiamondsAndVStacks D6.9's `subintegral_bijective_of_seminormal`
with the seminormal source R and reduced target Ψ(R). This is the rigidity criterion of
Stacks 0H3G and gives R=Ψ(R) (BLM, proof of Theorem 6.5.3). For arbitrary R, replacement
R→R^sn above, `snRing_seminormal` and `sn_compare` identify Ψ(R) with the supplied reflection
compatibly with its unit;
the restricted Dieudonné equivalence follows from the unit and counit (BLM Remark 6.5.4).
Popescu's theorem for discrete valuation rings of characteristic p
(Bhatt–Lurie–Mathew, Proposition 6.6.8) is part of the local comparison target.
([Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3),
arXiv v3, §6.5, Proposition 6.5.1, Corollary 6.5.2, Theorem 6.5.3, Remark 6.5.4, pp.74–75; §6.6
(Notation 6.6.1 to the proof of Theorem 6.5.3), pp.76–78.) *Needs:* *Universal saturated de
Rham–Witt complex*; *Classical and saturated de Rham–Witt comparison*;
DiamondsAndVStacks D6.9 (`IsSeminormalRing`, `IsSubintegral`, `subintegral_lift`,
`subintegral_bijective_of_seminormal`, `snRing`, `snMap`, `snRing_seminormal`, `sn_lift`,
`sn_compare`; Stacks [0EUL](https://stacks.math.columbia.edu/tag/0EUL),
[0EUR](https://stacks.math.columbia.edu/tag/0EUR),
[0H3G](https://stacks.math.columbia.edu/tag/0H3G)).

The local comparison includes `Crystalline.cuspSeminormalComparison`: for every prime p, the
`F_p`-algebra isomorphism `DiamondsAndVStacks.snRing(F_p[t²,t³]) ≅ F_p[t]` carrying
`DiamondsAndVStacks.snMap` to the inclusion.
Identify `F_p[X,Y]/(Y²−X³)` with the subring `F_p[t²,t³]` by `X ↦ t²`, `Y ↦ t³`:
its monomials reduce uniquely to `X^a` and `X^aY`, whose images have distinct exponents in t.
The inclusion into F_p[t] is integral, since t satisfies a monic quadratic over the
subring. For every field k, a cusp point `(x,y)` with `x³=y²` has the unique parameter
`a=y/x` when `x≠0` and `a=0` when `x=0`. Thus the inclusion induces a bijection on
k-valued points for every field k and is subintegral, in the supplied `IsSubintegral`
sense. The normal domain F_p[t] is seminormal: for `x≠0` the fraction `y/x` with square x
and cube y is integral and belongs to F_p[t]; the zero case and uniqueness use reducedness.
The supplied `subintegral_lift` makes this inclusion a reflection into seminormal rings;
`sn_compare` identifies it with `snMap`, compatibly with the inclusion (Stacks 0EUR).
This argument applies in characteristics 2 and 3 without division by either prime.

**Checks.**

- For the cusp `R = F_p[t²,t³]`: `S_R = F_p[t]`, the seminormalisation of R, for every prime
  p, including 2 and 3. The common root t is absent from R, so reduction alone leaves R unchanged
  and cannot give this comparison; root uniqueness requires no division by 2 or 3.
- For `R = F_p[ε]/ε²`: `S_R = F_p`, and the reflection unit is the quotient killing ε.
  Thus the source need not be reduced.
- For a regular Noetherian F_p-algebra R (seminormal, being normal): R→S_R is an isomorphism, in
  agreement with Ω⁰_R≅W_1(WsatΩ_R)⁰.
- The inclusion `F_p(u^p) → F_p(u)` is an integral universal homeomorphism but has a proper
  purely inseparable residue-field extension. It is excluded from the subintegral argument;
  both fields are already seminormal, and this inclusion is not their reflection unit.
- The map `F_p → F_p[ε]/ε²` is subintegral but not an isomorphism. Reducedness of the target
  in the rigidity argument is necessary.

### CR.4.7 The crystalline comparison, Frobenius, slopes and the Nygaard filtration

**Finite and infinite crystalline de Rham–Witt comparison.** (a) Let A be a ring in which p is
nilpotent and X a smooth A-scheme. For each r≥1 there is an isomorphism
Ru_(r*)O_(X/W_r(A))≅W_rΩ^*_(X/A) in D⁺(X_Zar,W_r(A)), functorial in X, where
u_r:(X/W_r(A))_crys→X_Zar and the crystalline site is formed with respect to the canonical divided
powers on the kernel V W_(r−1)(A) of the projection w₀:W_r(A)→A. (b) More generally, for a
quasi-coherent crystal E of flat modules on (X/W_r(A))_crys, Ru_(r*)E is represented by
E_r⊗_(W_r(O_X))W_rΩ^*_(X/A), where E_r is the value of E on the PD thickening X→W_r(X) and the
differential is induced by the connection of the crystal. (c) For X smooth over a perfect field k
(the case A=k), these isomorphisms are compatible in r and give Ru_*O_(X/W(k))≅Rlim_r
W_rΩ^*_(X/k)≅WΩ^*_(X/k), and the corresponding isomorphisms on RΓ(X,−); here lim_r W_rΩ^q=Rlim_r
W_rΩ^q because the restriction maps are surjective on affine opens.

*Hypotheses.* p is a prime. (a), (b): p is nilpotent in A and X is a smooth A-scheme; nilpotence of
p is a hypothesis of the comparison, not of the complex W_rΩ^*_(X/A). (b): E is a quasi-coherent
crystal of flat O_(X/W_r(A))-modules. (c): k is a perfect field and X is a smooth k-scheme;
W_rΩ^*_(X/k) is the Langer–Zink complex relative to k.

*Proof sketch.* Local lifts: Zariski-locally X=Spec B with B étale over A[T₁,…,T_d]; A_r=W_r(A)[T]
with T_i↦T_i^p is a Frobenius lift with δ_r:A_r→W_r(A[T]), T_i↦[T_i], and it extends uniquely to an
étale B_r with δ_r:B_r→W_r(B) (Langer–Zink Proposition 3.2). For an embedding of X into a smooth
scheme Y with a Witt lift (Y_r,Δ_r), the comparison morphism is the composite from the de Rham
complex of the PD envelope of X in Y_r to W_r(O_X)⊗Ω^*_(W_r(Y)/W_r(A)) and on to W_rΩ^*_(X/A); it is
independent of the embedding (compare through products) and is defined globally by simplicial
methods (Langer–Zink §3.2, (3.4)–(3.7)). For X=Spec B as above the source of the comparison is
Ω^*_(B_r/W_r(A)) (*Crystalline cohomology from an embedding* (Layer CR.2)). By *Witt localization
and étale descent* (2), with p^m·W_r(A)=0, both sides for B are obtained from those for the
polynomial algebra by the flat base change B_(m+r)⊗_(A_(m+r),φ^m)−, compatibly with d; so assume
B=A[T]. Then W_rΩ^*_(B/A)=C_int⊕C_frac (integral and non-integral weights, *Polynomial basic Witt
differential expansion*), the comparison maps Ω^*_(A_r/W_r(A)) isomorphically onto C_int, and C_frac
is acyclic by the formula for d on basic forms (Langer–Zink Proposition 2.6). This proves (a)
(Langer–Zink Theorem 3.5). (b): the connection on E_r is obtained from the crystal on the thickening
W_r(B)⊕Ω; the comparison map is a quasi-isomorphism by reduction to the structure sheaf, using
Grothendieck's linearisation of differential operators and the flatness of E (Langer–Zink Theorem
3.8, Lemma 3.9). (c): the local lifts are compatible in r, so the comparison maps are; pass to the
derived limit. On the de Rham–Witt side the derived limit is the ordinary limit because restriction
is surjective on affine opens (*Initial relative de Rham–Witt complex*). Where a tower of complexes
is replaced by one with projective terms and surjective transition maps, the replacement is an
isomorphism in the derived category of towers, and a surjective quasi-isomorphism only when the
original tower has surjective transition maps (Berthelot–Ogus erratum, (B2.1), (B2.1a)).
([Langer–Zink, *De Rham–Witt cohomology for a proper and smooth
morphism*](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §3.1 (Theorem 3.1, Proposition 3.2,
Definition 3.3, Proposition 3.4), §3.2 ((3.4)–(3.7)), §3.3 Theorem 3.5 with proof, printed pp.67–75;
§3.5 Theorem 3.8 and Lemma 3.9, printed pp.82–90; [Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §10.1, Theorem 10.1.1 (quoted from Illusie,
Théorème II.1.4) and Theorem 10.1.2, p.128; [Berthelot–Ogus, corrigendum to Appendix B of *Notes on
crystalline cohomology*](https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf), both pages:
the replacement text for assertion (B2.1) of Appendix B of Berthelot–Ogus and the new statement
(B2.1a) with its proof; [Illusie, *Complexe de de Rham–Witt et cohomologie
cristalline*](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part II, introduction (p.
598) and §1: 1.1 ((1.1.1)), Proposition 1.2 (a)–(c) ((1.2.1)–(1.2.4)), 1.3 ((1.3.1)–(1.3.3)),
Théorème 1.4 with its proof, printed pp. 600–607; Proposition 2.1 (a), Théorème 2.7 and Scholie 2.8,
printed pp. 607–611.) *Needs:* *Initial relative de Rham–Witt complex*; *Canonical divided powers on
the Verschiebung ideal of W_r(R)*; *Polynomial basic Witt differential expansion*; *Witt
localization and étale descent*; *Classical and saturated de Rham–Witt comparison*; *Crystalline
cohomology from an embedding* (Layer CR.2); *Crystalline linearization along a smooth embedding*
(Layer CR.2); *Enhanced crystalline direct image and global sections* (Layer CR.2); AdicSpacesPartIII
F0.6 (*Cohomology of an inverse limit of sheaves*); EnhancedDerivedSheaves Layer E2.

**Checks.**

- For X=Spec k, k a perfect field: both sides are W_r(k) in degree 0.
- For A=Z/p^n and X=Spec A[T]: W_rΩ^*_(A[T]/A)=C_int⊕C_frac with C_int≅Ω^*_(W_r(A)[T]/W_r(A)) and
  C_frac acyclic, so both sides compute the de Rham cohomology of W_r(Z/p^n)[T] over W_r(Z/p^n).

**Graded and crystalline Frobenius conventions.** In every F–V procomplex dF=pFd, so the graded
Frobenius F is in general not a map of complexes. Let p be nilpotent in A and X a smooth A-scheme.
The absolute Frobenius 𝐅:W_rΩ^q_(X/A)→W_(r−1)Ω^q_(X/A), 𝐅=p^q·F, is a map of complexes, semilinear
over F:W_r(A)→W_(r−1)(A); it is the map induced on de Rham–Witt complexes by
F:W_r(O_X)→W_(r−1)(O_X). The crystalline complexes carry an absolute Frobenius
𝐅:Ru_(r*)O_(X/W_r(A))→Ru_((r−1)*)O_(X/W_(r−1)(A)), induced by the absolute Frobenius of X₀=X⊗F_p and
the PD morphism Spec W_(r−1)(A)→Spec W_r(A) given by F, for the divided powers extended to the
kernel of W_r(A)→A/pA. The comparison isomorphisms of *Finite and infinite crystalline de Rham–Witt
comparison* at levels r and r−1 intertwine the two maps 𝐅. For X smooth over a perfect field k, the
limit over r is the endomorphism φ=p^q·F of the complex WΩ^*_(X/k), and it corresponds to the
crystalline Frobenius of Ru_*O_(X/W(k)).

*Hypotheses.* p is a prime; p is nilpotent in A; X is a smooth A-scheme; r≥2. For the last sentence
k is a perfect field and X is smooth over k. In degree q=0 the scaling factor is 1.

*Proof sketch.* d(p^q·F(x))=p^q·p·F(dx)=p^(q+1)·F(dx), so 𝐅 commutes with d; it is the map induced
by functoriality of differential forms from the square formed by F on W_r(O_X) and F on W_r(A),
because d(Fξ)=p·F(dξ) (Langer–Zink (3.15)–(3.16)). Reduce by the simplicial construction to X
embedded in a smooth affine Y with a Frobenius lift Φ_r:Y_(r−1)→Y_r (Langer–Zink Proposition 3.2).
The crystalline 𝐅 is then represented by the map of PD-envelope de Rham complexes induced by Φ_r,
and the square with the comparison maps commutes because the maps Δ_r of the Frobenius lift
intertwine Φ with F on Witt vectors (Langer–Zink (3.17)–(3.20), Proposition 3.6). For X smooth over
a perfect field pass to the limit over r: φ=p^q·F on WΩ^q_(X/k). Three facts are part of this
target: the divided powers of *Canonical divided powers on the Verschiebung ideal of W_r(R)* extend
to the kernel `V W_{r−1}(A) + p·W_r(A)` of W_r(A) → A/pA; `F : W_r(A) → W_{r−1}(A)` is a PD morphism for
these ideals (F(γ_n(Vξ)) = (pⁿ/n!)ξⁿ = γ_n(pξ) lies in `pW_{r−1}(A)`); and Ru_*O for X over
`(W_r(A), VW_{r−1}(A))` agrees with that over X ⊗ 𝔽_p. ([Langer–Zink, *De Rham–Witt cohomology for a proper and
smooth morphism*](https://www.math.uni-bielefeld.de/~zink/dRW.pdf), §3.3, diagrams (3.15)–(3.18) and
Proposition 3.6 with (3.19)–(3.20), printed pp.75–77; [Bhatt–Morrow–Scholze, *Topological Hochschild
homology and integral p-adic Hodge
theory*](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §8.1, paragraph after
Definition 8.1 (before Lemma 8.2), p.266; [Illusie, *Complexe de de Rham–Witt et cohomologie
cristalline*](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part I, introduction (p.
542); §2 E: Proposition 2.18 ((2.18.2), (2.18.7)) and 2.19 (the sentence after (2.19.6)), printed
pp. 564–565; [Illusie, *Complexe de de Rham–Witt et cohomologie
cristalline*](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part II: Proposition 1.2 (b),
square (1.2.3), printed p. 603; Scholie 2.8, (2.8.4), printed pp. 610–611.) *Needs:* *Relative
Frobenius–Verschiebung procomplexes*; *Finite and infinite crystalline de Rham–Witt comparison*;
*Semilinear crystalline Frobenius and linearization* (Layer CR.3).

**Checks.**

- For k[t], F(d[t])=[t]^(p−1)d[t] but φ(d[t])=p[t]^(p−1)d[t].
- For dlog[t], F fixes the form and φ multiplies it by p.

**Slope decomposition on the existing isocrystal carrier.** Let k be a perfect field of
characteristic p and V a finite-dimensional Mathlib WittVector.Isocrystal over
K=FractionRing(WittVector p k). For a reduced rational λ=a/b, b>0, define the standard block over an
algebraic closure of k by F(e_i)=e_(i+1) for i<b and F(e_b)=p^a e_1, with σ on coefficients. V is
isoclinic of slope λ if its scalar extension is a sum of these blocks. There is a canonical finite
direct-sum decomposition V=⊕_λ V_λ into isoclinic subisocrystals. Hom(V_λ,V_μ)=0 for λ≠μ. Over
algebraically closed k the standard blocks are exactly the simple objects. Over a finite field
F_(p^r), the slopes are v_p of eigenvalues of the K-linear F^r divided by r, with multiplicities.

*Hypotheses.* p prime; k perfect; V finite-dimensional. Semisimplicity and classification by simple
standard blocks are asserted only over algebraically closed k.

*Proof sketch.* The carrier, Frobenius-semilinear equivalences and equivariant morphisms are already
in Mathlib. Construct the cyclic standard blocks and use the Dieudonné–Manin classification after
extending k to an algebraic closure; the full classification is an explicit missing proof input
below. The different-slope Hom groups vanish: iterate Frobenius over a common denominator and use
its p-adic valuation scaling to show a nonzero equivariant map cannot connect two different slopes.
Thus the isoclinic summands are canonical. Their uniqueness makes them invariant under descent,
giving the decomposition over perfect k. For k finite, σ^r=id, so F^r is linear. Its eigenvalue
valuations on a standard slope block equal rλ, giving the stated convention and the Newton-polygon
computation. Mathlib proves only the rank-one classification
(`WittVector.isocrystal_classification`). The full classification over an algebraically closed field
(cyclic vectors and lattices), the vanishing of equivariant maps between different slopes, descent
of the isoclinic summands to a perfect field and agreement with the valuations of F^r over finite
fields are part of this target. ([Lurie, *Lecture 26:
Isocrystals*](https://www.math.ias.edu/~lurie/205notes/Lecture26-Isocrystals.pdf), Example 5 and
Theorem 6, p.2; Definition 12 and Remark 14, p.3; [Illusie, *Complexe de de Rham–Witt et cohomologie
cristalline*](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Chapter II, §3, Théorème 3.2
and Corollaire 3.5, pp.614–616.) *Needs:* Mathlib `WittVector.frobenius` and `WittVector.frobeniusEquiv`,
as listed in *Exact supplier contracts*; Mathlib `WittVector.Isocrystal`.

**Checks.**

- A rank-one standard block with F=p^aσ has slope a.
- For F_3, T²+3 has slopes 1/2 twice; for F_5, T²−2T+5 has slopes 0 and 1.
- A slope-zero Jordan block over F_p need not split into one-dimensional isocrystals over F_p;
  semisimplicity is not asserted over that field.

**Integral cohomological control.** Let X be smooth proper over a perfect field k of
characteristic p and W=W(k). For H=H^b(X,WΩ^a_X), a,b≥0, prove that its p-primary torsion
T is killed by p^N for some N, that H/T is finite free over W, and that H is separated and
complete for both the p-adic and V-adic topologies. The semilinear operators F,V satisfy
FV=VF=p and preserve T. These assertions do not make H itself finite over W.

The API:

- `Crystalline.wittCohomology_bounded_torsion`: There is an N with p^N T=0.
- `Crystalline.wittCohomology_free_quotient`: H/T is finite free over W.
- `Crystalline.wittCohomology_V_complete`: H≅lim_n H/V^nH, in particular ∩_n V^nH=0;
  the analogous p-adic assertion also holds.

*Proof sketch.* Prove the canonical-limit and closed-image assertions from the finite-level
Cartier and restriction sequences and proper coherent finiteness; closed V^nH gives
V-adic completeness and separatedness. Use the two Cartier auxiliary complexes of Illusie
II.2.9–II.2.12: their cohomology modulo V has finite length, so it is finitely generated over
the skew power-series ring W_σ[[V]]. Together with FV=p this yields finite generation modulo
p-torsion and a uniform p-power bound on that torsion. Pass these properties through the
associated long exact sequence, proving their stability under subobjects, quotients and
extensions as in II.2.14. The torsion-free finite quotient over the DVR W is free.
([Illusie, *Complexe de de Rham–Witt et cohomologie
cristalline*](https://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), II.2.1–II.2.5,
pp.607–609; II.2.9–II.2.14, pp.611–613.) *Needs:* *Structural properties of the classical complex
on smooth F_p-algebras*, applied sheafwise over k; *Finite and infinite crystalline de Rham–Witt
comparison*; SchemeAndStackFoundations Layer 2 (proper coherent finiteness);
EnhancedDerivedSheaves E2:towers.1 (`derivedTowerLimit`), with §E2.2
(`IsReplete.milnor`) for the module towers on the point topos.

**Checks.**

- For X=Spec k only H⁰(WΩ⁰)=W is nonzero, T=0, and V=pσ⁻¹ gives the usual complete topology.
- For an ordinary elliptic curve, H¹(WO)/T has rank one; for a supersingular elliptic curve
  it has rank two. The quotient is finite even when integral Witt cohomology is not finite.
- On A¹_(F_p), O_X contains the infinitely many independent Teichmüller monomials in WO_X;
  H⁰(WO_X)[1/p] is infinite-dimensional. Properness is essential for the finite quotient.

**Degree filtration and the slope spectral sequence.** Let X be a smooth proper scheme of dimension
d over a perfect field k, W=W(k), K=W[1/p]. The filtration of WΩ^*_X by the subcomplexes WΩ^(≥a)_X,
0≤a≤d, gives a convergent spectral sequence E₁^(a,b)=H^b(X,WΩ^a_X)⇒H^(a+b)_crys(X/W), compatible
with the Frobenius φ, which acts on the a-th column through p^a·F. After tensoring with K, the E₁
terms are finite-dimensional over K, the Frobenius on the a-th column has slopes in [a,a+1), and the
spectral sequence degenerates at E₁; so H^b(X,WΩ^a_X)⊗K is the part of H^(a+b)_crys(X/W)⊗K with
slopes in [a,a+1). For each r≥1 the same filtration of W_rΩ^*_X gives a spectral sequence
E₁^(a,b)=H^b(X,W_rΩ^a_X)⇒H^(a+b)_crys(X/W_r(k)).

*Hypotheses.* p is a prime; k is a perfect field; X is proper and smooth over k, of dimension d. The
finiteness, slope and degeneration statements are after ⊗K only; nothing is asserted about
E₁-degeneration over W or about finite generation of H^b(X,WΩ^a_X) over W.

*Proof sketch.* The filtration by the subcomplexes WΩ^(≥a)_X is finite, so hypercohomology gives a
convergent spectral sequence with the stated E₁ term; its abutment is crystalline cohomology by
*Finite and infinite crystalline de Rham–Witt comparison* (c). The same holds at each finite level
r. φ=p^a·F in degree a preserves the filtration (*Graded and crystalline Frobenius conventions*), so
the differentials commute with the induced Frobenius maps. Write H=H^b(X,WΩ^a_X) and T for its
p-torsion submodule. T is killed by a power p^N of p and H/T is a free W-module of finite type
(Illusie, Théorème II.2.13); F and V act on H with FV=VF=p (Illusie II.3.1), so the slopes of F on
(H/T)⊗K lie in [0,1]. H is separated for the V-adic topology (Illusie, Corollaire II.2.5); hence ∩_n
V^n(H/T)=0 (if x lies in the intersection and x̃∈H lifts x, then p^N·x̃∈∩_n V^n(H)=0, so x̃∈T), V is
topologically nilpotent on H/T, and F has no slope 1. So F has slopes in [0,1) on H⊗K and φ=p^a·F
has slopes in [a,a+1) on the a-th column (Illusie, proof of Théorème II.3.2). Maps of F-isocrystals
between objects with disjoint slope intervals vanish (*Slope decomposition on the existing
isocrystal carrier*); the differentials d_r⊗K, r≥1, connect columns a and a+r, so they vanish.
*Integral cohomological control* supplies the torsion bound, finite free quotient and
V-adic separated completeness used in this argument.
([Ekedahl, *On the multiplicative properties of the de Rham–Witt complex I*, Ark. Mat. 22
(1984)](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf),
§0 (Definitions and preliminaries), sentence after Lemma 0.8, printed p.191; [Illusie, *Complexe de
de Rham–Witt et cohomologie cristalline*](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf),
Part II, §3 A: 3.1 ((3.1.1)–(3.1.6)), Théorème 3.2 with its proof, Corollaire 3.3, 3.4, Corollaire
3.5 ((3.5.4)), printed pp. 614–616; [Illusie, *Complexe de de Rham–Witt et cohomologie
cristalline*](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part II, §2: standing
hypotheses and Proposition 2.1 (p. 607), Corollaire 2.5 (p. 609), Théorème 2.7 and Scholie 2.8 (pp.
610–611), Remarque 2.12 and Théorème 2.13 (pp. 612–613).) *Needs:* *Finite and infinite crystalline
de Rham–Witt comparison*; *Graded and crystalline Frobenius conventions*; *Proper smooth crystalline
perfectness and reductions* (Layer CR.3); *Integral cohomological control*;
*Slope decomposition on the existing isocrystal carrier*;
DerivedModuleAlgebra §S.1 (*The spectral sequence of a first-quadrant double complex*).

**Checks.**

- For a proper smooth curve only the columns a=0 and a=1 occur, with slopes in [0,1) and [1,2).
- For an elliptic curve E over k: if E is ordinary, H¹_crys(E/W)⊗K has slopes 0 and 1, and
  H¹(E,WO_E)⊗K, H⁰(E,WΩ¹_E)⊗K both have dimension 1; if E is supersingular, the slopes are 1/2, 1/2,
  H¹(E,WO_E)⊗K has dimension 2 and H⁰(E,WΩ¹_E)⊗K=0.
- For P¹_k, the only rational E₁ terms are K at (0,0) and K at (1,1), with Frobenius
  slopes 0 and 1 respectively; the degree factor p^a is essential.

**Nygaard filtration and divided Frobenius.** Let M be a saturated Dieudonné complex and i an
integer. Define N^(≥i)M^q=p^(i−q−1)·V(M^q) for q<i and N^(≥i)M^q=M^q for q≥i. This is a subcomplex
of M, decreasing in i, and x∈M^q lies in N^(≥i)M^q if and only if p^q·F(x)∈p^i·M^q; equivalently
N^(≥i)M=α_F⁻¹(p^iM∩η_pM), where α_F=p^q·F in degree q. Hence φ=α_F restricted to N^(≥i)M is uniquely
divisible by p^i, giving a map of complexes φ_i=φ/p^i:N^(≥i)M→M, and N^(≥i)M is the largest
subcomplex of M on which φ is divisible by p^i. The graded pieces gr^i_N M=N^(≥i)M/N^(≥i+1)M vanish
in degrees >i, and x↦p^(−i)·α_F(x) induces an isomorphism of complexes gr^i_N M≅τ^(≤i)(M/pM). M is
complete for the filtration if and only if every M^q is p-adically complete. If M is a saturated
Dieudonné algebra the filtration is multiplicative, N^(≥i)·N^(≥j)⊂N^(≥i+j), and
φ_(i+j)(xy)=φ_i(x)·φ_j(y). Maps of saturated Dieudonné complexes preserve the filtration and commute
with the φ_i. For R smooth over a perfect field k and M=WΩ^*_R, a strict Dieudonné algebra by
*Classical and saturated de Rham–Witt comparison*, this is the Nygaard filtration N^(≥i)WΩ^*_R:
p^(i−1)V W(R)→p^(i−2)V WΩ¹_R→⋯→V WΩ^(i−1)_R→WΩ^i_R→WΩ^(i+1)_R→⋯; it is transported to Ru_*O_(X/W(k))
for a smooth k-scheme X by *Finite and infinite crystalline de Rham–Witt comparison*.

*Hypotheses.* p is a prime; M is a saturated Dieudonné complex (termwise p-torsion-free, with V
satisfying FV=VF=p); i is an integer, and N^(≥i)M=M for i≤0 when M is concentrated in degrees ≥0.
For multiplicativity M is a saturated Dieudonné algebra. In the last sentence R is a smooth algebra
over a perfect field k, respectively X a smooth k-scheme.

The API:

- `Crystalline.Nygaard.degree`: For q<i, N≥i in degreeq is p^(i−q−1)imV; in degreeq≥i it is all
  forms.
- `Crystalline.Nygaard.dividedF`: p^iφ_i is the restriction of φ and φ_i is a cochain map.
- `Crystalline.Nygaard.decalage`: For a saturated Dieudonné complex M, α_F maps N^(≥i)M
  isomorphically onto p^iM∩η_pM (BLM Proposition 8.2.1(2)); for M=WΩ^*_R this is BMS2 Proposition
  8.5.
- `Crystalline.Nygaard.mem_iff`: For x∈M^q: x∈N^(≥i)M^q if and only if p^q·F(x)∈p^i·M^q.
- `Crystalline.Nygaard.map`: A map f:M→M′ of saturated Dieudonné complexes satisfies
  f(N^(≥i)M)⊂N^(≥i)M′ and f∘φ_i=φ_i∘f; in particular this holds for WΩ^*_R→WΩ^*_(R′) induced by a
  homomorphism of smooth algebras over a perfect field.
- `Crystalline.Nygaard.mul`: For a saturated Dieudonné algebra: N^(≥i)M·N^(≥j)M⊂N^(≥i+j)M and
  φ_(i+j)(xy)=φ_i(x)·φ_j(y).
- `Crystalline.Nygaard.gr_iso`: x↦p^(−i)·α_F(x) induces an isomorphism of complexes gr^i_N
  M≅τ^(≤i)(M/pM), and gr^i_N M vanishes in degrees >i (BLM Proposition 8.2.1(1),(4)).

*Proof sketch.* Subcomplex: for q+1<i, d(p^(i−q−1)·V(y))=p^(i−q−2)·V(dy) by Vd=p·dV; for q+1=i,
dV(y)∈M^i (BLM Construction 8.1.1). α_F(p^(i−q−1)·V(y))=p^(i−1)·FV(y)=p^i·y, so
α_F(N^(≥i)M^q)⊂p^iM^q. Conversely, if q<i and p^q·F(x)=p^i·y, then p^q·F(x)=p^q·F(p^(i−q−1)·V(y))
and F is injective, so x∈N^(≥i)M^q (BLM Proposition 8.2.1(2)). This gives φ_i, its uniqueness (M is
p-torsion-free) and the maximality. Graded pieces: in degrees q<i, p^q·F induces a bijection
p^(i−q−1)V M^q/p^(i−q)V M^q→p^iM^q/p^(i+1)M^q because F:V M^q→pM^q is bijective; in degree i,
F:M^i/VM^i→d⁻¹(pM^(i+1))/pM^i is bijective by saturation (BLM Proposition 8.2.1(3),(4)).
Completeness: p^(i−q)·M^q⊂N^(≥i)M^q⊂p^(i−q−1)·M^q for q<i (BLM Remark 8.1.2). Multiplicativity:
V(u)·V(v)=p·V(uv) and V(u)·y=V(u·F(y)) (*Dieudonné algebras and multiplicative quotients*), and α_F
is multiplicative. Functoriality: maps of saturated Dieudonné complexes commute with F and V. For R
smooth over a perfect field, WΩ^*_R is a strict Dieudonné algebra (*Classical and saturated de
Rham–Witt comparison* (1)) and the formula is BMS2 Definition 8.1; φ:WΩ^*_R≅η_pWΩ^*_R identifies
N^(≥i) with p^iWΩ∩η_pWΩ (BMS2 Proposition 8.5). ([Bhatt–Morrow–Scholze, *Topological Hochschild
homology and integral p-adic Hodge
theory*](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §8.1, Definition 8.1, the
definition of φ_i after it, Proposition 8.5 with proof and the definition of the filtration on
Ru_*O^crys after it, pp.265–268; [Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt
complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §8.1 Construction 8.1.1, Remark 8.1.2,
Example 8.1.3; §8.2 Proposition 8.2.1 with proof, pp.100–102.) *Needs:* *Saturated Frobenius*;
*Image of Frobenius on a saturated complex*; *Verschiebung and the differential*; *Dieudonné
algebras and multiplicative quotients*; *Classical and saturated de Rham–Witt comparison*; *Graded
and crystalline Frobenius conventions*; *Principal p-décalage on torsion-free complexes*; *Finite
and infinite crystalline de Rham–Witt comparison*.

**Checks.**

- `test_nygaard_zero`: N≥0=WΩ.
- `test_nygaard_perfect`: For a perfect field k in degree zero and i≥0, N≥iW(k)=p^iW(k).
- `test_nygaard_boundary`: At degreeq=i−1, N≥i=imV with no extra factor p; at degreeq=i it is the
  whole module.
- N^(≥0)M=M for M in degrees ≥0; for a perfect F_p-algebra k, M=W(k) and i≥0: N^(≥i)W(k)=p^i·W(k) (BLM
  Example 8.1.3).
- For `k=F_p` and `i=−1`, `N^(≥−1)W(k)=ℤ_p`, whereas `p⁻¹ℤ_p` strictly contains it in `ℚ_p`.
  For all integer indices the perfect-ring formula is `N^(≥i)W(k)=p^max(i,0)W(k)`.
- For R=k[t] over a perfect field k: d[t]∈N^(≥1)WΩ¹_R but d[t]∉N^(≥2)WΩ¹_R=V WΩ¹_R (its image in
  W_1Ω¹=Ω¹_R is dt≠0); φ(d[t])=p·[t]^(p−1)·d[t] and φ_1(d[t])=[t]^(p−1)·d[t].

**Nygaard, conjugate, Hodge and lift filtrations.** Let R be a smooth algebra over a perfect field k
and WΩ=WΩ^*_R with its Nygaard filtration. (1) The composite N^(≥i)WΩ--φ_i→WΩ→Ω^*_(R/k) lands in the
canonical truncation τ^(≤i)Ω^*_(R/k), kills N^(≥i+1)WΩ, and induces a quasi-isomorphism gr^i_N
WΩ→τ^(≤i)Ω^*_(R/k). (2) The sequence WΩ/N^(≥i)--p→WΩ/N^(≥i+1)→Ω^(≤i)_(R/k) is a cofiber sequence,
where Ω^(≤i) is the stupid truncation and the second map is induced by WΩ→Ω^*_(R/k)→Ω^(≤i)_(R/k).
(3) Let Ã be the p-adic completion of a smooth W(k)-algebra lifting R, with a chosen lift φ̃ of
Frobenius, and let σ:Ω̂^*_(Ã/W(k))→WΩ be the comparison map constructed from φ̃. Then σ maps the
subcomplex p^max(i−•,0)Ω̂^•_(Ã/W(k)), with terms p^(i−q)Ω̂^q for q<i and Ω̂^q for q≥i, into
N^(≥i)WΩ, and the induced map is a quasi-isomorphism for every i≥0.

*Hypotheses.* p is a prime; k is a perfect field; R is a smooth k-algebra; i≥0. τ^(≤i) is the
canonical truncation (kernel of d in degree i, zero above) and Ω^(≤i) the stupid truncation (zero
above degree i); they are different complexes. (3): Ã is the p-adic completion of a smooth
W(k)-algebra with Ã/p=R, and φ̃:Ã→Ã lifts the Frobenius of R; σ depends on φ̃.

*Proof sketch.* (1): φ_i identifies gr^i_N WΩ with τ^(≤i)(p^iWΩ/p^(i+1)WΩ)≅τ^(≤i)(WΩ/p) (*Nygaard
filtration and divided Frobenius*), and WΩ/p→W_1Ω=Ω^*_(R/k) is a quasi-isomorphism (BLM Corollary
2.7.2 with *Classical and saturated de Rham–Witt comparison*); the composite to Ω^*_(R/k) lands in
τ^(≤i) because dF=pFd (BMS2 Lemma 8.2). (2): multiplication by p is injective on WΩ/N^(≥i) with
cokernel the complex W(R)/p→⋯→WΩ^(i−1)/p→WΩ^i/V WΩ^i. Its map to Ω^(≤i)_(R/k) is surjective with
kernel K: K^q=Fil¹WΩ^q/pWΩ^q for q<i and K^i=Fil¹WΩ^i/V WΩ^i, where Fil¹=V WΩ+dV WΩ. K is acyclic:
in degrees ≤i−2 it agrees with the acyclic complex Fil¹WΩ/p (the kernel of the quasi-isomorphism
WΩ/p→Ω); if y=V(a)+dV(b) in degree i−1 has dy=dV(a)∈V WΩ^i, then da=FdV(a)∈pWΩ^i, so a=F(a′) by
saturation and V(a)=p·a′, that is y≡d(V(b)) mod p; and K^i is generated by the elements
dV(b)=d(V(b)) (BMS2 Lemma 8.3, which quotes Illusie II.3.20 for this step). (3): σ is a
quasi-isomorphism because σ mod p is the identity of Ω^*_(R/k) under WΩ/p≃Ω^*_(R/k); it maps
p^(i−q)Ω̂^q into N^(≥i)WΩ^q since p=VF. On graded pieces one compares Ω̂^q/p with the cohomology
groups p·WΩ^q/(p·V WΩ^q+p·dV WΩ^(q−1)) for q<i and WΩ^i/(V WΩ^i+dV WΩ^(i−1)), which restriction
identifies with Ω^q_(R/k) (BMS2 Proposition 8.7). ([Bhatt–Morrow–Scholze, *Topological Hochschild
homology and integral p-adic Hodge
theory*](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §8.1, Lemma 8.2 and Lemma 8.3
with proofs, pp.266–267; §8.1.2, Proposition 8.7 with proof, pp.269–270; [Bhatt–Lurie–Mathew,
*Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3), arXiv v3, §8.2
Proposition 8.2.1(3),(4); §8.3 Proposition 8.3.3, Corollaries 8.3.4, 8.3.5, Example 8.3.6,
pp.101–104.) *Needs:* *Nygaard filtration and divided Frobenius*; *Classical and saturated de
Rham–Witt comparison*; DerivedDeRhamCohomology Layer 2 (§2.12 *The ordinary algebraic de Rham
complex*); DerivedDeRhamCohomology Layer 2 (§2.27 *The de Rham algebra of a completely smooth formal
algebra*); *The finite quotients compute cohomology modulo p^r*; Mathlib `CochainComplex.truncLE`;
Mathlib `HomologicalComplex.stupidTrunc`.

**Checks.**

- For a perfect field R=k: gr^i_N W(k)=p^iW(k)/p^(i+1)W(k)≅k=τ^(≤i)Ω^*_(k/k) for every i≥0.
- For R=k[t] and i=0: gr⁰_N WΩ=W(R)/V W(R)=k[t] in degree 0, and φ_0 induces x↦x^p, an isomorphism
  onto τ^(≤0)Ω^*_(R/k)=k[t^p]; in (2), WΩ/N^(≥0)=0 and the cofibre is WΩ/N^(≥1)=k[t]=Ω^(≤0)_(R/k).
  The two truncations differ: k[t^p]⊂k[t] is a proper inclusion.

### CR.DDR.4.5 Derived de Rham–Witt with Nygaard filtration

From the classical de Rham–Witt complex `WΩ•_P` of a polynomial `F_p`-algebra and its Nygaard
filtration (§CR.4.6–§CR.4.7), construct `LWΩ_S`, `DerivedDeRham.derivedDeRhamWitt`, for an
`F_p`-algebra `S` as the derived p-completion of the realization `|WΩ•_(P•)|` over a polynomial
resolution `P• → S`, with Nygaard filtration `N^(≥i)` realized levelwise; independence of the
resolution is DerivedModuleAlgebra §0.1 applied to the functors `P ↦ WΩ•_P / N^(≥i)` and `P ↦
W_rΩ•_P`. Extend divided Frobenius and prove the fibre sequences `N^(≥i+1)LWΩ → N^(≥i)LWΩ --φ_i mod
p→ Fil_i^conj dR` and `LWΩ/N^(≥i) --p→ LWΩ/N^(≥i+1) → dR/Fil_H^(i+1)`. The resulting functor
restricts to the classical smooth object.

[BMS19], §8.2 opening, p.270, equations (4)–(5); Lemmas 8.2–8.3, pp.266–267.

*Needs:* §CR.4.6–§CR.4.7; DerivedDeRhamCohomology §1.14 (*Filtered derived categories*);
DerivedDeRhamCohomology §1.17 (*Completed filtered tensor products*); DerivedModuleAlgebra §1.3
(*The derived completion reflector*); DerivedDeRhamCohomology §2.22 (*De Rham cohomology from
polynomial resolutions*); DerivedDeRhamCohomology §3.2 (*The conjugate filtration*);
DerivedModuleAlgebra §0.1 (*Simplicial polynomial resolutions*)

Prove the following named laws.

- `derivedWittSmooth`: on a smooth `F_p`-algebra, `LWΩ` is the classical `WΩ` with its Nygaard
  filtration.
- `derivedWittModP`: `LWΩ_S ⊗^L_(ℤ_p) F_p ≃ dR_(S/F_p)`.
- `derivedWittDividedFrobenius`: `φ_i : N^(≥i)LWΩ → LWΩ` has the displayed modulo-p fibre sequence.
- `derivedWittHodgeQuotient`: multiplication by `p` on Nygaard quotients has cofibre
  `dR/Fil_H^(i+1)`.

**Checks.**

- `test_derived_witt_perfect`: for perfect `S`, `LWΩ_S = W(S)`, with Nygaard level `p^i W(S)` for `i≥0`.
- `test_derived_witt_fp`: for `S = F_p`, `LWΩ = ℤ_p` and its reduction is `F_p`.
- `test_derived_witt_singular_boundary`: for `S = F_p[x,y]/(x,y)²`, `LWΩ_S ⊗^L_(ℤ_p) F_p ≃
  dR_(S/F_p)` has `H^−1 ⊇ H^−2(L_(S/F_p)) ≅ F_p` (DerivedDeRhamCohomology §3.11), including `p = 2`,
  whereas for smooth `S` the reduction is the de Rham complex in degrees `[0, dim S]`; the derived
  object of a singular algebra is not the classical de Rham–Witt complex ([Bhatt12], Example 3.21,
  p.11; [BMS19], §8.2, p.270).

### CR.DDR.5.18 Quasiregular semiperfect derived Witt control

For quasiregular semiperfect `S` over `F_p`, `LWΩ_S` is in degree zero and p-torsion-free,
`N^(≥i)LWΩ_S` is a degree-zero submodule, `φ_i mod p` on `gr_N^i LWΩ_S` injects into `dR_(S/F_p)`
with image `Fil_i^conj`, and `LWΩ_S → S` is a PD thickening. The injectivity is on the Nygaard
graded term; it is not an injectivity claim for `φ_i mod p` on the whole level `N^(≥i)`.

[BMS19], Proposition 8.13 and the end of the proof of Proposition 8.12, pp.273–274.

*Needs:* §CR.DDR.4.5 (*Derived de Rham–Witt with Nygaard filtration*); DerivedDeRhamCohomology §5.2
(*Quasiregular semiperfectoid rings*); DerivedDeRhamCohomology §3.5 (*Derived Cartier graded
pieces*); DerivedModuleAlgebra §1.7 (*Complete flatness and complete faithful flatness*); DerivedDeRhamCohomology §PD.6.

Lean: `DerivedDeRham.qrspWittControl`.

**Checks.**

- `test_qrsp_witt_perfect`: for perfect `S`, `LWΩ_S = W(S)` with Nygaard levels `p^i W(S)` for `i≥0`.
- `test_qrsp_witt_degree_zero`: for `S = F_p[t^(1/p^∞)]/(t)`, `LWΩ_S` is a p-torsion-free module in
  degree zero.
- `test_qrsp_witt_singular_boundary`: for the non-semiperfect `F_p[x,y]/(x,y)²`, `LWΩ` is not in
  degree zero (§CR.DDR.4.5); the left Kan extension does not make an arbitrary singular `S`
  discrete.

### CR.DDR.5.20 Quasiregular semiperfect derived de Rham and PD envelopes

For every quasiregular semiperfect `F_p`-algebra `S`, put `S^♭ = lim_φ S` and `I = ker(S^♭ → S)`.
Then `dR_(S/F_p) ≃ dR_(S/S^♭)` is discrete and naturally identifies with `D_(S^♭)(I) = A_crys(S)/p`.
The Hodge filtration is the PD filtration and the increasing conjugate filtration agrees with the PD
conjugate filtration (DerivedDeRhamCohomology §4.2), with `gr_* ≃ Γ^*_S(I/I²)`. No finite-generation
or regular-sequence hypothesis on `I` is imposed. The proof reduces to `S̃ = S♭[X_i^(1/p^∞), i ∈
I]/(X_i)` as in [BMS19] and uses DerivedDeRhamCohomology §5.19 for the torsion-freeness of
`A_crys(S̃)`.

[BMS19], Proposition 8.12 and proof, pp.272–273.

*Needs:* DerivedDeRhamCohomology §5.2 (*Quasiregular semiperfectoid rings*); DerivedModuleAlgebra
§0.8 (*The cotangent transitivity triangle*); DerivedModuleAlgebra §0.16 (*Derived divided powers*);
DerivedDeRhamCohomology §3.5 (*Derived Cartier graded pieces*); DerivedDeRhamCohomology §3.2 (*The
conjugate filtration*); §CR.DDR.4.3 (*Regular quotients and classical PD envelopes*);
DerivedDeRhamCohomology §4.2 (*The conjugate filtration of a PD envelope*); §CR.DDR.4.5 (*Derived de
Rham–Witt with Nygaard filtration*); DerivedDeRhamCohomology §5.19 (*A_crys of perfect-ring
quotients by Teichmüller regular sequences*); DerivedDeRhamCohomology §PD.6.

Lean: `DerivedDeRham.qrspPdDerham`.

**Checks.**

- `test_qrsp_pd_perfect`: perfect `S = F_p` has `I = 0` and `dR = F_p`.
- `test_qrsp_pd_root_quotient`: put `P = F_p[t^(1/p^∞)]` and `S = P/(t)`. Inverse Frobenius on `P`
  identifies `S^♭` with `lim_n P/(t^(p^n))`, the t-adic completion of `P`. Division by the
  nonzerodivisor `t` in this completion gives `I = (t)` and `I/I² ≃ S`. Then `dR_(S/F_p)` is the
  degree-zero PD envelope of this principal ideal, with divided powers of `t`.
- `test_qrsp_pd_infinite_kernel`: put `P∞ = F_p[x_i^(1/p^∞) : i ∈ ℕ]` and `S∞ = P∞/(x_i : i ∈ ℕ)`.
  Frobenius is surjective on `S∞`. Every finite subset of the ordinary generators `x_i` is a regular
  sequence in the perfect ring `P∞`, as seen on the monomial basis modulo the preceding ordinary
  generators. Applying DerivedModuleAlgebra §0.13 to these finite quotients and DerivedModuleAlgebra
  §0.11 to their filtered colimit gives `L_(S∞/F_p) ≃ (⊕_i S∞)[1]`. Here `L_(P∞/F_p) = 0`: Frobenius
  induces both an equivalence and the zero map on it, using the polynomial model of
  DerivedModuleAlgebra §0.4. Thus `S∞` is quasiregular semiperfect. For `I∞ = ker((S∞)^♭ → S∞)`,
  perfection and transitivity give `L_(S∞/(S∞)^♭) ≃ (⊕_i S∞)[1]` and `I∞/I∞² ≃ ⊕_i S∞`. This
  conormal module is not finitely generated (reduction along the augmentation to `F_p` has infinite
  dimension), so `I∞` is not finitely generated. The theorem identifies `dR` with the discrete PD
  envelope and its conjugate graded pieces with `Γ^*_(S∞)(⊕_i S∞)`, exercising its
  no-finite-generation generality ([BMS19], Definition 8.8 and the filtered-colimit argument in
  Proposition 8.12).
- `test_qrsp_pd_not_semiperfect`: `F_p[t]` is not semiperfect and `dR_(F_p[t]/F_p)` has `H¹ ≠ 0`.

### CR.DDR.5.21 The structure theorem for A_crys(S)

For every quasiregular semiperfect `F_p`-algebra `S`, `A_crys(S)` is p-torsion-free and has a
natural `φ`-equivariant identification `A_crys(S) ≃ LWΩ_S` matching Nygaard filtrations. Its
`N^(≥i)` is `{x : φ(x) ∈ p^i A_crys}`; the divided Frobenius `gr_N^i → A_crys/p` injects with
conjugate image `Fil_i^conj`. The image of `N^(≥i)` modulo `p` is `Fil_H^i dR`. Nygaard completion
modulo `p` is Hodge-completed `dR`, and `φ mod p` is `x ↦ x^p`. Nygaard completion and completion at
the PD ideal are not identified; at `p = 2` the latter can collapse `ℤ₂` to `F₂`.

[BMS19], Theorem 8.14 and proof, pp.274–275.

*Needs:* §CR.DDR.5.20 (*Quasiregular semiperfect derived de Rham and PD envelopes*); §CR.DDR.5.18
(*Quasiregular semiperfect derived Witt control*); §CR.DDR.4.5 (*Derived de Rham–Witt with Nygaard
filtration*); DerivedDeRhamCohomology §4.2 (*The conjugate filtration of a PD envelope*);
DerivedDeRhamCohomology §5.19 (*A_crys of perfect-ring quotients by Teichmüller regular sequences*);
DerivedDeRhamCohomology §PD.7.

Lean: `DerivedDeRham.acrysStructure`.

**Checks.**

- `test_acrys_structure_fp`: for `S = F_p`, `A_crys = ℤ_p`, `φ = id` and
  `N^(≥i) = p^max(i,0) ℤ_p` for every integer i. At i=−1 this is ℤ_p, whereas
  p⁻¹ℤ_p strictly contains ℤ_p inside ℚ_p.
- `test_acrys_structure_divided_frobenius`: on `N^(≥i+1)` one has `φ_i = p φ_(i+1)`, so `φ_i mod p`
  on `N^(≥i)` factors through `gr_N^i`. Its image, on the level `N^(≥i)` as on `gr_N^i`, is exactly
  `Fil_i^conj(A_crys/p)`; surjectivity holds onto this image only.
- `test_acrys_structure_not_surjective`: for the nonperfect `S = F_p[t^(1/p^∞)]/(t)`, `I/I²` is free
  of rank one over `S`, so `gr_(i+1)^conj(A_crys/p) ≅ Γ^(i+1)_S(I/I²) ≠ 0` (§CR.DDR.5.20). Hence
  `Fil_i^conj` is a proper submodule of `A_crys/p` and `φ_i mod p` is not surjective onto
  `A_crys/p`.
- `test_acrys_structure_p_two`: at `p = 2`, completion at the PD ideal `(2)` of `ℤ₂` with its
  divided powers is not the Nygaard completion; `γ_(2^a)(2)` has valuation 1 for all `a`.

### CR.DDR.5.22 The canonical crystalline Čech complex

For a Noetherian regular `F_p`-algebra `A`, let `S = A_perf` be its direct-limit perfection.
Frobenius of `A` is flat by EnhancedDerivedSheaves §E1.6 `frobenius_flat_of_isRegular` (Kunz's
theorem, [StacksLC] Lemma 51.17.6, Tag 0EC0), and induces the identity on spectra, so `A → S` is
faithfully flat; `F_p → A` is a regular map, so `A` is a filtered colimit of smooth `F_p`-algebras
(SchemeAndStackFoundations §0.15; [StacksSmoothing] Theorem 16.12.1, Tag 07GC) and `L_(A/F_p) ≃
Ω¹_(A/F_p)[0]` is flat by DerivedModuleAlgebra §0.11–DerivedModuleAlgebra §0.12; hence `L_(S/A) ≃
L_(A/F_p) ⊗ S[1]` has Tor amplitude in degree `−1`, and `A → S` is a quasisyntomic cover whose
completed Čech terms are quasiregular semiperfect. The canonical cochain complex `A_crys(S) →
A_crys(S ⊗_A S) → …` computes `RΓ_crys(A/ℤ_p)`, through the unfolding of `LWΩ` on `QSyn_(F_p)` and
the identification `LWΩ_B ≃ WΩ•_B ≃ RΓ_crys(B/ℤ_p)` for smooth `B` (§CR.4.7). Regularity is
essential for faithful flatness of perfection; this formula is not asserted for arbitrary singular
`A`.

[BMS19], Remark 8.15, pp.275–276.

*Needs:* §CR.DDR.5.21 (*The structure theorem for A_crys(S)*); §CR.DDR.4.5 (*Derived de Rham–Witt
with Nygaard filtration*); DerivedDeRhamCohomology §5.3 (*Compatible-root quasisyntomic covers*);
DerivedDeRhamCohomology §5.4 (*Refinement and Čech stability of QRSP covers*);
DerivedDeRhamCohomology §5.5 (*Sheaves and unfolding from the QRSP basis*); DerivedDeRhamCohomology
§5.17 (*Descent of p-completed uncompleted de Rham*); DerivedModuleAlgebra §0.11 (*Localization and
filtered colimits of cotangent complexes*); §CR.2.1, §CR.4.6–§CR.4.7; SchemeAndStackFoundations
§0.15; EnhancedDerivedSheaves §E1.6 `frobenius_flat_of_isRegular` for the perfection cover and
`isRegular_of_frobenius_flat` for its singular negative Check.

Lean: `DerivedDeRham.regularFpCrystallineCech`.

**Checks.**

- `test_crys_cech_perfect`: for a perfect `A`, `S = A` and the complex is `W(A)` in degree zero.
- `test_crys_cech_line`: for `A = F_p[t]`, perfection is flat and its Čech terms are semiperfect;
  the complex computes `H⁰ = ℤ_p` and the crystalline `H¹` of the affine line.
- `test_crys_cech_singular`: for `A = F_p[x,y]/(x,y)²`, the converse of Kunz's theorem
  (`isRegular_of_frobenius_flat`) shows Frobenius is not flat. Its perfection is `F_p`, which is not
  flat over `A`: for `m = (x,y)`, the nonzero module `m ⊗_A F_p ≅ m` maps to zero in `F_p`. Thus the
  perfection map is not a cover and the formula is not asserted.

### CR.4.8 Logarithmic Hodge–Witt sheaves

**Logarithmic Hodge–Witt sheaves.** Let X be a regular locally Noetherian F_p-scheme, q≥0 and r≥1,
and let W_rΩ^q_X be the sheaf on the small étale site of X given on affines by the de Rham–Witt
complex (on regular Noetherian rings the classical, Langer–Zink and saturated complexes agree by
*Classical and saturated de Rham–Witt comparison*). The logarithmic Hodge–Witt sheaf W_rΩ^q_(X,log)
is the image, in the category of sheaves on X_ét, of the map (O_X^×)^(⊗q)→W_rΩ^q_X,
u₁⊗⋯⊗u_q↦dlog[u₁]∧⋯∧dlog[u_q], where dlog[u]=[u]⁻¹·d[u]. For q=0 it is the image of Z→W_r(O_X), the
constant sheaf Z/p^r. Its sections are closed forms. For X smooth over a perfect field k,
WΩ^q_(X,log)=lim_r W_rΩ^q_(X,log), formed in sheaves on the pro-étale site of X.

*Hypotheses.* p is a prime; X is a regular locally Noetherian F_p-scheme; q≥0; r≥1. W_rΩ^q_X is
regarded as a sheaf on the small étale site of X and the image is formed there: a section is
étale-locally a sum of symbols dlog[u₁]∧⋯∧dlog[u_q]. For WΩ^q_(X,log): X is smooth over a perfect
field k, and the limit is taken on the pro-étale site.

The API:

- `Crystalline.LogWitt.symbol`: For V→X étale and units u₁,…,u_q∈O_X(V)^×,
  symbol_V(u₁,…,u_q)∈W_rΩ^q_(X,log)(V) has image ∧_(i=1)^q([u_i]⁻¹d[u_i]) in W_rΩ^q_X(V). The empty
  tuple maps to 1. The symbol is additive in each unit under multiplication, and commutes with étale
  restriction and length restriction.
- `Crystalline.LogWitt.closed_fixed`: Every local section ω of W_rΩ^q_(X,log) satisfies dω=0. For
  every local section ω̃ of W_(r+1)Ω^q_(X,log) with restriction ω to level r, F(ω̃)=ω in W_rΩ^q_X,
  where F:W_(r+1)Ω^q_X→W_rΩ^q_X; indeed F(dlog[u])=dlog[u].
- `Crystalline.LogWitt.map`: Pullback of schemes sends a unit symbol to the symbol of its
  pulled-back units.

*Proof sketch.* dlog[u]=[u]⁻¹·d[u] is additive in u because the Teichmüller lift is multiplicative,
so the symbol map is defined on (O_X^×)^(⊗q); d(dlog[u])=0 and F(dlog[u])=dlog[u] in every F–V
procomplex (*Relative Frobenius–Verschiebung procomplexes*). W_rΩ^q_X is an étale sheaf (*Witt
localization and étale descent*); the image sheaf is the étale sheafification of the presheaf image,
and pullback along a morphism of schemes sends symbols to symbols. For q=0 the map is Z→W_r(O_X),
1↦1, whose image is the constant sheaf Z/p^r since W_r(F_p)=Z/p^r. For X smooth over a perfect
field, the sheaves W_rΩ^q_(X,log) are pulled back to the pro-étale site and their inverse limit
along restriction is taken there (BMS2 §8.1). Only the étale-local image of the symbol map is used;
no statement about the Zariski image is made. ([Shiho, *On logarithmic Hodge–Witt cohomology of
regular schemes*](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms140404.pdf), §2, Definition 2.6,
p.575; [Clausen–Mathew–Morrow, *K-theory and topological cyclic homology of henselian
pairs*](https://www.imo.universite-paris-saclay.fr/~matthew.morrow/Clausen%2C%20Mathew%2C%20Morrow%2C%20K-theory%20and%20TC%20of%20Henselian%20pairs.pdf),
§5.3, Definitions 5.25 and 5.26, p.43; [Bhatt–Morrow–Scholze, *Topological Hochschild homology and
integral p-adic Hodge theory*](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §8.1,
paragraph before Proposition 8.4, p.267; [Illusie, *Complexe de de Rham–Witt et cohomologie
cristalline*](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part I, §5, 5.7, definition
(5.7.1), printed pp. 596–597; the map dlog in 3.23, (3.23.1), printed p. 580; [Illusie, *Complexe de
de Rham–Witt et cohomologie cristalline*](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf),
Part 0, §2.4: 2.4.1 ((2.4.1.1)–(2.4.1.3)), Théorème 2.4.2 (Bloch) and the sentence after it, printed
pp. 527–528.) *Needs:* *Relative Frobenius–Verschiebung procomplexes*; *Classical and saturated de
Rham–Witt comparison*; *Witt localization and étale descent*; SchemeAndStackFoundations Layer 2.

**Checks.**

- `test_logWitt_zero_degree`: W_rΩ⁰_log is the constant Z/p^r generated by1.
- `test_logWitt_torus`: On G_m, the symbol of t is dlog[t], a closed degree-one section.
- `test_logWitt_not_all`: On Spec F_p[t] at length1, dt is not a logarithmic section on the whole
  scheme: its Cartier image is0 whereas logarithmic forms are Cartier fixed.
- On the torus G_m=Spec F_p[t,t⁻¹], dlog[t] is a section of W_rΩ¹_log; it is closed and
  F(dlog[t])=dlog[t].
- On Spec F_p[t] the form dt is not a section of Ω¹_log=W_1Ω¹_log: C(dt)=0 because dt is exact,
  while a logarithmic form ω satisfies C(ω)=ω (Shiho Proposition 2.10).

**Illusie and Shiho logarithmic exact sequences.** Let X be a regular locally Noetherian F_p-scheme
and q≥0; all sheaves are on the small étale site of X. (1) For r≥1, F:W_(r+1)Ω^q_X→W_rΩ^q_X induces
F:W_rΩ^q_X→W_rΩ^q_X/dV^(r−1)Ω^(q−1)_X (with Ω^(−1)=0), and the sequence
0→W_rΩ^q_(X,log)→W_rΩ^q_X--1−F→W_rΩ^q_X/dV^(r−1)Ω^(q−1)_X→0 is exact. (2) The sequence of
pro-sheaves 0→W_•Ω^q_(X,log)→W_•Ω^q_X--R−F→W_•Ω^q_X→0 is exact. (3) For positive integers n, m,
multiplication by p^m on W_(n+m)Ω^q_(X,log) induces a map p̲^m:W_nΩ^q_(X,log)→W_(n+m)Ω^q_(X,log),
and the sequence 0→W_nΩ^q_(X,log)--p̲^m→W_(n+m)Ω^q_(X,log)--R^n→W_mΩ^q_(X,log)→0 is exact;
consequently 0→W_•Ω^q_(X,log)--p^m→W_•Ω^q_(X,log)→W_mΩ^q_(X,log)→0 is an exact sequence of
pro-sheaves.

*Hypotheses.* p is a prime; X is a regular locally Noetherian F_p-scheme; q≥0. Exactness is for
sheaves on the small étale site; it does not hold on global sections or for Zariski sheaves in
general. In (1) r≥1 and Ω^(−1)=0; in (3) n, m≥1.

*Proof sketch.* For regular X, ker(W_(r+1)Ω^q_X→W_rΩ^q_X)=V^rΩ^q_X+dV^rΩ^(q−1)_X (Shiho Proposition
2.3), and F(V^rΩ^q_X)=p·V^(r−1)Ω^q_X=0, F(dV^rΩ^(q−1)_X)=dV^(r−1)Ω^(q−1)_X; so F descends to
W_rΩ^q_X→W_rΩ^q_X/dV^(r−1)Ω^(q−1)_X (Shiho Lemma 2.7). For X smooth over a perfect scheme these are
Illusie, Propositions I.3.2 and I.3.3. (1): reduce to strictly local rings, write them as filtered
colimits of smooth F_p-algebras (Popescu, Shiho Theorem 2.1) and pass to the limit (Shiho Theorem
2.2; Shiho Proposition 2.8). Smooth case, X smooth over F_p, q≥1; write π for the projection
W_rΩ^q_X→W_rΩ^q_X/dV^(r−1)Ω^(q−1)_X, so that π∘(R−F)=(1−F)∘R on W_(r+1)Ω^q_X. (i) W_rΩ^q_(X,log)
lies in the kernel of 1−F because F(dlog[u])=dlog[u]. (ii) R−F:W_(r+1)Ω^q_X→W_rΩ^q_X is surjective
for the étale topology (Illusie I.3.26), hence so is 1−F. (iii) If x∈W_rΩ^q_X and (1−F)x=0, choose
locally x̃∈W_(r+1)Ω^q_X with Rx̃=x and b∈Ω^(q−1)_X with Rx̃−Fx̃=dV^(r−1)b; the element z=dV^r(b) of
W_(r+1)Ω^q_X satisfies Rz=0 and Fz=dV^(r−1)b (FdV=d), so (R−F)(x̃+z)=0; by Illusie (I.5.7.4) with
m=0, x̃+z∈W_(r+1)Ω^q_(X,log)+ker R, and x=R(x̃+z)∈W_rΩ^q_(X,log). For q=0 the sequence is Illusie
I.3.28. (The smooth case is also [Colliot-Thélène–Sansuc–Soulé, §1, Lemme 2], quoted in Shiho
Proposition 2.8.). (2) follows from (1) because the projection W_•Ω^q_X→W_•Ω^q_X/dV^(•−1)Ω^(q−1)_X
is an isomorphism of pro-sheaves: restriction kills dV^(r−1)Ω^(q−1)_X⊂W_rΩ^q_X (Shiho Corollary
2.9). (3): reduce to the smooth case as in step 2 (Shiho Proposition 2.12). Smooth case, X smooth
over F_p, q≥1: multiplication by p^m on W_(n+m)Ω^q_X has kernel ker(R^m:W_(n+m)Ω^q_X→W_nΩ^q_X), so
it induces an injection p̲^m:W_nΩ^q_X→W_(n+m)Ω^q_X (Illusie I.3.4); p̲^m maps W_nΩ^q_(X,log) onto
p^m·W_(n+m)Ω^q_(X,log), and R^n is surjective on the logarithmic sheaves, because symbols lift along
restriction. If x∈W_(n+m)Ω^q_(X,log) and R^n(x)=0, lift x locally to x̃∈W_(n+m+1)Ω^q_(X,log); then
R^(n+1)x̃=0, that is x̃∈Fil^m W_(n+m+1)Ω^q_X, and (R−F)x̃=0, so x̃∈p^m·W_(n+m+1)Ω^q_(X,log)+ker R by
Illusie (I.5.7.4), and x=Rx̃∈p^m·W_(n+m)Ω^q_(X,log). For q=0 the sequence is
0→Z/p^n→Z/p^(n+m)→Z/p^m→0. (The smooth case is also [Colliot-Thélène–Sansuc–Soulé, §1, Lemme 3],
quoted in Shiho Proposition 2.12.) The pro-version follows by passing to the systems in n (Shiho
Corollary 2.13; for smooth X it is Illusie, Corollaire I.5.7.5). For smooth X the sequences come
from proof obligations here: establish the finite multiplication-p kernel formula of
Illusie I.3.4, étale-local R−F surjectivity of I.3.26 (I.3.28 for q=0), and the
logarithmic kernel criterion (I.5.7.4) by the smooth Cartier and symbol calculation of
I.5.7.2–I.5.7.3. These are formal theorems of this target. The reduction from regular to
smooth schemes uses SchemeAndStackFoundations §0.15, specialized in *Classical and
saturated de Rham–Witt comparison*. ([Shiho, *On logarithmic Hodge–Witt cohomology of regular
schemes*](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms140404.pdf), §2, Proposition 2.3, Lemma 2.7,
Proposition 2.8, Corollary 2.9, Proposition 2.12 and Corollary 2.13, pp.573–577;
[Clausen–Mathew–Morrow, *K-theory and topological cyclic homology of henselian
pairs*](https://www.imo.universite-paris-saclay.fr/~matthew.morrow/Clausen%2C%20Mathew%2C%20Morrow%2C%20K-theory%20and%20TC%20of%20Henselian%20pairs.pdf),
§5.3, the sequence recalled before Lemma 5.31 and the two diagrams in its proof, pp.44–45;
[Bhatt–Morrow–Scholze, *Topological Hochschild homology and integral p-adic Hodge
theory*](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf), §8.1, last paragraph of the
proof of Proposition 8.4, p.268; [Illusie, *Complexe de de Rham–Witt et cohomologie
cristalline*](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part I, §5, 5.7: Théorème
5.7.2 ((5.7.2.1)), Lemme 5.7.3, formula (5.7.4), printed p. 597; Corollaire 5.7.5, printed p. 598;
[Illusie, *Complexe de de Rham–Witt et cohomologie
cristalline*](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), Part I, §3: Proposition 3.2
(p. 568), Proposition 3.3 ((3.3.1)) and Proposition 3.4 (p. 569), Proposition 3.26 (p. 581),
Proposition 3.28 and Corollaire 3.29 (p. 582).) *Needs:* *Logarithmic Hodge–Witt sheaves*;
*Classical and saturated de Rham–Witt comparison*.

**Checks.**

- q=0: (1) is the Artin–Schreier–Witt sequence 0→Z/p^r→W_r(O_X)--1−F→W_r(O_X)→0.
- r=1: (1) is 0→Ω^q_(X,log)→Ω^q_X--1−F→Ω^q_X/dΩ^(q−1)_X→0 with F the inverse Cartier operator,
  compatible with 0→Ω^q_(X,log)→ZΩ^q_X--C−1→Ω^q_X→0 (Shiho Proposition 2.10, Remark 2.11).
- On X=Spec F_p the map 1−F on Γ(X,O_X)=F_p is zero, so (1) is not exact on global sections; for q=0
  and n=m=1, (3) is 0→Z/p→Z/p²→Z/p→0.

### Examples

- For `A = 𝔽_p`, the saturated de Rham–Witt complex is `W(𝔽_p) = ℤ_p` in degree zero, with `F = id`
  and `V = p`, and `W_r(M) = ℤ/p^r`.
- For `A = 𝔽_p[x]` and the Teichmüller lift `[x]`, the class `dV[x] ∈ WΩ¹` satisfies `F(dV[x]) =
  d[x]` (`FdV = d`), while `V(d[x]) = p·dV[x]` (`Vd = p dV`); these two identities fix the
  conventions for `F` and `V` on forms.

### Dependencies

Layers CR.1, CR.2, CR.3; EnhancedDerivedSheaves (Layer E0, Layer E1, Layer E2);
DerivedDeRhamCohomology (Layer 1, Layer 2, Layer 3); PerfectoidSpaces (Layer P1); TauCetiRoadmap
DerivedModuleAlgebra (§0.K.1); AdicSpacesPartIII (F0.6); DerivedModuleAlgebra
(§S.1); SchemeAndStackFoundations (Layer 2); Mathlib.

## Layer CR.3:duality: Trace and Poincaré duality

This layer constructs the crystalline trace of a proper smooth scheme over a perfect field from the
top-degree de Rham–Witt sheaf after Ekedahl, and proves Poincaré duality, the finite étale transfer,
Gysin maps and the diagonal class.

### CR.3:duality.1 The trace, duality and Gysin maps

**Proper smooth crystalline trace.** Let k be a perfect field of characteristic p, W_n=W_n(k), X a
proper smooth k-scheme of pure dimension d, W_nX=`Crystalline.wittScheme n X` of
CR.4.6 with carrier (|X|,W_nO_X), and f_n:W_nX→Spec W_n its
structure map; f_n^! denotes the exceptional inverse image of coherent duality. Let n≥1 and
σ be Witt Frobenius. For an integer r, `σ_*^r M` has the underlying additive group of M and
scalar action `a·m=σ^r(a)m`; this exact restriction of scalars also acts on complexes.
(1) The complex
f_n^!W_n is concentrated in degree −d, and there is a unique map of W_nO_X-modules
Tr^Ek:W_nΩ^d_X→f_n^!W_n[−d] which, on every open U⊂X with a smooth lift U′ over W_n, is the
composite of the isomorphism θ:W_nΩ^d_U≅σ^n_*H^d(Ω^•_(U′/W_n)) with the map induced by the coherent
trace isomorphism Ω^d_(U′/W_n)≅f′^!W_n[−d] of f′:U′→Spec W_n. It is an isomorphism and is compatible
with étale maps. (2) Put K_n=RΓ_crys(X/W_n). Through Ru_*O_crys≅W_nΩ^•_X
(*Finite and infinite crystalline de Rham–Witt comparison* (Layer CR.4)), inverse Cartier is
the coefficient-linear isomorphism `C^(−n):W_nΩ^d_X≅σ_*^n H^d(W_nΩ^•_X)`.
Its inverse, Tr^Ek and adjunction for f_n give `t_tw,n:σ_*^n K_n→W_n[−2d]`.
Apply σ_*^(−n) and compose with the canonical W_n-linear isomorphism
`σ_*^(−n)W_n→W_n`, whose underlying map is σ^n. This defines
`Tr^Ek_(X,n):K_n→W_n[−2d]`, equivalently a W_n-linear map
H^(2d)_crys(X/W_n)→W_n. These untwisted maps are compatible with reduction from W_n to W_(n−1), and
Tr^Ek_(X,1):H^(2d)_dR(X/k)=H^d(X,Ω^d_X)→k is the trace of coherent duality. (3) Normalisation. For
X=P^d, Tr^Ek_(X,n) sends to 1 the class [ω] of the Čech d-cocycle ω=dlog[t₁]∧…∧dlog[t_d] of the
standard covering, [t_i]∈W_nO the Teichmüller representative of the coordinate t_i; and h^d=ε_d·[ω]
in H^(2d)_crys(P^d/W_n), with `ε_d=(−1)^{d(d−1)/2}` for the Čech convention above. The crystalline trace is Tr_(X,n)=ε_d·Tr^Ek_(X,n), and Tr_X=Rlim_n
Tr_(X,n):RΓ_crys(X/W)→W[−2d]; thus Tr_(P^d)(h^d)=1.

*Hypotheses.* k is a perfect field of characteristic p; X is a proper smooth k-scheme of pure
dimension d; n≥1. (For (1), X smooth of pure dimension d suffices.). f_n^! is the functor of coherent
duality (Hartshorne, Residues and Duality) for the finite-type morphism f_n:W_nX→Spec W_n(k).
h=c₁(O(1))∈H²_crys(P^d/W_n) is the hyperplane class of *The crystalline first Chern class and the
hyperplane class* (Layer CR.3) and h^d its d-th power for the cup product of *Crystalline cup
products* (Layer CR.3).

The API:

- `Crystalline.cechTraceSign`: The integer `(−1)^{d(d−1)/2}`;
  `cechTraceSign_zero=1`, `cechTraceSign_one=1`, `cechTraceSign_two=−1`,
  and `cechTraceSign_add` gives `ε_(d+e)=(−1)^{de}ε_dε_e`.
- `Crystalline.crysTrace_projective`: Tr_(P^d)(h^d)=1 in W(k), for h=c₁(O(1)) and every d≥0; the
  same holds over W_n(k).
- `Crystalline.crysTrace_reduction`: Tr_X⊗^L_W W_n=Tr_(X,n) under RΓ_crys(X/W)⊗^L_W
  W_n≅RΓ_crys(X/W_n), and Tr_(X,1):H^d(X,Ω^d_X)→k is ε_d times the trace of coherent duality.
- `Crystalline.crysTrace_etale_local`: For an étale morphism g:U→X of smooth k-schemes of pure
  dimension d, g^*(Tr^Ek_X)=Tr^Ek_U under the identifications g^*W_nΩ^d_X≅W_nΩ^d_U and
  g^*f_(X,n)^!W_n≅f_(U,n)^!W_n (Ekedahl I, (2.11)).
- `Crystalline.crysTrace_iso`: Tr^Ek:W_nΩ^d_X→f_n^!W_n[−d] is an isomorphism of W_nO_X-modules, for
  X smooth of pure dimension d over k (Ekedahl I, Theorem 4.1).
- `Crystalline.crysTrace_ekedahl`: Tr_(X,n)=ε_d·Tr^Ek_(X,n), where Tr^Ek is induced by Ekedahl's map
  (2.11) by the stated σ_*^n restriction and σ_*^(−n) transport; on underlying top-degree
  classes, `Tr^Ek_(X,n)(x)=σ^n(t_tw,n(x))`. This map is W_n-linear.
  Tr^Ek_(P^d,n)([ω])=1 for the Čech class [ω] of dlog[t₁]∧…∧dlog[t_d], and ε_d∈{1,−1} is
  given by `ε_d=(−1)^{d(d−1)/2}`, so h^d=ε_d·[ω].
- `Crystalline.crysTrace_frobenius`: Tr_X(F(x))=p^d·σ(Tr_X(x)) for x∈H^(2d)_crys(X/W), F the
  semilinear Frobenius of *Semilinear crystalline Frobenius and linearization* (Layer CR.3) and σ
  the Frobenius of W(k); equivalently Tr_X is a map RΓ_crys(X/W)→W(−d)[−2d] compatible with
  Frobenius, W(−d) being W with Frobenius p^d·σ.
- The coherent external-product isomorphism and its counit and shift-sign identities are
  constructed from SchemeAndStackFoundations Layer 2 before the crystalline product trace.
- `Crystalline.crysTrace_product`: For proper smooth X,Y of pure dimensions d,e over k, under
  derived Künneth K(X×Y)≅K(X)⊗^L_W K(Y), Tr_(X×Y)=Tr_X⊗^L Tr_Y as morphisms to W[−2(d+e)], with the
  canonical shift and Koszul symmetry identifications. This holds at finite W_n levels and commutes
  with reduction. In particular Tr_(X×Y)(pr₁^*x∪pr₂^*y)=Tr_X(x)Tr_Y(y) for x,y of top degree.

*Proof sketch.* Local construction (Ekedahl I, (2.3)–(2.7)): for a smooth lift U′/W_n,
θ:W_nΩ^•_U≅σ^n_*H^•(Ω^•_(U′/W_n)); the map ε from U′ to the scheme (|U|,H⁰(Ω^•_(U′/W_n))) is finite;
the coherent trace Ω^d_(U′/W_n)≅f′^!W_n[−d], duality for the finite map θε and W_n≅(σ^n)^!W_n give
(θε)_*Ω^d_(U′/W_n)→f_n^!W_n[−d], which vanishes on d((θε)_*Ω^(d−1)_(U′/W_n)): by étale localisation
and adjunction this reduces to P^d, where R^df′_*Ω^(d−1)=0. Independence of the lift and
compatibility with étale maps (Ekedahl I, (2.8)–(2.11)); since f_n^!W_n[−d] is a sheaf, the local
maps glue to Tr^Ek. Tr^Ek is an isomorphism (Ekedahl I, Theorem 4.1): induction on n along
0→j_*W_(n−1)Ω^d→W_nΩ^d→(jF^(n−1))_*Ω^d→0 and the dual sequence, using the compatibility of Tr^Ek
with p (Lemma 3.3) and with F (Lemma 3.4) and the case n=1. Tr^Ek([ω])=1 on P^d (Ekedahl I, Lemma
3.2): the composite H^d(P^d_(W_n),Ω^d)→H^d(P^d,W_nΩ^d)→W_n is the coherent trace, the cocycle
dt′₁∧…∧dt′_d/(t′₁⋯t′_d) has trace 1 and maps to ω, because C^n fixes dlog[t]. For the global
construction of Ekedahl I.5, retain the coefficient restriction through the top-cohomology
projection and Cartier:
`σ_*^n K_n≅σ_*^n RΓ(X,W_nΩ^•)→RΓ(X,σ_*^n H^d(W_nΩ^•))[−d]≅RΓ(X,W_nΩ^d)[−d]→RΓ(X,f_n^!W_n)[−2d]→W_n[−2d]`.
The last arrow is the coherent-duality counit; every arrow in this composite t_tw,n is
W_n-linear. Since σ is an automorphism, applying σ_*^(−n) and then the linear map
σ_*^(−n)W_n→W_n, a↦σ^n(a), gives the asserted linear trace. For n≥2, write ρ for Witt
reduction and r_n for crystalline reduction on top cohomology. Lemma 3.4 and the proof of
Theorem 4.1, with the Frobenius adjunction of I.(2.5.2) and II.Lemma 2.1, give on underlying
classes `ρ(t_tw,n(x))=σ^(−1)(t_tw,n−1(r_n(x)))`. As ρ commutes with σ, the transported traces
therefore commute with reduction. The same transport at n=1 identifies Tr^Ek_(X,1) with the
de Rham trace of coherent duality. Sign: h^d
and [ω] are both bases of H^(2d)_crys(P^d/W_n)≅W_n, and the Čech cocycle of the d-th power of the
Hodge class of O(1) is `(−1)^{d(d−1)/2}dlog t₁∧…∧dlog t_d` on U₀∩…∩U_d: each multiplication of a form-degree-one, Čech-degree-one factor contributes the totalization sign. Hence h^d=ε_d·[ω] with the stated ε_d. Frobenius:
under RΓ_crys(X/W_n)≅RΓ(X,W_nΩ^•_X) the crystalline Frobenius of *Semilinear crystalline Frobenius
and linearization* (Layer CR.3) is p^q·F in degree q (*Graded and crystalline Frobenius conventions*
(Layer CR.4)), so on H^d(X,W_nΩ^d_X) it is p^d·F; and Tr^Ek carries F:W_nΩ^d_X→W_(n−1)Ω^d_X to the
map m of Ekedahl I, (3.4.1), on dualizing complexes lying over the Frobenius W_n(k)→W_(n−1)(k)
(Ekedahl I, Lemma 3.4). In the limit over n this gives Tr_X(F(x))=p^d·σ(Tr_X(x)). For product
compatibility, compare the local construction with the external product of coherent dualizing
complexes and their counits. The external-product identification of coherent dualizing
complexes, compatibility of their counits and the relative-dimension shift signs are proved in
this trace target from SchemeAndStackFoundations Layer 2. Carry this equality through the de Rham–Witt
comparison and the Künneth totalization. Check the Čech product and shift signs together with ε_d,
ε_e and ε_(d+e), using `ε_(d+e)=(−1)^{de}ε_dε_e`, so the hyperplane-normalized traces satisfy the derived product identity. This sign
and residue comparison supplies crysTrace_product here; Ekedahl I.5 alone does not assert it. The identification of Tr_X with Berthelot’s crystalline trace (LNM 407, VII
1.4.9) is not part of this target; the construction of the trace and duality do not depend on it.
The Hodge and de Rham cohomology of projective space used in the normalisation is the statement
proved in *Proper smooth tests and a crystalline torsion surface* (Layer CR.3). ([Ekedahl, *On the
multiplicative properties of the de Rham–Witt complex I*, Ark. Mat. 22
(1984)](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf),
Chapter I, pp. 192–198: I.2 with (2.5.2), (2.7) and (2.11); Lemmas 3.2, 3.3, 3.4;
Theorem 4.1; I.5; II.Lemma 2.1, p.199.) *Needs:*
*Finite and infinite crystalline de Rham–Witt comparison* (Layer CR.4); *Semilinear crystalline
Frobenius and linearization* (Layer CR.3); *Graded and crystalline Frobenius conventions* (Layer
CR.4); EnhancedDerivedSheaves Layer E1 (*The enhanced derived
category*); SchemeAndStackFoundations Layer 2 (*Coherent Grothendieck duality*,
from which this target constructs the coherent external-product and counit comparison);
SchemeAndStackFoundations Layer 2 (*Coherent Grothendieck duality*: f^! ≅ f^*(−) ⊗ Ω^d[d] for
smooth f); SchemeAndStackFoundations Layer 2 (*Proper coherent trace*); SchemeAndStackFoundations
Layer 2 (*Coherent Grothendieck duality*: the formula for finite morphisms);
SchemeAndStackFoundations Layer 2 (*Coherent Grothendieck duality*: (g∘f)^! ≅ f^!g^!);
SchemeAndStackFoundations Layer 2; *Vanishing of the top coherent de Rham differential* (Layer
CR.3).

**Checks.**

- `test_crysTrace_point`: For X=Spec k (d=0): Tr_X is the identity of W(k)=H⁰_crys(Spec k/W(k)).
  At n=1 over k=F_(p²), C^(−1)(a)=σ(a)=a^p, so the underlying t_tw,1 sends a to σ^(−1)(a).
  The final transport sends this to a, including for a∉F_p; omitting it gives a non-k-linear map.
- `test_crysTrace_P1`: For P¹ over k: Tr(h)=1 for h=c₁(O(1))∈H²_crys(P¹/W(k)).
- `test_crysTrace_P2_sign`: In Čech bidegree (1,1), the product sign is −1,
  so h²=−[dlog t₁∧dlog t₂]. Thus Tr^Ek(h²)=−1 and ε₂Tr^Ek(h²)=1;
  omitting ε₂ fails already over W(F₂), where −1 differs from 1.
- `test_crysTrace_finite_extension`: For X=Spec k′ with k′/k a finite extension (d=0):
  Tr_X:W(k′)→W(k) is the trace of the finite étale W(k)-algebra W(k′).
- On P^d: Tr(h^d)=1, and Tr^Ek([ω])=1 for the Čech class of dlog[t₁]∧…∧dlog[t_d] (Ekedahl I, Lemma
  3.2).
- Tr_X(F(x))=p^d·σ(Tr_X(x)); on P^d this is F(h^d)=p^d·h^d.

**Derived crystalline Poincaré duality.** Let k be a perfect field of characteristic p, W=W(k), X a
proper smooth k-scheme of pure dimension d and E a finite locally free crystal on X/W with dual E^∨;
write K(E)=RΓ_crys(X/W,E). The pairing K(E)⊗^L_W K(E^∨)→K(E⊗E^∨)→K(O_crys)→W[−2d], composed of the
cup product, the evaluation E⊗E^∨→O_crys and Tr_X, is perfect: its adjoint
K(E)→RHom_W(K(E^∨),W)[−2d] is an isomorphism in D(W). The same holds over W_n(k) with Tr_(X,n),
compatibly with ⊗^L_W W_n. For E=O_crys and H^i=H^i_crys(X/W): H^i[1/p]⊗H^(2d−i)[1/p]→W[1/p] is a
perfect pairing of W[1/p]-vector spaces, (H^i/tors)⊗_W(H^(2d−i)/tors)→W is a perfect pairing, and
H^i_tors≅Hom_W(H^(2d−i+1)_tors,W[1/p]/W).

*Hypotheses.* k is a perfect field of characteristic p; W=W(k); X is a proper smooth k-scheme of
pure dimension d. E is a crystal in finite locally free O_crys-modules on X/W and E^∨ its dual
crystal, with evaluation E⊗E^∨→O_crys (*Quasi-coherent and finite locally free crystals* (Layer
CR.1)). Tr_X and Tr_(X,n) are the traces of *Proper smooth crystalline trace*.

*Proof sketch.* Source and target of the adjoint map are perfect complexes of W-modules (*Proper
smooth crystalline perfectness and reductions* (Layer CR.3)), hence derived p-complete; by derived
Nakayama it suffices to prove that it is an isomorphism after ⊗^L_W k. By *Proper smooth crystalline
perfectness and reductions* (Layer CR.3) (3), *Smooth-lift comparison and PD filtration* (Layer
CR.2), the de Rham description of the cup product and the identification of Tr_(X,1) with ε_d times
the coherent trace (*Proper smooth crystalline trace*), the map becomes
RΓ_dR(X,(E_X,∇))→RHom_k(RΓ_dR(X,(E_X^∨,∇^∨)),k)[−2d], induced by the wedge product, the evaluation
and the trace t:H^d(X,Ω^d_X)→k. The trace t vanishes on the image of
d:H^d(X,Ω^(d−1)_X)→H^d(X,Ω^d_X), so it is defined on H^(2d)_dR(X/k). The forms of degree ≥j pair to
zero with the forms of degree ≥d−j+1, so the adjoint map is compatible with the filtrations by form
degree, and on the j-th graded piece it is Serre duality
RΓ(X,E_X⊗Ω^j_X)≅RHom_k(RΓ(X,E_X^∨⊗Ω^(d−j)_X),k)[−d], since (E_X⊗Ω^j)^∨⊗Ω^d≅E_X^∨⊗Ω^(d−j). The
statement over W_n follows by ⊗^L_W W_n. The statements on the groups H^i follow from
0→Ext¹_W(H^(2d−i+1),W)→H^i(RHom_W(K,W)[−2d])→Hom_W(H^(2d−i),W)→0 and Ext¹_W(T,W)≅Hom_W(T,W[1/p]/W)
for a torsion module T of finite length. Compatibility of trace and pairing with perfect-field
extension and the coefficient form of de Rham duality are part of this target; perfect-complex
biduality comes from SchemeAndStackFoundations Layer 2.
([Ekedahl, *On the multiplicative properties of the de Rham–Witt complex I*, Ark. Mat. 22
(1984)](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf),
Introduction, p. 186 (the crystalline duality formula); I.5, p. 198; II, Theorem 2.2 (p. 199) and
Corollary 2.2.23 (p. 203); [Stacks Project](https://stacks.math.columbia.edu), de Rham Cohomology,
de Rham Cohomology, Proposition 0FW7 (Poincaré duality), with Lemmas 0FW5 and 0FW6.) *Needs:*
*Proper smooth crystalline trace*; *Quasi-coherent and finite locally free crystals* (Layer CR.1);
*Proper smooth crystalline perfectness and reductions* (Layer CR.3); *Crystalline cup products*
(Layer CR.3); *Smooth-lift comparison and PD filtration* (Layer CR.2); DerivedModuleAlgebra (§1.3 *The derived completion reflector*); DerivedDeRhamCohomology (§1.22 *Valid exchanges
of completion and derived operations*); SchemeAndStackFoundations Layer 2 (*Proper coherent Serre
duality*); SchemeAndStackFoundations Layer 2 (*Coherent Grothendieck duality*: f^! ≅ f^*(−) ⊗
Ω^d[d] for smooth f); SchemeAndStackFoundations Layer 2 (*Proper coherent trace*);
SchemeAndStackFoundations Layer 2 (*D_QCoh of a qcqs scheme is generated by one perfect
complex*); *Vanishing of the top coherent de Rham differential* (Layer CR.3);
SchemeAndStackFoundations Layer 2.

**Checks.**

- For P^d: ⟨h^i,h^(d−i)⟩=Tr(h^d)=1, so H^(2i) and H^(2d−2i) are dual with dual bases h^i, h^(d−i).
- For a geometrically connected smooth proper curve C: H¹_crys(C/W) is torsion-free, hence
  H²_tors≅Hom_W(H¹_tors,W[1/p]/W)=0 and H²≅Hom_W(H⁰,W)=W; the pairing on H¹ is alternating and
  perfect.
- For the surface H_k of BMS1 Theorem 2.10 (d=2): H³_crys(H_k/W)_tors≅Hom_W(k⊕k,W[1/p]/W)≅k⊕k, and
  the pairing H²×H²→W vanishes on H²_tors.

**Finite étale crystalline transfer and trace.** For a finite étale map g:Y→X of constant degree m
between smooth proper pure d-dimensional schemes over a perfect field k, the trace of the finite
locally free algebra on each PD thickening defines tr_g:Rg_crys,*O_(Y/W)→O_(X/W). It induces
g_!:RΓ_crys(Y/W)→RΓ_crys(X/W), satisfying g_!g^*=m·id, the projection formula g_!(g^*a∪b)=a∪g_!b,
composition, and Tr_X g_!=Tr_Y. This transfer agrees with the degree-zero-shift Gysin map defined by
duality.

*Hypotheses.* g finite étale of constant degree m; X,Y smooth proper of the same pure dimension;
W=W(k), k perfect.

The API:

- `Crystalline.finiteEtaleTransfer_scalar`: g_!g^*=m·id on RΓ_crys(X/W).
- `Crystalline.finiteEtaleTransfer_projection`: g_!(g^*a∪b)=a∪g_!b.
- `Crystalline.finiteEtaleTransfer_trace`: Tr_X∘g_!=Tr_Y, and transfer composes for finite étale
  maps.

*Proof sketch.* Finite étale maps lift uniquely across nil PD thickenings. On every affine
thickening use the ordinary finite-locally-free algebra trace, which commutes with base change and
restricts to m on scalars. Descent gives tr_g and its projection formula. For the trace identity
compare finite-level de Rham resolutions: finite étale Ω_Y=g^*Ω_X, and the algebra trace on each
degree commutes with d. Transitivity of coherent-duality counits identifies the top trace. Pass to
Rlim over W_n. Pair the projection formula with Tr_X. The identity Tr_Xg_!=Tr_Y characterizes the
duality-defined Gysin map by its adjoint pairing, proving agreement. ([Ekedahl, *On the
multiplicative properties of the de Rham–Witt complex I*, Ark. Mat. 22
(1984)](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf),
Chapter I, §2, equations (2.5)–(2.11), pp. 192–194 (étale naturality of the dualizing trace); §5, p.
198 (crystalline trace from adjunction); [Stacks Project](https://stacks.math.columbia.edu),
Crystalline Cohomology, §60.8, Definition 60.8.4; §60.17–60.21, crystal evaluation and de Rham
comparison.) *Needs:* *The étale crystalline sites* (Layer CR.1); *Change of topology for
quasi-coherent crystals* (Layer CR.2); *Proper smooth crystalline trace*; *Derived crystalline
Poincaré duality*; SchemeAndStackFoundations Layer 2 (*Proper coherent trace*).

**Checks.**

- `test_finiteEtaleTransfer_identity`: The identity cover has transfer id.
- `test_finiteEtaleTransfer_split`: For Y=⊔_(i=1)^mX the transfer is the sum of the m coordinates
  and g_!g^*=m.
- `test_finiteEtaleTransfer_field`: For Spec F_(p^r)→Spec F_p transfer in degree zero is the trace
  W(F_(p^r))→Z_p and sends 1 to r.
- The statement requires constant degree; for a disconnected base it is componentwise.

**Proper smooth crystalline Gysin maps.** Let k be a perfect field of characteristic p, W=W(k), and
f:X→Y a morphism of proper smooth k-schemes of pure dimensions d_X and d_Y; write K(X)=RΓ_crys(X/W).
(1) The Gysin map f_*:K(X)→K(Y)[2(d_Y−d_X)] is the transpose of f^*:K(Y)→K(X) under the duality
isomorphisms of *Derived crystalline Poincaré duality*:
K(X)≅RHom_W(K(X),W)[−2d_X]→RHom_W(K(Y),W)[−2d_X]≅K(Y)[2(d_Y−d_X)]. It satisfies
Tr_Y(f_*x∪y)=Tr_X(x∪f^*y) for x∈H^i_crys(X/W), y∈H^(2d_X−i)_crys(Y/W). (2) Projection formula:
f_*(x∪f^*y)=f_*x∪y. (3) For a second morphism g:Y→Z of proper smooth k-schemes of pure dimension,
(g∘f)_*=g_*∘f_*. (4) For the structure map a:X→Spec k, a_*=Tr_X. (5) For a closed immersion f the
class of X in Y is cl_Y(X)=f_*(1)∈H^(2(d_Y−d_X))_crys(Y/W).

*Hypotheses.* k is a perfect field of characteristic p; W=W(k). X, Y (and Z) are proper smooth
k-schemes of pure dimensions d_X, d_Y (and d_Z); f:X→Y (and g:Y→Z) are morphisms of k-schemes.

The API:

- `Crystalline.crysGysin_comp`: (g∘f)_*=g_*∘f_* with the corresponding summed dimension shifts.
- `Crystalline.crysGysin_projection`: As morphisms K(X)⊗^L_W K(Y)→K(Y)[2(d_Y−d_X)],
  f_*∘μ_X∘(id⊗f^*)=μ_Y∘(f_*⊗id), using the even dimension shift. Hence f_*(x·f^*y)=f_*x·y on
  cohomology; no torsion-free hypothesis is imposed.
- `Crystalline.crysGysin_trace`: For the structural map X→Spec k, f_*=Tr_X.
- `Crystalline.crysGysin_adjoint`: Tr_Y(f_*x∪y)=Tr_X(x∪f^*y) for x∈H^i_crys(X/W) and
  y∈H^(2d_X−i)_crys(Y/W); on complexes, f_* is the transpose of f^* under the duality isomorphisms.
- `Crystalline.crysGysin_frobenius`: p^(d_Y)·f_*(F_X x)=p^(d_X)·F_Y(f_*x) in H^*_crys(Y/W)[1/p] for
  x∈H^*_crys(X/W)[1/p]; for a closed immersion of codimension c, F_Y(f_*x)=p^c·f_*(F_X x).

*Proof sketch.* Define f_* by transposition through the isomorphisms K(X)≅RHom_W(K(X),W)[−2d_X] and
K(Y)≅RHom_W(K(Y),W)[−2d_Y] of *Derived crystalline Poincaré duality*; the adjunction formula
Tr_Y(f_*x∪y)=Tr_X(x∪f^*y) is the definition read on cohomology. Prove the projection formula as
equality of morphisms K(X)⊗^L K(Y)→K(Y)[2(d_Y−d_X)]. Compose both candidates with the adjoint
duality isomorphism for K(Y), and use the tensor–internal-Hom adjunction. Their adjoints are the
same morphism on K(X)⊗^L K(Y)⊗^L K(Y): associativity of cup product and multiplicativity of f^*
identify both with Tr_X∘μ_X∘(id⊗f^*∘μ_Y), with the prescribed shifts and symmetry signs. Duality
therefore identifies the morphisms, including integral torsion. The class formula follows on
cohomology. Composition follows by contravariant transposition of (g∘f)^*=f^*∘g^*; transposition of
the unit W→K(X) gives Tr_X. For a closed immersion `i:Z↪Y` of smooth pure-dimensional
k-schemes with `dim Y=d`, `dim Z=d−c`, use `W_nY=Crystalline.wittScheme n Y`, `n≥1`.
Write `R𝒢_Z` for derived sheaf sections supported on Z in the Zariski topos of W_nY,
and `ℋ_Z^q` for its cohomology sheaves. The supported top-form object is
`R𝒢_Z(W_nΩ_Y^d) ≅ ℋ_Z^c(W_nΩ_Y^d)[−c]`; it is distinct from the full supported
crystalline object `R𝒢_Z(Ru_(Y/W_n),*O_crys) ≅ R𝒢_Z(W_nΩ_Y^•)`.
On a chart with ideal `(t₁,…,t_c)`, the top-form residue morphism is
`ι_(Z,n):(W_n i)_*W_nΩ_Z^(d−c) → ℋ_Z^c(W_nΩ_Y^d)`.
In the source's Koszul convention it sends α to
`(−1)^c [d[t₁]∧…∧d[t_c]∧α̃ / ([t₁],…,[t_c])]`, with α̃ any lift.
Prove independence of α̃ and of the regular generators, including reordering and unit
rescaling, and compatibility with étale restriction and changes of smooth W_n-lift.
The comparison diagram identifies `ι_(Z,n)[d−c]` with the supported coherent-duality
trace for W_n i, through the top-form dualizing identifications.
([Chatzistamatiou–Rülling, *Hodge-Witt cohomology and Witt-rational
singularities*](https://emis.de/ft/9676), §1.11, equation (1.11.1), Remarks 1.11.2–1.11.3,
Proposition 1.11.4 and its diagram (1.11.2), pp. 699–703.)

Transport the Koszul fractions and their comparison maps to the Čech totalization
`δ+(−1)^r d` and cup sign `(−1)^(s t)` fixed above. If `i_*^Ek` denotes the resulting
pushforward adjoint for the unnormalized Ekedahl traces, the normalized map is
`i_* = (ε_(d−c)/ε_d) i_*^Ek`: indeed `Tr_Y=ε_d Tr_Y^Ek` and
`Tr_Z=ε_(d−c) Tr_Z^Ek`. This sign transport is part of the residue comparison.
Use the codimension-filtration Cohen–Macaulay statements of Berthelot, LNM 407,
VI, Propositions 1.4.5 and 1.6.1, and his crystalline residues in VII, Theorem 1.4.6,
to compare local traces; VII, 1.4.9 constructs the global trace. Ekedahl I.5, p. 198,
identifies this trace with his construction by étale-local comparison at closed points
and the projective-space normalization (VII, 1.4.11).
Through the de Rham–Witt comparison, with the same Frobenius scalar transport as
*Proper smooth crystalline trace*, require the supported residue construction followed
by forgetting supports to agree with the duality-defined i_* at finite level and over W.
Its value on 1 is Berthelot's cycle class in this normalization. Also prove
`g^*∘i_* = i′_*∘g′^*` for cartesian squares of proper smooth k-schemes with
`dim Z′ = dim Z + dim Y′ − dim Y`; these smooth expected-dimension squares are
Tor-independent. These residue, cycle-class and base-change identifications are part
of this target. ([Ekedahl,
*On the multiplicative properties of the de Rham–Witt complex I*, Ark. Mat. 22
(1984)](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf),
Introduction, p. 186: the crystalline duality formula RHom_W(RΓ(X/W),W)[−2N]≅RΓ(X/W); I.5, p. 198,
for the characterisation of a trace by local residues; [Stacks
Project](https://stacks.math.columbia.edu), Weil Cohomology Theories, Weil Cohomology Theories,
Lemma 0FGT (pushforward defined by Poincaré duality).) *Needs:* *Derived crystalline Poincaré
duality*; *Proper smooth crystalline trace*; *Crystalline cup products* (Layer CR.3); *The
crystalline first Chern class and the hyperplane class* (Layer CR.3); *Semilinear crystalline
Frobenius and linearization* (Layer CR.3); *Finite étale crystalline transfer and trace*;
EnhancedDerivedSheaves Layer E1 (*Derived sheaf tensor*); *Witt schemes on locally p-nilpotent schemes*
(CR.4.6); *Finite and infinite crystalline de Rham–Witt comparison*
(Layer CR.4); SchemeAndStackFoundations §2.7 (`supportedSubsheaf`,
`localCohomologySheaf`, `rHZ_adjunction`, `supports_localization_triangle`); Layer 2
(*Coherent Grothendieck duality*, from which this target constructs the supported
closed-immersion comparison; *Tor-independent base change for quasi-coherent complexes*).

**Checks.**

- `test_crysGysin_identity`: For id_X, pushforward is the identity.
- `test_crysGysin_hyperplane`: For a hyperplane i:P^(d−1)→P^d over k: i_*(1)=h and i_*(h^j)=h^(j+1)
  for 0≤j≤d−1, h=c₁(O(1)).
- `test_crysGysin_shift`: For the structure map a:P^d→Spec k: a_*(h^d)=1 in W=H⁰_crys(Spec k/W) and
  a_*(h^j)=0 for j<d; the target of a_* is K(Spec k)[−2d]=W[−2d].
- `test_crysGysin_finite_etale`: For π:X′→X finite étale of constant degree n between proper smooth
  k-schemes of pure dimension d: π_*(1)=n in H⁰_crys(X/W) and π_*π^*x=n·x.
- For the structure map a:X→Spec k: a_*=Tr_X.
- On `Z=(t=0)⊂A¹_k`, replacing t by ut for a unit u and changing the lift of a
  zero-form leaves `ι_(Z,n)` unchanged; its restriction along an étale coordinate
  chart agrees with the residue formed on that chart, also for n=1.
- For `Z=(t₁=t₂=0)⊂A²_k`, swapping the regular generators reverses both the wedge
  and the generalized-fraction orientation, leaving the residue unchanged.
- For `i:P¹↪P²`, `ε₁/ε₂=−1` and `i_*^Ek(1)=−h`; the normalized Gysin class is h
  and `Tr_(P²)(i_*h)=Tr_(P¹)(h)=1`. Over W(F₂) the sign −1 still differs from 1.

**Diagonal class and crystalline coevaluation.** Let k be a perfect field of characteristic p,
W=W(k), X a proper smooth k-scheme of pure dimension d, K=RΓ_crys(X/W) and Δ:X→X×_kX the diagonal.
(1) [Δ_X]=Δ_*(1)∈H^(2d)_crys(X×X/W), Δ_* the Gysin map of *Proper smooth crystalline Gysin maps*.
(2) The correspondence [Δ_X] acts as the identity: pr_(2*)([Δ_X]∪pr₁^*x)=x for x∈H^*_crys(X/W). (3)
Under the Künneth isomorphism K⊗^L_W K≅RΓ_crys(X×X/W), [Δ_X] is the coevaluation coev:W→(K⊗^L_W
K)[2d] for the evaluation ev:K⊗^L_W K→W[−2d], ev(x⊗y)=Tr_X(x∪y): the composites (ev⊗id)∘(id⊗coev)
and (id⊗ev)∘(coev⊗id) are the identity of K. (4) If the H^i=H^i_crys(X/W) are free with bases
e_(i,j), then [Δ_X]=Σ_(i,j)e_(i,j)⊗e′_(2d−i,j) with e′_(2d−i,j)∈H^(2d−i) determined by
Tr_X(e_(i,j)∪e′_(2d−i,j′))=(−1)^i·δ_(jj′). (5) For P^d: [Δ]=Σ_(i=0)^d h₁^i∪h₂^(d−i), h_a=pr_a^*h.
The same holds over W_n(k), compatibly with reduction.

*Hypotheses.* k is a perfect field of characteristic p; W=W(k); X is a proper smooth k-scheme of
pure dimension d. In (4) the W-modules H^i_crys(X/W) are free; in general the formula holds in
H^*_crys(X×X/W)[1/p].

The API:

- `Crystalline.crysDiagonal_action`: The diagonal correspondence acts as id_K.
- `Crystalline.crysDiagonal_triangles`: Evaluation and coevaluation satisfy both triangular
  identities.
- `Crystalline.crysDiagonal_projective`: On P^d, [Δ]=Σh₁^i h₂^(d−i).

*Proof sketch.* [Δ_X]=Δ_*(1). By the projection formula and (pr₂∘Δ)_*=id:
pr_(2*)([Δ_X]∪pr₁^*x)=pr_(2*)Δ_*(Δ^*pr₁^*x)=x. Under derived Künneth, Δ^* is μ:K⊗^L K→K. Gysin
transposes this morphism using the Poincaré dualities of X and X×X. The product compatibility of
*Proper smooth crystalline trace* identifies the latter duality with the tensor product duality,
with Koszul symmetries. Thus Δ_*(1) is the transpose of multiplication applied to the unit, namely
the coevaluation for ev=Tr_X∘μ. The duality triangle identities prove both identity correspondences
as morphisms in D(W), including Tor contributions; no decomposition of an arbitrary integral Künneth
class into pure cohomology tensors is used. When every H^i(K) is free, the Tor terms vanish and
derived Künneth on cohomology becomes the direct sum of tensor products. Read the coevaluation in
dual bases; interchanging degrees i and 2d−i gives (−1)^i. This proves (4), and the hyperplane basis
with Tr(h^d)=1 gives (5). After inverting p the same argument applies over the field W[1/p]. The
coherent-product comparison and crysTrace_product are those already proved in
*Proper smooth crystalline trace*.
([Ekedahl, *On the multiplicative properties of the de Rham–Witt complex I*, Ark. Mat. 22
(1984)](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf),
Introduction, p. 186: the crystalline duality formula; [Stacks
Project](https://stacks.math.columbia.edu), Weil Cohomology Theories, Weil Cohomology Theories,
Lemma 0FGZ (class of the diagonal), and Lemma 0FH0.) *Needs:* *Proper smooth crystalline Gysin
maps*; *Derived crystalline Poincaré duality*; *Proper smooth crystalline Künneth formula* (Layer
CR.3); *Crystalline cup products* (Layer CR.3); *Proper smooth crystalline trace*; *The crystalline
first Chern class and the hyperplane class* (Layer CR.3); SchemeAndStackFoundations Layer 2;
EnhancedDerivedSheaves Layer E1 (*Derived sheaf tensor*).

**Checks.**

- `test_crysDiagonal_point`: For the point the diagonal class and coevaluation are 1.
- `test_crysDiagonal_P1`: For P¹, [Δ]=h₁+h₂.
- `test_crysDiagonal_curve`: For a geometrically connected smooth proper curve C of genus g over k,
  with pt∈H²_crys(C/W) of trace 1 and a basis a₁,…,a_g,b₁,…,b_g of H¹_crys(C/W) with
  Tr(a_i∪b_j)=δ_ij and Tr(a_i∪a_j)=0=Tr(b_i∪b_j): [Δ_C]=pt⊗1+1⊗pt+Σ_i(b_i⊗a_i−a_i⊗b_i).
- `test_crysDiagonal_euler`: Tr_(X×X)([Δ_X]∪[Δ_X])=Σ_i(−1)^i·rank_W H^i_crys(X/W); this is d+1 for
  P^d and 2−2g for a curve of genus g.
- For P^d: [Δ]=Σ_(i=0)^d h₁^i∪h₂^(d−i), and Tr_(P^d×P^d)([Δ]∪[Δ])=d+1.
- For every X: pr_(2*)([Δ_X]∪pr₁^*x)=x.

### Examples

- For a smooth proper geometrically connected curve `C` over a perfect field `k`, the trace
  identifies `H²_crys(C/W(k))` with `W(k)(−1)` and the cup product on `H¹_crys` is a perfect
  alternating pairing into it.

### Dependencies

Layers CR.1, CR.2, CR.3, CR.4; EnhancedDerivedSheaves (Layer E1); SchemeAndStackFoundations (Layer
2); DerivedDeRhamCohomology (Layer 1); Mathlib.

## Layer CR.5:log-algebra: Logarithmic structures

This layer is the algebra of log structures after Kato, independent of the crystalline layers:
monoids and their integral, fine and saturated variants; prelog rings, étale log structures,
associated and inverse-image log structures, characteristic monoids and charts; strict, exact,
integral, Kummer and vertical morphisms and log fibre products; log smoothness and Kato's chart
criterion; divisorial log structures, log regularity and the logarithmic Abhyankar lemma; integral
quasi-coherent log schemes after Beilinson and Binda–Kato–Vezzani; valuation log structures and
semistable formal charts.

### CR.5:log-algebra.1 Prelog rings, log structures and charts

**Prelog rings.** Use the prelog category of DerivedDeRhamCohomology §6.20: its data are a
commutative ring A, a commutative monoid P and a homomorphism α:P→(A,×), including elements
mapping to zero. A morphism consists of compatible ring and monoid maps. The fixed-ring chart
presentation `LogCrystalline.PrelogRing` uses these same data for geometric log structures.
Identify this presentation with the fibre of the supplied category over A by the identity
on P and α; the displayed morphism laws are transported through that identification.
Resolutions and derived functors are formed in the supplied category. Additive notation for
charts corresponds to multiplication in A.

`Suggested.lean` declares `LogCrystalline.PrelogRing`.

The API:

- `LogCrystalline.PrelogRing.alpha`: The structure homomorphism P→(A,×).
- `LogCrystalline.PrelogRing.hom_ext`: Morphisms agreeing on the ring and monoid components agree.
- `LogCrystalline.PrelogRing.map_comp`: Composition acts by composition on both components.

*Proof sketch.* Use the multiplicative monoid of the ring, not its unit group. Define morphisms by
the commuting square and componentwise composition. ([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
§1.1, pp.192–193; multiplicative convention at the start of §1.)
*Needs:* DerivedDeRhamCohomology §6.20 (the prelog category); Mathlib `CommMonCat`.

**Checks.**

- `zero_chart`: For the chart ℕ→k with 1↦0, every positive exponent maps to zero.
- `trivial_chart`: The one-element monoid gives the trivial prelog structure.
- `units_only_failure`: The chart ℕ→k with 1↦0 cannot factor through k×.
- The standard chart ℕ→A sends n to tⁿ, including t=0.

**Étale log structures.** On the pinned small étale site X_et, a log structure is a sheaf M of
commutative monoids and α:M→O_X under multiplication such that α⁻¹(O_X×)→O_X× is an isomorphism of
sheaves. A log scheme is the pair (X,M); no finite-generation assumption is implicit.

`Suggested.lean` declares `LogCrystalline.PrelogRing.IsLog`.

The API:

- `LogCrystalline.LogStructure.units`: The submonoid mapping to O_X× is canonically O_X×.
- `LogCrystalline.LogStructure.hom_ext`: Maps over O_X equal on M are equal.
- `LogCrystalline.LogStructure.stalk_is_log`: The unit condition holds if and only if it holds at
  every geometric stalk.

*Proof sketch.* Form the multiplicative monoid sheaf of the étale structure sheaf. Impose the
inverse-image-of-units isomorphism stalkwise; use sheaf descent. ([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
§1.2, p.193; trivial example §1.5(2), p.194.) *Needs:* *Prelog rings*; EnhancedDerivedSheaves Layer E1 (*DG comparison for complexes of module sheaves*); Mathlib
`AlgebraicGeometry.Scheme.smallEtaleTopology`.

**Checks.**

- `trivial_units`: For O_X× the characteristic monoid is the one-element monoid.
- `standard_log_point`: The logification of ℕ→k, 1↦0 has monoid k×⊕ℕ.
- `prelog_is_not_log`: The prelog monoid {1}→k is not a log structure when k× is nontrivial.
- The trivial log structure is O_X×→O_X.

**Associated log structures.** For α:M→O_X, define Mᵃ as the sheafified pushout `M⊔_{α⁻¹O_X×}O_X×` in
commutative monoids, with induced map to O_X. The map M→Mᵃ is initial among maps to log structures
over O_X and logification is left adjoint to forgetting the unit condition.

The API:

- `LogCrystalline.associatedLog.of`: The canonical map M→Mᵃ commutes with α.
- `LogCrystalline.associatedLog.lift`: Any map from M to a log structure extends uniquely across Mᵃ.
- `LogCrystalline.associatedLog.idempotent`: (Mᵃ)ᵃ≅Mᵃ, naturally.

*Proof sketch.* Take the pushout presheaf and sheafify. Check the unit condition on stalks and the
adjunction by the pushout universal property. ([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf), §1.3
and pushout remark, p.193.) *Needs:* *Étale log structures*.

**Checks.**

- `already_log`: Logification of O_X×→O_X is O_X×.
- `zero_log_point`: For ℕ→k with 1↦0, Mᵃ=k×⊕ℕ.
- `invertible_generator`: For ℕ→A with 1↦t∈A×, Mᵃ= A×.
- Logifying a log structure changes nothing.

**Inverse image log structures.** For f:X→Y and (N,β) on Y, f*N is the logification of
f⁻¹N→f⁻¹O_Y→O_X. This differs from plain inverse image because new elements can become units. A
morphism of log schemes over f is a map f*N→M compatible with O_X.

The API:

- `LogCrystalline.logPullback.of`: The prelog pullback maps canonically to f*N.
- `LogCrystalline.logPullback.comp`: (f∘g)*N≅g*(f*N), satisfying the identity and composition
  coherence.
- `LogCrystalline.logPullback.units`: f*(O_Y×)≅O_X×.

*Proof sketch.* Apply inverse image to the prelog structure, then logify. Use the logification
adjunction to prove the composition isomorphism. ([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
§1.4, pp.193–194; formulas (1.4.1)–(1.4.2).) *Needs:* *Associated log structures*.

**Checks.**

- `identity`: Identity pullback is the given log structure.
- `punctured_line`: Pullback of the t-chart to A[t⁻¹] is trivial.
- `special_fibre`: Reduction of ℕ→O_K, 1↦π, gives ℕ→k, 1↦0, not a trivial log structure.

**Characteristic monoids.** The characteristic sheaf M̄ of a log structure is the sheaf quotient
M/O_X×. At a geometric point it is a sharp monoid; M→M̄ is the quotient by units, not the image of
α. Groupification uses the existing Grothendieck group of a commutative monoid, sheafified when
necessary.

The API:

- `LogCrystalline.characteristicMonoid.quotient`: The map M→M̄ kills precisely the unit subgroup.
- `LogCrystalline.characteristicMonoid.gp_quotient`: The characteristic groupification is
  canonically M^gp modulo the image of O_X^×→M^gp. No injectivity of the unit map after
  groupification is assumed.
- `LogCrystalline.characteristicMonoid.sharp`: The only unit of each stalk of M̄ is the identity.

*Proof sketch.* Quotient the units action and sheafify. Apply the pinned universal groupification to
stalks and compare with the quotient of M^gp by O_X×. ([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
Formula (1.4.1), p.194; §2.4(3), p.197; Example 2.5(2), p.198.) *Needs:* *Étale log structures*;
Mathlib `Algebra.GrothendieckGroup`; Mathlib `Algebra.GrothendieckGroup.lift`.

**Checks.**

- `trivial`: The trivial log structure has zero characteristic group.
- `log_point`: The characteristic of k×⊕ℕ is ℕ.
- `same_alpha_image`: The log points k×⊕ℕ and k×⊕ℕ² have different characteristic monoids although α
  has the same image in k.
- At the standard log point, M̄=ℕ and M̄^gp=ℤ.

**Integral monoids.** A commutative monoid P is integral if P→P^gp is injective, equivalently
cancellation holds. A log structure is integral when all geometric stalks are integral. This is a
mathematical predicate on the existing groupification, not a second group construction.

The API:

- `LogCrystalline.IsIntegralMonoid.cancel`: Integrality is equivalent to ab=ac⇒b=c.
- `LogCrystalline.IsIntegralMonoid.of_injective`: The canonical map to the pinned GrothendieckGroup
  is injective.
- `LogCrystalline.IsIntegralMonoid.characteristic`: An integral log structure has integral
  characteristic stalks. Integral characteristic alone does not force an arbitrary log monoid to be
  integral.

*Proof sketch.* Use groupification and its cancellation criterion. Use Kato §2.4(3) to descend
integrality from the log monoid to its characteristic. No converse is claimed for arbitrary log
structures. ([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf), §2.2
and §2.4(2)–(3), p.197.) *Needs:* *Characteristic monoids*; Mathlib
`Algebra.GrothendieckGroup.of_injective`.

**Checks.**

- `nat`: The additive monoid ℕ is integral.
- `rational`: The additive monoid ℚ≥0 is integral without being finitely generated.
- `idempotent`: The two-element monoid with a²=a and a≠1 is not integral.
- ℕ and ℚ≥0 are integral.

**Fine monoids.** A commutative monoid is fine if it is integral and finitely generated. A log
structure is coherent if it étale locally admits a finitely generated chart, and fine if
additionally integral. Fine does not mean saturated.

`Suggested.lean` declares `LogCrystalline.IsFineMonoid`.

The API:

- `LogCrystalline.IsFineMonoid.integral`: Fine implies integral.
- `LogCrystalline.IsFineMonoid.finite_generators`: A fine chart admits a finite generating family.
- `LogCrystalline.IsFineMonoid.logification`: A fine prelog chart gives a fine associated log
  structure.

*Proof sketch.* Combine cancellation with a finite generating family. Define fine log structures by
finite charts and verify independence from the chart. ([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
§2.1–2.3 and §2.4(2), p.197.) *Needs:* *Integral monoids*; *Associated log structures*.

**Checks.**

- `nat`: ℕ is fine and saturated (`LogCrystalline.nat_fine_saturated`).
- `cusp`: ⟨2,3⟩ is fine and 1 is missing although 2·1 lies in the monoid
  (`LogCrystalline.cusp_fine_not_saturated`).
- `rational_not_fine`: ℚ≥0 is saturated but not finitely generated and hence not fine
  (`LogCrystalline.rational_saturated_not_fine`).
- The cusp monoid ⟨2,3⟩⊂ℕ is fine but not saturated.

**Saturated monoids.** An integral monoid P is saturated when for every g∈P^gp and integer n>0, gⁿ∈P
implies g∈P. In additive charts replace gⁿ by ng. An fs log structure is fine and saturated at
geometric stalks; saturation is stronger than integrality.

`Suggested.lean` declares `LogCrystalline.IsSaturatedMonoid`.

The API:

- `LogCrystalline.IsSaturatedMonoid.root_closed`: Positive powers lying in P force the element to
  lie in P.
- `LogCrystalline.IsSaturatedMonoid.saturation_lift`: Maps from P to saturated integral monoids
  extend through its saturation.
- `LogCrystalline.IsSaturatedMonoid.fs_integral`: Every fs log structure is integral.

*Proof sketch.* Use the existing groupification and define the power condition. Saturation is the
submonoid of P^gp of elements having a positive power in P; localize and glue. ([Thompson, *Toric
singularities revisited*](https://arxiv.org/abs/math/0305441v2), §1.2, Definition 1.6, p.7.)
*Needs:* *Integral monoids*; *Fine monoids*.

**Checks.**

- `nat`: ℕ⊂ℤ is saturated.
- `cusp`: ⟨2,3⟩⊂ℤ is not saturated.
- `rational`: ℚ≥0 is saturated and integral but not fine.
- Saturation of ⟨2,3⟩ inside ℤ is ℕ.

**Log charts.** A chart of M on U is a monoid P and P→Γ(U,M) whose associated log structure on U is
isomorphic to M|_U. A morphism chart consists of Q→P and charts of source and target giving the
structural map. Characteristic stalks are chart quotients by elements becoming units; a chart is not
required to equal the characteristic monoid.

The API:

- `LogCrystalline.LogChart.associated_iso`: The chart carries an isomorphism Pᵃ≅M|_U.
- `LogCrystalline.LogChart.characteristic_stalk`: M̄_x=P/{elements whose α-image is a unit at x}.
- `LogCrystalline.LogChart.restrict`: A chart restricts along any étale map.

*Proof sketch.* Logify the constant sheaf chart map. Use the associated-log isomorphism as chart
data; transport charts over étale neighborhoods. ([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
Definition 2.9 and Lemma 2.10, pp.199–200.) *Needs:* *Associated log structures*; *Inverse image log
structures*; *Fine monoids*.

**Checks.**

- `toric_origin`: At the origin of A^r with coordinate chart, M̄=ℕ^r.
- `torus`: On the torus all chart generators become units and M̄=0.
- `chart_not_sharp`: Chart ℤˣ→ℤ contains the nonidentity unit −1, while its associated log structure
  has trivial characteristic.
- The toric chart ℕ^r on affine r-space is fine.

### CR.5:log-algebra.2 Morphisms of log schemes

**Strict morphisms.** A morphism f:(X,M)→(Y,N) is strict when the structural map f*N→M is an
isomorphism. This means equality up to the specified isomorphism of pulled-back log structures, not
equality of arbitrary chart monoids.

The API:

- `LogCrystalline.IsStrict.pullback_iso`: Strictness supplies f*N≅M.
- `LogCrystalline.IsStrict.comp`: Composites of strict morphisms are strict.

*Proof sketch.* Use the canonical map from the log pullback; functoriality of inverse image
identifies the pullback for a composite with the iterated pullback. ([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
Proposition 3.8, p.203; inverse image §1.4; exact closed immersion §3.1.) *Needs:* *Inverse image
log structures*; *Log charts*.

**Checks.**

- `identity`: Every log identity is strict.
- `open_torus`: The torus restriction of a toric log scheme is strict for the induced log structure.
- `forget_log_point`: The standard log point over the trivial log point is not strict.

**Exact morphisms.** For integral monoids q:Q→P, exact means the square Q→P over Q^gp→P^gp is
cartesian. For log schemes this holds on geometric characteristic stalks. For a closed log immersion
(surjective pulled-back log map), exactness makes that log map an isomorphism, so exact closed
immersions are strict.

The API:

- `LogCrystalline.IsExact.gp_square`: Exactness is Q=(q^gp)⁻¹(P).
- `LogCrystalline.IsExact.comp`: Exact morphisms compose.
- `LogCrystalline.IsExact.closed_strict`: An exact closed immersion of integral log schemes is
  strict.

*Proof sketch.* Use the pullback square in existing groupifications. Pass between log stalks and
characteristic stalks and prove the closed-immersion assertion by cancellation. ([Kato, *Logarithmic
structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
§4.6, p.209.) *Needs:* *Integral monoids*; *Log charts*.

**Checks.**

- `nat_multiple`: The map ℕ→ℕ, a↦na is exact for n>0.
- `identity`: Identity monoid maps are exact.
- `diagonal_immersion`: The chart map ℕ²→ℕ, (a,b)↦a+b of a log diagonal is not exact.
- Multiplication n:ℕ→ℕ is exact without being strict for n>1 at a log point.

**Integral morphisms.** For integral monoids Q→P, integrality means every pushout with an integral
monoid Q′ is integral. Equivalently, from q(a₁)b₁=q(a₂)b₂ obtain a₃,a₄∈Q and b∈P with b₁=q(a₃)b,
b₂=q(a₄)b and a₁a₃=a₂a₄. Log morphisms satisfy this stalkwise. For injective integral chart maps,
ℤ[Q]→ℤ[P] is flat.

The API:

- `LogCrystalline.IsIntegralMorphism.pushout`: Integral chart maps preserve integrality of arbitrary
  integral pushouts.
- `LogCrystalline.IsIntegralMorphism.exact`: An integral local map of integral characteristic
  monoids is exact; locality means the inverse image of units is the unit submonoid.
- `LogCrystalline.IsIntegralMorphism.base_change`: Integral morphisms remain integral under integral
  log base change.

*Proof sketch.* Prove the chart factorization criterion by comparison with groupified pushouts. Use
the monoid-algebra flatness criterion for injective charts. ([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
Proposition 4.1; Definition 4.3; Corollaries 4.4–4.5, pp.206–209.) *Needs:* *Integral monoids*;
*Exact morphisms*.

**Checks.**

- `diagonal`: The diagonal ℕ→ℕ^r is integral.
- `identity`: Identity morphisms are integral.
- `cusp_inclusion`: ⟨2,3⟩→ℕ is injective but not integral: k[t²,t³]→k[t] is not flat.

**Kummer morphisms.** A homomorphism of integral monoids Q→P is Kummer if it is injective and every
p∈P has a positive power in the image of Q. A morphism of fs log schemes is Kummer when all
characteristic stalk maps are Kummer. Every positive-power map ℕ→ℕ is Kummer.

`Suggested.lean` declares `LogCrystalline.IsKummerHom`.

The API:

- `LogCrystalline.IsKummer.injective`: A Kummer characteristic map is injective.
- `LogCrystalline.IsKummer.power_lift`: Every target characteristic element has a positive power
  from the source.
- `LogCrystalline.IsKummer.comp`: Kummer morphisms compose.
- `LogCrystalline.IsKummer.identity`: Identity morphisms are Kummer.

*Proof sketch.* State injectivity and the power-surjectivity condition on characteristic stalks.
Use injectivity and successive positive powers to prove composition; identities use power one.
([Temkin, *Tame distillation and desingularization by
p-alterations*](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n1-p03-p.pdf),
§1.2.7 and proof, Step 10, pp.100,123–124.) *Needs:* *Saturated monoids*; *Exact morphisms*.

**Checks.**

- `positive_power`: For every n≥1, ℕ→ℕ, 1↦n is Kummer, independently of the base characteristic.
- `identity`: The identity is Kummer.
- `p_power`: The p-power chart is Kummer in characteristic p as well.
- `zero_power`: The map ℕ→ℕ, 1↦0 sends 0 and 1 to the same element, so it is not Kummer.
  `Suggested.lean` proves this failure of injectivity.

**Log fiber products.** An ordinary log fiber product uses the underlying scheme fiber product with
the associated log structure of the pushout of the two pulled-back log sheaves. The integral log
fiber product applies integralization, and the fs fiber product applies saturation in the category
of fs log schemes, including the induced underlying scheme modification. The three universal
properties are distinct.

The API:

- `LogCrystalline.logFiberProduct.projections`: The two projections commute over the base.
- `LogCrystalline.logFiberProduct.lift`: Maps from a log scheme, integral log scheme or fs log
  scheme factor uniquely through the respective fiber product.
- `LogCrystalline.logFiberProduct.strict_underlying`: A base change along a strict map has the
  ordinary underlying fiber product and pulled-back log structure.

*Proof sketch.* Form ordinary pushouts and logify. Integralize using the image in groupification;
saturate with the corresponding monoid-algebra base change rather than keeping the underlying scheme
by fiat. ([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
§1.6, p.195; Proposition 2.7 and §2.8, p.199; [Beilinson, *On the crystalline period
map*](https://arxiv.org/abs/1111.3316v4), §1.1, integral log fibre products, pp.2–3.) *Needs:*
*Associated log structures*; *Inverse image log structures*; *Integral monoids*; *Saturated
monoids*.

**Checks.**

- `over_trivial`: Products of toric charts over the trivial base use the product monoid.
- `identity`: Base change along the identity gives the original log scheme.
- `saturation_changes`: The pushout of two root charts ℕ→ℕ need not be saturated; saturation can
  change the underlying scheme.
- Fine log fiber products need not be saturated.

### CR.5:log-algebra.3 Log smoothness

**Log smooth morphisms.** A morphism of fine log schemes locally of finite presentation is log
smooth if it has étale-local lifts against exact closed immersions defined by square-zero ideals.
Log étale means unique lifts. In the integral quasi-coherent setting use fine models (*Log
smoothness by fine models*), not the finite chart hypothesis on the non-fine base.

The API:

- `LogCrystalline.IsLogSmooth.lift`: Every exact square-zero lifting diagram admits an étale-local
  lift.
- `LogCrystalline.IsLogSmooth.strict_iff`: For strict morphisms log smooth equals ordinary smooth.
- `LogCrystalline.IsLogSmooth.compose`: Log smooth morphisms compose.

*Proof sketch.* Specify exact square-zero test immersions and the étale-local lifting diagram.
Verify independence of charts and reduce strict cases to the ordinary lifting property. ([Kato,
*Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
§3.1–3.3, pp.200–201; square-zero exact test diagrams.) *Needs:* *Strict morphisms*; *Exact
morphisms*; *Log fiber products*; Mathlib `CategoryTheory.HasLiftingProperty`.

**Checks.**

- `semistable`: The standard chart x₁⋯x_r=π with diagonal ℕ→ℕ^r is log smooth.
- `identity`: A log identity is log smooth and log étale.
- `torsion_obstruction`: The p-th-root chart in characteristic p fails the log smooth criterion.
- Standard semistable charts are log smooth.

**Kato chart criterion.** A fine morphism f:X→Y is log smooth (respectively log étale) exactly when
étale locally it admits a chart Q→P such that ker(Q^gp→P^gp) and the torsion part of the cokernel
(respectively the entire cokernel) are finite of orders invertible on X, and `X→Y×_{Specℤ[Q]}Specℤ[P]`
is étale. For log smoothness one may instead require this last map smooth. These hypotheses do not
assert integrality or saturation. As a corollary, an integral log smooth morphism of fine
log schemes is flat on underlying schemes, using the injective integral chart refinement and
monoid-algebra flatness of *Integral morphisms*.

*Proof sketch.* Use the chart infinitesimal lifting argument and invert the indicated finite group
orders. For the converse obtain local charts and separate the free cokernel directions; apply the
ordinary étale or smooth lifting criterion. ([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
Theorem 3.5 and Remark 3.6, p.202; proof §3.13, pp.204–205; Corollary 4.5, p.209.)
*Needs:* *Log smooth morphisms*; *Log charts*; *Integral morphisms*.

**Checks.**

- For ℕ→ℕ^r diagonal the cokernel is free of rank r−1 and the standard semistable map is log smooth.
- For strict fine morphisms the criterion reduces to ordinary smoothness.
- In characteristic p the p-root chart has noninvertible p-torsion cokernel and fails the criterion;
  the diagonal integral semistable chart gives an underlying flat morphism.

**Kummer étale morphisms.** An fs log morphism is Kummer étale if its characteristic maps are
Kummer and it is log étale. For the standard root-cover chart ℕ→ℕ, 1↦n, n≥1, with underlying
scheme the corresponding monoid-algebra base change, this holds exactly when n is invertible on
the base. Log étaleness uses the finite cokernel ℤ/n and the identity map to the chart base change.

The API:

- `LogCrystalline.IsKummerEtale.kummer`: A Kummer étale map has Kummer characteristic maps.
- `LogCrystalline.IsKummerEtale.logEtale`: It is log étale.
- `LogCrystalline.IsKummerEtale.root_chart`: The standard root chart is Kummer étale under the
  invertibility hypothesis.

*Proof sketch.* Apply the Kato chart criterion to the root chart and its finite groupified
cokernel. In characteristic p the p-root obstruction follows from the same lifting criterion.
([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
Theorem 3.5 and Remark 3.6, p.202; [Temkin, *Tame distillation and desingularization by
p-alterations*](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n1-p03-p.pdf),
§1.2.7, pp.99–100.) *Needs:* *Kummer morphisms*; *Kato chart criterion*; *Log fiber products*.

**Checks.**

- `root_prime_to_p`: In characteristic p the n-root chart is Kummer étale for n prime to p.
- `p_root`: The p-root chart in characteristic p is Kummer and fails log étaleness.
- `identity`: The n=1 root chart is the log identity, hence Kummer étale.

**Base change of logarithmic morphisms.** Strict, log smooth and log étale morphisms are stable
under log base change; integral morphisms are stable under integral base change, exact fine
morphisms under fine log base change, and Kummer étale fs morphisms under fs base change. In each
category use its stated fiber product. The chart torsion-order invertibility remains a hypothesis,
not a consequence of saturation.

*Proof sketch.* Apply lifting diagrams to log smooth and strict maps. For exactness, integrality and
Kummer maps use the characteristic pushout in the correct category and the chart criterion. ([Kato,
*Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
§2.8, p.199; §3.9–3.12, pp.203–204; §4.3–4.8, pp.208–210; [Temkin, *Tame distillation and
desingularization by
p-alterations*](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n1-p03-p.pdf),
§1.2.7, Kummer étale maps, pp.99–100.) *Needs:* *Log fiber products*; *Strict morphisms*; *Exact
morphisms*; *Integral morphisms*; *Kummer morphisms*; *Kato chart criterion*.

**Checks.**

- Prime-to-p root covers stay Kummer étale after fs pullback; p-root covers do not gain étaleness.

### CR.5:log-algebra.4 Divisorial log structures and log regularity

**Divisorial log structures.** Let X be a regular noetherian scheme, D ⊂ X a strict normal crossings
divisor (an effective Cartier divisor that at each of its points x is cut out by x₁⋯x_r for part x₁,
…, x_r of a regular system of parameters of `O_{X,x}`), and j : U = X ∖ D → X. Define M_D = O_X ∩
j_*O_U^× as an étale sheaf of multiplicative monoids. Étale locally at a point lying on s branches
of D, the local equations give an fs chart ℕ^s → O_X. Mathlib has no normal crossings predicate at
the pin; the predicate is the Stacks Project definition and is stated here with its unit-change
invariance.

The API:

- `LogCrystalline.divisorialLog.sections`: M_D(V) consists of regular functions on V invertible on
  V∩U.
- `LogCrystalline.divisorialLog.boundary_chart`: Boundary local equations yield the chart ℕ^s→O_X.
- `LogCrystalline.divisorialLog.unit_change`: Replacing each local equation by a unit multiple
  yields the same associated log structure.

*Proof sketch.* Use the local equations of D and the open complement U. Use regular local
factorization to identify sections invertible off D with units times boundary powers; descend the
chart under changes of equations. ([Temkin, *Tame distillation and desingularization by
p-alterations*](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n1-p03-p.pdf),
§1.2.7, pp.99–100, SNC log structure and cusp non-example; [Nizioł, *Toric singularities:
log-blow-ups and global resolutions*](https://webusers.imj-prg.fr/~wieslawa.niziol/resol7.pdf),
Proposition 2.6 and proof, pp.4–5; [Stacks Project](https://stacks.math.columbia.edu), Étale
Morphisms of Schemes, Definition 41.21.1 (tag 0BI9), strict normal crossings divisor.) *Needs:*
*Étale log structures*; *Log charts*; *Saturated monoids*.

**Checks.**

- `empty_boundary`: For D empty, M_D=O_X×.
- `coordinate_crossing`: For xy=0 as boundary in A², the origin has characteristic ℕ².
- `cusp_failure`: On Spec k[t²,t³] the boundary log structure at t=0 is not the regular SNC fs
  construction.
- Changing local boundary equations by units leaves M_D canonically unchanged.

**Log regular schemes.** For a locally noetherian fs log scheme and geometric stalk at x, let I_x be
the ideal generated by α(M_x∖O_x×). It is log regular at x if O_x/I_x is regular and dim
O_x=dim(O_x/I_x)+rankℤ(M_x^gp/O_x×). Require this at every point. This agrees with regularity for
the trivial log structure; the hypotheses are part of the definition.

The API:

- `LogCrystalline.IsLogRegular.boundary_ideal`: The defining ideal is generated by nonunit log
  sections.
- `LogCrystalline.IsLogRegular.dimension`: Log regularity supplies the regular quotient and the
  displayed rank formula.
- `LogCrystalline.IsLogRegular.trivial_iff`: With the trivial log structure, log regularity is
  ordinary regularity.

*Proof sketch.* Use the characteristic group rank and the ideal of nonunit log sections. Check the
dimension equality in a boundary parameter chart, and use regular local rings for SNC pairs.
([Nizioł, *Toric singularities: log-blow-ups and global
resolutions*](https://webusers.imj-prg.fr/~wieslawa.niziol/resol7.pdf), Definition 2.2, pp.2–3;
Proposition 2.6, p.5.) *Needs:* *Characteristic monoids*; *Saturated monoids*.

**Checks.**

- `regular_trivial`: A regular scheme with trivial log structure is log regular.
- `coordinate_crossing`: For the standard toric chart on A² at the origin, dim=0+2.
- `nodal_trivial`: The nodal ring k[x,y]/xy with trivial log structure is not log regular.

**Log smoothness over log regular schemes.** Let f:(X,M)→(Y,N) be a log smooth morphism of fs log
schemes whose underlying schemes are locally noetherian. If (Y,N) is log regular, then (X,M) is log
regular. The fs and noetherian hypotheses are retained; this is not a theorem about arbitrary
non-fine valuation-log formal schemes.

*Hypotheses.* Fine saturated log structures, locally noetherian underlying schemes, and log smooth
structural morphism.

*Proof sketch.* Use the Kato chart criterion to reduce to a smooth morphism over the toric base
change defined by a chart Q→P. Apply Kato’s local completed-ring and rank calculation for log
regularity, and preserve the regular quotient and dimension formula through smooth/étale
localization. Thompson Theorem 3.14 states the result but refers to Kato for the proof; that proof
is part of this target. Kato’s theorem that log smooth morphisms preserve log regularity (Thompson,
Theorem 3.14, referring to Kato, *Toric singularities*, Theorem 8.2) is proved here by the local
completed-ring argument. ([Thompson, *Toric singularities
revisited*](https://arxiv.org/abs/math/0305441v2), §3.5, Theorem 3.14, p.32; citing Kato Toric
singularities, Theorem 8.2.) *Needs:* *Log regular schemes*; *Kato chart criterion*.

**Checks.**

- A strict smooth morphism over a regular scheme with trivial log structure recovers ordinary
  preservation of regularity.
- The toric coordinate crossing boundary on smooth affine space satisfies the rank formula after the
  log smooth chart.

**Componentwise branch purity.** Prove `Crystalline.etale_of_genericallyEtale_codimOne`, the
componentwise adapter to PurityOfBranchLocus §2.2 `Scheme.Hom.etale_of_etaleAt_codimOne`: let
`f:X→Y` be a finite morphism from a normal scheme X to a regular integral locally noetherian
scheme Y such that every irreducible component of X dominates Y and is étale over Y at its generic
point. If f is unramified at every codimension-one point of X, then f is étale. When X is integral
this is the supplied corollary; the adapter covers finite normalizations with disconnected source.
For each component X_i, the dominance and generic-étaleness assumptions give a finite separable
extension `K(Y)→K(X_i)`.

*Hypotheses.* Finiteness, normal source, regular integral locally noetherian target, dominance and
generic étaleness of every irreducible component of the source, and unramifiedness at every
codimension-one source point.

*Proof sketch.* Being finite over Y, X is locally noetherian; being normal, it is the disjoint
union of open and closed normal integral subschemes. The restriction of f to each of them is
finite, dominant and generically étale, and its codimension-one points are those of X lying in
it, with the same stalks. For a morphism locally of finite type, unramifiedness at a point is
formal unramifiedness of the stalk map. Apply the supplied §2.2 corollary to each restriction;
its generic-étaleness hypothesis handles the dimension-zero stalks. Étaleness is local on the
source. ([Stacks,
Lemma 28.7.7](https://stacks.math.columbia.edu/tag/033N), normal locally noetherian schemes as
disjoint unions of normal integral schemes; [Lemma
58.21.4](https://stacks.math.columbia.edu/tag/0BMB), the pointwise purity behind the supplied
corollary.) *Needs:* PurityOfBranchLocus §0.1 (stalk form of unramifiedness) and §2.2
(`Scheme.Hom.etale_of_etaleAt_codimOne`); SchemeAndStackFoundations §0.30 (normal schemes).

**Checks.**

- For a finite family of finite separable field extensions `L_i/K`, the morphism
  `⨿_i Spec L_i→Spec K` is finite étale; the codimension-one condition is empty on every
  component and separability supplies generic étaleness.
- Over a field k of characteristic ≠ 2, `Spec k[x,y]/(y²−1)→Spec k[x]` has source the disjoint
  union of two copies of `𝔸¹_k` (`y=±1`), normal but not integral, so the supplied corollary does
  not apply to it directly; each component maps isomorphically and the map is étale.
- For every prime p, including 2, let `K=𝔽_p(t)` and `L=K[u]/(u^p−t)`. Both spectra are regular
  and zero-dimensional, so the codimension-one condition is empty, but `Ω¹_(L/K)=L du≠0`.
  The map is not étale; generic étaleness is necessary.
- Over a characteristic-zero field k, `Spec k[t]→Spec k[x]`, `x↦t²`, is finite dominant and
  generically étale between regular schemes, but `Ω¹_(k[t]/k[x])=k[t]/(t)·dt`. It is ramified at
  the codimension-one point `t=0` and is excluded by the unramifiedness hypothesis.
- `𝔸¹_k ⊔ Spec k→𝔸¹_k`, the identity on the first component and the origin on the second, is
  finite, unramified, and an isomorphism over the dense open `𝔸¹_k∖{0}`, but is not flat at the
  isolated point. The second component does not dominate, so the hypothesis must be imposed at
  the generic point of every source component, not over a dense open of the target.

**The classical Abhyankar lemma.** Let X = Spec A be a regular local scheme with residue
characteristic p ≥ 0, f₁, …, f_r part of a regular system of parameters, D = Σ div(f_i) the strict
normal crossings divisor they cut out, and U = X ∖ Supp D. For integers n_i ≥ 1 put
`X′ = X[T₁, …, T_r]/(T₁^{n₁} − f₁, …, T_r^{n_r} − f_r)` and U′ = U ×_X X′. Then X′ is regular and U′ is the
complement of the strict normal crossings divisor Σ div(T_i); if every n_i is prime to p, U′ → U is
a connected finite étale cover, tamely ramified along D. Conversely, let V → U be a finite étale
cover tamely ramified along D, and let n_i be the least common multiple of the orders of the inertia
groups of V at the generic point of div(f_i). Then every n_i is prime to p, and V ×_U U′ extends
uniquely, up to unique isomorphism, to a finite étale cover of X′. When X is strictly local, every
connected tamely ramified cover of U is a quotient of such a U′, and the tame fundamental group of U
is canonically `∏_{ℓ≠p} ℤ_ℓ(1)^r`.
For strictly local `X`, the covers `U′` for all tuples `(n_i)` prime to `p` form the compatible
tame Kummer tower: when `m_i ∣ n_i` for every `i`, the transition to the `m`-tuple sends its root coordinate to
`T_i^{n_i/m_i}`. Its inverse limit is a universal tame pro-cover; its automorphism group is
`lim_(n_i) ∏_i μ_{n_i} = ∏_{ℓ≠p} ℤ_ℓ(1)^r`, with the transition maps on roots of unity given by
the same powers.

*Proof sketch.* Regularity of X′: its local ring is finite and flat over A with maximal ideal
generated by T₁,…,T_r,g_(r+1),…,g_d, where f₁,…,f_r,g_(r+1),…,g_d is a regular system
of parameters of A. The extension has dimension d, so these d generators make it regular. Étaleness of U′ when the n_i
are prime to p: the f_i are units on U. For the extension statement, uniqueness holds because X′ is
normal (the extension is the normalisation of `X′` in `V ×_U U′`). AbhyankarLemma §0.3 supplies
the DVR extension at codimension-one points; its §1.1 supplies the tame-cover predicate.
After spreading out these extensions, LocalPurity §§2.1–2.2 extends uniquely across the remaining
complement, whose points have codimension at least two in the regular scheme `X′`. For the finite
normalization, *Componentwise branch purity* applies the supplied
`Scheme.Hom.etale_of_etaleAt_codimOne` to each normal integral component. Every component dominates
`X′` and is generically étale, because over the dense open `U′` the normalization is the finite
étale `V ×_U U′`.
Primality of the n_i to p is proved
by contradiction with a descent argument along X[T₁]/(T₁^p − f₁) on the strictly henselian local
scheme. Over a strictly local `X`, the action of `μ_{n₁} × ⋯ × μ_{n_r}` on `U′` is compatible with
the tower transitions; cofinal domination of connected tame covers makes the inverse limit
universal and gives the full tame fundamental group ([SGA 1](https://arxiv.org/abs/math/0206203), Exposé XIII, Appendice I, Proposition
5.1, Proposition 5.2 (absolute Abhyankar lemma) and Corollaire 5.3, pp. 314–316 of the arXiv
edition). *Needs:* Mathlib `IsRegularLocalRing` and `Algebra.Etale`; the strict normal crossings
divisor of *Divisorial log structures*; LocalPurity §§2.1–2.2 (regular-local purity, spreading out
and codimension-two cover extension); *Componentwise branch purity* (PurityOfBranchLocus §2.2);
AbhyankarLemma §§0.1–0.3, 1.1 and 3.3–3.4 (DVR tameness and Abhyankar, codimension-one
tame covers, regular-divisor local structure and normalization).

**Checks.**

- `abhyankar_root_cover_regular`: for A = k⟦x, y⟧ with D = div(x), n = 2 and p ≠ 2, X′ = Spec k⟦t,
  y⟧ with t² = x has maximal ideal (t,y), dimension two, and is regular; U′ → U is a
  degree-two étale cover. The boundary parameter t alone does not generate the maximal ideal.
- `abhyankar_wild_fails`: for A = 𝔽_p⟦x⟧ and the Artin–Schreier cover V : z^p − z = 1/x of U = Spec
  𝔽_p((x)), the inertia order is p, so V is not tamely ramified and no root cover T^n = x with n
  prime to p makes V ×_U U′ extend to an étale cover; tameness cannot be dropped.
- `abhyankar_tame_pi1`: for X strictly local of dimension one (a strictly henselian discrete
  valuation ring) and r = 1, the tame fundamental group of the punctured spectrum is `∏_{ℓ≠p} ℤ_ℓ(1)`.
- For `A = k⟦x,y⟧` with `k` separably closed of characteristic `p` and `D = V(xy)`, the compatible
  prime-to-p root covers of `x` and `y` give `∏_{ℓ≠p} ℤ_ℓ(1)^2`. The divisor `D` is singular at the
  closed point, so the regular-divisor theorem alone does not cover this SNC example.

**Logarithmic Abhyankar lemma.** Let X be regular noetherian with SNC boundary D, U=X∖D, and V→U a
finite étale cover whose normal finite extension Y→X is tamely ramified along D. With the divisorial
fs log structures, Y→X is Kummer étale and Y is log regular. Étale locally the cover is dominated by
adjoining n_i-th roots of boundary parameters with each n_i invertible; if a Galois cover is used,
its inertia orders satisfy these prime-to-residue-characteristic conditions. Do not replace tameness
by arbitrary ramification.

*Proof sketch.* Apply *The classical Abhyankar lemma* to obtain, étale locally, domination of the
cover by a root cover `X[T₁, …, T_r]/(T_i^{n_i} − f_i)` with each n_i invertible. On a dominating root
chart use the Kummer étale criterion, then descend the fs log structure and log regularity. Temkin
uses this as an application of the classical lemma without writing out the logarithmic descent; that
descent is part of this target, and the log regularity of Y uses Kato’s theorem that log smooth
morphisms preserve log regularity (*Log smoothness over log regular schemes*). ([Temkin, *Tame
distillation and desingularization by
p-alterations*](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n1-p03-p.pdf),
Theorem 4.2.1 proof, Steps 9–10 inherited from IT14b, p.123; §1.2.7.) *Needs:* *Divisorial log
structures*; *Log regular schemes*; *Kummer morphisms*; *Kato chart criterion*; *The classical
Abhyankar lemma*.

**Checks.**

- The n-th root map on the punctured line extends to a Kummer étale log cover when n is invertible,
  whereas a wildly ramified p-root map does not.

### CR.5:log-algebra.5 Integral quasi-coherent log schemes

**Integral quasi-coherent log schemes.** An integral quasi-coherent log scheme has an integral log
structure étale locally admitting a chart by an arbitrary integral monoid. Quasi-coherent does not
require finite generation. The corresponding log formal scheme has an étale log structure on an adic
formal scheme compatible with restriction to its reductions. Over a fine base, finite chart data can
be approximated by fine submonoids.

The API:

- `LogCrystalline.QCLogScheme.chart`: Étale locally there is an arbitrary integral chart.
- `LogCrystalline.QCLogScheme.fine_inclusion`: Every fine log scheme is integral quasi-coherent.
- `LogCrystalline.QCLogScheme.integral_limits`: Finite limits exist after applying integralization
  to the ordinary log limit.

*Proof sketch.* Use arbitrary integral charts and the same associated-log construction. For formal
schemes use their sites and reductions (AdicSpacesPartIII Layer F0) and specify compatible chart
data. ([Beilinson, *On the crystalline period map*](https://arxiv.org/abs/1111.3316v4), §1.1,
pp.2–3; [Binda–Kato–Vezzani, *On the p-adic weight-monodromy conjecture for complete intersections
in toric varieties*](https://arxiv.org/abs/2207.00369v2), §2.1, conventions before Definition 2.1,
pp.5–6.) *Needs:* *Integral monoids*; *Log charts*; *Log fiber products*; AdicSpacesPartIII F0.3
(*Formal schemes and locally noetherian formal schemes*).

**Checks.**

- `fine_case`: The fine log point embeds in the quasi-coherent category without changing its log
  structure.
- `rational_log_point`: ℚ≥0→k, positive elements↦0, defines a non-fine integral quasi-coherent log
  structure.
- `coherence_failure`: The rational log point has no finitely generated characteristic chart.
- The characteristic monoid ℚ≥0 gives an integral quasi-coherent log point that is not fine.

**Vertical logarithmic morphisms.** A morphism f:X→S of integral log schemes is vertical if the
sheaf cokernel of f⁻¹M_S→M_X in commutative monoids is a sheaf of groups. Equivalently on an
additive chart h:Q→P, for every p∈P there exist p′∈P and q∈Q with p+p′=h(q). Vertical is distinct
from strict and from saturated.

The API:

- `LogCrystalline.IsVertical.cokernel_group`: The quotient by the base monoid is a group.
- `LogCrystalline.IsVertical.comp`: Vertical morphisms compose.
- `LogCrystalline.IsVertical.base_change`: Verticality is stable under integral pullback and
  generic-fiber restriction.

*Proof sketch.* Form the monoid cokernel by killing the base image. Use the group criterion p+p′
lying in the base image to prove composition and pushout stability. ([Binda–Kato–Vezzani, *On the
p-adic weight-monodromy conjecture for complete intersections in toric
varieties*](https://arxiv.org/abs/2207.00369v2), Definition 2.3 and Remark 2.4, pp.6–7.) *Needs:*
*Integral quasi-coherent log schemes*; *Inverse image log structures*.

**Checks.**

- `diagonal`: For ℕ→ℕ^r diagonal, each vector has a complementary vector making all coordinates
  equal.
- `identity`: Identity morphisms are vertical.
- `horizontal_boundary`: The chart 0→ℕ is not vertical; its quotient is ℕ, not a group.
- The semistable diagonal ℕ→ℕ^r is vertical.

**Log smoothness by fine models.** A morphism of integral quasi-coherent log (formal) schemes is log
smooth in the Binda–Kato–Vezzani sense if étale locally it is the integral log base change of a log
smooth morphism over a fine log structure M₀→M_S on the same base. This is the explicit finite-model
condition, not a claim that arbitrary infinite charts satisfy Kato finite-presentation criteria.

The API:

- `LogCrystalline.QCLogSmooth.fine_model`: Étale locally the morphism has the stated fine model.
- `LogCrystalline.QCLogSmooth.fine_compatibility`: In the fine category this notion agrees with fine
  log smoothness.
- `LogCrystalline.QCLogSmooth.base_change`: Integral quasi-coherent base change preserves this
  finite-model log smoothness.

*Proof sketch.* Choose a fine base log structure and a fine log smooth model. Take integral log base
change and allow étale localization; compare the definition with fine log smoothness.
([Binda–Kato–Vezzani, *On the p-adic weight-monodromy conjecture for complete intersections in toric
varieties*](https://arxiv.org/abs/2207.00369v2), Definition 2.1, pp.5–6.) *Needs:* *Integral
quasi-coherent log schemes*; *Log smooth morphisms*; *Log fiber products*.

**Checks.**

- `identity`: The identity on a quasi-coherent log scheme has a fine identity model locally.
- `valuation_base_change`: Base-changing ℕ→ℕ^r to ℚ≥0 gives a log smooth integral quasi-coherent
  chart.
- `infinite_chart_warning`: The strict projection Spec(k[ε]/ε²) with pulled-back ℚ≥0 log structure
  to the ℚ≥0 log point is not log smooth: its underlying dual-number algebra is not smooth.
- Semistable diagonal charts survive integral base change to the valuation monoid.

**Descent of finite data to a fine model.** For integral quasi-coherent S and X,X′ log smooth over S
in the finite-model sense, every S-morphism X→X′ étale locally descends to a morphism of log smooth
fine models over a common fine base log structure M_i→M_S. A chart M_∞ is a filtered colimit of fine
submonoids, and finite presentation of the fine source chart permits descent of its chart map. No
global fine model is asserted.

*Proof sketch.* Choose common fine source and target models by combining their finite base charts.
Factor the finite chart map through a sufficiently large fine submonoid of the base chart, then take
integral pushouts and the étale model. ([Binda–Kato–Vezzani, *On the p-adic weight-monodromy
conjecture for complete intersections in toric varieties*](https://arxiv.org/abs/2207.00369v2),
Proposition 2.2 and its proof, pp.6–7.) *Needs:* *Log smoothness by fine models*; *Fine monoids*;
*Log fiber products*.

**Checks.**

- A finite list of source and target chart generators descends together.

### CR.5:log-algebra.6 Valuation log structures and semistable formal charts

**Valuation log structures and tilt charts.** For a nonarchimedean field K define O_K^×log by the
associated log structure of O_K∖{0}→O_K, and let k⁰ be its log pullback to the residue field. Its
characteristic is the nonnegative valuation monoid. If K is perfectoid, the sharp map of
PerfectoidSpaces Layer P1, `O_{K♭}∖{0}→O_K` induces the same characteristic and a chart of this log
structure; the two residue log structures are canonically identified. For C the completed algebraic
closure of a discretely valued field, this characteristic is ℚ≥0 after fixing the valuation scale.

The API:

- `LogCrystalline.valuationLog.characteristic`: The characteristic is the monoid of nonnegative
  values.
- `LogCrystalline.valuationLog.tilt_chart`: The sharp map gives the stated tilt chart.
- `LogCrystalline.valuationLog.residue_iso`: The K and K♭ residue log structures are canonically
  isomorphic.

*Proof sketch.* Quotient nonzero integral elements by units to obtain the valuation monoid. Take the
tilt `O_{K♭}` and the sharp map from PerfectoidSpaces Layer P1; the sharp map induces a bijection of
value monoids, which identifies the two logifications. ([Binda–Kato–Vezzani, *On the p-adic
weight-monodromy conjecture for complete intersections in toric
varieties*](https://arxiv.org/abs/2207.00369v2), Notation 2.5 and Lemma 2.6, p.7.) *Needs:*
*Integral quasi-coherent log schemes*; *Inverse image log structures*; PerfectoidSpaces Layer P1
(*Fontaine's θ: W(S♭+) → S+ is surjective with kernel generated by a primitive nonzerodivisor*,
§1.18).

**Checks.**

- `dvr`: For a DVR with chosen π, the valuation chart is ℕ, 1↦π.
- `completed_algebraic_closure`: For C the residue characteristic monoid is ℚ≥0.
- `residue_not_trivial`: Reduction of the valuation log structure retains its positive-value
  characteristic.
- The residue log structure is nontrivial even though every positive-valuation element maps to zero.

**Log structures on semistable formal charts.** For a complete mixed-characteristic DVR O_K, a
semistable formal chart is Spf(O_K⟨x₁,…,x_d⟩/(x₁⋯x_r−π)), 1≤r≤d, with base chart ℕ→O_K, 1↦π, source
chart ℕ^r→A, e_i↦x_i, and diagonal ℕ→ℕ^r. Over O_C use integral log base change from a finite DVR
extension model. This is vertical and log smooth; its log structure agrees with the functions
invertible on the generic fiber on the stated regular semistable models.

The API:

- `LogCrystalline.formalSemistableLog.chart`: The source and base charts have the displayed diagonal
  structural map.
- `LogCrystalline.formalSemistableLog.special_fibre`: Reduction gives the same diagonal chart with
  x₁⋯x_r=0 and base generator mapping to zero.
- `LogCrystalline.formalSemistableLog.base_change`: Integral base change to O_C retains log
  smoothness and verticality.

*Proof sketch.* Build the diagonal chart and use the chart criterion. Apply the formal site and
completed coordinate ring of AdicSpacesPartIII Layers F0 and R2; transfer the chart by integral base
change. Use the log-regular boundary description to identify the generic-fiber-unit log structure,
restricted to the source hypotheses. Beilinson supplies the uniquely p-divisible finite-level lift,
Česnavičius–Koshikawa the period-base chart, and Binda–Kato–Vezzani and Nizioł the formal divisorial
identification; the extension from noetherian fine log regularity to the non-noetherian O_C formal
boundary is proved here under the finite-model hypotheses of the sources. ([Binda–Kato–Vezzani, *On
the p-adic weight-monodromy conjecture for complete intersections in toric
varieties*](https://arxiv.org/abs/2207.00369v2), Definition 2.7 and Remark 2.8, pp.7–8; [Koshikawa,
*Logarithmic prismatic cohomology I*](https://arxiv.org/abs/2007.14037v3), Appendix A, §A.1 Examples
(1)–(2), p.50.) *Needs:* *Valuation log structures and tilt charts*; *Log smoothness by fine
models*; *Vertical logarithmic morphisms*; *Divisorial log structures*; AdicSpacesPartIII F0.3
(*Formal schemes and locally noetherian formal schemes*); AdicSpacesPartIII R2.2 (*Admissible formal
O_K-schemes*).

**Checks.**

- `smooth_case`: For r=1 the relation x₁=π leaves the pulled-back base log structure and ordinary
  smooth remaining coordinates.
- `node`: For xy=π the closed-fiber crossing has characteristic ℕ² over the diagonal ℕ.
- `forget_log`: The nodal reduction with trivial log structure does not have the semistable log
  smooth map.
- Changing a local chart by multiplying a parameter by a unit preserves the associated log
  structure.

### Examples

- The standard log point `k^log` has characteristic monoid `ℕ`; the log structure of `xy = 0` in
  `𝔸²` at the origin, from the chart `ℕ² → k[x, y]/(xy)`, is fine and saturated but the morphism to
  `k^log` given by the diagonal `ℕ → ℕ²` is not strict.
- The monoid `{0, 2, 3, 4, …} ⊂ ℕ` is fine but not saturated (`2·1 ∈` it while `1 ∉` it); its monoid
  algebra is the cusp `k[t², t³]`.

### Dependencies

EnhancedDerivedSheaves (Layer E1); AdicSpacesPartIII (F0.3, R2.2); PerfectoidSpaces (Layer P1);
Mathlib.

## Layer CR.5: Logarithmic differentials and log crystalline cohomology

This layer builds log crystalline cohomology: log differentials and log de Rham complexes with the
semistable chart formula and residues, morphisms of Cartier type and the log Cartier isomorphism,
exactification of log immersions, log PD envelopes and thickenings, the log crystalline site and its
crystals, log stratifications and connections, the log Poincaré lemma and descent along embedding
systems, derived p-adic log crystalline cohomology, and the log structure on `A_cris`.

### CR.5.1 Log differentials, residues and the Cartier isomorphism

**Logarithmic differentials.** For a prelog ring map (A,Q)→(B,P), use the universal affine log
differential module of DerivedDeRhamCohomology §6.20 (*Shared free-prelog and cotangent
constructors*), identified there with H⁰ of `DerivedDeRham.gabberLogCotangent` by
`DerivedDeRham.logCotangentH0`. Its presentation is `(Ω¹_{B/A}⊕B⊗ℤP^gp)` modulo
dα(p)−α(p)⊗p and the images of Q^gp. Its maps d:B→Ω¹ and dlog:P→(Ω¹,+) represent pairs
consisting of an A-derivation D and a monoid-to-additive-group map δ with Dα(p)=α(p)δ(p) and δ(Q)=0.
This target owns étale sheafification on log schemes and the natural identification of its
affine-chart sections with that supplied module, preserving d and dlog. The identification
commutes with logification and the canonical base-change maps; for a pushout of prelog rings
the usual base-change isomorphism is the supplied one. Logification leaves the module unchanged.

The API:

- `LogCrystalline.logDifferentials.dlog_mul`: dlog(pq)=dlog(p)+dlog(q).
- `LogCrystalline.logDifferentials.d_alpha`: d(α(p))=α(p)dlog(p).
- `LogCrystalline.logDifferentials.lift`: Log derivation pairs correspond uniquely to B-linear maps
  from Ω¹_log.

*Proof sketch.* Transport the universal affine module along the prelog-category identification
of CR.5:log-algebra.1. Its universal d,dlog identify it with the displayed quotient, using the
pinned ordinary Kähler module and groupification. Étale localization of the universal property
gives descent and the affine-chart identification; the same property makes the logification and
base-change diagrams commute. ([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
§1.7–1.8, pp.195–196; logification invariance and base-change formula.)
*Needs:* DerivedDeRhamCohomology §6.20 (*Shared free-prelog and cotangent constructors*);
*Prelog rings* (Layer CR.5:log-algebra); *Log charts* (Layer CR.5:log-algebra); Mathlib
`Algebra.GrothendieckGroup.lift`; Mathlib `KaehlerDifferential`; Mathlib `KaehlerDifferential.D`.

**Checks.**

- `trivial_log`: With trivial log structures Ω¹_log is the ordinary Kähler module.
- `toric_line`: For A[t] with t-chart over trivial A, Ω¹_log=A[t]dlog(t) and dt=t dlog(t).
- `log_point`: The standard log point over the trivial log point has Ω¹_log=k, although `Ω¹_{k/k}=0`.
- For a toric chart A[Q]→A[P], Ω¹_log=A[P]⊗ℤ(P^gp/Q^gp).
- On `(A,0)→(A[t,x],ℕ→x)`, the affine-chart identification sends the supplied generators to
  `dt,dlog x` and sends `dx` to `x dlog x`; after any base change `A→A′` the same formulas hold.
  Localizing at x identifies dlog x with x⁻¹dx, compatibly with logification.

**Log de Rham complexes.** Sheafify the ordinary exterior log dg construction supplied by
DerivedDeRhamCohomology §6.20 (*Shared logarithmic derived de Rham and Cartier theory*), using
the affine module of *Logarithmic differentials*. For a log morphism X→S, Ω^q_log=∧^q_O Ω¹_log and
d is the unique graded derivation extending ordinary d and satisfying d(dlog m)=0. The natural
affine-chart identification preserves d, dlog, exterior products and differential, and commutes
with logification and the canonical base-change maps. On free prelog inputs it is the ordinary
dg model used by the supplier's resolutions; its ordinary chart complex is distinct from the
realized raw derived log de Rham object on general inputs. For an integrable coefficient connection
∇ use F⊗Ω^q_log with differential ∇ extended by the graded Leibniz rule. The degree-zero term is O_X
or F; the complex is cohomological. This target owns the geometric sheafification and coefficient
extension; continuous forms and residues are the extensions specified below in CR.5.1.

The API:

- `LogCrystalline.logDeRham.degree_zero`: Ω⁰_log=O_X.
- `LogCrystalline.logDeRham.dlog_closed`: d(dlog m)=0.
- `LogCrystalline.logDeRham.base_change`: Log pullback induces a map of differential graded
  algebras.

*Proof sketch.* Sheafify the supplied ordinary affine dg model using the natural affine-chart
identifications of *Logarithmic differentials*. The uniqueness of the graded derivation
identifies the differentials on overlaps and under logification and base change. Exterior
products use Mathlib's alternating relations in all characteristics. Extend an integrable
coefficient connection by the graded Leibniz rule; integrability gives the square-zero identity.
([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
§1.9, p.196; coefficient complex Theorem 6.4, p.219.)
*Needs:* DerivedDeRhamCohomology §6.20 (*Shared logarithmic derived de Rham and Cartier theory*);
*Logarithmic differentials*;
EnhancedDerivedSheaves Layer E1 (*The enhanced derived category*);
Mathlib `ExteriorAlgebra`; Mathlib `ExteriorAlgebra.ι_sq_zero`.

**Checks.**

- `trivial_log`: For trivial log structures this is the ordinary de Rham complex.
- `relative_log_point`: The identity log point has only degree zero.
- `char_p_torus`: Over F_p the class dlog t on the torus is not the differential of a Laurent
  polynomial.
- The logarithmic generator dlog t is closed.
- On `(F₂,0)→(F₂[t,x],ℕ→x)`, the affine-chart identification preserves
  `dt∧dlog x` and `d(t dlog x)=dt∧dlog x`, while `(dlog x)²=0`; these identities persist
  under logification and base change.

**Semistable chart differential formula.** Let A=O_K[x₁,…,x_d]/(x₁⋯x_r−π), 1≤r≤d, with base ℕ→O_K,
1↦π, and source ℕ^r, e_i↦x_i. Relative to this log base, Ω¹_log is
`(⊕_{i≤r}Ae_i⊕⊕_{j>r}A dx_j)/A(e₁+⋯+e_r)`, with dlog x_i=e_i and dx_i=x_i e_i. It is free of rank d−1. The exterior powers
give the full relative log complex; the same formula holds continuously after adic completion with
its inherited chart.

*Proof sketch.* Apply the quotient definition of log differentials to the diagonal chart. The
polynomial relation differentiates to πΣe_i and is already killed by the stronger log-base relation
Σe_i=0. Eliminate e_r to obtain the free basis, then pass to continuous forms by the specified
completion. ([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
Example 3.7(2), pp.202–203; §1.7–1.8, pp.195–196; [Česnavičius–Koshikawa, *The A_inf-cohomology in
the semistable case*](https://arxiv.org/abs/1710.06145v3), §5.10, the continuous log de Rham
complex, pp.36–37.) *Needs:* *Logarithmic differentials*; *Log de Rham complexes*; *Log structures
on semistable formal charts* (Layer CR.5:log-algebra).

**Checks.**

- For xy=π, dlog y=−dlog x; for r=1 only dx₂,…,dx_d remain.

**Absolute semistable residue maps.** For the same semistable A, take log differentials relative to
the trivial log structure on O_K, denoted Ω_abs, not relative to O_K^log. Here
`Ω_abs=(A^r⊕A^{d−r})/A(πΣe_i)`. For the component D_i=(x_i=0), define res_i:Ω_abs→A/(x_i) by
res_i(e_j)=δ_ij and res_i(dx_j)=0 for j>r. It is well defined since π=0 on D_i. Individual res_i do
not factor through `Ω¹_{A/O_K^log}`, since res_i(Σe_j)=1. Exterior residues use the corresponding
component log forms and the signed wedge convention.

The API:

- `LogCrystalline.semistableResidue.coordinate`: res_i(dlog x_j)=δ_ij.
- `LogCrystalline.semistableResidue.ordinary`: res_i annihilates ordinary differentials dx_j,
  including dx_i=x_i dlog x_i.
- `LogCrystalline.semistableResidue.relative_obstruction`: res_i(Σ_j dlog x_j)=1; hence there is no
  induced individual residue on the relative log quotient.

*Proof sketch.* Retain the absolute relation πΣe_i instead of killing Σe_i. Define component
coefficient maps, check the defining relation vanishes on D_i, and extend to wedge residues with the
fixed sign. Compare the relative quotient to show why separate component coefficients cannot
descend. ([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
§1.7–1.9, pp.195–196 and Example 3.7(2), pp.202–203; coefficient projection on the absolute
presentation; [Disegni–Liu, *A p-adic arithmetic inner product
formula*](https://disegni-daniel.perso.math.cnrs.fr/AIPF.pdf), Appendix B.2, residue quotient and
diagram (B.7), PDF p.118.) *Needs:* *Semistable chart differential formula*; *Log de Rham
complexes*.

**Checks.**

- `node_absolute`: For xy=π, absolute res_x sends dlog x to 1 and dlog y to 0.
- `ordinary_zero`: An ordinary differential has zero residue.
- `relative_nonexample`: The proposed relative map dlog x↦1,dlog y↦0 violates dlog x+dlog y=0.

**Log structures under reduction and completion.** Reduction of a chart and adic completion mean
pullback of its actual associated log structure along the underlying ring or scheme map. For finite
semistable charts, the completed continuous log differential module is the inverse limit of the
quotient modules on finite reductions and has the semistable presentation. Reduction of π retains
the base generator with image zero. No statement identifies a completed complex with the derived
completion of an arbitrary coefficient complex without the completion hypotheses.

*Proof sketch.* Pull back and logify at every finite level. Use the finite free semistable
presentation for continuous differentials and the adic and derived completion of AdicSpacesPartIII
Layer F0 and DerivedModuleAlgebra §§1.3–1.5. ([Česnavičius–Koshikawa, *The A_inf-cohomology in the
semistable case*](https://arxiv.org/abs/1710.06145v3), §5.9–5.13, pp.36–38; [Koshikawa, *Logarithmic
prismatic cohomology I*](https://arxiv.org/abs/2007.14037v3), Appendix A, §A.1 Examples (1)–(2) and
base-change convention, p.50.) *Needs:* *Inverse image log structures* (Layer CR.5:log-algebra);
*Log structures on semistable formal charts* (Layer CR.5:log-algebra); *Semistable chart
differential formula*; DerivedModuleAlgebra (§1.3 *The derived completion reflector*).

**Checks.**

- The nodal special fiber retains diagonal ℕ→ℕ²; completing or reducing does not replace it by a
  trivial log structure.

**Morphisms of Cartier type.** For an integral log morphism f:X→S in characteristic p, Cartier type
means that f is integral and its relative Frobenius `X→X^(p)=X×_{S,F_S}S` is exact, using the fine
integral log fiber product. The absolute log Frobenius is the usual Frobenius on O and
multiplication by p on M. Log smoothness alone does not imply Cartier type.

The API:

- `LogCrystalline.IsCartierType.integral`: Cartier type implies the structural morphism is integral.
- `LogCrystalline.IsCartierType.relative_frobenius_exact`: The relative log Frobenius is exact.
- `LogCrystalline.IsCartierType.base_change`: Cartier type is stable under fine log base change.

*Proof sketch.* Use the supplied absolute and relative scheme Frobenius maps, and equip them
with the p-power map on log monoids and the integral log fibre-product structure.
Impose the two stated properties and verify them for the semistable diagonal chart. ([Kato,
*Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
§4.7–4.8, pp.209–210; [Hyodo–Kato, *Semi-stable reduction and crystalline cohomology with
logarithmic poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), §2.12, Cartier type,
pp.231–232.) *Needs:* SchemeAndStackFoundations §0.29
(`absoluteFrobenius`, `schemeFrobeniusTwist`, `relativeFrobenius`); *Integral morphisms* (Layer
CR.5:log-algebra); *Exact morphisms* (Layer CR.5:log-algebra); *Log fiber products* (Layer CR.5:log-algebra).

**Checks.**

- `semistable`: The diagonal ℕ→ℕ^r in characteristic p is of Cartier type.
- `smooth_trivial`: A smooth morphism with trivial log structures is of Cartier type.
- `root_counterexample`: For r>1 prime to p, the log smooth integral chart ℕ→ℕ, 1↦r over the log
  point on k[t]/t^r is not Cartier type.

**Logarithmic Cartier isomorphism.** Let f:X→S be fine log smooth of Cartier type in characteristic
p. Then `C⁻¹:Ω^q_{X^(p)/S,log}→H^q(F_{X/S,*}Ω^•_{X/S,log})` is an isomorphism for all q, with
`C⁻¹(da)=a^{p−1}da` and C⁻¹(dlog m)=dlog m, interpreted under the relative Frobenius coefficient
twist. It is compatible with products and base change. Exactness of relative Frobenius cannot be
omitted.

*Proof sketch.* Reduce by log smooth charts and étale localization to the monoid-algebra complex.
Use relative Frobenius exactness to identify the closed-form summands with the Frobenius twist;
combine the ordinary polynomial Cartier computation with logarithmic generators. ([Kato,
*Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
Theorem 4.12 and proof §4.13–4.14, pp.212–214.) *Needs:* *Morphisms of Cartier type*; *Log de Rham
complexes*; *Kato chart criterion* (Layer CR.5:log-algebra).

**Checks.**

- For a torus C⁻¹ fixes dlog t; the non-Cartier root chart fails the isomorphism.

### CR.5.2 Exactification and log PD envelopes

**Exactification of log immersions.** For a closed immersion of fine log schemes i:X→Y (underlying
closed and surjective pulled-back log map), étale locally on X factor i as X→Y^ex→Y, where the first
is exact closed and the second log étale. In a chart P→Q for i, use `P^ex=P^gp×_{Q^gp}Q`, followed by
the required local scheme base change. The exactification carries the source log structure on its
closed fiber; it is only locally canonical up to the refinements used by descent.

The API:

- `LogCrystalline.logExactification.factor`: The immersion factors through an exact closed immersion
  followed by a log étale map.
- `LogCrystalline.logExactification.source_log`: The log pullback to X agrees with its original log
  structure.
- `LogCrystalline.logExactification.refinement`: Two local exactifications admit common log étale
  refinements for PD descent.

*Proof sketch.* Construct the chart pullback P^ex and the monoid-algebra localization. Use the log
étale chart criterion and the closed-immersion unit adjustment; compare refinements rather than
assuming a global chosen exactification. ([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
Proposition 4.10(1), pp.210–211; §5.6–5.7, p.216.) *Needs:* *Exact morphisms* (Layer
CR.5:log-algebra); *Kato chart criterion* (Layer CR.5:log-algebra); *Log fiber products* (Layer
CR.5:log-algebra).

**Checks.**

- `already_exact`: An already exact immersion can use Y itself.
- `log_diagonal`: For the log affine-line diagonal the exactifying neighborhood contains the unit
  t₂/t₁ with value 1 on X.
- `ordinary_diagonal_failure`: The ordinary equation t₂−t₁ without a unit ratio does not model the
  logarithmic diagonal near the origin.
- The diagonal of the logarithmic affine line acquires the unit ratio t₂/t₁.

**Fine log PD envelopes.** Fix a PD base (S,L,I,γ) with fine L and O_S killed by a nonzero integer.
For a closed log immersion X→Y over S, X fine and Y coherent, Kato Proposition 5.3 constructs a
right adjoint to forgetting the compatible PD structure on an exact thickening. In general this
adjoint may replace X by X̃. In the fixed-source specialization require γ to extend to the source X;
then X̃≅X. Étale locally exactify, take *Compatible-base envelopes with fixed quotient*
(DerivedDeRhamCohomology §PD.6), and pull back the exactifying log structure. For an exact immersion
it is the ordinary PD envelope with inherited log structure.

*Hypotheses.* For the fixed-source factorization/API, the base PD structure extends to the source X.
Kato §5.5.2 prints Y in place of X; the source hypothesis is stated in Du–Moon–Shimizu,
Theorem 2.1(2) and footnote 2, pp.5–6.

The API:

- `LogCrystalline.logPDEnvelope.factor`: Under the source PD-extension hypothesis, the original
  source X embeds exactly into its log PD envelope.
- `LogCrystalline.logPDEnvelope.lift`: Every compatible exact PD thickening mapping to Y factors
  uniquely through the envelope.
- `LogCrystalline.logPDEnvelope.exact_case`: For an exact immersion the log envelope is the ordinary
  PD envelope with pulled-back log structure.

*Proof sketch.* Exactify and apply *Compatible-base envelopes with fixed quotient*
(DerivedDeRhamCohomology §PD.6). Check the universal property on exact PD test thickenings and
descend along étale refinements. ([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
Proposition 5.3, p.215; §§5.4–5.6, p.216; [Du–Moon–Shimizu, *On log crystalline higher direct
image*](https://arxiv.org/abs/2603.00559v1), Theorem 2.1(2) and footnote 2, pp.5–6, for the source
hypothesis.) *Needs:* *Exactification of log immersions*; *Compatible-base envelopes with fixed
quotient* (DerivedDeRhamCohomology §PD.6); *Inverse image log structures* (Layer CR.5:log-algebra);
Mathlib `DividedPowers`.

**Checks.**

- `identity`: If the base PD structure already extends to X, the envelope of X→X is X.
- `ambient_not_source`: Take A=F₂[e,h]/(e²,eh,h²), I=(e,h) and
  γ₂(ae+bh)=a²h, γ_n=0 for n≥3. With trivial log structures, Y=Spec A and X=V(e),
  the base powers extend to Y and cannot extend to X. Any compatible source-preserving envelope
  would have h=γ₂(e) in its defining ideal, although h is nonzero on X.
- `log_diagonal`: The log affine-line diagonal uses the divided powers of t₂/t₁−1.
- `ordinary_wrong`: The ordinary PD envelope using only t₂−t₁ is not the log envelope at t=0.
- For the log affine-line diagonal, the envelope is locally the PD polynomial ring k[t]⟨v⟩ with
  v=t₂/t₁−1.

**Quasi-coherent log PD envelopes.** Let (S,M_S,I,γ) be a quasi-coherent log PD base with p^nO_S=0.
For a locally closed embedding (Z,M)→(Y,N) of log S♯-schemes (so γ extends to both Z and Y) with M
integral quasi-coherent and N quasi-coherent, Beilinson constructs the log PD envelope in integral
quasi-coherent exact PD thickenings. Under the fine-base specialization this extends the fine
envelope. Construction uses chart approximations and logarithmic coordinate thickenings. It does not
prove an uncompleted envelope theorem over a base where p is not nilpotent.

*Hypotheses.* The source and ambient are log S♯-schemes in Beilinson §1.2: γ extends to their
extended base ideals.

The API:

- `LogCrystalline.qcLogPDEnvelope.exact_source`: The envelope has an exact PD source immersion.
- `LogCrystalline.qcLogPDEnvelope.lift`: Compatible exact integral quasi-coherent PD test
  thickenings have a unique factorization.
- `LogCrystalline.qcLogPDEnvelope.fine_case`: On fine charts this agrees with the fine log PD
  envelope.

*Proof sketch.* Reduce étale locally to chart embeddings and finite fine approximations. Construct
PD polynomial coordinates and logarithmic multiplicative coordinates, quotient by the chart
relations, then descend the right-adjoint universal property. For p-adic bases work levelwise before
taking the derived inverse limit; do not uncomplete the result. ([Beilinson, *On the crystalline
period map*](https://arxiv.org/abs/1111.3316v4), §1.3, pp.4–6; [Česnavičius–Koshikawa, *The
A_inf-cohomology in the semistable case*](https://arxiv.org/abs/1710.06145v3), Footnote 11, p.45 of
the version read.) *Needs:* *Integral quasi-coherent log schemes* (Layer CR.5:log-algebra); *Descent
of finite data to a fine model* (Layer CR.5:log-algebra); *Fine log PD envelopes*;
*Compatible-base envelopes with fixed quotient* (DerivedDeRhamCohomology §PD.6).

**Checks.**

- `fine_diagonal`: For a fine log diagonal the Beilinson and Kato envelopes coincide.
- `identity`: An identity embedding with compatible base PD structure has its identity envelope.
- `uncompleted_scope`: Over ZMod p with its zero PD ideal, the identity embedding of the integral
  quasi-coherent ℚ≥0 log point has that same non-fine log point as its envelope.
- At each p^n level the envelope extends the fine envelope on finite charts.

**Exact log PD thickenings.** Over a log PD base S with p^n=0, an object is an exact closed
immersion U→T of integral quasi-coherent log schemes over S, with a quasi-coherent PD ideal (J,δ)
defining U. Require γ to extend to T and U, and require γ and δ to extend jointly to divided powers
on J+IO_T. There is no assumption IO_T⊆J. J is nil in this setting; do not require a uniform
ordinary nilpotence bound absent in the source. Fine thickenings form the Kato special case.

The API:

- `LogCrystalline.LogPDThickening.ideal`: The thickening carries its actual defining PD ideal J.
- `LogCrystalline.LogPDThickening.exact_log`: The log structure pulled back to U is its given log
  structure.
- `LogCrystalline.LogPDThickening.pd_base`: The divided powers on J and IO_T have a common extension
  to J+IO_T; their restrictions agree on the intersection.

*Proof sketch.* Use the existing DividedPowers API on affine PD ideals and descend it. Impose
exactness and base compatibility as the displayed mathematical conditions, with nil PD ideals in
finite characteristic. ([Beilinson, *On the crystalline period
map*](https://arxiv.org/abs/1111.3316v4), §1.2, pp.3–4; §1.5, pp.6–7.) *Needs:* *Integral
quasi-coherent log schemes* (Layer CR.5:log-algebra); *Exact morphisms* (Layer CR.5:log-algebra);
DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7 and DerivedModuleAlgebra §0.DP.3; Mathlib `DividedPowers`.

**Checks.**

- `zero_ideal`: U=T with zero PD ideal is an exact PD thickening.
- `square_zero`: For the square-zero ideal (ε) in F_p[ε]/(ε²), the specified structure γ₁(ε)=ε and
  γ_n(ε)=0 for n≥2 gives a valid exact PD object over the trivial-log base.
- `nonexact_rejected`: The unexactified log affine-line diagonal is not an object of the site.
- Base PD operations agree after restriction to every affine object.

**PD smooth log thickenings.** An integral quasi-coherent log PD thickening (Z,T) over a p-nilpotent
PD base is PD smooth if every map from an affine exact log PD thickening (Z′,T′) whose closed fiber
maps into Z admits a lift to T as in Beilinson §1.4. Coordinate PD envelopes of
polynomial/logarithmic coordinate embeddings are PD smooth, retracts are PD smooth, and envelopes in
fine log smooth ambient schemes are PD smooth. Do not assert that this property is étale local; the
source explicitly leaves that question open.

The API:

- `LogCrystalline.IsPDSmooth.affine_lift`: The affine PD test lifting property is the definition.
- `LogCrystalline.IsPDSmooth.coordinate`: Coordinate PD thickenings are PD smooth.
- `LogCrystalline.IsPDSmooth.retract`: Retracts of PD smooth thickenings are PD smooth.

*Proof sketch.* Specify the affine PD lifting property over the base. Lift ordinary coordinates
arbitrarily and logarithmic coordinates with the unit adjustment; use the envelope universal
property. Use the source retract criterion and fine log smooth lifting only in their stated
directions. ([Beilinson, *On the crystalline period map*](https://arxiv.org/abs/1111.3316v4), §1.4,
definition, examples and Remark, p.6.) *Needs:* *Exact log PD thickenings*; *Quasi-coherent log PD
envelopes*; *Log smooth morphisms* (Layer CR.5:log-algebra); Mathlib
`CategoryTheory.HasLiftingProperty`.

**Checks.**

- `base_object`: The base PD thickening S₀→S is PD smooth: every test thickening already has its
  structural map to S.
- `coordinate_envelope`: The PD envelope of an affine coordinate embedding is PD smooth.
- `singular_identity`: Over F₃ with trivial logs the identity thickening of
  Z=Spec F₃[x]/(x²) is not PD smooth. Test against
  Z′=Spec F₃[t]/(t²)⊂T′=Spec F₃[t]/(t³), with square-zero PD ideal (t²)
  and x↦t on Z′. Every putative lift sends x to t+a t² and has x²↦t²≠0.
  This distinguishes the lifting property from merely having a zero PD ideal.
- A coordinate PD envelope has the affine lifting property.

### CR.5.3 The log crystalline site and its crystals

**Log crystalline sites.** For integral quasi-coherent Z over a p-nilpotent log PD base S♯, with the
base PD structure extending to Z, objects of (Z/S)_crys are U étale over Z and exact integral
quasi-coherent log PD thickenings U→T over S. Morphisms commute with source, log structure and
divided powers; coverings are étale covers of T whose induced closed fibers cover U. The structure
sheaf sends (U,T) to Γ(T,O_T), and the PD ideal and log sheaves are inherited from T. Fine objects
recover the Kato site.

The API:

- `LogCrystalline.logCrystallineSite.structure_sections`: O_crys(U,T)=Γ(T,O_T).
- `LogCrystalline.logCrystallineSite.pullback`: A compatible diagram of source log schemes and log
  PD bases induces the crystalline pullback map.
- `LogCrystalline.logCrystallineSite.trivial_log`: With trivial log structures the fine site is the
  ordinary crystalline site.

*Proof sketch.* Define the category of exact PD objects and its étale coverings. Use log PD
envelopes to construct products needed by the site and the morphism u:(Z/S)_crys→Z_et. Verify the
structure sheaf and functoriality under log PD base maps. ([Beilinson, *On the crystalline period
map*](https://arxiv.org/abs/1111.3316v4), §1.5, pp.6–7; [Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf), §5.2
and §5.9, fine log crystalline site, pp.215–217.) *Needs:* *Exact log PD thickenings*;
*Quasi-coherent log PD envelopes*; EnhancedDerivedSheaves Layer E1 (*DG
comparison for complexes of module sheaves*); Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`;
Mathlib `CategoryTheory.GrothendieckTopology`.

**Checks.**

- `identity_object`: If Z is itself a compatible PD base object, its zero-ideal thickening is an
  object.
- `log_diagonal_envelope`: The exactified PD log diagonal is a valid site object.
- `nonexact_excluded`: An ordinary closed immersion whose log map is nonexact is excluded until
  exactified.
- For trivial log structures and fine objects this specializes to the ordinary crystalline site.

**Logarithmic crystals.** A log crystal is a sheaf F of O_crys-modules. Restricting F to all étale
pullbacks of a PD object (U,T) gives the module sheaf F_T on T_et. Every site morphism
g:(U′,T′)→(U,T) induces the canonical map g*F_T→F_T′, adjoint to the restriction map into g_*F_T′;
require it to be an isomorphism. Here g* is pullback on ringed ambient étale sites, including
sheafification. Quasi-coherence, flatness and finite local freeness are additional evaluation
properties. Tensor is the sheaf tensor, and duality is internal O-linear Hom for finite locally free
evaluations.

The API:

- `LogCrystalline.LogCrystal.transition`: Evaluation gives g*F_T≅F_T′, coherent for identity and
  composition.
- `LogCrystalline.LogCrystal.tensor`: The tensor product of crystals is a crystal.
- `LogCrystalline.LogCrystal.dual`: For finite locally free F, evaluation of F∨ is the O_T-linear
  dual of F_T.

*Proof sketch.* Use the module-sheaf category on the log crystalline site and restrict along the
functor taking an ambient étale object to its pulled-back PD thickening. Identify the two structure
rings canonically, so section evaluation is a linear isomorphism after scalar transport. Form the
ambient ringed-site pullback using its adjunction with pushforward. Take the adjoint of the
crystalline restriction map and impose its invertibility for every PD morphism; restriction
functoriality supplies identity and composition coherence. Sheafify pointwise module tensors and use
internal Hom for finite locally free duals. Pullback commutes with these operations, giving
cartesian evaluation maps without imposing quasi-coherence on general crystals. ([Kato, *Logarithmic
structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
Definition 6.1, p.218; [Beilinson, *On the crystalline period
map*](https://arxiv.org/abs/1111.3316v4), §1.7, crystals and log connections, pp.8–11.) *Needs:*
*Log crystalline sites*; EnhancedDerivedSheaves Layer E1 (*DG
comparison for complexes of module sheaves*); EnhancedDerivedSheaves Layer E1 (*Derived sheaf tensor*); Mathlib `ModuleCat`; Mathlib `PresheafOfModulesOfCommRing`;
Mathlib `ModuleCat.extendScalars`; Mathlib `SheafOfModules`; Mathlib `SheafOfModules.pullback`;
Mathlib `PresheafOfModules.sheafification`; Mathlib `ModuleCat.restrictScalars`.

**Checks.**

- `structure_sheaf`: O_crys has its canonical cartesian transitions.
- `zero`: The zero sheaf is a crystal.
- `closed_fibre_sheaf`: With trivial logs on X=Spec F_p, the quotient module
  O_X^crys(U,T)=O_U is a sheaf but is not a crystal. Along the map from
  (X,Spec F_p[ε]/(ε²)) to (X,X), its cartesian comparison is
  `F_p[ε]/(ε²)⊗_{F_p}F_p→F_p`; its kernel is the nonzero ideal (ε).
  The structure sheaf, by contrast, has the identity comparison on the same object.

**Log PD stratifications.** For a log PD envelope D of a closed embedding into a log smooth ambient
over the compatible PD base, a log PD stratification on an O_D-module sheaf M is an isomorphism
ε:p₂*M→p₁*M on the exactified double PD diagonal D(1). All pullbacks are sheaf pullbacks on the
ambient étale sites. Require diagonal restriction to be the identity and p₁₂*ε∘p₂₃*ε=p₁₃*ε on the
exactified triple PD diagonal D(2), using the canonical pullback coherence isomorphisms. The first
PD order produces a sheaf log connection on this same M.

The API:

- `LogCrystalline.LogPDStratification.diagonal`: Diagonal pullback of ε is the identity.
- `LogCrystalline.LogPDStratification.cocycle`: The triple diagonal satisfies the stated cocycle.
- `LogCrystalline.LogPDStratification.first_order`: The first infinitesimal difference of ε is a
  Leibniz log connection.

*Proof sketch.* Exactify and PD-envelope the double and triple ambient diagonals over the same base.
Their projections, diagonal section and triple-to-double maps induce actual ringed-site module
pullbacks. Evaluate a crystal on these PD objects. Its cartesian transitions give ε; identity and
composition produce the diagonal and cocycle equations. Reduce ε modulo the second PD order. The
first-order coefficient is additive, respects restriction and satisfies the Leibniz rule with target
M tensor the sheaf of PD log one-forms. ([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
Proposition 6.5 and proof §6.6–6.7, pp.219–220; [Hyodo–Kato, *Semi-stable reduction and crystalline
cohomology with logarithmic poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf),
§2.16–2.17, logarithmic PD differential operators, pp.234–235.) *Needs:* *Fine log PD envelopes*;
*Logarithmic crystals*; *Logarithmic differentials*; Mathlib `SheafOfModules.pullback`.

**Checks.**

- `structure`: The structure crystal has the canonical multiplication-compatible stratification.
- `zero`: The zero module has its unique stratification.
- `failed_cocycle`: On the trivial-log affine line over F₃, a rank-one
  double-diagonal isomorphism given by multiplication by 1+γ₂(ξ) restricts
  to 1 on the diagonal. On the triple PD diagonal set ξ=x₁−x₀ and η=x₂−x₁.
  Modulo total PD degree 3, its composite is 1+γ₂(ξ)+γ₂(η), whereas
  its direct map is 1+γ₂(ξ+η)=1+γ₂(ξ)+ξη+γ₂(η).
  The surviving ξη coefficient is 1, so diagonal normalization alone fails.

**Integrable logarithmic connections.** A log connection on an O_D-module M over a log smooth
ambient Y/S is an additive map `∇:M→M⊗_O_D Ω¹_{Y/S,log}|_D` satisfying ∇(am)=a∇m+m⊗da. Integrability
means the degree-two curvature vanishes in the coefficient log de Rham complex. Morphisms are
horizontal O_D-linear maps. On formal evaluations use p-adically complete modules and continuous
connections.

The API:

- `LogCrystalline.LogConnection.leibniz`: ∇(am)=a∇m+m⊗da.
- `LogCrystalline.LogConnection.curvature`: Integrability is vanishing of the degree-two composite.
- `LogCrystalline.LogConnection.horizontal`: A horizontal linear map induces a map of coefficient
  log complexes.

*Proof sketch.* Use the universal log differential module in the Leibniz rule. Extend ∇ to the
graded complex; identify ∇² with the explicit curvature map. ([Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
Theorem 6.2(b), pp.218–219; [de Jong, *Crystalline Dieudonné module theory via formal and rigid
geometry*](https://www.numdam.org/article/PMIHES_1995__82__5_0.pdf), §2.2.2–2.2.4, ordinary
crystalline connection, pp.19–21.) *Needs:* *Logarithmic differentials*; *Log de Rham complexes*.

**Checks.**

- `structure`: The connection on O_D is ordinary d valued in log forms.
- `zero`: The zero module has the zero integrable connection.
- `nonintegrable`: On a two-variable smooth chart, the rank-one connection d+x dy has curvature
  dx∧dy and is not integrable.

**Logarithmic quasi-nilpotence.** Choose a local basis dlog t_i for log differentials and write ∇_i
for its coefficient operators. Log quasi-nilpotence means that for every local m, products over i of
the falling factorial operators `∏_{j=0}^{a_i−1}(∇_i−j)` vanish for every multiindex a with
sufficiently large total degree |a| in finite-level evaluations; formally they tend to zero in the
p-adic topology. The condition is independent of such a log basis. On ordinary invertible
coordinates it agrees with the usual PD Taylor quasi-nilpotence; plain powers `∇_i^{a_i}` are not the
log criterion.

The API:

- `LogCrystalline.LogQuasiNilpotent.falling_factorial`: The local condition is eventual vanishing of
  the displayed falling factorial operators.
- `LogCrystalline.LogQuasiNilpotent.coordinate_independent`: Equivalent logarithmic coordinate bases
  give the same property.
- `LogCrystalline.LogQuasiNilpotent.formal_mod_pn`: Formal quasi-nilpotence is the finite-level
  condition modulo each p^n.

*Proof sketch.* Express logarithmic PD Taylor coefficients in unit ratios u_i−1. Their coefficients
are falling factorials of logarithmic operators; use PD diagonal coordinate changes to show
independence. At formal level require convergence modulo every p^n. ([Kato, *Logarithmic structures
of Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
Theorem 6.2(b)(iii), Remark 6.3, pp.218–219; [Hyodo–Kato, *Semi-stable reduction and crystalline
cohomology with logarithmic poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), §2.17,
log PD Taylor coefficients, p.235.) *Needs:* *Integrable logarithmic connections*; *Log PD
stratifications*.

**Checks.**

- `zero_residue`: The constant zero logarithmic operator is quasi-nilpotent.
- `integer_residue`: A scalar operator λ=1 has ∇(∇−1)=0, though its positive powers are not zero in
  characteristic zero.
- `unramified_residue`: Take O=W(F₄), p=2 and λ=[a] with a²+a+1=0.
  On the rank-one module over O with logarithmic residue λ, each factor λ−j
  reduces to either a or a−1, both nonzero in F₄. Every falling factorial
  is a unit, so the connection fails formal log quasi-nilpotence even though
  its residue is integral. The same test modulo 2 fails finite-level quasi-nilpotence.
- For a constant residue λ∈ℤ≥0, the falling factorial vanishes once the index exceeds λ.

**Crystals and log connections.** For a fine closed log embedding X→Y with Y log smooth over a
p-nilpotent fine log PD base S, evaluation on the log PD envelope D gives an equivalence between
module-sheaf crystals on X/S and O_D-module sheaves with integrable, stalkwise log quasi-nilpotent
connection valued in the sheaf `M⊗Ω¹_{Y/S,log}|_D`. On every étale U, the connection therefore lands
in Γ(U,M⊗Ω¹), with tensor formed as a sheaf. Quasi-nilpotence means eventual vanishing of local PD
Taylor coefficients for each stalk element; it does not require one bound on a section of an
arbitrary non-quasicompact U. Beilinson §1.7 supplies the coordinate PD-smooth integral
quasi-coherent extension under its stated hypotheses. Finite locally free evaluations match finite
locally free modules. Formal versions use compatible p-power levels and complete modules.

*Proof sketch.* Restrict the given crystal to the ambient étale site of D; differentiate its sheaf
PD diagonal stratification. Sheaf tensor terms give the Leibniz rule and the triple cocycle gives
zero curvature. At each geometric stalk use the local logarithmic falling-factorial and ordinary
Taylor coefficients. Stalkwise eventual vanishing makes the PD Taylor expression finite locally for
each section germ; change of coordinates preserves the intrinsic stratification. Recover cartesian
evaluation by sheaf pullback and descend it across local PD lifts. The functor sends F to
crystalEvaluation F D, with its underlying sheaf equal to F_D. Apply Beilinson finite-chart
approximation only for the stated coordinate PD-smooth extension. Apply the construction at each
finite formal level and retain compatible reduction maps before invoking p-adic completion. ([Kato,
*Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
Theorem 6.2 and proof §6.7–6.8, pp.218–221; [Beilinson, *On the crystalline period
map*](https://arxiv.org/abs/1111.3316v4), §1.7, Theorem after the crystal definition, p.11.)
*Needs:* *Logarithmic crystals*; *Log PD stratifications*; *Integrable logarithmic connections*;
*Logarithmic quasi-nilpotence*; *PD smooth log thickenings*; Mathlib `SheafOfModules`; Mathlib
`PresheafOfModules.sheafification`.

**Checks.**

- The structure crystal corresponds to d; logarithmic residue 1 uses the binomial Taylor factor, not
  the exponential of ordinary powers.

### CR.5.4 The log Poincaré lemma and log crystalline cohomology

**Filtered logarithmic PD de Rham complexes.** On the log PD envelope D in a log smooth ambient Y/S,
form the sheaf complex `M⊗_O_D Ω^•_{Y/S,log}|_D` with the coefficient connection differential. On any
étale U its degree q term is Γ(U,M⊗Ω^q), using the sheaf tensor and then restriction of scalars to
the PD base. Impose `dγ_n(x)=γ_{n−1}(x)dx` locally. The structure-complex PD filtration is
F^mΩ^a=J^[m−a]Ω^a, with nonpositive powers the whole structure sheaf. Filtered coefficients use the
convolution sheaf filtration and Griffiths transversality. The generic PD filtration is supplied by
DerivedDeRhamCohomology §PD.4. A tensor of section
modules computes these terms only under a justified affine quasi-coherent hypothesis.

The API:

- `LogCrystalline.logPDDeRham.pd_derivative`: `dγ_n(x)=γ_{n−1}(x)dx` for n≥1.
- `LogCrystalline.logPDDeRham.filtration_degree`: F^mΩ^a=J^[m−a]Ω^a for structure coefficients.
- `LogCrystalline.logPDDeRham.coefficient_tensor`: The degree-q coefficient sheaf is M⊗Ω^q with its
  extended connection differential. Evaluation on U gives Γ(U,M⊗Ω^q); no unqualified isomorphism
  with Γ(U,M)⊗Γ(U,Ω^q) is asserted.

*Proof sketch.* Form the sheaf tensor of the module sheaf from the common crystal/connection adapter
with the locally defined PD log form sheaves. Sheafify pointwise tensors; restrict to étale U only
after this operation. Extend the restriction-compatible coefficient connection by the graded Leibniz
rule and the PD differential identity. Integrability gives a complex with these actual sheaf tensor
terms. Take the PD ideal sheaf filtration, shift its index by form degree and prove differential
preservation locally. For filtered coefficients use convolution with their transverse sheaf
filtration. ([Beilinson, *On the crystalline period map*](https://arxiv.org/abs/1111.3316v4), §1.7,
pp.8–11; §1.8, pp.11–12.) *Needs:* *Fine log PD envelopes*; *Integrable logarithmic connections*;
*Divided power filtration* (DerivedDeRhamCohomology §PD.4); Mathlib `DividedPowerAlgebra`; Mathlib
`DividedPowerAlgebra.dp`; Mathlib `PresheafOfModules.sheafification`; Mathlib
`AlgebraicGeometry.«Proj»`; Mathlib `MvPolynomial.gradedAlgebra`.

**Checks.**

- `degree_zero`: F^mΩ⁰=J^[m].
- `zero_pd_ideal`: For J=0, F^mΩ^a is zero when m>a and the full term when m≤a.
- `ordinary_power_failure`: In the existing divided-power algebra `Γ_{F_p}(F_p)`, x=γ₁(1) satisfies
  x^p=0 while γ_p(1)≠0. Replacing the PD filtration by ordinary powers loses this generator.
- `section_tensor_failure`: For the identity PD thickening of P1 over F_p, p prime, with trivial log
  and the canonical Cartier connection on Frob*O(1)=O(p), Ω¹=O(−2). Its section tensor Γ(O(p))⊗Γ(Ω¹)
  is zero, but Γ(O(p)⊗Ω¹)=Γ(O(p−2)) has dimension p−1 and is nonzero. The coefficient-form sheaf
  must retain the latter term.
- The degree-one filtration shifts the PD index by one.

**Log PD Poincaré lemma.** Under the fine log smooth embedding hypotheses of the crystal–connection
equivalence, Ru_*F is naturally represented by the log PD de Rham complex of F_D. For a coordinate
PD-smooth integral quasi-coherent embedding, Beilinson gives the analogous comparison, including the
compatible PD filtration. The map is induced by the crystal evaluation and linearized log PD
resolution; the claim is not an ordinary de Rham comparison for an arbitrary singular ambient
scheme.

*Proof sketch.* Use crystalEvaluation on the same ambient module sheaf and resolve the crystal by
the linearized sheaf PD diagonal complex. Contract the ordinary additive and logarithmic
multiplicative PD coordinate directions locally, using stalkwise quasi-nilpotence and the PD Taylor
equivalence. Push forward and descend the resulting sheaf comparison. Its coefficient terms are M
tensor the PD log form sheaves; transport the compatible PD filtration. ([Kato, *Logarithmic
structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
Theorem 6.4, p.219; Proposition 6.5 and proof §6.9, pp.219–221; [Beilinson, *On the crystalline
period map*](https://arxiv.org/abs/1111.3316v4), §1.6 acyclicity, pp.7–8; §1.8 comparison theorem,
pp.11–12.) *Needs:* *Crystals and log connections*; *Filtered logarithmic PD de Rham complexes*; *PD
smooth log thickenings*; EnhancedDerivedSheaves Layer E2
(*Bounded-below hypercover descent*); EnhancedDerivedSheaves Layer E1
(*The enhanced derived category*).

**Checks.**

- The log affine-line resolution uses divided powers of the unit-ratio difference.

**Logarithmic embedding-system descent.** Choose an étale hypercover X_•→X and compatible embeddings
into log smooth ambient schemes, or coordinate PD-smooth integral quasi-coherent thickenings. The
total derived pushforward of the cosimplicial log PD de Rham complexes represents Ru_*F and is
independent of the embeddings by common refinements. At finite levels these complexes are bounded
below uniformly, so use bounded-below hypercover descent; no repleteness of the ordinary étale topos
is assumed.

*Proof sketch.* Use local log smooth/coordinate PD embeddings to build the hypercover system. Apply
the local Poincaré lemma termwise and bounded-below hypercover descent. Compare two systems on their
common refinement and use the resulting canonical derived isomorphisms. ([Hyodo–Kato, *Semi-stable
reduction and crystalline cohomology with logarithmic
poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), §2.18–2.21, pp.236–239; [Beilinson,
*On the crystalline period map*](https://arxiv.org/abs/1111.3316v4), §1.8, embedding-system
comparison, pp.11–12.) *Needs:* *Log PD Poincaré lemma*; *Quasi-coherent log PD envelopes*;
EnhancedDerivedSheaves Layer E2 (*Bounded-below hypercover descent*);
EnhancedDerivedSheaves Layer E1 (*The enhanced derived category*).

**Checks.**

- Changing a semistable chart leaves the computed log crystalline complex canonically equivalent.

**Derived p-adic log crystalline cohomology.** For compatible log PD bases S_n with p^n=0 and
compatible coefficient crystals F_n on X/S_n, define RΓ_logcrys(X/S,F)=Rlim_n RΓ(X/S_n,F_n). This is
a derived inverse limit, not a naive termwise limit. Under a p-complete PD-smooth embedding with
suitable flat evaluations and finite log forms, continuous log PD de Rham computes it. The
completion and reduction comparison hypotheses are part of the statement.

The API:

- `LogCrystalline.pAdicLogCrystalline.level_maps`: There are coherent maps to every finite-level
  complex.
- `LogCrystalline.pAdicLogCrystalline.derived_limit`: The defining object is Rlim of the
  finite-level log crystalline complexes.
- `LogCrystalline.pAdicLogCrystalline.continuous_model`: For a compatible chain-level PD de Rham
  resolution with degreewise surjective transition maps, Rlim is the derived class of its degreewise
  continuous limit. A flat PD-smooth embedding supplies such a resolution under its completeness
  hypotheses; flatness alone does not make arbitrary chosen complexes surjective.

*Proof sketch.* Form the coherent finite-level complexes and their derived inverse limit
(EnhancedDerivedSheaves E2:towers.1, `derivedTowerLimit`). Use continuous coefficient PD forms
on a compatible flat embedding; identify Rlim with the completed model only after the relevant Mittag–Leffler or
derived-completion comparison. The coherent derived limit and its finite-level projections are
supplied by EnhancedDerivedSheaves E2:towers.1 (`derivedTowerLimit`). On the affine embedding models, use
module towers and the point-topos `IsReplete.derived_limits` and `IsReplete.milnor` of §E2.2;
these comparisons are not assertions of repleteness of the log crystalline topos.
DerivedModuleAlgebra §§1.3–1.5 identifies the limit with derived
completion only under its regularity hypotheses. ([Beilinson, *On the crystalline period
map*](https://arxiv.org/abs/1111.3316v4), §1.12, pp.16–17; [Česnavičius–Koshikawa, *The
A_inf-cohomology in the semistable case*](https://arxiv.org/abs/1710.06145v3), §5.13, finite-level
inverse-limit comparison, pp.37–38.) *Needs:* *Logarithmic embedding-system descent*; *Log
structures under reduction and completion*; EnhancedDerivedSheaves E2:towers.1
(`derivedTowerLimit`) and §E2.2 (`IsReplete.derived_limits`, `IsReplete.milnor`, point topos);
EnhancedDerivedSheaves Layer E1 (*The enhanced derived category*); DerivedModuleAlgebra (§1.3 *The derived
completion reflector*); DerivedModuleAlgebra §§1.4–1.5; Mathlib `DerivedCategory`.

**Checks.**

- `witt_point`: For the standard log Witt point over itself, the completed structure cohomology is
  W(k) in degree zero.
- `zero_coefficients`: Zero coefficients give the zero complex.
- `lim_one`: For the auxiliary inverse system ℤ with transitions multiplication by p, the derived
  inverse limit has H¹=ℤ_p/ℤ although the ordinary inverse limit is zero. The completion retains
  this derived-limit degree.
- Nonzero lim¹ is retained for inverse systems without exact inverse limit.

### CR.5.5 p-divisible log structures and the log structure on A_cris

**Unique lifting of p-divisible log structures.** Let (Z,M) be integral quasi-coherent over F_p and
suppose the sharp sheaf M/O_Z× is uniquely p-divisible. For an ordinary compatible PD thickening Z→T
over a p^n-nilpotent PD base, M lifts uniquely to a log structure on T making the immersion exact.
The lifted log structure is functorial in PD thickenings and compatible with Frobenius. Thus
ordinary and log crystalline sites agree after this canonical lift. Arbitrary integral
quasi-coherent or fine log structures do not have this uniqueness assertion.

*Proof sketch.* For p^n=0, the PD identity c^p=p!γ_p(c) puts c^p in pJ. The binomial
expansion then gives (b+c)^(p^n)=b^(p^n) for c∈J, independently of the chosen lift b.
Map a copy of the original log sheaf to O_T by a↦α̃(a)^(p^n), and logify.
The map to M given by p^n-th powers and unique p-divisibility of the characteristic sheaf
prove exactness and uniqueness. These maps glue and are functorial, giving the site comparison. ([Beilinson, *On the crystalline period map*](https://arxiv.org/abs/1111.3316v4), §1.17,
unique log lifting lemma and proof, pp.25–26.) *Needs:* *Integral quasi-coherent log schemes* (Layer
CR.5:log-algebra); *Characteristic monoids* (Layer CR.5:log-algebra); *Exact log PD thickenings*;
*Log crystalline sites*.

**Checks.**

- The rational characteristic log point satisfies the hypothesis; the characteristic ℕ of the
  standard fine log point does not.
- For T=Spec Z/4 with the canonical PD ideal (2), γ₂(2)=2 and the ideal is not
  PD-nilpotent. Nevertheless (b+2)^4=b^4, so lifting the rational characteristic log point
  is independent of the lift.
- For a zero PD ideal the lift is the original log structure; replacing the uniquely
  p-divisible characteristic by ℕ loses the unique root needed for exactness.

**The induced log structure on A_cris.** Let K be a complete discretely valued field of
characteristic zero with perfect residue field of characteristic p, and let C=C_K be the
completed algebraic closure supplied by PadicPeriodRings §2. Normalize v(p)=1. Then v(C×)=ℚ:
the algebraic closure has the divisible hull of the discrete value group, and completion of a
rank-one valued field preserves the values of nonzero elements. Take A_cris=A_cris(O_C) to be the
p-adic completion of `periodPDEnvelope` from PadicPeriodRings §3, with its finite PD quotients
A_cris/pⁿ and the θ_cris and Frobenius of §§3, 4.1. DerivedDeRhamCohomology §PD.7 identifies its
general A_cris(O_C) construction with this carrier by
`Crystalline.fontaineEnvelope_periodPDEnvelope`, preserving the structure map, divided powers,
completion, θ_cris and functorial maps. This target constructs the log structure on that carrier.

On each A_cris/pⁿ use the log structure induced by `O_{C♭} ∖ {0}` through the Teichmüller chart
x ↦ [x]. It is the unique exact lift of the valuation log structure on O_C/p, whose sharp monoid
is ℚ≥0 under the normalized valuation. The compatible finite-level lifts define the p-adic log
base, with Frobenius acting by p on the characteristic.

The API:

- `LogCrystalline.aCrisLog.finite_lift`: For C=C_K as above, the reduction to O_C/p is the valuation
  log structure and the immersion is exact.
- `LogCrystalline.aCrisLog.frobenius`: For the same C, Frobenius on the characteristic is
  multiplication by p.
- `LogCrystalline.aCrisLog.fine_chart_comparison`: For a semistable chart descended from `O_{K′}`,
  K′/K finite, the log crystalline computation over A_cris/pⁿ agrees with the computation from
  a fine chart model after integral log base change.

*Proof sketch.* Use PadicPeriodRings §§2–3 for C_K and the completed principal envelope, §4.1 for
Frobenius, and DerivedDeRhamCohomology §PD.7 for the general-envelope identification. The tilt
and Teichmüller map are supplied by PerfectoidSpaces Layer P1 and Mathlib. Use the sharp uniquely
p-divisible valuation characteristic for canonical lifts at every finite p-level. Compare with the
Teichmüller chart and prove transition and Frobenius compatibility; define the complete base by the
compatible system. Česnavičius–Koshikawa identify the formal boundary over O_C under finite-model
hypotheses; the extension from noetherian fine log regularity to this non-fine base is proved here
for the semistable charts over finite extensions K′/K, by integral log base change, as in
*Log structures on semistable formal charts*. ([Česnavičius–Koshikawa, *The A_inf-cohomology in the
semistable case*](https://arxiv.org/abs/1710.06145v3), §5.2, p.32; §§5.9–5.13, pp.36–38;
[Beilinson, *On the crystalline period map*](https://arxiv.org/abs/1111.3316v4), §1.17, unique log
lifting lemma and absolute crystalline cohomology, pp.25–26.) *Needs:* *Unique lifting of
p-divisible log structures*; *Valuation log structures and tilt charts* (Layer CR.5:log-algebra);
*Log structures on semistable formal charts* (Layer CR.5:log-algebra); *Derived p-adic log
crystalline cohomology*; PadicPeriodRings §2 (`PadicFieldCompletion`), §3 (`periodPDEnvelope`,
completion and θ_cris), §4.1 (Frobenius); PerfectoidSpaces §§P1.17–P1.18 (tilt and Fontaine's θ);
DerivedDeRhamCohomology §PD.7 (`Crystalline.fontaineEnvelope_periodPDEnvelope`); Mathlib
`WittVector.teichmuller`.

**Checks.**

- `rational_characteristic`: For C=C_K with K as above, the sharp monoid remains ℚ≥0 at every
  A_cris/p^n level, with v(p)=1.
- `irrational_value_group`: On ℚ_p(T), the valuation with v(p)=1 and v(T)=α for a positive
  irrational α extends to an algebraic closure and its completion. Its value group contains
  ℚ+ℚα and its valuation characteristic is therefore not ℚ≥0. This field lies outside the
  C=C_K specialization; the uniquely p-divisible lifting theorem still applies to its actual
  valuation characteristic.
- `trivial_units`: Units give the trivial characteristic part of the chart.
- `not_fine`: The valuation characteristic ℚ≥0 cannot be replaced by a finite ℕ chart in the
  canonical A_cris log base.
- The log structure is integral quasi-coherent, generally non-fine.

### CR.DDR.6.1 Free prelog resolutions

Use `DerivedDeRham.freePrelogResolutions` of DerivedDeRhamCohomology §6.20, together with
its `freePrelogUniversal`, `prelogResolutionAugmentation` and `prelogResolutionComparison`.
The category of prelog rings and its free/forgetful adjunction are supplied there without
using the geometric log layer here. Ordinary generators `T` and log generators `S` give
`(A[T,S], M ⊕ ℕ^(S))`, with each log generator mapped to its ring variable. All subsequent
cotangent and de Rham models use the supplied resolution comparisons and filtration maps.

[Bhatt12], Propositions 5.3–5.5, Definition 5.6, Proposition 5.7 and Remark 6.10,
pp.23–26; [KY], §2.1, Notation 2.4 and Remark 2.8, pp.12–14.

*Needs:* DerivedDeRhamCohomology §6.20 (*Shared free-prelog and cotangent constructors*).

**Checks.**

- `test_prelog_free_empty`: with both generator sets empty the free object is `(A, M)`.
- `test_prelog_free_two_generators`: one ordinary `t` and one monoid `x` give `(A[t, x], M ⊕ ℕ)`,
  with `x` the image of the monoid generator.
- `test_prelog_free_no_identification`: the monoid generator `x` is not freely mapped independently
  of its ring image; forgetting this compatibility gives the wrong adjunction.

### CR.DDR.6.2 Homotopy pushouts of prelog rings

Use `DerivedDeRham.prelogHomotopyPushout` of DerivedDeRhamCohomology §6.20, including its
natural maps and resolution comparisons. Its ring and monoid components are the respective
derived pushouts. For the p-completed comparisons here apply DerivedModuleAlgebra §1.6 to
the ring component; the monoid is unchanged. Reduction of a p-complete ring component modulo
`p` is the derived tensor with `F_p`, including when ordinary reduction has higher Tor.

[KY], Remark 2.8, Definition 2.44 and Remark 2.45, pp.13–14, 23–24; [Bhatt12],
Definition 4.8 and Proposition 4.9, pp.20–21; [KY], Lemma 3.6(2), p.28.

*Needs:* DerivedDeRhamCohomology §6.20 (`prelogHomotopyPushout`);
DerivedModuleAlgebra §1.6 (*Completion of simplicial commutative algebras*).

**Checks.**

- `test_prelog_pushout_trivial_monoids`: for trivial monoids it is the derived tensor product of
  rings.
- `test_prelog_pushout_monoid`: for `ℕ ← ℕ → ℕ` with both maps multiplication by 2 (`x ↦ x²` on
  monoid algebras), the homotopy pushout of monoids has `π₀ = ⟨a, b | 2a = 2b⟩`. It is integral: `na
  + mb ↦ (n + m, m mod 2)` embeds it into `ℤ ⊕ ℤ/2`. Its group completion has the 2-torsion element
  `a − b`, which does not lie in `π₀` although `2(a − b) = 0` does, so `π₀` is neither saturated nor
  has torsion-free group completion.
- `test_prelog_pushout_nonintegral`: for `ℕ ← ℕ² → ℕ` with maps `(i, j) ↦ i + j` and `(i, j) ↦ i +
  2j`, `π₀ = ⟨a, b | a = b, a = 2b⟩ = {0, e}` with `e = 2e ≠ 0`. It is not integral, since `e + e =
  e + 0` while `e ≠ 0`. The homotopy pushout of integral monoids need not be integral.
- `test_prelog_pushout_completion`: p-completing `(ℤ[ℕ], ℕ)` gives `(ℤ_p⟨x⟩, ℕ)`; the monoid is not
  completed.

### CR.DDR.6.3 Derived logarithmic derivations

For a map `(A, M) → (B, N)` and a `B`-module `P`, define log derivations as base-compatible sections
of `(B ⊕ P, N ⊕ P) → (B, N)`. The ring is the split square-zero extension, the monoid operation is
`(n, u)(n′, u′) = (nn′, u + u′)`, and its structure sends `(n, u)` to `(α(n), α(n)u)`. Sections are
a ring derivation `D : B → P` and an additive log derivative `δ : N → P` with `D(α(n)) = α(n)δ(n)`,
both zero on the base, `DerivedDeRham.logDerivedDerivations`. The higher structure is recorded by
`Ext` groups against the log cotangent complex, as in DerivedModuleAlgebra §0.6.

[Bhatt12], Remark 6.6 and displayed equivalence (6), pp.25–26.

*Needs:* §CR.DDR.6.1 (*Free prelog resolutions*); DerivedModuleAlgebra §0.5 (*Square-zero extensions
and their classes*); §CR.5:log-algebra.1.

Prove the following named laws.

- `logDerivationsDiscrete`: log derivations into a module are the compatible pairs `(D, δ)` with `Dα
  = αδ`.
- `logDerivationsModuleMap`: a `B`-linear `P → P′` induces the map of log derivations.
- `logDerivationsFree`: for finite free prelog generators the derivations are freely specified by
  ordinary `D(t)` and logarithmic `δ(x)`.

**Checks.**

- `test_log_derivations_identity`: for the identity prelog map there are no nonzero log derivations.
- `test_log_derivations_coordinate`: for `(A, 0) → (A[x], ℕ)`, a log derivation has `D(x) = x δ(1)`.
- `test_log_derivations_log_point`: for `(k, 0) → (k, ℕ → 0)`, log derivations have `D = 0` and
  arbitrary `δ(1) ∈ P`; the representing object still has an additional negative cotangent term.

### CR.DDR.6.3.1 Log square-zero extension classes

For `(A, M) → (B, N)` and a `B`-module `P`, construct `DerivedDeRham.LogSquareZeroExtension`: a
prelog `(A, M)`-algebra `(B′, N′)` with surjective projection to `(B, N)` and an identified
square-zero ring kernel `i : P → B′` with its given `B`-action. Require a compatible additive action
of `P` on `N′`, written `n′ · u`, with every fibre of `N′ → N` a nonempty free transitive `P`-set,
`(n′ · u)(m′ · v) = (n′m′) · (u+v)`, and `α′(n′ · u) = α′(n′)(1+i(u))`. The fibre over the monoid
unit is identified with `P` by `u ↦ 1 · u`; its elements are units and their ring images are
`1+i(u)`. The base prelog map and both projections are retained. This is the torsor extension for
the split module object `(B ⊕ P, N ⊕ P)` of §CR.DDR.6.3, rather than an arbitrary monoid surjection.

Morphisms fix the base, projections, ring-kernel identification and the `P`-action. Define their
isomorphism relation and `DerivedDeRham.LogExal` as the quotient. Construct its abelian group law by
taking the fibre product over `(B,N)` and pushing its kernel `P ⊕ P` out by addition: on rings
quotient by the antidiagonal, and on monoids quotient by the antidiagonal `P`-action. The split
extension is zero; kernel negation gives the inverse. Prove well-definedness, the group laws,
coefficient pushout and pullback in the target prelog algebra. The resolution cocycle records both
the ring and monoid lift differences with the order `d₀ − d₁`.

[Bhatt12], Remark 6.6 and equivalence (6), pp.25–26, for the split module object and its
derivation-space classifier; its degree-one torsors are constructed by applying the free prelog
resolution of §§5–6. [GR], §§2.5.4–2.5.7, p.30, supplies the ordinary ring specialization of this
torsor and Baer-sum construction.

*Needs:* §CR.DDR.6.1 (*Free prelog resolutions*); §CR.DDR.6.3 (*Derived logarithmic derivations*);
DerivedModuleAlgebra §0.5 (*Square-zero extensions and their classes*); §CR.5:log-algebra.1 (prelog
maps and units).

**Checks.**

- `test_log_extension_zero_kernel`: for `P = 0`, both projections are isomorphisms and `LogExal` is
  zero.
- `test_log_extension_log_point`: over `(ℚ,0)`, extend `(ℚ,ℕ → 0)` by `P = ℚ` with `B′ = ℚ[ε]/ε²`,
  `N′ = ℕ × ℚ` and `α′(n,u) = ε^n(1+uε)`. This has no prelog section: every lift of the monoid
  generator has ring image `ε`, whereas a section of the ring sends its zero image to zero. Its
  class is nonzero.
- `test_log_extension_baer_sign`: for the same log point, replace `ε^n` by `(cε)^n`. Classes add by
  `c+d`, the split class has `c=0`, and `c=1` and `c=−1` are distinct inverse classes. This
  distinguishes addition from the zero or sign-reversed operation.

### CR.DDR.6.4 The Gabber logarithmic cotangent complex

Use `L_log = DerivedDeRham.gabberLogCotangent` of DerivedDeRhamCohomology §6.20, with
its universal `d` and `d log`, `logCotangentH0`, `logCotangentOrdinaryMap` and
`logCotangentNaturality`. In particular `H⁰ L_log = Ω¹_log` and `dα(n) = α(n) d log n`;
identical monoids identify its ordinary-to-log map with an equivalence. These are the supplied
objects and maps. Gabber's and Olsson's complexes are compared here only for integral
morphisms of integral prelog rings, not for all log smooth maps.

On this supplied carrier prove the derivation and extension classifiers:

- `logCotangentUniversal`: for a discrete `B`-module `P`, `Hom_(D(B))(L_log, P)` is the
  log derivation module of §CR.DDR.6.3, and `Hom_(D(B))(L_log, P[1])` is additively
  `LogExal_(A,M)((B,N), P)`. The extension class is its ring-and-monoid resolution cocycle;
  the split class is zero and the log-point extension of §CR.DDR.6.3.1 has its nonzero
  conormal coefficient.
- `logDerivationsRepresented`: the degree-zero classifier identifies the universal `d`,
  `d log` with the compatible derivation pair of §CR.DDR.6.3.

[Bhatt12], Definition 6.3, Remark 6.4, Proposition 6.5 and Remark 6.6, pp.24–26;
[KY], Definition 2.5, Lemmas 2.9–2.10, Remark 2.13, pp.13–15; [Ols05], §8,
Lemma 8.22 and Theorem 8.32.

*Needs:* DerivedDeRhamCohomology §6.20 (`gabberLogCotangent` and its public maps);
§CR.DDR.6.3 (*Derived logarithmic derivations*); §CR.DDR.6.3.1 (*Log square-zero extension
classes*); §CR.5.1 (log differentials); DerivedModuleAlgebra §0.5.

**Checks.**

- `test_log_cotangent_identity`: an identity prelog map has zero cotangent complex.
- `test_log_cotangent_free`: for `(A, 0) → (A[t, x], ℕ)`, `L_log` is free in degree zero on `dt` and
  `d log x`, with `dx = x d log x`.
- `test_log_cotangent_nonintegral`: [KY] Remark 2.13, with `P` generated by `(2,0), (0,2), (1,1)`
  inside `ℕ²` and `char(k) ≠ 2`, is log étale but has nonzero Gabber cotangent complex (unbounded on
  the left, [Ols05] 7.3).

### CR.DDR.6.5 Log cotangent transitivity, base change and invariance

Use `DerivedDeRham.logCotangentFunctoriality` of DerivedDeRhamCohomology §6.20 for
transitivity, homotopy prelog base change, filtered colimits and passage from integral
prelog monoids to their associated log structures. The maps from ordinary cotangent
triangles, including connecting arrows, are the supplied maps. The derived pushout is
replaced by an ordinary pushout only under homological log flatness (§CR.DDR.6.6).

The additional comparison here is `L_log ≃ Ω¹_log` in degree zero for an integral morphism
of integral prelog rings that is log smooth after logification. Apply the Gabber–Olsson
comparison to the supplied cotangent complex, then the discrete cotangent theorem for
integral log smooth maps.

[KY], Lemmas 2.10, 2.14, Theorem 2.11 and Remark 2.12, pp.14–16;
[Ols05], Theorems 8.18, 8.20, 8.32 and 1.1(iii).

*Needs:* DerivedDeRhamCohomology §6.20 (`logCotangentFunctoriality`);
§CR.DDR.6.4 (*The Gabber logarithmic cotangent complex*);
§CR.5:log-algebra.3 (log smoothness), §CR.5:log-algebra.5 (integral log structures).

**Checks.**

- `test_log_transitivity_identity`: identity maps have zero relative `L_log`.
- `test_log_transitivity_strict`: for identical monoids the triangle is the ordinary transitivity
  triangle.
- `test_log_base_change_pushout`: the homotopy prelog pushout includes ring and monoid terms; for
  trivial monoids it is DerivedModuleAlgebra §0.10.
- `test_log_cotangent_integral_smooth`: for `(k,0) → (k[x],ℕ → x)`, the integral log smooth
  comparison gives `L_log = k[x] d log x` in degree zero, with `dx ↦ x d log x`.

### CR.DDR.6.6 Homological logarithmic flatness

A prelog map `R → S` is homologically log flat (hlf) if for every prelog map `R → S′` the homotopy
pushout `S′ ⊔^L_R S` (§CR.DDR.6.2) is equivalent to the ordinary pushout. It is hlf faithfully flat
if moreover the underlying ring map is faithfully flat. Equivalently, the ring map is flat and the
monoid map is flat in the homotopy-pushout sense of [Bhatt12] Definition 4.8. This differs from Kato
log flatness in both directions. Covers define the hlf topology on prelog algebras,
`DerivedDeRham.homologicalLogFlatness`.

[KY], Definition 2.44 and Remarks 2.45–2.46, pp.23–24; [Bhatt12], Definition 4.8 and Proposition
4.9, pp.20–21.

*Needs:* §CR.DDR.6.1 (*Free prelog resolutions*); §CR.DDR.6.2 (*Homotopy pushouts of prelog rings*);
§CR.DDR.6.5 (*Log cotangent transitivity, base change and invariance*); §CR.5:log-algebra.1.

Prove the following named laws.

- `hlfUnderlyingCriteria`: hlf iff ring-flat and monoid homotopy-pushout-flat.
- `hlfPushoutOrdinary`: every base change has the displayed derived-to-ordinary pushout equivalence.
- `hlfCompositionBaseChange`: hlf and hlf faithfully flat maps are stable under composition and base
  change.
- `hlfIntegralSufficient`: an underlying flat ring map with injective integral map of integral
  monoids is hlf ([KY] Remark 2.45).

**Checks.**

- `test_hlf_identical_monoids`: a prelog map with isomorphic chart monoids and flat underlying ring
  is hlf.
- `test_hlf_strict_logification`: `(F₂, C₂ → 1) → (F₂, 0)` has flat underlying ring and both
  logifications are trivial, so the associated log map is strict. Its chart-monoid pushout along
  `C₂ → 0` is nondiscrete: the corresponding monoid-algebra derived tensor has
  `Tor₁^{ℤ[C₂]}(ℤ, ℤ) = ℤ/2` ([Bhatt12] Propositions 4.4, 4.7–4.9). Log strictness (§CR.5:log-algebra.2) does not identify
  the chart monoids.
- `test_hlf_diagonal`: the diagonal `(k, ℕ → 0) → (k, ℕ² → 0)` is hlf but not Kato log flat.
- `test_hlf_nonintegral_kato`: for `P` generated by `(2,0), (0,2), (1,1)` in `Q = ℕ²`, `(k[P], P) →
  (k[Q], Q)` is Kato log flat but not hlf.

### CR.DDR.6.7 Logarithmic derived de Rham

Use `DerivedDeRham.logDerivedDeRham` and `DerivedDeRham.logDeRhamDLog` of
DerivedDeRhamCohomology §6.20, with `logDeRhamOrdinaryMap`, `logDeRhamHodgeGraded`,
`logDeRhamStrict` and `logDeRhamCompletions`. The raw realization uses direct sums;
Hodge completion and derived p-completion are separate supplied functors. The algebra is
base-ring linear, with `gr_H^i ≃ L∧^i_B L_log[−i]`; its differential is generally not
linear over the target ring. The ordinary-to-log map, closed additive `d log`, products
and filtration maps in all comparisons here are these public maps.

For the period inputs use `DerivedDeRham.periodLogSpecialization` and
`DerivedDeRham.periodLogComparisonData` of §6.20. Their cotangent and de Rham objects
specialize the same constructors; their `d log` is this `logDeRhamDLog`.
`DerivedDeRham.periodDLogCanonical` of §6.21 identifies it with `log[ε]`, preserving
the first Hodge graded transitivity boundary `ψ_n([ε] − 1) = ε_n⁻¹ dε_n`.
This specialization includes p=2 and arbitrary perfect residue fields, and preserves the
ordinary-to-log maps, products, filtrations, completion maps and Galois/valued-embedding
functoriality supplied there.

[Bhatt12], Definitions 6.1, 6.8, Propositions 6.9, 6.11 and Remark 6.10, pp.24–26;
Proposition 9.3(5), Remark 9.4, Proposition 9.11, Remark 9.12 and Construction 9.15,
pp.34–38; [KY], Construction 2.6, p.13.

*Needs:* DerivedDeRhamCohomology §§6.20–6.21 (shared logarithmic de Rham and period maps).

**Checks.**

- `test_log_derham_identity`: an identity prelog map gives the base ring with no positive Hodge
  pieces.
- `test_log_derham_free_coordinate`: for `(F_p, 0) → (F_p[x], ℕ)`, `d(x) = x d log x` and `d(d log
  x) = 0`.
- `test_log_derham_rational_logification`: [Bhatt12] Example 6.15: strict `ℚ → ℚ[x, x⁻¹]` gives
  uncompleted `dR = ℚ`, while logifying the units adds a degree-one conjugate class.
- On the supplied period inputs, the identity root system gives zero `d log`; a Tate
  generator has the nonzero first graded boundary of §6.20, also at `p=2` with
  `k=F₂(u)ᵖᵉʳᶠ`. The same specialization gives `log[ε]` under `periodDLogCanonical`.

### CR.DDR.6.8 Log de Rham base change and Künneth

For a homotopy pushout `S` of prelog `A`-algebras `S₁, S₂`, `dR_log(S₁/A) ⊗^L_A S₂ ≃ dR_log(S/S₂)`
and `dR_log(S₁/A) ⊗^L_A dR_log(S₂/A) ≃ dR_log(S/A)`, compatibly with Hodge filtrations and
multiplication. The p-completed versions use completed derived tensor. The first tensor is over the
base ring `A`; `dR_log(S₁/A)` is not generally an `S₁`-module, so the additional `S₁`-relative
tensor printed in [KY] Theorem 2.11 is not used.

[Bhatt12], Proposition 6.12 and proof, p.26; [KY], Theorem 2.11, second displayed formula, p.15.

*Needs:* §CR.DDR.6.7 (*Logarithmic derived de Rham*); §CR.DDR.6.2 (*Homotopy pushouts of prelog
rings*); §CR.DDR.6.6 (*Homological logarithmic flatness*); DerivedDeRhamCohomology §2.23 (*Derived
base change and Künneth*); DerivedDeRhamCohomology §1.17 (*Completed filtered tensor products*)

Lean: `DerivedDeRham.logDeRhamBaseChange`.

**Checks.**

- `test_log_kunneth_identity`: base change along the identity preserves the value.
- `test_log_kunneth_free`: free ring and log variables tensor with the signed differential.
- `test_log_kunneth_non_hlf`: for a non-hlf map the ordinary pushout does not compute the homotopy
  prelog pushout (§CR.DDR.6.6).

### CR.DDR.6.9 Derived logarithmic Cartier theory

Use `DerivedDeRham.logCartier` of DerivedDeRhamCohomology §6.20 for prelog `F_p`-algebras.
Its homotopy Frobenius twist uses ring Frobenius and multiplication by p on the base monoid.
The supplied conjugate filtration has `gr_i^conj ≃ L∧^i L_log((B,N)^(1)/(A,M))[−i]` in
`D(A)`. Retain the levelwise simplicial scalars of that twist in the relative constructions
here; an ordinary twist requires the ring and monoid flatness criteria. On free coordinates
the supplied inverse Cartier map sends `dy` to `[y^(p−1)dy]` and `d log x` to `[d log x]`.

[Bhatt12], Notation 7.1, Lemma 7.2, Theorem 7.3 and Proposition 7.4, pp.27–28;
[KY], Notation 2.15 and Construction 2.6, pp.13, 16.

*Needs:* DerivedDeRhamCohomology §6.20 (`logCartier` and the shared Frobenius twist).

**Checks.**

- `test_log_cartier_ordinary`: `C⁻¹(dy^(1)) = [y^(p−1) dy]`.
- `test_log_cartier_log`: `C⁻¹(d log x^(1)) = [d log x]`, including `p = 2`.
- `test_log_cartier_twist_monoid`: the twisted monoid map is multiplication by `p`.

### CR.DDR.6.9.1 Log relative conjugate transitivity

For composable characteristic-p prelog maps `R = (A,M) → S = (B,N) → T = (C,P)`, construct
`DerivedDeRham.logRelativeConjugateTransitivity`, an increasing relative conjugate filtration on
`dR_log(T/R)`, with `Fil_−1 = 0`, natural transitions, exhaustiveness and multiplication `Fil_i
⊗^L_A Fil_j → Fil_(i+j)`. Choose compatible free prelog resolutions `S_k = (B_k,N_k)` over `R` and
`T_k = (C_k,P_k)` over `S_k`. Write `S_k^(1) = S_k ⊔^L_(R,Frob_R) R`, whose ring is `B_k^(1)`. Its
weight-`n` graded piece in `D(A)` is the realization of `Ω•_log(S_k/R) ⊗_(B_k^(1))
Frob_R^*(∧^n_(C_k) Ω¹_log(T_k/S_k)[−n])`, where the relative exterior power is first formed over
`C_k`, then restricted to `B_k` and extended along `B_k → B_k^(1)`, `b ↦ b ⊗ 1`. The connection is
the Frobenius-descent connection. If the ring of `S^(1)` is discrete, the same formula is
`dR_log(S/R) ⊗^L_(B^(1)) Frob_R^*(Res^C_B L∧^n_C L_log(T/S)[−n])`. For a nondiscrete twist retain
the levelwise models and their `A`-linear realization; taking `π₀` is not a substitute. The shifts,
scalars and filtered-limit restrictions are those of DerivedDeRhamCohomology §§3.3, 3.5 and 3.6.1.

[Bhatt12], Proposition 7.8 and its proof, p.29, using Proposition 7.4 and the ordinary relative
construction of Proposition 3.22, pp.11–12.

*Needs:* §CR.DDR.6.9 (*Derived logarithmic Cartier theory*); §CR.DDR.6.7 (*Logarithmic derived de
Rham*); §CR.DDR.6.8 (*Log de Rham base change and Künneth*); §CR.DDR.6.1 (*Free prelog
resolutions*); DerivedDeRhamCohomology §3.6.1 (*Relative conjugate transitivity*);
DerivedModuleAlgebra §0.14 (*Derived exterior powers*); DerivedDeRhamCohomology §1.14 (*Filtered
derived categories*); DerivedDeRhamCohomology §1.22 (*Valid exchanges of completion and derived
operations*)

**Checks.**

- `test_log_relative_identity_top`: for `S = T`, only weight zero remains, `dR_log(S/R)`.
- `test_log_relative_identity_base`: for `R = S`, this is the absolute log conjugate filtration with
  graded pieces `L∧^n L_log(T^(1)/R)[−n]` from §CR.DDR.6.9.
- `test_log_relative_coordinate`: for `(F_p,0) → (F_p[t],0) → (F_p[t,x],ℕ → x)`, the relative
  weight-one class is `d log x`, including `p=2`, and `dx = x d log x`. With trivial target monoid
  the relative class instead is `x^(p−1) dx` as in DerivedDeRhamCohomology §3.6.1.

### CR.DDR.6.10 The boundary of logification invariance

Use `DerivedDeRham.logificationBoundaries` of DerivedDeRhamCohomology §6.20.
For integral prelog monoids over `ℤ/p^n`, `n ≥ 1`, it identifies raw log derived de Rham
with that of the associated log structures, preserving the Hodge and conjugate filtrations.
Its p-completed form requires the compatible derived reductions stated there. These are
conditions on the comparisons consumed here; cotangent logification invariance alone does
not extend raw de Rham invariance to characteristic zero.

[Bhatt12], Corollary 7.5 and proof, pp.28–29; Example 6.15, p.27.

*Needs:* DerivedDeRhamCohomology §6.20 (`logificationBoundaries`);
§CR.5:log-algebra.5 (integral log structures).

**Checks.**

- `test_logification_char_p`: over `F_p`, the prelog chart `ℕ → F_p[x]` and its logification give
  the same log derived de Rham complex.
- `test_logification_rational_counterexample`: over `ℚ`, [Bhatt12] Example 6.15 shows the
  uncompleted invariance fails.
- `test_logification_cotangent_range`: the cotangent complex is logification-invariant also over
  `ℚ`, while the de Rham statement is not.

### CR.DDR.6.11 Integral log smooth Cartier-type comparison

For a map of integral prelog `F_p`-algebras that is integral and log smooth of Cartier type after
logification, Gabber `L_log` is the ordinary log differential module (§CR.DDR.6.5) and derived log
de Rham agrees with the ordinary log complex. Nilpotent-p extensions retain flatness and finite
dévissage hypotheses. Cartier type is the condition of §CR.5.1 on the relative Frobenius; it is not
inferred from fs log smoothness alone.

[Bhatt12], Corollary 7.6 and its proof, pp.28–29; [KY], Lemma 2.14, pp.15–16.

*Needs:* §CR.DDR.6.5 (*Log cotangent transitivity, base change and invariance*); §CR.DDR.6.9
(*Derived logarithmic Cartier theory*); §CR.DDR.6.10 (*The boundary of logification invariance*);
§CR.5.1, §CR.5:log-algebra.3.

Lean: `DerivedDeRham.logSmoothCartierComparison`.

**Checks.**

- `test_log_smooth_identity`: the identity chart gives the base.
- `test_log_smooth_free_coordinate`: a free log coordinate satisfies the integral Cartier-type
  criterion.
- `test_log_smooth_nonintegral`: a log-étale nonintegral monoid map (§CR.DDR.6.4) has nonzero Gabber
  cotangent complex; integrality cannot be dropped.

### CR.DDR.6.12 The log crystalline comparison map

**Integral free-resolution envelopes.** For `n ≥ 1` and a prelog `ℤ/p^n`-map
`f : (A, M) → (B, N)` with integral monoids `M` and `N`, prove
`DerivedDeRham.logCrystallineIntegralResolution`: every term of the standard free prelog
resolution has the form `(A[T_i, S_i], M ⊕ ℕ^(S_i))`, hence has integral chart monoid and
integral quasi-coherent logification. The augmentation is surjective on rings and monoids,
so its logification embeds the original integral quasi-coherent log scheme of `(B, N)` into
this coordinate ambient. Over the log base `(Spec A, Mᵃ)` with zero PD ideal, the
source-preserving quasi-coherent log PD envelope of §CR.5.2 exists and is coordinate PD smooth.
Its closed fibre retains `Nᵃ`; its ambient log structure remains integral quasi-coherent.
The zero base PD structure extends to both source and ambient.

On fine models this envelope is obtained by exactification followed by the strict PD envelope;
in the integral quasi-coherent range use Beilinson's envelope and its fine-model descent,
without requiring a global chosen exactification. The universal property extends the
simplicial structure maps and resolution comparisons to the envelopes. The log PD Poincaré
lemma identifies each resulting log PD de Rham complex with the cohomology of the same site
of §CR.5.3, compatibly with the PD filtration.

[Bhatt12], Proposition 7.18 and proof, p.30; [Beilinson, *On the crystalline period
map*](https://arxiv.org/abs/1111.3316v4), §1.3, pp.4–6; §1.4(i), p.6; §§1.8–1.9, pp.11–13.
*Needs:* §CR.DDR.6.1 (*Free prelog resolutions*); §CR.DDR.6.10 (*The boundary of logification
invariance*); §CR.5.2–§CR.5.4.

**Checks.**

- `test_log_crys_free_integral`: adjoining any sets of ordinary and log generators to an
  integral chart preserves cancellation; the logification is integral quasi-coherent.
- `test_log_crys_fine_envelope`: for the fine log affine-line diagonal the envelope contains
  the unit ratio and divided powers of `t₂/t₁ − 1`, with the original log structure on the fibre.
- `test_log_crys_nonfine_envelope`: the identity embedding of the integral chart
  `(F_p, ℚ≥0)` sending positive elements to zero has its identity envelope, although the chart
  is not fine.

**The integral log crystalline comparison map.** For `n ≥ 1` and a prelog `ℤ/p^n`-map
`f : (A, M) → (B, N)` with integral `M` and `N`, let `f_log-crys` be the site of §CR.5.3 for
the associated log schemes over `(Spec A, Mᵃ)` with zero base PD ideal. Use
`logCrystallineIntegralResolution` to form its envelope model `D_log(P• → (B, N))`.
The natural map `Ω•_log(P•/(A, M)) → Ω•_log(P•/(A, M)) ⊗ D_log(P• → (B, N))` yields
`Comp_log : dR_log(f) → RΓ(f_log-crys, O_crys)`,
`DerivedDeRham.logCrystallineComparisonMap`, via the log PD Poincaré lemma (§CR.5.4).
It is natural in `DF(A)`, respects Hodge/PD filtrations, and is multiplicative in the sense
of §CR.DDR.4.1: a map of strict dg algebras into the envelope model, compatible with cup products
in `D(A)`. The derived prelog source and its shared constructors retain the general domain of
DerivedDeRhamCohomology §6.20; this crystalline comparison uses the integral range above.

[Bhatt12], Proposition 7.18 and proof, p.30, restricted to integral charts;
[Beilinson, *On the crystalline period map*](https://arxiv.org/abs/1111.3316v4), §1.9, pp.12–13.

*Needs:* §CR.DDR.6.1 (*Free prelog resolutions*); §CR.DDR.6.7 (*Logarithmic derived de Rham*);
*Integral free-resolution envelopes*; §CR.DDR.4.1 (*The derived de Rham to crystalline map*);
§CR.5.2–§CR.5.4, DerivedDeRhamCohomology §PD.6.

Prove the following named laws, all for `n ≥ 1` and integral source and target chart monoids.

- `logCrystallineComparisonNatural`: prelog base squares whose four chart monoids are integral
  induce commuting comparison-map squares.
- `logCrystallineComparisonFiltered`: Hodge terms map to the log crystalline PD filtration.
- `logCrystallineComparisonStrict`: for strict maps with fixed log structure the map is the ordinary
  `Comp`.
- `logCrystallineComparisonExactification`: on fine models the target uses exactification followed
  by the strict PD envelope; their descended model is the universal integral quasi-coherent
  envelope, functorially, retaining the given source log structure.

**Checks.**

- `test_log_crys_identity`: for an identity prelog map with integral chart over `ℤ/p^n`, `n ≥ 1`,
  `Comp` is the base identity.
- `test_log_crys_strict_regular`: a strict regular quotient with integral charts in the
  nilpotent-p flat range agrees with the PD comparison of §CR.DDR.4.3.
- `test_log_crys_noncartier`: [Bhatt12] Example 7.23 has integral chart monoids and a comparison
  map, but its relative Frobenius-twisted source and ordinary crystalline target differ.
- `LogCrystalline.idempotentChart_boundary`: let `E = {1, e}` with `e² = e ≠ 1` and map it
  to `F₂` by `e ↦ 0`. This is already a log ring, since only `1` maps to a unit, but
  `e·e = e·1` violates cancellation; its associated log scheme is outside this comparison's
  domain, including for the identity map. In `E^gp` one has `e = 1`, so integralization
  cannot preserve this ring and chart: it would force `0 = 1` in `F₂`.

### CR.DDR.6.13 The corrected logarithmic lci condition

For `n ≥ 1`, a prelog `ℤ/p^n`-map `(A, M) → (B, N)` with integral `M` and `N` and with `A` and `B`
flat over `ℤ/p^n` is *corrected G-lci*, `DerivedDeRham.correctedLogLciCondition`, if it factors as
`(A, M) → (P, Q) → (B, N)` with integral `Q`, the first map integral and log smooth of Cartier type
modulo `p` and the second a strict surjection whose kernel is generated by a finite regular sequence.
It is *ind-corrected G-lci* if it is a filtered colimit of corrected G-lci maps with compatible
factorizations (maps of factorizations commuting with the structure maps). Filtered colimits of
these integral chart monoids remain integral, so the resulting map has the crystalline target of
§CR.DDR.6.12. A strict effective epimorphism without the regular-sequence condition does not suffice:
[Bhatt12] Definition 7.20 is corrected by adding it in this integral-chart range.

[Bhatt12], Definition 7.20, Example 7.21 and Theorem 7.22 proof sketch, p.31.

*Needs:* §CR.DDR.6.11 (*Integral log smooth Cartier-type comparison*); §CR.DDR.6.12 (*The log
crystalline comparison map*); DerivedModuleAlgebra §0.13 (*Regular quotients and two-term models*);
§CR.5.1, §CR.5:log-algebra.3; Mathlib `RingTheory.Sequence.IsWeaklyRegular`,
`RingTheory.Sequence.IsRegular`.

Prove the following named laws.

- `correctedGLciFactorization`: the condition returns the chosen factorization with its regular
  quotient and modulo-p Cartier witnesses.
- `correctedGLciStrictRegular`: a strict regular quotient of flat `ℤ/p^n`-algebras with integral
  charts is in the condition, with identity first factor.
- `correctedGLciLocalFiltered`: the ind-corrected condition is stable under filtered colimits of
  compatible factorizations.
- `correctedGLciExample721`: for every `n ≥ 1`, the reductions modulo `p^n` of source examples (i)
  and (iii) are corrected G-lci with the following factorizations reduced modulo `p^n`: (i) for `O_K
  = W[t]/(E(t))` with Eisenstein `E` and uniformizer `π`, the factorization `(0 → W) → (ℕ → W[t], 1
  ↦ t) → (ℕ → O_K, 1 ↦ π)` has a log smooth Cartier-type first map and kernel `(E(t))`, and
  logification (§CR.DDR.6.10) passes to `(O_K ∖ {0} → O_K)`; (iii) the semistable chart `ℕ^r →
  O_K[x₁, …, x_d]/(x₁ ⋯ x_r − π)` over `(ℕ → O_K, 1 ↦ π)`, `1 ↦ e₁ + … + e_r`, is log smooth of
  Cartier type with identity second map. Example (ii), `O_K̄`, is not obtained from this condition;
  the period computation uses the log–ordinary comparison of [Bhatt12] Proposition 9.11 instead. The
  p-adic comparisons of (i) and (iii) use their compatible finite-level factorizations
  (§CR.DDR.6.14); `W = ℤ_p` itself is not a `ℤ/p^n`-algebra, since `p^n ≠ 0` in `ℤ_p`.

**Checks.**

- `test_corrected_glci_identity`: the identity map of a flat `ℤ/p^n`-algebra with integral chart has
  empty regular sequence and Cartier-type first factor.
- `test_corrected_glci_characteristic_zero`: for `k = F_p`, `W = ℤ_p` has no unital `ℤ/p^n`-algebra
  structure for `n ≥ 1`, whereas its finite reductions admit the Eisenstein factorization above.
- `test_corrected_glci_hypersurface`: the strict quotient `F_p[t] → F_p` by the regular element `t`
  qualifies.
- `test_corrected_glci_square_zero`: `F_p → F_p[x,y] → F_p[x,y]/(x,y)²` with trivial logs satisfies
  the printed condition of [Bhatt12] Definition 7.20 but fails the corrected regular quotient
  condition.

### CR.DDR.6.14 The corrected log crystalline comparison theorem

For a corrected G-lci prelog `ℤ/p^n`-map in the integral-chart range of §CR.DDR.6.13, `Comp_log` is
an isomorphism in `DF(A)` compatible with cup products (§CR.DDR.6.12). For an ind-corrected G-lci map
the same holds: filtered colimits preserve integral chart monoids, `dR_log` commutes with filtered
colimits (§CR.DDR.6.1), and the affine envelope model of §CR.DDR.6.12 commutes with these colimits
by the universal properties of logification and log PD envelopes and the termwise construction of
log differentials. The compatible p-adic version uses derived limits of flat finite reductions
with integral charts and the same factorizations. The proof combines the integral Cartier-type log smooth
comparison (§CR.DDR.6.11) for the first factor with the regular quotient comparison of §CR.DDR.4.3
for the second and the logarithmic relative conjugate filtration ([Bhatt12] Proposition 7.8). This
is the valid scope of [Bhatt12] Theorem 7.22 with the corrected condition; neither arbitrary strict
surjections nor every fs log smooth map are included.

[Bhatt12], Theorem 7.22 proof sketch and Proposition 7.8, pp.29, 31.

*Needs:* §CR.DDR.6.13 (*The corrected logarithmic lci condition*); §CR.DDR.6.12 (*The log
crystalline comparison map*); §CR.DDR.6.11 (*Integral log smooth Cartier-type comparison*);
§CR.DDR.6.9 (*Derived logarithmic Cartier theory*); §CR.DDR.6.9.1 (*Log relative conjugate
transitivity*); §CR.DDR.6.8 (*Log de Rham base change and Künneth*); §CR.DDR.4.3 (*Regular quotients
and classical PD envelopes*); §CR.DDR.5.9 (*The lci crystalline comparison theorem*); §CR.DDR.5.10
(*p-adic crystalline comparison by derived limits*); §CR.5.2–§CR.5.4; DerivedModuleAlgebra §1.1
(*Derived limits of towers*); DerivedModuleAlgebra §1.T.1 / *The Milnor sequence for towers of
complexes*.

Lean: `DerivedDeRham.logLciCrystallineComparison`.

**Checks.**

- `test_log_crys_thm_regular`: a finite strict regular quotient gives the corrected positive case,
  including `p = 2`.
- `test_log_crys_thm_square_zero`: the nonregular square-zero quotient is a negative case even with
  trivial monoids (§CR.DDR.4.1).
- `test_log_crys_thm_eisenstein`: example (i) of §CR.DDR.6.13 over `ℤ/p^n` gives an equivalence.

### CR.DDR.6.15 Log quasisyntomic sites and QRSP bases

A log-quasisyntomic prelog ring `(R, P)` has `R` p-complete with bounded p-torsion and Gabber
`L_log((R, P)/ℤ_p)` of p-complete Tor amplitude `[−1, 0]`; `P` need not be integral ([KY] Definition
3.2). A map `A → B` of bounded-torsion p-complete prelog rings is p-completely homologically log
flat when `B ⊗^L_A A/p ≃ B/p` is discrete and `A/p → B/p` is hlf. It is log-quasisyntomic when
moreover `L_log(B/A) ⊗^L_B B/p` has Tor amplitude `[−1, 0]`, and a cover when the mod-p map is hlf
faithfully flat. These covers define `QSyn_prelog` and the relative `qSyn_(R,P)`,
`DerivedDeRham.logQuasisyntomicSites`. Integral monoids are an additional restriction of the
log-smooth and prismatic applications, not part of the general site definition.

[KY], Definitions 3.1–3.3, Lemmas 3.5–3.6, Corollary 3.7 and Remarks 3.8–3.9, pp.27–28.

*Needs:* §CR.DDR.6.6 (*Homological logarithmic flatness*); §CR.DDR.6.4 (*The Gabber logarithmic
cotangent complex*); §CR.DDR.6.5 (*Log cotangent transitivity, base change and invariance*);
§CR.DDR.6.2 (*Homotopy pushouts of prelog rings*); DerivedDeRhamCohomology §5.1 (*The quasisyntomic
sites*); DerivedModuleAlgebra §1.7 (*Complete flatness and complete faithful flatness*)

Prove the following named laws.

- `logQSynCover`: a cover retains complete faithful flatness, completed hlf and relative log
  cotangent amplitude `[−1, 0]`.
- `logQSynBaseChange`: the completed homotopy prelog base change preserves covers ([KY] Lemma 3.6).

**Checks.**

- `test_log_qsyn_strict`: with identical monoids and the strict conventions, the ordinary `QSyn`
  condition is recovered.
- `test_log_qsyn_semistable`: the p-complete integral semistable chart is log quasisyntomic over its
  logarithmic `O_K` base.
- `test_log_qsyn_hlf_boundary`: a Kato log-flat map that is not hlf fails the log `QSyn` cover
  condition, even if its ring reduction is flat.

### CR.DDR.6.16 Log quasiregular semiperfectoid objects

For a p-complete prelog ring `(S, P)`, let `P^♭ = lim_(×p) P` and `P^×` its units. It is log
semiperfectoid ([KY] Definition 3.11) if (1) `S` admits a map from an integral perfectoid ring
(PerfectoidSpaces §P1.24), (2) Frobenius on `S/p` is surjective, and (3) `P^♭ → P/P^×` is
surjective. It is log quasiregular semiperfectoid if also `(S, P)` is log quasisyntomic,
`DerivedDeRham.logQuasiregularSemiperfectoid`. Integrality of `P` is a separate hypothesis. The
tilt-surjectivity clause is stronger than p-divisibility of `P/P^×` and weaker than p-divisibility
of `P`. Such objects have `Λ_p L_log((S, P)/ℤ_p)[−1]` complete-flat; equivalently, under the log
semiperfect assumptions, the shifted relative cotangent of `(S, P)` over a perfectoid ring with
trivial prelog structure is complete-flat ([KY] Lemma 3.16).

[KY], Definition 3.11, Remarks 3.12–3.15 and Lemma 3.16, pp.29–31.

*Needs:* §CR.DDR.6.15 (*Log quasisyntomic sites and QRSP bases*); §CR.DDR.6.4 (*The Gabber
logarithmic cotangent complex*); §CR.DDR.6.5 (*Log cotangent transitivity, base change and
invariance*); PerfectoidSpaces §P1.24.

Prove the following named laws.

- `logQrspTiltCondition`: `P^♭ → P/P^×` is surjective, with the ring perfectoid-source and
  semiperfectness conditions.
- `logQrspCotangent`: under log semiperfectness, the shifted relative log cotangent is complete-flat
  exactly in the log QRSP range.
- `logQrspPerfectoidSource`: the completed source prelog ring surjects on rings and modulo monoid
  units.
- `logQrspDivisibilityRelations`: `P` p-divisible implies tilt-surjectivity, which implies `P/P^×`
  p-divisible; for sharp monoids the three conditions agree.

**Checks.**

- `test_log_qrsp_trivial`: for trivial monoids the condition reduces to the ordinary QRSP ring
  condition.
- `test_log_qrsp_divisible`: if `S` is ordinary QRSP and `P` is uniquely p-divisible, then `(S, P)`
  is log QRSP ([KY] Example 3.15(1)).
- `test_log_qrsp_missing_ring_source`: `(ℤ_p, 0)` has semiperfect reduction and the tilt condition,
  but lacks a perfectoid ring map (DerivedDeRhamCohomology §5.2) and is excluded.

### CR.DDR.6.17 Compatible-root covers of prelog rings

For `(R, P) ∈ QSyn_prelog`, choose ring generators `ℤ_p[X_i] → R` and monoid generators `ℕ^(J) → P`.
Use the free p-complete prelog source `(ℤ_p⟨X_i, Y_j⟩, ℕ^(J))`, with `e_j ↦ Y_j`, and its
compatible-root cover `(O⟨X_i^(1/p^∞), Y_j^(1/p^∞)⟩, ℕ[1/p]^(J))` over an integral perfectoid `O`
(for example `ℤ_p[p^(1/p^∞)]^∧`, integral perfectoid by PerfectoidSpaces §P1.24–§P1.25). The
p-completed homotopy prelog base change (§CR.DDR.6.2) to `(R, P)` gives a log `QSyn` cover by log
QRSP objects, and its target monoid is p-divisible. The target need not be integral. All completed
Čech terms are log QRSP; restriction to this basis and Čech totalization are inverse descent
constructions, `DerivedDeRham.logCompatibleRootCovers`.

[KY], Lemmas 3.17–3.19 and Corollary 3.20 with proof, pp.31–32.

*Needs:* §CR.DDR.6.15 (*Log quasisyntomic sites and QRSP bases*); §CR.DDR.6.16 (*Log quasiregular
semiperfectoid objects*); §CR.DDR.6.1 (*Free prelog resolutions*); §CR.DDR.6.6 (*Homological
logarithmic flatness*); §CR.DDR.6.2 (*Homotopy pushouts of prelog rings*); DerivedDeRhamCohomology
§5.3 (*Compatible-root quasisyntomic covers*); DerivedDeRhamCohomology §5.5 (*Sheaves and unfolding
from the QRSP basis*); PerfectoidSpaces §P1.24–§P1.25.

Prove the following named laws.

- `logRootCover`: the displayed completed two-sort pushout gives a log `QSyn` cover with log QRSP
  target.
- `logRootCoverMonoid`: the target monoid is p-divisible and satisfies the tilt-surjectivity
  condition.
- `logRootCoverCech`: every completed Čech term is log QRSP ([KY] Lemma 3.19).
- `logRootCoverUnfolding`: general prelog log QRSP basis functors unfold by the corresponding Čech
  totalization, independently of the cover.
- `logQSynQrspBasis`: log QRSP objects form a basis of `QSyn_prelog`; integrality of an output is
  checked separately when an application needs it.
- `logQSynUnfolding`: restriction to the general prelog QRSP basis and Čech totalization are inverse
  descent constructions.

**Checks.**

- `test_log_root_cover_trivial`: with no monoid generators, the construction specializes to the
  ordinary ring compatible-root cover of DerivedDeRhamCohomology §5.3.
- `test_log_root_cover_coordinate`: a free monoid coordinate `x` acquires compatible monoid roots
  and matching ring roots `x^(1/p^n)`.
- `test_log_root_cover_finite`: one finite root stage does not make the monoid p-divisible or the
  ring reduction semiperfect.

### CR.DDR.6.18 Log cotangent powers and completed de Rham descent

For a fixed prelog base, derived exterior powers of the Gabber log cotangent complex satisfy hlf
faithfully flat Čech descent. Finite Hodge quotients of log derived de Rham inherit descent; the
Hodge-completed object descends by its quotient limit. In the log-quasisyntomic range, p-completed
uncompleted log de Rham descends using the uniformly bounded-below conjugate filtration. The
completion and totalization exchanges retain their boundedness hypotheses and the prelog homotopy
Čech nerve.

[KY], Proposition 2.47, Remark 2.48 and Corollary 2.49, pp.24–26; Corollary 3.10, p.29.

*Needs:* §CR.DDR.6.6 (*Homological logarithmic flatness*); §CR.DDR.6.15 (*Log quasisyntomic sites
and QRSP bases*); §CR.DDR.6.17 (*Compatible-root covers of prelog rings*); §CR.DDR.6.9 (*Derived
logarithmic Cartier theory*); §CR.DDR.6.7 (*Logarithmic derived de Rham*); §CR.DDR.6.2 (*Homotopy
pushouts of prelog rings*); DerivedModuleAlgebra §0.17 (*Exterior powers of a triangle and
décalage*); DerivedDeRhamCohomology §5.6 (*Descent of raw and completed cotangent powers*);
DerivedDeRhamCohomology §5.7 (*Descent of Hodge quotients and completion*); DerivedDeRhamCohomology
§5.17 (*Descent of p-completed uncompleted de Rham*); DerivedDeRhamCohomology §1.22 (*Valid
exchanges of completion and derived operations*); DerivedModuleAlgebra §1.1 (*Derived limits of
towers*); DerivedModuleAlgebra §1.T.1 / *The Milnor sequence for towers of complexes*.

Lean: `DerivedDeRham.logPowerDeRhamDescent`.

**Checks.**

- `test_log_descent_trivial_monoids`: trivial monoids give the ordinary descent of
  DerivedDeRhamCohomology §5.6–5.7.
- `test_log_descent_identity`: the identity cover is constant.
- `test_log_descent_root_cover`: a root cover uses both monoid and ring coordinates in its Čech
  nerve.

### CR.DDR.6.19 The log point and its full cotangent complex

For a field `k`, the standard log point is `(k, ℕ)` with every positive monoid element sent to `0`.
Over the trivial prelog base `(k, 0)`, its Gabber complex is `[k --0→ k]` in cohomological degrees
`−1, 0`: factor through the free log line `(k[t], ℕ)`, then the strict regular quotient `t = 0`,
whose conormal maps to `t d log t = 0`. `H⁰` is `k·d log 1` and `H^−1` is `k`; the log point over
this trivial base is not assigned the integral log-smooth degree-zero theorem. Over itself the
relative complex is zero and derived de Rham is `k`. Over `F_p` its Hodge and conjugate powers
retain both cotangent degrees and the derived twist.

[Bhatt12], Example 6.2, Proposition 6.5 and the strict regular quotient calculation of §§3.3, 6,
pp.16–18, 24–25.

*Needs:* §CR.DDR.6.4 (*The Gabber logarithmic cotangent complex*); §CR.DDR.6.5 (*Log cotangent
transitivity, base change and invariance*); §CR.DDR.6.7 (*Logarithmic derived de Rham*); §CR.DDR.6.9
(*Derived logarithmic Cartier theory*); DerivedModuleAlgebra §0.13 (*Regular quotients and two-term
models*)

Lean: `DerivedDeRham.logPointExample`.

**Checks.**

- `test_log_point_trivial_base`: over `(k, 0)` the complex is `[k → k]` with zero map.
- `test_log_point_identity`: over itself the relative complex is zero.
- `test_log_point_char_two`: at `p = 2` there is no hidden invertibility-of-2 hypothesis; both
  degrees survive.

### CR.DDR.6.20 The semistable chart with its monoid map

Let `O_K` be a complete mixed-characteristic discrete valuation ring with uniformizer `π` and
perfect residue field. For `1 ≤ r ≤ d`, `B = O_K[x₁, …, x_d]/(x₁ ⋯ x_r − π)`, or its p-adic
completion, carries the chart `ℕ^r → B`, `e_i ↦ x_i`. The base chart is `ℕ → O_K`, `1 ↦ π`, and the
monoid map sends `1 ↦ e₁ + … + e_r`. This is an integral log smooth Cartier-type chart; its relative
Gabber cotangent is the finite free module on `d log x₁, …, d log x_r, dx_(r+1), …, dx_d` modulo `Σ
d log x_i = 0`, in degree zero and rank `d − 1`. For the completed chart use continuous completed
differentials. The log de Rham Hodge and conjugate pieces, finite reductions and crystalline
comparison retain this base chart; the trivial log base has a different cotangent complex.

[Bhatt12], Example 7.21, third example, p.31; §CR.5:log-algebra.6 (semistable formal charts).

*Needs:* §CR.DDR.6.11 (*Integral log smooth Cartier-type comparison*); §CR.DDR.6.14 (*The corrected
log crystalline comparison theorem*); §CR.DDR.6.7 (*Logarithmic derived de Rham*); §CR.DDR.6.9
(*Derived logarithmic Cartier theory*); DerivedDeRhamCohomology §2.27 (*The de Rham algebra of a
completely smooth formal algebra*); §CR.5:log-algebra.6.

Lean: `DerivedDeRham.semistableChartExample`.

**Checks.**

- `test_semistable_rank_one`: `r = d = 1` gives rank `0`.
- `test_semistable_rank_two`: `r = d = 2` gives the relation `d log x₁ + d log x₂ = 0` and rank `1`.
- `test_semistable_ramified`: for a ramified `O_K` use `π`, not `p`, with base `1 ↦ π`; `r = 0` is
  excluded.

### Examples

- For the semistable chart `W[x, y]/(xy − p)` over `W` with log structure from `x, y`, the log
  differentials satisfy `dlog x + dlog y = dlog p`. Write `W_p^log` for
  `(Spec W, ℕ → W, 1 ↦ p)`. Relative to `W_p^log`, the relation is `dlog x + dlog y = 0`, and
  `Ω¹_log` is free of rank one on `dlog x`.

### Dependencies

Layers CR.5:log-algebra; EnhancedDerivedSheaves (Layer E1, Layer E2); DerivedDeRhamCohomology
(Layer 1); PerfectoidSpaces (Layer P1); Mathlib.

## Layer CR.6: Hyodo–Kato complexes and semistable structure

This layer is Hyodo–Kato theory: the Hyodo–Kato complexes over the log Witt base with Frobenius and
monodromy, the relation `Nφ = pφN`, finiteness and nilpotence, the logarithmic de Rham–Witt complex
and the log de Rham–Witt model, the
uniformizer-dependent Hyodo–Kato map and the comparison theorem, change of uniformizer, products,
good reduction and the Tate curve; then the convergent complexes on tubes and their Witt models
after Disegni–Liu and log rigid Hyodo–Kato cohomology after Grosse-Klönne.

### CR.6.1 Hyodo–Kato complexes, Frobenius and monodromy

**Standard log Witt bases.** For p prime and k perfect of characteristic p, W_n(k) and W(k) carry
the associated log structure of ℕ→W_n(k) or W(k), 1↦0. The base PD ideal (p) has its canonical
compatible divided powers. Frobenius is Witt Frobenius σ on the ring and multiplication by p on the
chart; reductions preserve the chart. This is different from the chart 1↦p.

The API:

- `LogCrystalline.logWittBase.chart`: The chart generator maps to zero.
- `LogCrystalline.logWittBase.frobenius`: The ring part is the pinned Witt Frobenius and the monoid
  part multiplies by p.
- `LogCrystalline.logWittBase.reduce`: `W_{n+1}→W_n` preserves the chart and the PD structure.

*Proof sketch.* Use Mathlib’s Witt vectors with their Frobenius and the finite quotients of Layer
CR.4. Logify the zero chart at every level and apply the canonical PD structure on (p).
([Hyodo–Kato, *Semi-stable reduction and crystalline cohomology with logarithmic
poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), §3.1, p.242.) *Needs:* *Associated
log structures* (Layer CR.5:log-algebra); DerivedDeRhamCohomology §§PD.1–PD.2, PD.4–PD.7 and
DerivedModuleAlgebra §0.DP.3; Mathlib `WittVector`; Mathlib `WittVector.frobenius`; Mathlib
`WittVector.frobeniusEquiv`.

**Checks.**

- `length_one`: W₁(k)^log=k with 1↦0.
- `relative_identity`: The identity of the log Witt base has zero relative log differentials.
- `not_p_chart`: At lengths n>1 the chart 1↦0 differs from the chart 1↦p.
- The characteristic remains ℕ at every Witt level.

**Integral Hyodo–Kato complexes.** Let O_K be a complete mixed-characteristic DVR with perfect
residue k, and X a proper semistable model with special log fiber Y over k^log. Define
C_HK,ℤ(Y)=Rlim_n RΓ_logcrys(Y/W_n(k)^log,O), with the canonical PD ideal (p). The construction uses
the actual reduced diagonal semistable log structure. Finite-level embedding descent is integral;
the cohomology can have p-torsion.

The API:

- `LogCrystalline.integralHK.finite_level`: There are coherent maps to RΓ_logcrys(Y/W_n(k)^log).
- `LogCrystalline.integralHK.embedding_model`: A compatible log PD embedding system computes the
  same integral complex.
- `LogCrystalline.integralHK.pullback`: A map of proper semistable models induces a contravariant
  map of integral HK complexes.

*Proof sketch.* Apply the completed log crystalline construction to the standard Witt log base.
Choose compatible embeddings/hypercovers and their integral PD log complexes; retain derived inverse
limits. ([Hyodo–Kato, *Semi-stable reduction and crystalline cohomology with logarithmic
poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), §3.1–3.3, pp.242–244.) *Needs:*
*Standard log Witt bases*; *Derived p-adic log crystalline cohomology* (Layer CR.5); *Log structures
on semistable formal charts* (Layer CR.5:log-algebra); Layer CR.3; Mathlib `DerivedCategory`.

**Checks.**

- `point`: The relative log point has integral HK=W(k) in degree zero.
- `zero_cohomology`: Its positive-degree cohomology vanishes.
- `projective_line`: For the good-reduction model `P¹_{O_K}`, integral HK has
  H⁰=W(k), H²=W(k)(−1) and all other cohomology zero. In degree 2,
  Frobenius is pσ, so this integral module cannot be replaced by K₀(−1).
- `two_points`: A disjoint union of two good-reduction points has H⁰=W(k)²,
  distinguishing the construction from an always-rank-one object.
- For Y the log point over itself, C_HK,ℤ=W(k).

**Rational Hyodo–Kato complexes.** With the same proper semistable hypotheses let K₀=Frac
W(k)=W(k)[1/p] and `C_HK(Y)=C_HK,ℤ(Y)⊗^L_{W(k)}K₀`. Its cohomology D^m is finite dimensional over K₀,
with the Frobenius and monodromy constructed below. Rationalization is an explicit scalar extension
and does not identify integral cohomology lattices with torsion-free ones.

The API:

- `LogCrystalline.rationalHK.cohomology`: Rational cohomology is integral cohomology tensored with
  K₀.
- `LogCrystalline.rationalHK.map`: Pullback maps commute with rationalization.
- `LogCrystalline.rationalHK.torsion_killed`: Every p-power torsion class maps to zero.

*Proof sketch.* Invert p by the derived scalar extension, which is flat. Transport the finite-level
operators and their coherent identities to the rational complex. ([Hyodo–Kato, *Semi-stable
reduction and crystalline cohomology with logarithmic
poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), §3.2, p.243; Theorem 5.1,
pp.262–263.) *Needs:* *Integral Hyodo–Kato complexes*; EnhancedDerivedSheaves Layer E1 (*Derived sheaf tensor*).

**Checks.**

- `point`: For the relative log point the rational complex is K₀ in degree zero.
- `projective_line`: For the good-reduction projective line, H⁰=K₀ and H²=K₀(−1), with
  all other cohomology zero.
- `two_points`: For two disjoint good-reduction points, H⁰=K₀² and higher cohomology vanishes.

**Hyodo–Kato Frobenius.** Absolute Frobenius of the special log fiber, together with Witt Frobenius
σ and multiplication by p on the base chart, gives a σ-semilinear chain endomorphism φ of integral
HK, hence of rational HK. Equivalently its linearization is σ*C_HK→C_HK. On a lifted coordinate de
Rham model φ in degree q is p^q times the coefficient Frobenius on logarithmic q-forms, with
Frobenius-lift comparisons supplied by descent.

The API:

- `LogCrystalline.hkFrobenius.semilinear`: φ(ax)=σ(a)φ(x).
- `LogCrystalline.hkFrobenius.linearization`: The associated σ-twisted linear map is the
  linearization, not an ordinary K₀-linear φ.
- `LogCrystalline.hkFrobenius.forms`: On q-fold logarithmic generators the Frobenius multiplier is
  p^q.

*Proof sketch.* Use the absolute log Frobenius and the base σ to induce the crystalline map. Compute
φ(dlog x)=p dlog x on a coordinate lift, then descend the model-independent endomorphism.
([Hyodo–Kato, *Semi-stable reduction and crystalline cohomology with logarithmic
poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), §3.2–3.4, pp.243–245;
[Česnavičius–Koshikawa, *The A_inf-cohomology in the semistable
case*](https://arxiv.org/abs/1710.06145v3), §5.11, log Frobenius lift, pp.37–38.) *Needs:* SchemeAndStackFoundations §0.29
(`absoluteFrobenius`, `schemeFrobeniusTwist`, `relativeFrobenius`); *Integral
Hyodo–Kato complexes*; *Rational Hyodo–Kato complexes*; *Logarithmic embedding-system descent*
(Layer CR.5); *Morphisms of Cartier type* (Layer CR.5); Mathlib `WittVector.frobenius`; Mathlib
`ModuleCat.extendScalars`.

**Checks.**

- `point`: On W(k) in degree zero, φ=σ.
- `log_one_form`: A logarithmic one-form acquires the factor p.
- `not_linear`: For `k=F_{p²}` and a∈k with a^p≠a, on degree-zero W(k) the Teichmüller element
  satisfies φ([a])=[a^p]≠[a]φ(1).
- On H⁰ of the log point φ is σ.

**Hyodo–Kato monodromy.** Embed the special log fiber over the log parameter base W_n(k)[t]^log,
then use its PD t-envelope and specialize t=0 in the derived category. Let C be the relative log
complex and C̃ the complex relative to the trivial Witt log structure. With θ=dlog t and the signed inclusion ι_θ specified in Conventions, 0→C[−1]→C̃→C→0 defines the connecting endomorphism N:C→C. The equivalent PD logarithmic
diagonal Taylor description takes the first coefficient of the unit-ratio parameter. Fix this
convention throughout.

The API:

- `LogCrystalline.hkMonodromy.boundary`: N is the connecting morphism of the signed θ triangle, with `d_{C[−1]}=−d_C`.
- `LogCrystalline.hkMonodromy.linear`: N is W(k)-linear integrally and K₀-linear rationally.
- `LogCrystalline.hkMonodromy.embedding_independence`: Common embedding refinements preserve the
  connecting endomorphism.

*Proof sketch.* Use the embedding system over W_n[t]^log and form absolute and relative PD log
complexes. Take the connecting map of the signed θ short exact sequence after derived t=0 specialization. In degree q identify right wedge with left wedge by `(−1)^{q−1}`; include this identification when comparing the source triangle and its boundary with the first logarithmic PD Taylor coefficient and pass through Rlim
and rationalization. ([Hyodo–Kato, *Semi-stable reduction and crystalline cohomology with
logarithmic poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), §3.5–3.6, pp.244–246;
§4.20.) *Needs:* *Integral Hyodo–Kato complexes*; *Fine log PD envelopes* (Layer CR.5); *Filtered
logarithmic PD de Rham complexes* (Layer CR.5); *Logarithmic embedding-system descent* (Layer CR.5);
EnhancedDerivedSheaves Layer E1 (*The enhanced derived category*).

**Checks.**

- `point`: For the relative log point N=0.
- `tate_block`: In the geometric Tate model’s unscaled slope basis, N(e₁)=v_K(q)e₀ and N(e₀)=0.
  Scaling e₁ by v_K(q)⁻¹ gives the normalized unit block.
- `shift_chain_map`: For x↦dx, the coefficients in dι_θ^1(x) and
  `ι_θ^2(d_{C[−1]}x)` are both +1; raw right wedge gives +1 and −1.
- `wedge_sign`: On the normalized Tate block, reversing the connecting-map sign gives N′(e₁)=−e₀,
  whereas the fixed convention gives N(e₁)=e₀.
- N vanishes on the relative log point and is compatible with base change.

**Frobenius–monodromy relation.** For the HK operators in the signed θ convention, Nφ=pφN as
semilinear maps on the rational complex and on finite-level/coherent integral models wherever
defined. Equivalently N∘φ_lin=p φ_lin∘σ*N. The factor comes from Frobenius(θ)=pθ in the defining
triangle.

`Suggested.lean` declares `LogCrystalline.PhiNModule`.

*Proof sketch.* Apply Frobenius to the absolute-relative short exact sequence. The left wedge map
scales by p since θ does; functoriality of the boundary gives Nφ=pφN. ([Hyodo–Kato, *Semi-stable
reduction and crystalline cohomology with logarithmic
poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), §3.4 and §3.6, pp.243–246.) *Needs:*
*Hyodo–Kato Frobenius*; *Hyodo–Kato monodromy*.

**Checks.**

- For φ(e₀)=e₀, φ(e₁)=pe₁, N(e₁)=e₀ both sides on e₁ equal pe₀.

**Finiteness and Frobenius isogeny.** For a proper fine log smooth integral Y/k^log of Cartier type,
finite-level log crystalline cohomology has finite W_n(k)-length and the completed cohomology is a
finite W(k)-module. After inverting p, φ_lin is an isomorphism. Semistable special log fibers
satisfy these hypotheses. Integral Frobenius is only an isogeny; it need not be invertible before
rationalization.

*Proof sketch.* Use log smooth integral embeddings and proper coherent cohomology to obtain
finite-level length and completed finiteness. Use the Cartier comparison and bounded differential
rank to construct Frobenius inverses up to a bounded power of p on the pro-system. Invert p to
obtain the linearized isomorphism. ([Hyodo–Kato, *Semi-stable reduction and crystalline cohomology
with logarithmic poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), §2.22–2.24 and
§3.2–3.4, pp.240–244.) *Needs:* *Integral Hyodo–Kato complexes*; *Hyodo–Kato Frobenius*;
*Logarithmic Cartier isomorphism* (Layer CR.5); *Logarithmic embedding-system descent* (Layer CR.5);
Layer CR.3.

**Checks.**

- For a good reduction curve this recovers the ordinary crystalline finiteness and Frobenius
  isogeny.

**Nilpotence of Hyodo–Kato monodromy.** On each finite-dimensional rational HK cohomology D^m, N is
nilpotent. More generally, for finite-dimensional K₀-space D, σ-semilinear invertible φ, K₀-linear N
and Nφ=pφN, with σ preserving the p-adic valuation, N^dim(D)=0. No such conclusion is asserted for
arbitrary infinite-dimensional modules or noninvertible Frobenius.

`Suggested.lean` declares `LogCrystalline.PhiNModule.N_pow_finrank_eq_zero`.

*Proof sketch.* Compare characteristic-polynomial coefficients of N under the σ-semilinear
conjugation and p-scaling. A coefficient of positive degree must have its valuation shifted by a
nonzero multiple of v(p), while σ preserves valuation; hence it vanishes. Apply Cayley–Hamilton to
the polynomial T^dim(D). ([Hyodo–Kato, *Semi-stable reduction and crystalline cohomology with
logarithmic poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), §3.2, p.243; algebraic
deduction from §3.4, p.244.) *Needs:* *Finiteness and Frobenius isogeny*; *Frobenius–monodromy
relation*.

**Checks.**

- A two-dimensional Tate block has N²=0 and N≠0; a zero Frobenius cannot be used to deduce
  nilpotence.

**Logarithmic de Rham–Witt complexes.** Let k be a perfect field of characteristic p, (Y,M) a fine
log scheme with a log smooth morphism f:(Y,M)→k^log of Cartier type, and n≥1. Let C_n be the log
crystalline complex Ru_*O of (Y,M) over the standard log Witt base W_n(k)^log in D(Y_ét,W_n(k)),
represented by the log PD de Rham complexes of embedding systems. Define W_nω^q_Y=H^q(C_n)
as abelian sheaves on Y_ét, with the Witt coefficient action transported through the ring map
in (2). In this cohomology-sheaf presentation that map acts on constants by σ^n (HK (4.9));
use this transported action for the W_n(k)-linear Witt complex and its comparisons.
The canonical lift of M is the log structure
W_n(M)=M⊕ker(W_n(O_Y)^×→O_Y^×), (m,u)↦[α(m)]·u, on the scheme W_nY=(|Y|,W_n(O_Y)). (1)
Operators. d:W_nω^q→W_nω^(q+1) is the Bockstein of 0→C_n→C_(2n)→C_n→0 (multiplication by p^n, then
reduction); F:W_(n+1)ω^q→W_nω^q is induced by the reduction C_(n+1)→C_n, V:W_nω^q→W_(n+1)ω^q by
multiplication by p:C_n→C_(n+1). To construct the canonical restriction
R:W_(n+1)ω^q→W_nω^q, use the Cartier intermediary of HK (2.24)–(2.25), with the relative
Frobenius twist of Y and its log structure. On a compatible flat embedding system set
Ẽ_m^q={a∈p^q C_m^q | da∈p^(q+1) C_m^(q+1)} and E_n^q=Ẽ_m^q/p^nẼ_m^q for m>n+q;
the differential uses m>n+q+1. Prove independence of m and the Frobenius-induced
quasi-isomorphism C_n^(1)→E_n, where C_n^(1) computes the Frobenius-twisted log scheme.
Multiplication by p^q into C_(n+q+1)^q sends cycles of C_(n+1)^q to cycles of E_n^q
and boundaries to boundaries. Compose the resulting H^q(C_(n+1))→H^q(E_n) with the
inverse of H^q(C_n^(1))≅H^q(E_n), transporting the relative Frobenius twist as in HK (4.2).
This defines R. Then prove d²=0, FV=VF=p, dF=pFd, Vd=pdV and FdV=d, and that R commutes
with d, F and V. (2) Logarithmic forms. There are a ring map W_n(O_Y)→W_nω⁰_Y, compatible
with F, V and R, whose composite with d is a derivation, and a homomorphism dlog:M^gp→W_nω¹_Y with
d[α(m)]=[α(m)]·dlog m, d(dlog m)=0, F(dlog m)=dlog m, R(dlog m)=dlog m and V(x·dlog m)=V(x)·dlog m;
dlog vanishes on the image of f^(−1)L^gp, so the chart generator of k^log has dlog zero. (3)
Presentation. W_nω^•_Y is the quotient of the log de Rham complex of (W_nY,W_n(M)) over W_n(k)^log
by the differential graded ideal generated by V^i[a]·dV^j[α(m)]−V^i[a·α(m)^(p^(i−j))]·dlog m for
0≤j<i<n, a∈O_Y and m∈M. (4) Structure. R is surjective with kernel V^nW_1ω^q+dV^nW_1ω^(q−1).
At length one the precise Cartier identification is
C⁻¹:ω^q_(Y^(1)/k^log)≅H^q(F_(Y/k^log),*ω^•_(Y/k^log)), with relative Frobenius pullback on
coefficients. Transport the twist over the perfect base to write W_1ω^q_Y≅ω^q_(Y/k^log).
The differential on W_1ω^• is the Bockstein d of (1), transported to the ordinary log de Rham
differential; this is a statement about individual cohomology sheaves, not a replacement of
W_1ω^• by a complex with zero differential. Finally lim_n W_nω^q_Y is p-torsion-free. (5)
Semistable case. Let Y be the special log fibre of a semistable scheme over O_K, with the log
structure of *Integral Hyodo–Kato complexes* (properness is not needed here), t the chart generator
of k^log and θ=dlog t. Let W_nω̃^•_Y be the quotient of the log de Rham complex of (W_nY,W_n(M))
over W_n(k) with the trivial log structure by the differential graded ideal generated by the same
elements. Then 0→W_nω^•_Y[−1]→W_nω̃^•_Y→W_nω^•_Y→0, whose first map is the signed inclusion ι_θ of Conventions and
whose second map is the projection, is an exact sequence of complexes. The absolute Frobenius
induces φ on W_nω̃^•_Y with φ(θ)=pθ, so pφ, φ and φ on the three terms commute with the maps, and
the connecting map N satisfies Nφ=pφN on cohomology.

*Hypotheses.* k is a perfect field of characteristic p; (Y,M) is fine and f is log smooth of Cartier
type over the standard log point k^log; n≥1. W_nY is a scheme because p=0 on Y (*Witt localization
and étale descent* (4)). (5): Y is the special log fibre of a semistable scheme over O_K; for general
Cartier-type Y no absolute–relative sequence is asserted.

The API:

- `LogCrystalline.logDeRhamWitt.operators`: d, F, V and R on W_nω_Y with d²=0, FV=VF=p, dF=pFd,
  Vd=pdV, FdV=d, and R commuting with d, F, V.
- `LogCrystalline.logDeRhamWitt.dlog_relative`: dlog:M^gp→W_nω¹_Y is a homomorphism with
  d[α(m)]=[α(m)]·dlog m, F(dlog m)=dlog m, and dlog m=0 for m in the image of f^(−1)L^gp.
- `LogCrystalline.logDeRhamWitt.presentation`: W_nω_Y is the quotient of the log de Rham complex of
  (W_nY,W_n(M)) over W_n(k)^log by the ideal generated by the displayed elements.
- `LogCrystalline.logDeRhamWitt.restriction`: The maps on cycles and boundaries through E_n
  give canonical R; R([a])=[a] and R(dlog m)=dlog m.
- `LogCrystalline.logDeRhamWitt.cartier`: Inverse Cartier identifies the degree-q cohomology
  sheaf with forms on the relative Frobenius twist; after transporting coefficients W_1ω^•
  has the ordinary log de Rham differential. R is surjective with kernel
  V^nW_1ω+dV^nW_1ω, and lim_n W_nω_Y is p-torsion-free.
- `LogCrystalline.logDeRhamWitt.absolute_sequence`: In the semistable case
  0→W_nω_Y[−1]→W_nω̃_Y→W_nω_Y→0 is exact, with first map ι_θ and φ(θ)=pθ.

*Proof sketch.* The statements are étale local, so use embedding systems whose terms are constant
simplicial objects (Y,M)↪(Z,N) over W_n(k)^log; each C_n is flat over W_n(k) with C_n⊗Z/p^m≅C_m for
m≤n. Construct E_n and the maps on cycles and boundaries before the operator compatibilities;
use the relative Frobenius quasi-isomorphism of HK (2.25) to identify their targets.
The relations of (1) then follow from HK (4.1)–(4.2). For (2), the image of a Witt vector (a_0,…,a_(n−1)) is the class of Σ_i p^i·ã_i^(p^(n−i))
for lifts ã_i to the envelope, and dlog m is the class of dlog m̃ for a lift m̃ to N; these classes
are cocycles independent of the lifts, because p^i·(ã+h)^(p^(n−i))≡p^i·ã^(p^(n−i)) for h in the PD
ideal and dlog changes by d log(u) for u in 1+(PD ideal) (HK (4.9)). These maps define a map from
the log de Rham complex of (W_nY,W_n(M)) to W_nω^•_Y, surjective in each degree, which kills the
generators of (3): F^(i−j)d[α(m)]=[α(m)]^(p^(i−j))·dlog m and V(x·F(y))=V(x)·y give
V^i[a]·dV^j[α(m)]=V^i[a·α(m)^(p^(i−j))]·dlog m. The induced map on the quotient is an isomorphism
and (4) holds by induction from the relative Frobenius-twisted Cartier identification at n=1.
Define B_0ω^q=0, B_1ω^q=dω^(q−1), Z_0ω^q=ω^q and Z_1ω^q=ker d, and define B_(j+1), Z_(j+1)
as the inverse images under Cartier of B_j, Z_j, carrying the successive Frobenius twists.
These filtrations compute the images of V^n and dV^n and their relations (HK (4.3)–(4.7)),
and hence the stated kernel and surjectivity of R. Under Cartier, the Bockstein sends the
class of t^p in H⁰(C_1) to the class of t^(p−1)dt in H¹(C_1), corresponding to d(t)=dt;
thus the length-one Witt complex retains the de Rham differential. For (5), the presentation over the trivial log structure is the
relative one with M^gp in place of M^gp/f^(−1)L^gp; on a semistable chart the class of t is part of
a basis of the characteristic of M, so the exterior powers of these groups form split short exact
sequences, and the presentations of the three terms give exactness (HK (1.5), proved in (4.20)). The
degree-scaled Frobenius acts on dlog forms by multiplication by p, so φ(θ)=pθ and φ∘ι_θ=ι_θ∘pφ; the
relation Nφ=pφN is functoriality of the connecting map (HK (1.6)). ([Hyodo–Kato, *Semi-stable
reduction and crystalline cohomology with logarithmic
poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), §1.4–1.6, pp.225–226; Definition 3.1,
p.242; (2.24)–(2.25), pp.240–242; §4.1–4.7, pp.246–250; (4.9), pp.250–253;
(4.20), pp.261–262.) *Needs:* *Standard log Witt
bases*; *Integral Hyodo–Kato complexes*; *Associated log structures* (Layer CR.5:log-algebra);
*Logarithmic differentials* (Layer CR.5); *Log de Rham complexes* (Layer CR.5); *Morphisms of
Cartier type* (Layer CR.5); *Logarithmic Cartier isomorphism* (Layer CR.5); *Log crystalline sites*
(Layer CR.5); *Logarithmic embedding-system descent* (Layer CR.5); *Witt localization and étale
descent* (Layer CR.4); Mathlib `TruncatedWittVector`.

**Checks.**

- The relative log point: for (Y,M)=k^log over itself, W_nω_Y is W_n(k) in degree 0 and zero in
  positive degrees, dlog of the chart generator being 0; in (5), W_nω̃_Y=W_n(k)⊕W_n(k)·θ with zero
  differential, the sequence is split and N=0.
- Strict smooth good reduction: for Y smooth over k with the log structure pulled back from k^log,
  W_nω_Y=W_nΩ_Y, Illusie's complex of *Classical de Rham–Witt complex as the initial V-pro-complex*
  (Layer CR.4), with dlog(u·t^a)=dlog[u]; for Y the special fibre of a smooth model the sequence of
  (5) splits as W_nω̃_Y=W_nΩ_Y⊕θ∧W_nΩ_Y[−1] and N=0.
- The nodal chart: for Y=Spec k[x,y]/(xy), the special fibre of Spec O_K[x,y]/(xy−π), with chart
  ℕ²→O_Y, e₁↦x, e₂↦y, over 1↦e₁+e₂: dlog x+dlog y=0 in W_nω¹_Y and W_1ω¹_Y=ω¹_(Y/k^log) is free of
  rank one on dlog x, whereas in W_nω̃¹_Y, dlog x+dlog y=θ=ι_θ^1(1) and φ(θ)=pθ.
- `LogCrystalline.logWitt_polynomial_R_F`: For the strict smooth chart A=F_p[t],
  R([t])=t at lengths 2→1, whereas F([t])=t^p. On the chart with a multiplicative log
  generator t, R(dlog t)=dlog t.
- `LogCrystalline.logWitt_smooth_chart_differential`: On the strict smooth chart A=F_p[t],
  W_1ω^• is the ordinary de Rham complex with d(t)=dt≠0; inverse Cartier represents dt
  by the cohomology class of t^(p−1)dt on the relative Frobenius twist.

**Finite-level log Witt quotient complexes.** Under the perfect-field, fine log smooth
Cartier-type hypotheses of *Logarithmic de Rham–Witt complexes*, let m>n≥1. Multiplication
by p^n on W_mω^• factors through R^n:W_mω^•→W_(m−n)ω^•. Its induced map
μ_(m,n):W_(m−n)ω^•→W_mω^• is injective in every degree and commutes with d.
Define Q_(m,n)=`LogCrystalline.logWittQuotient` as its cokernel complex, giving the genuine
short exact sequence 0→W_(m−n)ω^•→W_mω^•→Q_(m,n)→0.
Restriction R^(m−n) induces a quasi-isomorphism Q_(m,n)→W_nω^•, functorial in Y and
compatible with Frobenius and restriction. Thus this quotient yields the corresponding
triangle in the derived category.

*Proof sketch.* Use the Cartier filtrations and kernel calculation of *Logarithmic de
Rham–Witt complexes* to factor p^n, prove degreewise injectivity of μ_(m,n), and compute the
cohomology of the quotient map. Its quasi-isomorphism is distinct from the short exact sequence
ending in Q_(m,n). ([Hyodo–Kato, *Semi-stable reduction and crystalline cohomology with
logarithmic poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), Theorem 4.4 and
Corollary 4.5(1), pp.248–249.) *Needs:* *Logarithmic de Rham–Witt complexes*.

**Checks.**

- For the relative log point, μ_(m,n) is p^n:W_(m−n)(k)→W_m(k), and Q_(m,n)=W_n(k)
  concentrated in degree zero.
- `LogCrystalline.logWitt_polynomial_V_not_p`: For A=F_p[t] at m=2, n=1,
  ker(R:W_2(A)→A)=V(A), but im μ_(2,1)=V(A^p). Hence V(t) lies in ker R and outside that
  image. The quotient map Q_(2,1)→W_1ω^• is a quasi-isomorphism and is not an isomorphism
  in degree zero; the positive-degree terms are essential.
- On a multiplicative log chart, R^(m−n)(dlog t)=dlog t and
  μ_(m,n)(dlog t)=p^n dlog t; the quotient construction respects these closed forms.

**PD differential factorisation for the log Witt comparison.** Under the hypotheses of
*Logarithmic de Rham–Witt complexes*, put I_n=V W_(n−1)(O_Y) and give it the canonical
Witt divided powers γ. The presentation map from the ordinary log de Rham complex of
(W_nY,W_n(M)) to W_nω^• kills
`dγ_j(a) − γ_(j−1)(a) da` for every local a∈I_n and j≥1. It therefore factors through the
quotient by the differential graded ideal generated by these relations, denoted
`LogCrystalline.logWittPDDifferentials`. For an embedding system admitting
(W_nY^•,W_n(M^•))→(Z^•,N^•), the induced ring/log map from its PD envelope to Witt vectors
then gives a map from the log PD de Rham complex to this quotient and hence to W_nω^•.
This factorisation defines the crystalline comparison map. In the semistable case it also
holds over the trivial log Witt base with W_nω̃^• as target.

*Proof sketch.* Lift the relation compatibly to the inverse-limit Witt complex. There
j! times the relation vanishes by the divided-power identities and the derivation rule.
The inverse limit is p-torsion-free by *Logarithmic de Rham–Witt complexes*, and the prime-to-p
factor of j! is a unit; hence the relation itself vanishes before reduction to length n.
In the semistable case the absolute–relative sequence gives the same p-torsion-freeness for
the inverse-limit absolute complex, so the argument also gives the absolute factorisation.
Use the universal property of PD differentials, then descend the maps of embedding systems.
([Hyodo–Kato, *Semi-stable reduction and crystalline cohomology with logarithmic
poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), (4.19.1) and its vanishing,
pp.260–261.) *Needs:* *Logarithmic de Rham–Witt complexes*; *Fine log PD envelopes*;
*Filtered logarithmic PD de Rham complexes* (Layer CR.5); *Canonical divided powers on the
Verschiebung ideal of W_r(R)* (Layer CR.4).

**Checks.**

- For j=1 the relation is da−da=0, since γ_1(a)=a and γ_0(a)=1 on the PD ideal.
- For a=V([t]) over F_p[t], dγ_p(a)=γ_(p−1)(a) da in W_nω¹ for n≥2, including p=2;
  finite-level p-torsion does not justify cancellation of p! there.
- On a multiplicative log chart the factorisation preserves dlog t; on the relative log point
  it preserves the relation dlog of the base chart generator=0.

**Log de Rham–Witt model.** For (Y,M) fine and log smooth of Cartier type over k^log let W_nω^•_Y be
the complex of *Logarithmic de Rham–Witt complexes*. There is a canonical isomorphism
Ru_*O_(Y/W_n(k)^log)≃W_nω^•_Y in D(Y_ét,W_n(k)), compatible with Frobenius and, through R, with the
transition maps in n; hence, for Y as in *Integral Hyodo–Kato complexes*,
C_HK,ℤ(Y)≃Rlim_n RΓ(Y_ét,W_nω^•_Y) compatibly with φ. In the semistable case the same
construction gives C̃_n≃W_nω̃^•_Y, and these isomorphisms carry the embedding-system triangle of
*Hyodo–Kato monodromy* to the sequence of *Logarithmic de Rham–Witt complexes* (5), so the two
monodromy operators N agree. Take Rlim integrally and invert p only at the stated rational
step.

*Proof sketch.* Choose compatible embedding systems admitting maps from the canonical log
Witt lift. The PD envelope gives the ring/log morphism; *PD differential factorisation for the
log Witt comparison* gives the map of complexes C_n→W_nω^• through the quotient by PD
differential relations. For m=n+1 compare 0→C_1→C_(n+1)→C_n→0 with
0→W_1ω^•→W_(n+1)ω^•→Q_(n+1,n)→0, using multiplication by p^n for the first arrows.
Compose the map into Q_(n+1,n) with its quasi-isomorphism to W_nω^•. This compares triangles
in the derived category and proves the comparison by induction. At n=1 the map is the
Cartier identification with its coefficient twist and Bockstein differential, as specified
in *Logarithmic de Rham–Witt complexes*. Apply the same PD factorisation over the trivial
log base in the semistable case. The maps respect the signed inclusion ι_θ and projection;
the resulting map of triangles identifies the absolute models and their connecting maps N.
([Hyodo–Kato, *Semi-stable reduction and crystalline cohomology with logarithmic
poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), Corollary 4.5(1), p.249;
§4.19–4.20, pp.260–262.) *Needs:* *Logarithmic de Rham–Witt complexes*;
*Finite-level log Witt quotient complexes*; *PD differential factorisation for the log Witt
comparison*; *Integral Hyodo–Kato complexes*; *Hyodo–Kato monodromy*;
*Logarithmic embedding-system descent* (Layer CR.5); *Logarithmic Cartier isomorphism*
(Layer CR.5).

**Checks.**

- The comparison fixes dlog generators and preserves N and the Frobenius factor p in degree one.
- For the relative log point both sides are W_n(k) in degree 0 and the comparison is the identity.
- For Y smooth over k with the log structure pulled back from k^log, the comparison is the
  isomorphism of *Finite and infinite crystalline de Rham–Witt comparison* (Layer CR.4) for A=k.

### CR.6.2 The Hyodo–Kato comparison

**Normalized logarithms of units.** Let O_K be a complete discrete valuation ring of mixed
characteristic (0, p) with perfect residue field k and fraction field K. Normalize its norm by
`|p|=p⁻¹`; K is then a complete normed ℚ_p-field, without any finiteness assumption on k.
Using the supplied multiplicative representatives, write a unit as u = [ū](1 + a) with
a ∈ m_K, and define `log_K(u) = NormedSpace.logOneAdd K K (u / [ū] - 1)`, with u and [ū]
viewed in K. This is Tau Ceti's series carrier in
`TauCeti.Analysis.Normed.Algebra.LogOneAdd.Basic`; its value is
`Σ_{n≥1} (−1)^{n+1}aⁿ/n`. PadicFunctionalAnalysis §4.5 supplies convergence and the
principal-unit logarithm laws, since |a|<1. The normalized extension kills Teichmüller units and
torsion units and is additive under multiplication. Only units are needed for changes of
uniformizer; no value log(π) is prescribed by this definition.

The API:

- `LogCrystalline.unitLog.mul`: log_K(uv)=log_K(u)+log_K(v).
- `LogCrystalline.unitLog.teichmuller`: log_K([a])=0 for a∈k×.
- `LogCrystalline.unitLog.principal_series`: On 1+m_K the value is the displayed convergent series.

*Proof sketch.* Divide the unit by its supplied multiplicative representative to obtain a
principal unit. Apply PadicFunctionalAnalysis §4.5 to the native `NormedSpace.logOneAdd` series
on the complete normed ℚ_p-algebra K; scalar restriction identifies its rational coefficients
with those of `NormedSpace.logOneAdd K K`. Multiplicativity of the representatives and the
principal-unit logarithm law give additivity on O_Kˣ. Its value on Teichmüller units is zero;
if u^m=1 with m≥1, then m log_K(u)=0, so log_K(u)=0 in the characteristic-zero field K.
([Hyodo–Kato, *Semi-stable reduction and crystalline
cohomology with logarithmic poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), Proof
§5.5, pp.265–266, the unit logarithm.) *Needs:* Mathlib
`Perfection.teichmuller₀`, `Perfection.mk_teichmuller₀` and `PerfectionMap.id`;
PadicFunctionalAnalysis §4.5 (*Exponential, logarithm and binomial evaluation*, on main);
Tau Ceti `NormedSpace.logOneAdd` and `NormedSpace.logOneAdd_eq_tsum` in
`TauCeti.Analysis.Normed.Algebra.LogOneAdd.Basic`.

**Checks.**

- `one`: log_K(1)=0.
- `torsion`: For a torsion unit ζ, log_K(ζ)=0.
- `principal_unit`: In Q₃, log_K(4)=3−3²/2+3³/3−⋯ has valuation 1:
  after division by 3 its residue modulo 3 is 1. Thus the unit logarithm
  does not vanish on all units.
- `branch_warning`: Adding c v to an extension of the logarithm changes its value on
  a uniformizer by c and leaves its values on units unchanged, since v(u)=0.
- log_K(uv)=log_K(u)+log_K(v).

**Uniformizer-dependent Hyodo–Kato maps.** For proper semistable X/O_K, K₀=Frac W(k) and chosen
uniformizer π, construct `ρ_π:C_HK(Y)⊗^L_{K₀}K→RΓ(X_K,Ω^•_{X_K/K,log})`. For the usual semistable
model with only vertical boundary, generic log structure is trivial and the target is ordinary de
Rham. The map uses the PD parameter envelope t↦π and a rational Frobenius iteration to compare t=0
and t=π; it is not defined as an integral comparison or a choice-free map.

The API:

- `LogCrystalline.hkComparisonMap.pullback`: ρ_π is natural for morphisms of the proper semistable
  models.
- `LogCrystalline.hkComparisonMap.rational_domain`: Its domain is the explicitly rationalized HK
  complex extended from K₀ to K.
- `LogCrystalline.hkComparisonMap.generic_log`: For vertical semistable boundary its target is
  ordinary generic-fiber de Rham.

*Proof sketch.* Use the PD envelope of the uniformizer relation in W_n[t]^log and its two base
specializations. Iterate Frobenius enough to move the maximal ideal into p times the parameter
algebra; compare by Frobenius isogeny and log crystalline base change. Pass to the rational
inverse-limit comparison and proper formal functions for the generic log de Rham target.
([Hyodo–Kato, *Semi-stable reduction and crystalline cohomology with logarithmic
poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), Theorem 5.1, pp.262–263; construction
§5.2–5.4, pp.263–265.) *Needs:* *Rational Hyodo–Kato complexes*; *Finiteness and Frobenius isogeny*;
*Hyodo–Kato monodromy*; *Filtered logarithmic PD de Rham complexes* (Layer CR.5); *Log structures
under reduction and completion* (Layer CR.5).

**Checks.**

- `point`: For the base point the map is the canonical K₀⊗K→K identification.
- `good_reduction`: For the same actual good-reduction model, its comparison maps for any two
  uniformizers agree, since its geometric N vanishes.
- `integral_warning`: Already on the base point, the rational domain contains p⁻¹∈K₀ while the
  integral degree-zero HK lattice W(k) does not contain p⁻¹.
- Good reduction specializes to the crystalline–de Rham map independent of the uniformizer.

**Hyodo–Kato comparison theorem.** For a proper semistable X over a complete mixed-characteristic
DVR with perfect residue k, the map ρ_π is a quasi-isomorphism after the displayed K₀→K scalar
extension. On every degree, `H^m_HK(Y)⊗_{K₀}K≅H^m_dR(X_K)`. For the more general proper fine log
smooth integral Cartier-type model of HK Theorem 5.1 use the log de Rham generic fiber.

*Proof sketch.* Apply the rational Frobenius-isogeny comparison on the PD parameter envelope. Use
radicial log crystalline base change under HK §2.23 hypotheses and proper formal functions. Identify
the completed generic-fiber complex with algebraic log de Rham and conclude the constructed map is
an isomorphism. ([Hyodo–Kato, *Semi-stable reduction and crystalline cohomology with logarithmic
poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), Theorem 5.1, pp.262–263; proof
§5.2–5.4, pp.263–265.) *Needs:* *Uniformizer-dependent Hyodo–Kato maps*; *Finiteness and Frobenius
isogeny*; *Logarithmic embedding-system descent* (Layer CR.5); Layer CR.3.

**Checks.**

- The point and good reduction comparisons coincide with their ordinary crystalline counterparts.

**Change of uniformizer.** For π′=πu with u∈O_K×, with monodromy from the signed parameter inclusion fixed in *Conventions*, and
normalized unit logarithm, `ρ_{πu}=ρ_π∘exp(log_K(u)N)`. On H^m the exponential is the finite sum
`Σ_{j=0}^{s−1}(log_K(u)N)^j/j!` for N^s=0. The plus sign is derived from the unit-ratio logarithmic PD
Taylor expansion. Different sign conventions for N require the corresponding changed formula.

*Proof sketch.* Compare the two parameter maps t↦π and t↦πu using the log diagonal unit ratio. Its
divided-power Taylor expansion has coefficients N^j/j! and argument +log(u). Use nilpotence to
truncate and check the two unit changes compose by additivity of log and multiplication of commuting
exponentials. ([Hyodo–Kato, *Semi-stable reduction and crystalline cohomology with logarithmic
poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), Theorem 5.1, pp.262–263; proof §5.5,
pp.265–266.) *Needs:* *Uniformizer-dependent Hyodo–Kato maps*; *Normalized logarithms of units*;
*Nilpotence of Hyodo–Kato monodromy*; Tau Ceti `TauCeti.nilpotentExpUnit`; Mathlib
`IsNilpotent.exp`.

**Checks.**

- On N(e₁)=e₀, N(e₀)=0, the transformation sends e₁ to e₁+log(u)e₀; successive unit changes agree
  with multiplication of units.

**Products and Hyodo–Kato comparison.** For proper fine log smooth integral Cartier-type models for
which the log fiber product stays in those hypotheses, rational HK has the Künneth quasi-isomorphism
C_HK(Y₁)⊗^L C_HK(Y₂)→C_HK(Y₁×^logY₂). The operators are φ₁⊗φ₂ and N₁⊗1+1⊗N₂, and ρ_π respects the de
Rham product comparison. The ordinary product of two strictly semistable models need not itself be
strictly semistable; use the stated log product or an allowed semistable refinement.

*Proof sketch.* Use the cup products and Künneth formula of Layer CR.3 and the derived tensor
product of EnhancedDerivedSheaves Layer E1. Adapt the PD de Rham resolutions and descent to the fine
smooth integral logarithmic product, as in Kato’s final Künneth theorem on p.222; retain its
quasi-compact/quasi-separated and flat-crystal hypotheses before proper rational scalar extension.
Tensor the absolute-relative triangles to identify N as the sum of factor operators. Use the
naturality of the PD parameter comparison for the common uniformizer and tensor the nilpotent
exponentials. ([Hyodo–Kato, *Semi-stable reduction and crystalline cohomology with logarithmic
poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), Theorem 5.1, pp.262–263, functorial
comparison input; [Binda–Kato–Vezzani, *On the p-adic weight-monodromy conjecture for complete
intersections in toric varieties*](https://arxiv.org/abs/2207.00369v2), Remark 3.12, monoidality
argument, p.18; [Kato, *Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
Final Künneth theorem, printed Theorem 6.12 and announced as 6.11, p.222.) *Needs:* *Hyodo–Kato
comparison theorem*; *Hyodo–Kato monodromy*; *Frobenius–monodromy relation*; *Log fiber products*
(Layer CR.5:log-algebra); Layer CR.3; EnhancedDerivedSheaves Layer E1
(*The enhanced derived category*).

**Checks.**

- Two Tate blocks satisfy Nφ=pφN on their tensor product, and the uniformizer-change exponential
  factors as the tensor of the factor exponentials.

### CR.6.3 Examples and base change

**Good reduction monodromy.** If X/O_K is proper smooth with the log structure pulled back from the
base valuation chart, then its HK complex is ordinary crystalline cohomology of X_k, N=0, and ρ_π is
the ordinary crystalline–de Rham comparison. Therefore changing the uniformizer by a unit has no
effect.

*Proof sketch.* Strictness removes the relative log generators and identifies the log site with the
ordinary one. The absolute-relative parameter triangle splits, so its boundary N vanishes. Compare
the PD construction with the ordinary crystalline–de Rham map. ([Hyodo–Kato, *Semi-stable reduction
and crystalline cohomology with logarithmic
poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), §3.5–3.6, pp.245–246; Theorem 5.1,
pp.262–263.) *Needs:* *Hyodo–Kato monodromy*; *Hyodo–Kato comparison theorem*; *Change of
uniformizer*; Layer CR.2; *Strict morphisms* (Layer CR.5:log-algebra).

**Checks.**

- For a proper smooth elliptic curve with good reduction, N=0 in H¹.

**Tate curve monodromy.** For a split Tate elliptic curve E_q/K with v_K(q)=n>0 and a proper
semistable model, rational H¹_HK has a slope basis e₀,e₁ with φ(e₀)=e₀, φ(e₁)=pe₁ and N(e₀)=0,
N(e₁)=n e₀, in the fixed orientation. Thus N≠0, N²=0 and Nφ=pφN. Rescaling e₀ by the nonzero
rational factor n gives the normalized block N(e₁)=e₀; specify the basis rescaling rather than
claiming the integral lattice has unit monodromy.

*Proof sketch.* Use the semistable nodal model and its oriented annular residue/dual-graph
connecting map. Derive the valuation coefficient from the residue model of the split Tate curve.
Compare this residue boundary with the fixed HK triangle, then compute the displayed matrices. The
geometric coefficient v_K(q) of the monodromy is derived here from the log crystalline residue model
of the split Tate curve, with its valuation normalisation and change of basis. ([Hyodo–Kato,
*Semi-stable reduction and crystalline cohomology with logarithmic
poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), §1.1–1.5, pp.223–225; log Witt
description §4.20, pp.261–262; [Grosse-Klönne, *Frobenius and monodromy operators in rigid analysis,
and Drinfel’d’s symmetric space*](https://arxiv.org/abs/1408.3346v1), Introduction, curve/monodromy
discussion, pp.1–3; the computation of the coefficient v_K(q) is part of this target.) *Needs:*
*Hyodo–Kato monodromy*; *Frobenius–monodromy relation*; *Hyodo–Kato comparison theorem*.

**Checks.**

- For n=1, N(e₁)=e₀ gives the specified nonzero test block.

**Proper one-parameter logarithmic comparison.** Let Y be a proper fine log smooth family over a
neighborhood of T=0 in W(k)[T]^log, with chart ℕ, 1↦T. Write Y₀ for its T=0 log fiber, Y_n for
reduction modulo p^n, and Ȳ_n for the fiber over W_n(k)^log. The finite-level PD Poincaré
comparison identifies RΓ_logcrys(Ȳ₁/W_n^log) with the relative log de Rham complex of Ȳ_n,
compatibly with the boundary N from the absolute-relative dlog T sequence. The compatible
inverse-limit and rational cohomology comparison uses proper finite W-cohomology, not log smoothness
alone.

*Proof sketch.* Use the finite-level log smooth lift and PD Poincaré lemma, comparing the
signed dlog T inclusion sequences to prove N compatibility. Use the universal-coefficient short exact
sequence `0→H^i/p^n→H^i_n→H^{i+1}[p^n]→0`, whose last transitions multiply by p. Proper finite
W-modules kill the inverse limit of the torsion terms and identify completed cohomology, then
rationalize. ([Qian, *Ordinarity of local Galois representation arising from Dwork
motives*](https://arxiv.org/abs/2103.00106v1), Theorem 1.6, PDF p.4; Theorem 3.2 and proof, PDF
pp.14–18.) *Needs:* *Log PD Poincaré lemma* (Layer CR.5); *Hyodo–Kato monodromy*; *Integral
Hyodo–Kato complexes*; Layer CR.3.

**Checks.**

- The comparison is N-equivariant and commutes with `W_{n+1}→W_n`; it does not use Dwork-specific
  geometry.

### CR.6.4 Convergent complexes on tubes and Witt models

**Convergent logarithmic embedding complexes.** For a fine log scheme X of finite type over k^log,
put W=W(k), K₀=W[1/p], with k perfect of characteristic p. Let W[t]^log have chart 1↦t,
W^log its fibre at t=0 with chart 1↦0, and W^triv the trivial-log Witt base. Choose the
embedding system X^⋆↪Z^⋆ of Disegni–Liu Appendix B.1 over W[t]^log and form
`Y^⋆ = Z^⋆ ×_(W[t]^log) W^log` before completing. Complete Y^⋆ along its special fibre and
put `T^⋆ = ]X^⋆[_(Y^⋆)`, the interior of the specialisation preimage in this generic fibre
(AdicSpacesPartIII Layer R2). Write s:T^⋆→X^⋆_ét for specialisation and u:X^⋆→X for the
hypercover augmentation. Define the tube form complexes
`C_rel = Ω^•_(Y^⋆/W^log) ⊗_(O_(Y^⋆)) O_(T^⋆)` and
`C_abs = Ω^•_(Z^⋆/W^triv) ⊗_(O_(Z^⋆)) O_(T^⋆)`.
Then `ω_X = Ru_*Rs_* C_rel` and `ω̃_X = Ru_*Rs_* C_abs` are rational convergent
logarithmic complexes on X_ét. Use separated affine embedding charts and their product
refinements: their tubes are Hausdorff strictly K₀-analytic Berkovich spaces, with corresponding
adic tubes. The analytic étale site here means the adic étale site of AdicSpacesPartIV Layer R4.
The constructions descend from this embedding basis to every such X; no global separatedness
hypothesis on X is imposed. These are convergent rather than overconvergent j† complexes.

The API:

- `LogCrystalline.convergentLogComplex.relative`: The relative complex uses the W^log differential
  quotient on Y^⋆ and its realization C_rel on T^⋆.
- `LogCrystalline.convergentLogComplex.absolute`: The absolute variant uses the trivial-log Witt
  base on Z^⋆, restricts to the same T^⋆, and retains dlog t.
- `LogCrystalline.convergentLogComplex.site_compare`: On the separated embedding basis,
  identify the Berkovich quasi-étale and adic étale ringed topoi, carrying analytic functions
  and the tube form complexes to their counterparts. For the complementary tube inclusion g,
  the comparison intertwines g*, g_* and their adjunction unit, and identifies specialization
  s and Rs_* through the formal étale site. It therefore identifies the support kernels on
  all module sheaves and bounded-below complexes, their inclusions and special-fibre maps,
  and the signed monodromy triangle with its connecting map. These identifications commute
  with embedding refinements and their cocycles.
- `LogCrystalline.convergentLogComplex.refinement`: Common embedding refinements induce canonical
  quasi-isomorphisms.

*Proof sketch.* Take tubes and specialisation from AdicSpacesPartIII Layer R2 and AdicSpacesPartIV
Layer R4. On the separated embedding basis apply Berner Theorem 2.4 to the Hausdorff strictly
analytic tubes. Identify the structure sheaves on affinoid charts. Verify the complement square
on these charts, then identify inverse images and their right adjoints by the adjunctions;
identify s by the common formal étale specialization. This proves the functor comparisons,
rather than only coherent-cohomology agreement. Exact equivalences preserve kernels and the
signed short exact form sequence, hence its derived connecting map. Descend these comparisons
and the relative and absolute realizations along common separated refinements. ([Berner,
*Etale homotopy theory of non-archimedean analytic spaces*](https://arxiv.org/abs/1708.03657),
Theorem 2.4 and the following caution on direct images, pp.19–20; [Disegni–Liu,
*A p-adic arithmetic inner product formula*](https://disegni-daniel.perso.math.cnrs.fr/AIPF.pdf),
Appendix B.1–B.2; footnote 31, PDF pp.113–116.) *Needs:* *Logarithmic embedding-system descent*
(Layer CR.5); *Log de Rham complexes* (Layer CR.5); AdicSpacesPartIII Layer R2 (*Generic fibres*;
*Specialisation, tubes and rig-points*); AdicSpacesPartIV Layer R4 (*The étale site on the analytic
carriers*).

**Checks.**

- `point`: For k=F_p and X=k^log↪Z=Spec W[t] with chart 1↦t, the zero fibre
  is Y=W^log and T=Sp K₀. Thus ω_X=K₀ in degree zero and ω̃_X has K₀ and
  K₀·dlog t in degrees zero and one, with zero differential. Completing Z along (p),
  or along (p,t), and taking the tube of X instead gives |t|<1. Relative forms over
  W[t]^log would then give O(|t|<1) in degree zero, including the nonconstant t.
  These distinctions hold also at p=2.
- `site_complement`: For X=X₁⊔X₂ two log points and U=X₁, both sites identify restriction
  with K₀²→K₀ onto the second factor and support with K₀⊕0; no coherence of a general
  supported sheaf is required.
- `site_specialization`: For U=X the transported special-fibre map is the identity on Rs_*;
  for U empty both its source and target vanish.
- `site_signed_boundary`: Put θ=dlog t and β=x dy on a smooth chart. The degree-two
  shifted injection is −x dy∧θ, and its differential is −dx∧dy∧θ, the image of −dβ.
  Both sites give this same chain map and hence the same connecting N.
- `identity_refinement`: An identity embedding refinement induces the identity comparison.
- `not_overconvergent_by_name`: The unit-disc series with coefficients `p^{⌊√n⌋}` is convergent and
  has no radius greater than one. Its existence distinguishes the convergent tube-function object
  from the dagger object; the absolute log point also retains the extra dlog(t) direction.
- For a strict semistable special fiber the resulting complexes admit the stated rational log Witt
  comparison.

**Proper support on open analytic tubes.** For an open U⊂X in the DL embedding setting, let
g:]X^⋆∖U^⋆[_(Y^⋆)→T^⋆ be the complementary open analytic tube inclusion termwise,
using the same zero fibres Y^⋆ and tubes T^⋆ as above. On their adic étale sites define
f_!F=ker(F→g_*g*F) on module sheaves. The functors g*, g_* and f_! are exact
(DL Remark B.2), transported by `LogCrystalline.convergentLogComplex.site_compare`.
Define ω_(U,X)=Ru_*Rs_*f_!C_rel and ω̃_(U,X)=Ru_*Rs_*f_!C_abs. This is analytic-tube support. There is a
natural map from special-fiber F_!F*Rs_* to Rs_*f_!, which need not be a categorical factorization
or an isomorphism in general.

The API:

- `LogCrystalline.tubeProperSupport.kernel`: The supported sheaf is the kernel of restriction to
  ]X∖U[.
- `LogCrystalline.tubeProperSupport.whole`: For U=X, f_! is the identity.
- `LogCrystalline.tubeProperSupport.special_fibre_map`: There is the source natural map
  F_!F*Rs_*→Rs_*f_!, without a general isomorphism claim.

*Proof sketch.* Define the support kernel f_!F = ker(F → g_*g^*F) on the adic étale site of the tube
(AdicSpacesPartIV Layer R4). The ringed-topos and functor comparison above transports DL
Definition B.1's kernel, Remark B.2's exactness and Lemma B.3's natural transformation;
it applies to all module sheaves, including noncoherent support kernels. Apply
the support functor before the analytic specialisation pushforward and then the embedding-system
pushforward. Construct the special-fibre comparison by the adjunction map and preserve its
direction. ([Disegni–Liu, *A p-adic arithmetic inner product
formula*](https://disegni-daniel.perso.math.cnrs.fr/AIPF.pdf), Definition B.1 and Remark B.2, PDF
p.113; Lemma B.3, PDF p.114; triangle (B.3), PDF p.116.) *Needs:* *Convergent logarithmic embedding
complexes*; AdicSpacesPartIV Layer R4 (*The étale site on the analytic carriers*).

**Checks.**

- `whole_space`: Taking U=X recovers the unsupported complex.
- `empty_open`: Taking U empty gives the zero support kernel.
- `two_components`: For X=X₁⊔X₂ consisting of two smooth points, U=X₁
  and the constant coefficient K₀, restriction to the complementary tube is
  the projection K₀²→K₀ onto the second factor. Its kernel is K₀⊕0.
  The full complex K₀² and the zero complex both give the wrong support.
- The site comparison carries the short exact form sequence with shifted injection
  β↦(−1)^(q−1)β∧dlog t to the same sequence; exact support preserves its triangle and N.

CR.6.4 owns the convergent relative and absolute realizations, tube support kernel and signed
monodromy triangle. The quasi-étale `TubeProperSupport` and `SupportedLogComplex` interfaces
of PadicDifferentialEquationsAndRigidCohomology RD.4.42/RD.4.45 are transport adapters of
these objects through `LogCrystalline.convergentLogComplex.site_compare`; their coefficient
extensions use the same constant-coefficient specialization. This is a downstream use of
CR.6.4, not an input to it.

**Semistable logarithmic Witt models.** Let κ be a perfect field of characteristic p, W=W(κ),
K₀=W[1/p]. Let W[t]° be Spec W[t] with the log structure associated with 1↦t, W° its fibre at t=0,
κ° the fibre of W° at p=0 (the standard log point), and W^triv=Spec W with the trivial log
structure. Let (X,L) be a log scheme of finite type and strictly semistable over κ°, and
{(X^⋆,L^⋆)↪(Z^⋆,N^⋆)} an admissible embedding system for (X,L)/W[t]°; put
(Y^⋆,M^⋆)=(Z^⋆,N^⋆)×_(W[t]°)W°, and for l≥1 let D_l^⋆ be the PD envelope of X^⋆ in Y_l^⋆=Y^⋆⊗Z/p^l,
over W with its usual divided powers. Define, in D⁺(X_ét,W_•) (systems indexed by l),
Wω_X=Ru_*(Ω^*_((Y^⋆,M^⋆)/W°)⊗O_(D_l^⋆)) and Wω̃_X=Ru_*(Ω^*_((Z^⋆,N^⋆)/W^triv)⊗O_(D_l^⋆)), where
u:X^⋆→X is the augmentation of the hypercovering. They do not depend on the embedding system. After
applying Rlim_l and ⊗_W K₀ there is a distinguished triangle
Wω_(X,K₀)[−1]→Wω̃_(X,K₀)→Wω_(X,K₀)--N→Wω_(X,K₀) in D⁺(X_ét,K₀), whose first map is ∧dlog t, whose
second map is the natural projection, and whose third map N is the connecting map. The convergent
complexes ω_X, ω̃_X ∈ D⁺(X_ét, K₀) of *Convergent logarithmic embedding complexes* (the same
differential forms on the tube of X^⋆ in place of the PD envelopes) are related to them by natural
equivalences ω_X≃Wω_(X,K₀), ω̃_X≃Wω̃_(X,K₀), under which the triangle (B.1) of Disegni–Liu
corresponds to this one.

*Hypotheses.* κ is a perfect field of characteristic p (in Disegni–Liu the residue field of a finite
extension of Q_p); W=W(κ), K₀=W[1/p]. (X,L) is a fine log scheme of finite type over κ°, strictly
semistable over κ°; the embedding system is admissible in the sense of Disegni–Liu §B.1: among the
conditions, (X⁰,M⁰)≅(Z⁰,N⁰)×_(W[t]°)κ°, Z⁰ is flat over W[t] and smooth over W, and N⁰ is the log
structure defined by the relative strict normal crossings divisor Y⁰=Z⁰⊗_(W[t])W. The triangle and
the comparison with ω_X, ω̃_X are statements in D⁺(X_ét,K₀), after Rlim over l and ⊗_W K₀.

The API:

- `Crystalline.LogWittModel.envelope_eval`: For an admissible embedding system, Wω_X and Wω̃_X are
  represented by Ru_* of the complexes Ω^*_((Y^⋆,M^⋆)/W°)⊗O_(D_l^⋆) and
  Ω^*_((Z^⋆,N^⋆)/W^triv)⊗O_(D_l^⋆), l≥1, on the hypercovering X^⋆.
- `Crystalline.LogWittModel.embedding_independence`: The product-embedding maps are compatible
  quasi-isomorphisms and satisfy the cocycle.
- `Crystalline.LogWittModel.rational_compare`: There are natural equivalences ω_X≃Wω_(X,K₀) and
  ω̃_X≃Wω̃_(X,K₀) in D⁺(X_ét,K₀) (Disegni–Liu (B.5)) carrying the triangle (B.1) of the convergent
  complexes to the triangle (B.4); in particular they commute with the maps ∧dlog t.
- `Crystalline.LogWittModel.monodromy_triangle`: Wω_(X,K₀)[−1]--∧dlog
  t→Wω̃_(X,K₀)→Wω_(X,K₀)--N→Wω_(X,K₀) is a distinguished triangle in D⁺(X_ét,K₀), and N is its
  connecting map (Disegni–Liu (B.4)).

*Proof sketch.* Log schemes, log differentials, embedding systems and log PD envelopes are those of
Layer CR.5. The exact sequence of coherent sheaves 0→Ω^(q−1)_((Y^⋆,M^⋆)/W°)--∧dlog
t→Ω^q_((Z^⋆,N^⋆)/W^triv)⊗O_(Y^⋆)→Ω^q_((Y^⋆,M^⋆)/W°)→0, compatible with differentials, tensored with
O_(D_l^⋆), gives the triangle; N is its connecting map (Disegni–Liu (B.1), (B.4)). Independence of
the embedding system: compare two systems through their product. Disegni–Liu state this as well
known and identify Wω_X with the modified de Rham–Witt complex of Hyodo and Hyodo–Kato and Wω̃_X
with its variant. Comparison with the convergent complexes: the canonical map from the structure
sheaf of the formal completion of Y^⋆ along X^⋆ to Rlim_l O_(D_l^⋆) induces, after ⊗K₀, maps from
the tube complexes to the PD-envelope complexes; they are equivalences because (X^⋆,L^⋆) is strictly
semistable over κ° (Disegni–Liu (B.5), by an argument they attribute to their reference [4], §1.9).
([Disegni–Liu, *A p-adic arithmetic inner product formula*, arXiv
v3](https://arxiv.org/abs/2204.09239v3), Appendix B.1 (embedding systems and admissible embedding
systems, pp.80–81) and B.2, from 'From now on, we assume that (X,L) is strictly semistable' to
(B.5), pp.81–82.) *Needs:* *Universal base-compatible divided power envelope*
(DerivedDeRhamCohomology §PD.6); *Enhanced crystalline direct image and global sections* (Layer
CR.2); Layer CR.5:log-algebra; Layer CR.5; *Convergent logarithmic embedding complexes*.

**Checks.**

- `test_logWittModel_point`: For X=κ° with the embedding κ°↪W[t]° (Z=Spec W[t], Y=W°, D_l=Spec
  W/p^l): Wω_X=(W/p^l)_l in degree 0, Wω̃_X=(W/p^l⊕W/p^l·dlog t)_l in degrees 0 and 1 with zero
  differential, and the connecting map N of the triangle is 0.
- `test_logWittModel_diagonal_embedding`: For an admissible embedding system E of (X,L), the
  isomorphisms Wω_X(E)≅Wω_X(E) and Wω̃_X(E)≅Wω̃_X(E) obtained by comparing E with itself through the
  product system E×E and its two projections are the identity maps.
- `test_logWittModel_rational_scope`: For X=κ° with the embedding κ°↪W[t]°: the tube of X in the
  generic fibre of the formal completion of Y=W° is the point Sp K₀, so ω_X=K₀ in degree 0 and
  ω̃_X=K₀⊕K₀·dlog t in degrees 0 and 1 with zero differential; Wω_(X,K₀) and Wω̃_(X,K₀) are the same
  complexes, and the equivalences of (B.5) are the identity maps.

**Sato’s homological de Rham–Witt complex.** Let X be strictly semistable of finite type over
the standard log point of a perfect field k, with an ordering of its components. On X_ét
construct the sheaf ν^q_(X,r) of logarithmic forms at generic points whose codimension-one
residues sum to zero. Construct the logarithmic valuation residue maps from the local
Witt symbol residues on smooth strata, with their compatibility under restriction. For σ:U↪X the smooth locus,
define W_rΞ^q_X as the W_rO_X-submodule of σ_*W_rΩ^q_U generated by ν^q_(X,r). Prove independence
of U and construct d,R,F,V, making W_rΞ^•_X a complex. It is the homological complex; it need
not have an internal algebra product. Its module action is by W_rΛ^•_X, the cohomological
subalgebra of σ_*W_rΩ^•_U generated by W_rO_X and the dlog images of units of X.

For a local normal-crossing embedding i:X↪P in a smooth k-scheme, prove the residue sequence
0→W_rΩ^(q+1)_P→W_rΩ^(q+1)_P(log X)→i_*W_rΞ^q_X→0 and the ascending filtration
F₀=0, gr_a W_rΞ^q_X≅⊕_(|I|=a)W_rΩ^(q−a+1)_(X_I), a≥1, with the residue signs determined by
the component ordering. For the absolute semistable Witt model construct
∂:Wω̃_X→WΞ_X[−1]. With Frobenius retained its target is WΞ_X(−1)[−1]: the projection satisfies
∂φ=pφ∂. Under Rlim_r and ⊗_W K₀ construct ω⁺_X≃WΞ_(X,K₀), where ω⁺_X is the embedding-tube
complex of the quotient of ordinary absolute (q+1)-forms in logarithmic absolute (q+1)-forms.
Prove that ∂ corresponds to that quotient map ω̃_X→ω⁺_X[−1].

The API:

- `Crystalline.SatoWitt.residue`: The displayed sequence on P_ét is exact, with quotient i_*W_rΞ^q_X.
- `Crystalline.SatoWitt.ordered_gr`: The stratum identifications of gr_a carry the ordered
  residue signs; swapping two component labels changes the corresponding iterated residue sign.
- `Crystalline.SatoWitt.absolute_map`: The map ∂ has domain Wω̃_X and target WΞ_X[−1], with
  the p-scaled Frobenius identity, restriction compatibility and the signed shifted differential.
- `Crystalline.SatoWitt.rational_compare`: The equivalence ω⁺_X≃WΞ_(X,K₀) carries the quotient
  of absolute log forms to ∂, and respects the WΛ-module action and ordered residues.

*Proof sketch.* Construct the generic logarithmic residue kernel ν and its W_rO_X-span.
Étale locally embed the crossing in a smooth scheme and identify this span with logarithmic
absolute Witt forms modulo ordinary absolute Witt forms through Poincaré residues. The resulting
stratum filtration proves independence, stability under the operators and the WΛ-module law.
Project the absolute Witt complex on the smooth locus to the dlog t coefficient; its image
and kernel are identified by the residue sequence, giving ∂ and its p-scaled Frobenius.
Apply the embedding-system de Rham–Witt comparison to this same quotient and its ordered
filtration, then pass to the rational tube models. Comparing these quotient maps before
descent proves the stated compatibility. All residue, operator and rational comparison
assertions are proved here.
([Sato, *Cycle classes for p-adic étale Tate twists and the image of p-adic
regulators*](https://ems.press/content/serial-article-files/26173), §2, logarithmic residue
sheaves; §8, Definitions 8.1 and 8.3, Propositions 8.4, 8.6 and 8.10, printed pp.210–215;
[Disegni–Liu, *A p-adic arithmetic inner product formula*](https://disegni-daniel.perso.math.cnrs.fr/AIPF.pdf),
Appendix B.2, (B.7)–(B.10), PDF p.118.) *Needs:* *Semistable logarithmic Witt models*;
*Absolute semistable residue maps* (Layer CR.5); *Logarithmic Hodge–Witt sheaves* (Layer CR.4),
applied only on smooth strata; *Illusie and Shiho logarithmic exact sequences* (Layer CR.4);
*Log de Rham–Witt model*; *Convergent logarithmic embedding complexes*.

**Checks.**

- For smooth X, W_rΞ_X=W_rΩ_X. For a smooth point ω̃ has the extra θ=dlog t direction,
  and ∂ sends θ to 1 in W_rΞ⁰_X, respecting ∂φ=pφ∂.
- For X=Spec k[x,y]/(xy), gr₂W_rΞ¹_X=W_r(k) at the crossing. This term is absent if
  WΞ is replaced by the regular-scheme dlog-image sheaf W_rΩ_log.
- At the ordered crossing, the double residue of dlog x∧dlog y changes sign after swapping
  the branches; quotienting ordinary absolute forms leaves this residue class nonzero.

**Witt comparison maps with proper support.** In the situation of *Semistable logarithmic Witt
models* let F:U→X be the inclusion of an open subscheme, and let ω̃_(U,X), ω⁺_(U,X)∈D⁺(X_ét,K₀) be
the convergent complexes with support of Disegni–Liu, defined like ω̃_X and ω⁺_X with the tube
functor f^!_(U^⋆,X^⋆) inserted (f^! is the kernel of the unit id→g_*g^* for the open immersion g of
the tube of X^⋆∖U^⋆ into the tube of X^⋆). (1) There is a natural map F_!F^*Wω̃_(X,K₀)→ω̃_(U,X) in
D⁺(X_ét,K₀) (Disegni–Liu (B.6)): F_!F^* applied to the inverse of the equivalence ω̃_X≃Wω̃_(X,K₀),
followed by the natural transformation F_!∘F^*∘Rs_*→Rs_*∘f^! of their Lemma B.3. (2) Let
WΞ_X∈D⁺(X_ét,W_•) be the complex of *Sato’s homological de Rham–Witt complex*, with the equivalence ω⁺_X≃WΞ_(X,K₀).
In the same way there is a natural map F_!F^*WΞ_(X,K₀)→ω⁺_(U,X) (Disegni–Liu (B.9)). (3) Using
the correspondence proved in *Sato’s homological de Rham–Witt complex*, these two maps form a
commutative square (Disegni–Liu (B.10)) with the map F_!F^*Wω̃_(X,K₀)→F_!F^*WΞ_(X,K₀)[−1] induced by
Sato's map Wω̃_X→WΞ_X[−1] and the map ω̃_(U,X)→ω⁺_(U,X)[−1] induced by the quotient maps
Ω^(q+1)_((Z^⋆,N^⋆)/W^triv)⊗O_(Y^⋆)→Ξ^q_(Z^⋆)=Ω^(q+1)_((Z^⋆,N^⋆)/W^triv)/Ω^(q+1)_(Z^⋆/W). The map
∧dlog t is the map ω_(U,X)[−1]→ω̃_(U,X) of Disegni–Liu (B.8); it does not occur in (B.10). For U=X
the tube functor is the identity and the maps (1), (2) are the inverses of the comparison
equivalences.

*Hypotheses.* (X,L) is strictly semistable of finite type over κ°, with an admissible embedding
system as in *Semistable logarithmic Witt models*; U⊂X is an open subscheme with inclusion F. All
objects and maps are in D⁺(X_ét,K₀): Rlim over l and ⊗_W K₀ are applied before F_!F^*. WΞ_X, its rational comparison and the compatibility of ∂:Wω̃_X→WΞ_X[−1] with the
quotient of absolute differential forms are supplied by *Sato’s homological de Rham–Witt complex*.
The Frobenius-equivariant form of ∂ includes the twist (−1) on its target.

The API:

- `Crystalline.LogWittSupport.compare`: Natural maps F_!F^*Wω̃_(X,K₀)→ω̃_(U,X) and
  F_!F^*WΞ_(X,K₀)→ω⁺_(U,X) in D⁺(X_ét,K₀) (Disegni–Liu (B.6), (B.9)).
- `Crystalline.LogWittSupport.open_identity`: For U=X, the tube support functor is the identity and
  the comparison recovers the full rational model comparison.
- `Crystalline.LogWittSupport.dlog_square`: Using the compatibility of clause (3), the
  maps (B.6) and (B.9) form the square (B.10), whose vertical arrows are the support comparison maps
  and whose horizontal arrows are induced respectively by Sato’s map and by the quotient of forms.
  Naturality of the tube support transformation proves the square.

*Proof sketch.* Lemma B.3: the unit Rs_*→Rs_*∘g_*∘g^* factors through G_*∘G^*∘Rs_* for the closed
immersion G:X∖U→X, so the square of Disegni–Liu Lemma B.3 commutes, which yields the natural
transformation F_!∘F^*∘Rs_*→Rs_*∘f^!_(U,X). (B.6): apply F_!F^* to the inverse of the equivalence
(B.5) on the embedding system, then the transformation of step 1, then Ru_*; the target is ω̃_(U,X)
by its definition. (B.9) is obtained in the same way from ω⁺_X≃WΞ_(X,K₀). (B.10): its bottom arrow
is the horizontal arrow of (B.8), induced by the quotient maps of (B.7), and its top arrow is
induced by Sato's map. By *Sato’s homological de Rham–Witt complex*, Sato's map Wω̃_X→WΞ_X[−1] corresponds, under
ω̃_X≃Wω̃_(X,K₀) and ω⁺_X≃WΞ_(X,K₀), to the map ω̃_X→ω⁺_X[−1] induced by the quotient maps; naturality of step 1
therefore proves that the square commutes. Disegni–Liu display (B.10) without proof. ([Disegni–Liu, *A p-adic
arithmetic inner product formula*, arXiv v3](https://arxiv.org/abs/2204.09239v3), Appendix B.1,
Definition B.1, Remark B.2 and Lemma B.3 with proof, p.80; B.2, the definitions of ω_(U,X), ω̃_(U,X)
(p.81) and (B.6)–(B.9), p.83; [Disegni–Liu, *A p-adic arithmetic inner product formula*, arXiv
v3](https://arxiv.org/abs/2204.09239v3), Appendix B.2, diagrams (B.7), (B.8) and (B.10), p.83.)
*Needs:* *Semistable logarithmic Witt models*; *Sato’s homological de Rham–Witt complex*;
EnhancedDerivedSheaves Layer E1 (*The enhanced derived category*); EnhancedDerivedSheaves Layer E1 (*Derived sheaf tensor*); SchemeAndStackFoundations Layer 2; *Proper support on open
analytic tubes*.

**Checks.**

- `test_logWittSupport_empty`: For U=∅: g is the identity of the tube of X^⋆,
  f^!_(∅,X)=ker(id→id)=0, so ω̃_(∅,X)=ω⁺_(∅,X)=0, and the sources F_!F^*(−) of (B.6) and (B.9) are
  0.
- `test_logWittSupport_full`: For U=X: the tube of X∖U is empty, f^!_(X,X) is the identity,
  ω̃_(X,X)=ω̃_X, and (B.6) is the inverse of the equivalence ω̃_X≃Wω̃_(X,K₀) of (B.5).
- `test_logWittSupport_map`: Let X=X₁⊔X₂ be a disjoint union of two smooth points over κ°, with the
  standard semistable log structures, and U=X₁. The source and target of (B.6) restrict on X₁ to the
  full comparison and on X₂ to zero. The support map is the full comparison on X₁ and zero on X₂;
  replacing support by the full complex or by zero fails this test.

**Convergent monodromy triangles.** For the relative and absolute convergent log complexes with the
stated analytic proper support, the signed inclusion ι_θ for θ=dlog t yields ω_(U,X)[−1]→ω̃_(U,X)→ω_(U,X)→^N
ω_(U,X), compatibly with the Frobenius factor p. Thus Nφ=pφN in the same convention as the
crystalline embedding model. Apply the source exact support functor on tubes before taking derived
pushforwards.

*Proof sketch.* Take the absolute-relative log differential short exact sequence on the embedding
tube. Apply the exact tube support functor and derived specialization/hypercover pushforward.
Identify the connecting map with the fixed N convention and Frobenius scaling. ([Disegni–Liu, *A
p-adic arithmetic inner product formula*](https://disegni-daniel.perso.math.cnrs.fr/AIPF.pdf),
Appendix B.2, triangles (B.1)–(B.2), PDF pp.115–116; Witt triangle (B.4), PDF p.117.) *Needs:*
*Convergent logarithmic embedding complexes*; *Proper support on open analytic tubes*; *Hyodo–Kato
monodromy*; *Frobenius–monodromy relation*.

**Checks.**

- For U=X and a strictly semistable fiber this recovers the unsupported convergent triangle.

**Convergent and log de Rham–Witt complexes.** For a strictly semistable X/k^log, DL equation (B.5)
supplies natural quasi-isomorphisms ω_X≃Wω_X⊗ℚ and ω̃_X≃Wω̃_X⊗ℚ, compatible with the
absolute-relative triangle, Frobenius and N. The Witt objects are those of *Semistable logarithmic
Witt models*. This is a
rational comparison in the stated embedding setting; arbitrary singular log schemes and an integral
convergent comparison are outside its statement.

*Proof sketch.* Take the semistable logarithmic Witt complexes of *Semistable logarithmic Witt
models* and compare the embedding models via crystalline de Rham–Witt comparison. Pass to the
convergent rational complexes and identify the θ-wedge maps termwise. ([Disegni–Liu, *A p-adic
arithmetic inner product formula*](https://disegni-daniel.perso.math.cnrs.fr/AIPF.pdf), Equation
(B.5) and the preceding strict-semistable comparison argument, PDF p.117.) *Needs:* *Convergent
monodromy triangles*; *Semistable logarithmic Witt models*; *Log de Rham–Witt model*.

**Checks.**

- The connecting monodromy agrees under the two comparison maps.

**Sato logarithmic residue variant.** For a strictly semistable X/k^log, use an admissible embedding
system over W(k)[t]^log with source a strict Zariski hypercover of X. Its degree-zero lift Z⁰ is
flat and generically smooth over W[t], smooth over W, and the actual fibre Y⁰=(t=0) is a relative
strict normal crossings divisor over W. Its log structure is the divisor log of Y⁰, and its special
fibre is formed by the actual structure map and k^log→W[t]^log. Higher levels are the compatible
Grosse-Klönne induced system. On each lift define Ω_+^q as the sheaf cokernel of ordinary absolute
(q+1)-forms into absolute log (q+1)-forms over W; restrict to the prescribed fibre, realize on the
tube and totalize. Derived specialization gives ω_X^+, naturally comparable with WΞ_X⊗ℚ. For support
along U, apply the analytic tube support functor before specialization in this same system; retain
the natural special-fibre-support comparison without declaring it invertible. WΞ and its ordered
residue sequence are those of *Sato’s homological de Rham–Witt complex*. The q+1 shift, stratum
ordering and coefficient-module convention are essential.

*Proof sketch.* Choose the source strict Zariski hypercover and the degree-zero W[t] lift satisfying
flatness, generic smoothness over Frac(W[t]), W-smoothness and the actual relative SNC zero-divisor
condition. Identify the log structure with that divisor log and the special fibre by pullback along
the prescribed log point. Use Grosse-Klönne §§5.1–5.2: form products of degree-zero lifts over W,
blow up the corresponding products of flat divisor components, remove strict transforms, and take
the exceptional divisor with the diagonal embeddings. Retain all face, degeneracy, augmentation and
structure-map compatibilities. Form the sheaf cokernel of ordinary-to-log absolute forms in degree
q+1 on these actual lifts. Restrict to the zero fibre and use the tube realization of *Convergent
logarithmic embedding complexes* and totalization tied to the same embedding system. Apply Sato
Definition 8.3 and Propositions 8.4 and 8.6, pp.211–213, to compare the ordered-stratum residue
complexes with rational WΞ. Transport its module structure. For U⊂X use the same embedding’s exact
tube support kernel before derived specialization. Construct the map from special-fibre extension by
zero to that supported residue complex; DL does not identify these two support procedures.
*Sato’s homological de Rham–Witt complex* supplies the residue quotient, rational
comparison and absolute Witt map, with the compatibility needed for this embedding model. ([Disegni–Liu, *A p-adic arithmetic inner product
formula*](https://disegni-daniel.perso.math.cnrs.fr/AIPF.pdf), Appendix B.1 admissible embeddings,
PDF pp.114–115; B.2 residue bridge and diagrams (B.7)–(B.9), PDF p.118; [Grosse-Klönne, *Frobenius
and monodromy operators in rigid analysis, and Drinfel’d’s symmetric
space*](https://arxiv.org/abs/1408.3346v1), §§5.1–5.2, pp.26–27; [Sato, *Cycle classes for p-adic
étale Tate twists and the image of p-adic
regulators*](https://ems.press/content/serial-article-files/26173), Definition 8.3, Proposition 8.4
and Proposition 8.6, pp.211–213.) *Needs:* *Convergent logarithmic embedding complexes*; *Absolute
semistable residue maps* (Layer CR.5); *Sato’s homological de Rham–Witt complex*; *Proper support on open analytic tubes*; Mathlib
`SheafOfModules`.

**Checks.**

- For a smooth component the homological Witt sheaf agrees with ordinary WΩ; on a crossing the
  ordering controls the higher residue signs.
- For a smooth point, the degree-shifted quotient retains θ=dlog t and ∂(θ)=1.
- For a two-branch crossing, swapping the branch labels negates the double-residue class;
  ordinary absolute forms have zero residue and disappear in Ω_+.

**Rigid cohomology of smooth strata.** Let k have characteristic p, A₀ be a complete mixed
characteristic discrete valuation ring with residue k and fraction field K₀, and Z a smooth
finite-type k-scheme. Construct RΓ_rig(Z/K₀) with constant coefficients from dagger frames:
choose local closed embeddings in smooth weak formal A₀-schemes, take overconvergent de Rham
complexes on their tubes, and descend over a finite affine cover. Prove independence of frames,
finite-dimensionality of each H^i, and, for k perfect and A₀=W(k), bijectivity of semilinear
Frobenius. Tensoring with a finite-dimensional constant coefficient space preserves these
conclusions. For proper smooth Z identify the rigid complex with the rational crystalline
complex of Layer CR.3 and with convergent cohomology.

*Hypotheses.* p is prime; Z is smooth and of finite type. Frame independence and finiteness on
separated Z are extended to general Z by finite affine-cover descent. Frobenius requires a
perfect residue field and its Witt lift; no finiteness of ordinary de Rham cohomology of a rigid
closed disc is inferred. Only this smooth-stratum rigid theory is in scope.

The API:

- `Crystalline.smoothStratumRigid.frame_independence`: Product frames and common cover
  refinements give compatible quasi-isomorphisms of the overconvergent complexes.
- `Crystalline.smoothStratumRigid.finiteDimensional`: Each H^i_rig(Z/K₀) is finite-dimensional.
- `Crystalline.smoothStratumRigid.frobenius`: Over perfect k its semilinear Frobenius is bijective.
- `Crystalline.smoothStratumRigid.proper_comparison`: For proper smooth Z, the rigid,
  convergent and rational crystalline complexes are canonically identified.

*Proof sketch.* The overconvergent Poincaré homotopy on product frames proves independence and
Zariski descent. Prove the constant-coefficient case of Kedlaya's finiteness theorem directly
from its affine dagger argument and finite-cover descent; do not use the conditional finiteness
assertions of AdicSpacesPartIV F1.11 to discharge their own input. Construct Frobenius on frames;
on each pure dimension-d component the finite Frobenius trace and pullback compose to
multiplication by p^d, giving an inverse
on rational cohomology. For proper smooth Z, the proper dagger comparison identifies the
frame de Rham model with its convergent model and the rational crystalline embedding computation.
These finiteness, trace and comparison steps are proof obligations of this target.
([Kedlaya, *Finiteness of rigid cohomology with coefficients*](https://arxiv.org/abs/math/0208027),
Theorem 1.2.1, §4 (frames and overconvergent cohomology), §9.1 (smooth-case finiteness);
[Grosse-Klönne, *Frobenius and monodromy operators in rigid analysis, and Drinfel’d’s symmetric
space*](https://arxiv.org/abs/1408.3346v1), §1.5 and proof of Theorem 5.3, pp.28–29.)
*Needs:* AdicSpacesPartIV F1.5 (*The Monsky–Washnitzer weak completion*), F1.7 (*Dagger spaces*)
and F1.8–F1.10 (dagger de Rham complexes and proper comparison, without F1.11 finiteness);
AdicSpacesPartIII Layer R2 (tubes); *Crystalline cohomology from an embedding* (Layer CR.2);
*Proper smooth crystalline perfectness and reductions* (Layer CR.3);
SchemeAndStackFoundations Layer 4 (alterations); EnhancedDerivedSheaves Layer E2 (descent).

**Checks.**

- On Spec k the complex is K₀[0], with Witt Frobenius σ when k is perfect.
- On A¹_k the overconvergent primitive makes H¹_rig vanish; ordinary rigid closed-disc
  de Rham cohomology need not vanish or be finite-dimensional.
- On G_m the degree-one class is dlog t and Frobenius sends it to p·dlog t; this nonproper
  smooth stratum has a one-dimensional H¹ and bijective rational Frobenius.

### CR.6.5 Log rigid Hyodo–Kato cohomology

**Log rigid Hyodo–Kato cohomology.** Let k be a field of characteristic p, A₀ a complete discrete
valuation ring of mixed characteristic with residue field k and fraction field K₀ (for perfect k, A₀
= W(k)), `S†=Spwf(A₀[t]†)` the weak formal base with chart `1↦t`,
`Ŝ=Spf A₀⟨t⟩` its adic completion, and S₀ = (Spf A₀, 1 ↦ 0) its fibre at t = 0. Let
Y be a strictly semistable log scheme over the log point (Spec k, 1 ↦ 0). An admissible weak formal
lift of an open U ⊂ Y is a weak formal S†-log scheme (Z, N_Z), smooth over A₀ and flat over S† with
reduction generically smooth over the special fibre of S†, whose fibre at t = 0 is a normal
crossings divisor defining
N_Z, with (U, N_U) ≅ (Z, N_Z) ×_(S†) (Spec k, 1 ↦ 0). Write
Y_Z=(Z,N_Z)×_(S†) S₀ for the A₀-lift of U, so U=Y_Z×_(A₀)k; such lifts exist locally on Y.
For a covering Y = ⋃_h U_h with admissible lifts, form for each finite set G of indices the weak
formal blow-up of the weak formal product of the lifts over Spf A₀
along the products of their flat boundary components, remove the strict transforms, and take the
exceptional divisor Y_G with the diagonal embedding of `U_G = ⋂_{h∈G} U_h`; the tubes `]U_G[_{Y_G}` in
the generic fibres `Y_{G,ℚ}` (K₀-dagger spaces) form a simplicial site `]U_•[_{Y_•}`. Let ω̃^• be the
logarithmic de Rham complex of these weak formal log schemes over A₀, ω^• its quotient relative to
S₀ (forms modulo θ = dlog t), and E a locally constant sheaf of finite-dimensional K₀-spaces on Y.
Define

```text
RΓ_rig(Y/S₀, E) = RΓ(]U_•[_{Y_•}, E ⊗_{K₀} ω^•_{Y_•,ℚ}),
```

and the monodromy N : H*_rig(Y/S₀, E) → H*_rig(Y/S₀, E) as the connecting map of the exact sequence
0 → E ⊗ ω^•[−1] → E ⊗ ω̃^• → E ⊗ ω^• → 0, whose first map is ∧θ. Prove that this is independent of
the covering and the lifts; that H*_rig(Y/S₀, E) is finite-dimensional when Y is quasi-compact; that
for a lift σ of the q-th power Frobenius (q a power of p) and an F-structure (E, φ) the induced φ is
bijective when k is perfect and satisfies Nφ = qφN; that when all irreducible components of Y are
proper, RΓ_rig(Y/S₀, E) agrees with the convergent theory; and that for Y proper, k perfect, A₀ =
W(k) and E = K₀, RΓ_rig(Y/S₀) is identified with the rational log crystalline Hyodo–Kato complex
RΓ_crys(Y/W(k)^log) ⊗ K₀ of Layer CR.6.

The API:

- `LogRigidHK.complex`: RΓ_rig(Y/S₀, E) on the simplicial dagger tube site.
- `LogRigidHK.monodromy`: N as the connecting map of the ∧θ sequence.
- `LogRigidHK.frobenius`: φ from a Frobenius lift, with Nφ = qφN.
- `LogRigidHK.finiteDimensional`: finiteness for quasi-compact Y.
- `LogRigidHK.crystallineComparison`: the identification with rational log crystalline cohomology
  for proper Y over a perfect field.

*Proof sketch.* Independence of the choices uses common refinements of coverings and of lifts. The
weight filtration by the images of `ω̃^j ⊗ Ω^{k−j}` has graded pieces given by residues onto the
intersections of j irreducible components, and the Poincaré lemma identifies these with ordinary
rigid cohomology of the strata; this gives a spectral sequence whose E₁ terms are finite-dimensional
for quasi-compact Y, with Frobenius acting compatibly, whence finiteness and bijectivity of φ. The
relation Nφ = qφN holds because φ acts by qφ on the first term of the ∧θ sequence, since σ(t) = t^q
gives φ(θ) = qθ. The convergent comparison completes the weak formal lifts and blow-ups over
Ŝ, uses their rigid generic fibres, and compares the E₁ terms for proper strata ([Grosse-Klönne,
*Frobenius and monodromy
operators in rigid analysis, and Drinfel’d’s symmetric space*](https://arxiv.org/abs/1408.3346v1),
Notations, p.6; §1.1, p.7; §§5.1–5.2, pp.26–28, spectral sequence (4); Theorem 5.3, p.28;
§5.4 and Proposition 5.5, pp.28–29; §3.11, p.18).
*Needs:* *Rigid cohomology of smooth strata*;
AdicSpacesPartIV F1.7 (*Dagger spaces*) and F1.5 (*The Monsky–Washnitzer weak
completion*); AdicSpacesPartIII Layer R2 (*Specialisation, tubes and rig-points*); *Log de Rham
complexes* (Layer CR.5); *Integral Hyodo–Kato complexes*; *Hyodo–Kato monodromy*.

**Checks.**

- For U=Spec k and Z=S†, Y_Z=Spf A₀ while U=Y_Z×_(A₀)k;
  the t=0 fibre still has mixed characteristic.
- For `A₀=ℤ_p`, the series `Σ_(n≥0) p^(⌊√n⌋) t^n` lies in `ℤ_p⟨t⟩` but not `ℤ_p[t]†`:
  its coefficient valuations tend to infinity and have no positive linear lower bound in n.
  The rigid generic fibre of `Ŝ` is the completion of the dagger generic fibre of `S†`.
- `logRigidHK_good_reduction`: if Y is smooth (one component, empty boundary), N = 0 and
  H*_rig(Y/S₀) is ordinary rigid cohomology of Y.
- `logRigidHK_two_lines`: for Y = {xy = 0} ⊂ 𝔸²_k, the special fibre of xy = t, the weight spectral
  sequence gives H⁰_rig(Y/S₀) = K₀ and H¹_rig(Y/S₀) = K₀, spanned by the class of dlog x with φ = q
  and N = 0; this matches the de Rham cohomology of the annulus |t| ≤ |x| ≤ 1. A definition that
  drops the log structure would give H¹ = 0 here.
- `logRigidHK_cycle`: let `k=𝔽_q`, `A₀=W(k)` and `φ` be the linear `q`-power Frobenius. For `Y`
  consisting of two copies of `ℙ¹_k` glued transversely at two distinct `k`-rational nodes,
  `H¹_rig(Y/S₀)` is two-dimensional, with Frobenius eigenvalues `1` (from the cycle of the dual
  graph) and `q` (from the residues at the nodes). Monodromy `N` maps the `q`-eigenline
  isomorphically onto the 1-eigenline. Then `Nφ=qφN` holds and `φN=qNφ` fails.
- Over `k=𝔽₃`, glue two copies of `ℙ¹_k` transversely along the degree-two closed points
  defined by `t²+1` and `t²+t+2`, with the log structure of a strictly semistable smoothing.
  Over `𝔽₉` there are four nodes, so the dual graph has `b₁=4−2+1=3`. The normalization
  sequence gives `χ(O_Y)=2−4=−2` and arithmetic genus three; the weight spectral sequence (4)
  gives two three-dimensional weight pieces in `H¹_rig(Y/S₀)`, hence dimension six.

**Proper log rigid and crystalline Hyodo–Kato cohomology.** For a proper strictly semistable special
log fiber Y over a perfect field, the log rigid Hyodo–Kato complex RΓ_rig(Y/S₀) of *Log rigid
Hyodo–Kato cohomology* is canonically comparable with the rational log crystalline HK complex,
compatibly with φ, N and the uniformizer-dependent de Rham comparison. This is Grosse-Klönne §3.11
and the BKV Remark 3.4(2) input.

*Proof sketch.* Use the proper convergent/crystalline comparison for log smooth embedding systems.
Compare the log rigid boundary-complex models with the same log parameter specializations and their
θ triangles. Use proper de Rham/dagger comparison to match the uniformizer maps. ([Grosse-Klönne,
*Frobenius and monodromy operators in rigid analysis, and Drinfel’d’s symmetric
space*](https://arxiv.org/abs/1408.3346v1), §3.11, pp.18–19; Theorem 3.4 and proof, pp.16–17;
[Binda–Kato–Vezzani, *On the p-adic weight-monodromy conjecture for complete intersections in toric
varieties*](https://arxiv.org/abs/2207.00369v2), Remark 3.4(2), p.16.) *Needs:* *Hyodo–Kato
comparison theorem*; *Log de Rham–Witt model*; *Log rigid Hyodo–Kato cohomology*.

**Checks.**

- In good reduction it agrees with the ordinary proper rigid–crystalline comparison.

**Ramified Hyodo–Kato base change.** For a finite residue extension k′/k and log base k′^(d)→k^log
given by ℕ→ℕ, 1↦d, d≥1, put N^(d)=N_raw/d on the HK complex of a model over k′^(d). For a base
change `Y′=Y×_{k^log}k′^(d)`, the rational comparison `C_HK^(d)(Y′)≃C_HK(Y)⊗_{K₀}W(k′)[1/p]` is
(φ,N)-equivariant with this normalized N^(d). Without normalization raw monodromy scales by d. In
characteristic p, this is not a claim that the d=p root map is log étale.

*Proof sketch.* Compare the standard log-base parameter under t↦t^d, so dlog t becomes d dlog t′.
Use rational log crystalline/log rigid base change in the semistable setting and divide the raw
boundary by d. Transport Frobenius and verify the normalized connecting diagram.
([Binda–Kato–Vezzani, *On the p-adic weight-monodromy conjecture for complete intersections in toric
varieties*](https://arxiv.org/abs/2207.00369v2), Remarks 3.4–3.5 and Definition 3.6, pp.16–17.)
*Needs:* *Hyodo–Kato monodromy*; *Finiteness and Frobenius isogeny*; *Log fiber products* (Layer
CR.5:log-algebra); *Log rigid Hyodo–Kato cohomology*.

**Checks.**

- For d=1 it is unramified base change.
- For a Tate curve and ramification index d=2, N_raw doubles and N^(2)=N_raw/2 recovers N.
- For d=p the rational division by d is valid, while the root chart is not log étale in
  characteristic p; omitting 1/d fails whenever N is nonzero.

### Examples

- For a split Tate curve over `K` with `v_K(q)=2`, its minimal regular proper model over `O_K` has
  special fibre two copies of `ℙ¹_k` meeting transversely at two distinct `k`-rational nodes.
  With the semilinear `p`-power Frobenius, `H¹_HK` has a basis `e₀, e₁` with `φ(e₀)=e₀`,
  `φ(e₁)=pe₁`, `N(e₀)=0` and `N(e₁)=2e₀`, so `Nφ=pφN`.

### Dependencies

Layers CR.2, CR.3, CR.4, CR.5:log-algebra, CR.5; EnhancedDerivedSheaves (Layer E1);
AdicSpacesPartIII (Layer R2); AdicSpacesPartIV (§§F1.5, F1.7, F1.11, Layer R4);
SchemeAndStackFoundations (Layer 2);
Mathlib and Tau Ceti.

## Layer CR.7: Coefficients and relative cohomology

This layer packages the objects other roadmaps consume: finite projective crystalline coefficients,
filtered Frobenius coefficients with monodromy on semistable models,
relative crystalline direct images with proper smooth base change, and the Gauss–Manin
connection.

### CR.7.1 Coefficients with Frobenius, filtration and monodromy

**Finite projective crystalline coefficients.** Start from a finite locally free crystal of Layer
CR.1 or a finite locally free log crystal of Layer CR.5. At every PD object T take its finite
locally free module sheaf F_T and coherent sheaf-pullback isomorphisms. Only on affine T identify
its sections with a finite projective Γ(T,O_T)-module. A log PD-smooth embedding gives the
integrable stalkwise quasi-nilpotent sheaf connection using the common crystal evaluation. Tensor,
internal dual and End preserve these evaluation maps. Completed coefficients are compatible finite
locally free crystals at all W/p^(n+1) levels, with compatible reductions and morphisms; on an
O-model use the canonical PD thickenings M/p⊂M/p^(n+1). Rational coefficients retain an integral
system and invert p on morphisms, giving K₀-linear Hom spaces.

The API:

- `LogCrystalline.coefficientInterface.evaluate`: Evaluation at T returns the actual finite locally
  free O_T-module sheaf F_T; on affine T its section module is finite projective.
- `LogCrystalline.coefficientInterface.pullback`: For a compatible PD map g, g*F_T≅F_T′.
- `LogCrystalline.coefficientInterface.tensor_dual`: Evaluation and connection commute with tensor
  products and finite locally free duals.

*Proof sketch.* Reuse the CR.1/Layer CR.5 module-sheaf crystal category and add finite local
freeness on every ambient evaluation. The affine QC equivalence then gives finite projective section
modules. Use the same ambient sheaf evaluation and canonical transition maps for tensor, dual and
the PD connection; do not replace nonaffine sheaves by global modules. Form compatible crystal
systems over the trivial-log Witt PD bases W/p^(n+1), with source M/p and the canonical PD(p) model
evaluations. Require adjacent reduction isomorphisms and their morphism squares; compose them for
all reductions. Retain the integral system as an object presentation and localize Hom by K₀⊗_W Hom,
extending composition bilinearly. Evaluation on the actual model PD thickenings retains the same
reduction isomorphisms before rationalization. ([de Jong, *Crystalline Dieudonné module theory via
formal and rigid geometry*](https://www.numdam.org/article/PMIHES_1995__82__5_0.pdf), §§2.2.1–2.2.4,
pp.18–21; formal crystals and completed evaluation.) *Needs:* Layer CR.1; *Logarithmic crystals*
(Layer CR.5); *Crystals and log connections* (Layer CR.5); *Derived p-adic log crystalline
cohomology* (Layer CR.5); EnhancedDerivedSheaves Layer E1 (*Derived
sheaf tensor*); Mathlib `ModuleCat`; Mathlib `SheafOfModules`; Mathlib `SheafOfModules.pullback`.

**Checks.**

- `structure`: For the structure crystal, evaluation is O_T and ∇=d.
- `zero`: The zero crystal gives the zero finite projective module.
- `nonflat_failure`: The evaluation ℤ_p/pℤ_p over ℤ_p is not flat and therefore cannot be a finite
  projective coefficient evaluation.

**Filtered Frobenius coefficients on semistable models.** On a semistable O-model M, a rational
coefficient is a compatible completed finite locally free crystal system over W/p^(n+1), with source
M/p, followed by explicit p-inversion. Geometric Frobenius pullback is levelwise crystalline
pullback along absolute Frobenius of M/p and Witt σ; require an invertible horizontal linearization
φ:σ*C→C when used. A monodromy map N:C→C is a crystal morphism with Nφ=pφσ*N. To specify a de Rham
sheaf on the full algebraic generic fibre, supply a finite locally free integrable O_M/W connection
lattice whose reductions are horizontally and coherently identified with these very model PD
evaluations. This algebraization is additional data; formal completion alone does not supply it on
an arbitrary nonproper M. Restrict that lattice to M_K and pass to K-relative forms. Give this sheaf
an exhaustive separated decreasing filtration by étale-locally split sheaf submodules, with ∇Fil^i
contained in the sheaf image of Fil^(i−1)⊗Ω¹. Compatible model pullback retains level reductions,
commutes with Frobenius, and pulls back this realized filtration and connection. Twist C(r) scales φ
by p^(−r), retains N and shifts Fil^i to Fil^(i+r). The twist convention is the one fixed in
*Conventions*.

The API:

- `LogCrystalline.arithmeticCoefficientInterface.frobenius`: The horizontal linearization F_S^*F→F.
- `LogCrystalline.arithmeticCoefficientInterface.twist`: On F(r), `φ_r=p^{−r}φ` and
  `Fil^i(F(r))=Fil^{i+r}F`.
- `LogCrystalline.arithmeticCoefficientInterface.base_change`: Compatible model pullback is
  levelwise crystalline pullback, commutes with Frobenius and transports N. On the specified
  algebraization its generic realization is sheaf pullback, with the pulled-back connection and
  sheaf filtration; the comparison preserves Griffiths transversality.

*Proof sketch.* Use the completed finite locally free systems and localized Hom category from
finite-projective-coefficients. Construct levelwise model and Frobenius pullback, with natural
comparison isomorphisms commuting with level reduction and Witt-semilinear scalars. Evaluate C_n on
the actual M/p⊂M/p^(n+1) PD thickenings. Specify a finite locally free integrable algebraic lattice
and horizontal reduction isomorphisms commuting with adjacent ambient reduction; this is an
algebraization of the same formal evaluation, not a universal algebraization theorem. Pull that
lattice back to the actual generic fibre and quotient W-relative forms to K-relative forms. Define
filtration subobjects using the native module-sheaf submodule lattice, with complements only after
étale localization. Express Griffiths transversality in the sheaf tensor image. Pull back the
integral systems, realized connection and locally split filtration along a compatible model
morphism. Check the Frobenius commutation square, monodromy conjugation and sheaf filtration
transport on that same evaluation. Apply the twist convention of *Conventions*, φ_r=p^(−r)φ and
Fil^i_r=Fil^(i+r); scalars preserve invertibility and the Nφ relation. ([de Jong, *Crystalline
Dieudonné module theory via formal and rigid
geometry*](https://www.numdam.org/article/PMIHES_1995__82__5_0.pdf), §§2.2.1–2.2.4 and 2.3.1–2.3.4,
pp.18–22; [Hyodo–Kato, *Semi-stable reduction and crystalline cohomology with logarithmic
poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf), §3.4, pp.244–245; Theorem 5.1,
pp.262–263.) *Needs:* *Finite projective crystalline coefficients*; *Frobenius–monodromy relation*
(Layer CR.6); *Logarithmic differentials* (Layer CR.5); Mathlib `SheafOfModules.Submodule`; Mathlib
`SheafOfModules.pullback`; Mathlib `AlgebraicGeometry.«Proj»`; Mathlib `MvPolynomial.gradedAlgebra`.

**Checks.**

- `twist_zero`: Twist by zero is the original coefficient package.
- `twist_minus_one`: The twist F(−1) multiplies Frobenius by p and has `Fil^i(F(−1)) = Fil^{i−1}F`, so
  a filtration jump in degree 0 moves to degree 1.
- `crystal_not_filtered`: On any nonempty generic model, the same constant rank-one rational crystal
  with its specified de Rham realization admits distinct exhaustive separated locally split
  transverse sheaf filtrations with jumps in degrees 0 and 1. Thus the crystal does not determine
  its filtration.
- `local_split_not_global`: On P1 over a field, the Euler sequence 0→O(−1)→O²→O(1)→0 gives a
  subbundle that has complements on the two standard affine charts but has no global sheaf
  complement. It must satisfy the local splitting predicate.

### CR.7.3 Relative crystalline cohomology and the Gauss–Manin connection

**Proper smooth crystalline base change.** In a cartesian base diagram `X′=X×_{S₀}S₀′`,
let u:(S′,I′,γ′)→(S,I,γ) be a PD map of p-nilpotent bases, S quasi-compact,
and S₀⊂S and S₀′⊂S′ be defined by sub-PD ideals of I and I′. Give these fibres
the induced compatible base powers and use the base-compatible crystalline sites of Layer CR.1.
Assume f₀:X→S₀ smooth quasi-compact quasi-separated and F flat quasi-coherent.
For π:(X/S)_crys→S_Zar the structure map, the actual arrow
Lu*Rπ_*F→Rπ′_*g_crys*F is an isomorphism. For I₀=I this is the ordinary crystalline
base change of Layer CR.3. Relative proper smooth coefficient base change follows by applying this
statement on (V,T). For p-adically complete bases, use the corresponding compatible finite
p-power quotients and derived inverse limits, with the perfectness hypotheses of Layer CR.3
when asserting an uncompleted tensor comparison.

*Proof sketch.* Lift the smooth closed fibre locally to the ambient base, identify the two
crystalline complexes with the coefficient de Rham complexes of those lifts, and compare the
actual arrows. Their terms are flat over the base. Glue with finite affine-cover descent;
quasi-separatedness permits a second finite cover of the intersections. At complete bases apply
derived inverse limits and the corrected projective-resolution theorem of Layer CR.3, never
an unproved underived limit. A public source covering sub-PD ideals is
[Du–Moon–Shimizu, *On log crystalline higher direct image*](https://arxiv.org/abs/2603.00559v1),
Theorem 8.1 and proof, pp.31–34, with trivial log structures. For the ordinary case see
[Stacks Project](https://stacks.math.columbia.edu/tag/07MU), Remarks 60.24.8–60.24.9
(tags 07MS, 07MU), conditions (1)–(7). The relative derived-crystal and p-adic variants
are Du–Moon–Shimizu, Theorems 10.11–10.12, pp.43–44.
The inverse-system correction is [Berthelot–Ogus, erratum to *Notes on crystalline
cohomology*](https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf), pp.1–2,
21 August 2013. *Needs:* Layer CR.1; *Derived crystalline base change* (Layer CR.3);
*Log PD Poincaré lemma* (Layer CR.5), with trivial log structures and compatible base powers;
EnhancedDerivedSheaves Layer E2 (*Bounded-below hypercover descent*);
DerivedModuleAlgebra (§1.3 *The derived completion reflector*).

**Checks.**

- Finite free coefficients on the base point give the ordinary tensor base-change isomorphism.
- Reducing a smooth projective line from W_2(k) to k gives k⊕k[−2] by derived tensor.
- For sub-PD ideal I₀=0 and X=S smooth over S, evaluation of the identity coefficient is
  O_S[0]; compatibility with the base powers suffices even though the fibre is not V(I).

**Relative crystalline direct images.** For proper smooth f:X→Y over a p-nilpotent PD base
(S,I,γ), with Y quasi-compact and F a finite locally free quasi-coherent crystal on X/S,
construct K=Rf_crys,*F as a derived crystal on Y/S. Ordinary sites use Y→S₀=V(I);
if γ merely extends to IO_Y, use the base-compatible small sites of Layer CR.1.
For an object (V,T,δ), put X_V=X×_Y V and T♯=(T,J+IO_T,δ+γ), with the unique
common extension of the powers. The evaluation K_T is the O_T-complex
Rπ_(X_V/T♯),*F|_(X_V/T♯), where π is the crystalline structure map to T_Zar.
For affine T=Spec B its derived sections are RΓ_crys(X_V/T♯,F|_(X_V/T♯)) in D(B).
No morphism T→Y or scheme X×_Y T is required. Perfectness is derived;
individual H^i require the extra hypotheses of *Relative Gauss–Manin connections*.

The API:

- `LogCrystalline.relativeCrystallineImage.evaluate`: On (V,T), evaluation is the displayed
  sheaf-valued crystalline direct image; its derived global sections give crystalline cohomology.
- `LogCrystalline.relativeCrystallineImage.base_change_map`: A PD map T′→T gives the canonical
  derived tensor-to-evaluation arrow, compatible with composition.
- `LogCrystalline.relativeCrystallineImage.identity`: For f=id, K_T=F_T in degree zero.

*Proof sketch.* Localize the crystalline topos over (V,T) and derive its structure-map
pushforward using EnhancedDerivedSheaves Layer E1. Apply *Proper smooth crystalline base change*
to each affine evaluation to establish the derived cartesian property. Obtain perfectness by
the proper smooth finite-projective coefficient argument of Layer CR.3; its local Frobenius
factorization and finite affine-cover Tor-amplitude calculation also apply to the compatible
PD-base convention. The relevant public references are
[Stacks Project](https://stacks.math.columbia.edu/tag/07MJ), Remark 60.24.1 (tag 07MJ),
and [Du–Moon–Shimizu, *On log crystalline higher direct image*](https://arxiv.org/abs/2603.00559v1),
Lemma 5.9, pp.13–14; Theorems 8.1–8.2, pp.31–35; Theorem 9.1 and Proposition 9.2,
pp.35–38, specialized to trivial log structures. *Needs:* *Finite projective crystalline coefficients*;
Layer CR.3; Layer CR.1; *Proper smooth crystalline base change*;
EnhancedDerivedSheaves Layer E1 (*The enhanced derived category* and *Derived sheaf tensor*);
Mathlib `DerivedCategory`.

**Checks.**

- `identity`: For f=id and any (V,T), the evaluated image is F_T concentrated in degree zero.
  For nonaffine T this assertion concerns the module sheaf; RΓ(T,F_T) may have positive degrees.
- `closed_fibre`: For Y=Spec F_p, T=Spec ℤ/p² and V=Y, no T→Y exists. The formula still gives
  X_V=X, and for f=id and structure coefficients the evaluation is ℤ/p² in degree zero.
- `point`: A proper point over itself gives the coefficient module in degree zero.
- `no_local_freeness`: The bounded perfect complex [ℤ_p --p→ ℤ_p] has cohomology ℤ_p/pℤ_p, which is
  not locally free; perfectness alone does not make its individual cohomology finite projective.
- The structure coefficient pushforward of the identity morphism is its original coefficient.

**Relative Gauss–Manin connections.** Let f:X→Y be proper smooth over a smooth base Y/S and F a
finite locally free crystal with integrable quasi-nilpotent connection. Assume the relative
coefficient de Rham derived image is perfect, every H^i in the degrees used is finite locally free,
and the cohomology base-change maps in those degrees are isomorphisms (for instance, impose the
appropriate neighboring torsion-vanishing or locally constant rank conditions supplied by Layer
CR.3). Then the derived crystalline cartesian structure induces an integrable quasi-nilpotent
Gauss–Manin connection on H^i. Its map is the boundary of the first-step base-form filtration on the
absolute coefficient de Rham complex.

The API:

- `LogCrystalline.gaussManin.boundary`: The connection is the boundary map of the first-step
  base-form filtration.
- `LogCrystalline.gaussManin.leibniz`: ∇_GM(ah)=a∇_GM(h)+h⊗da.
- `LogCrystalline.gaussManin.integrable`: The extracted connection has zero curvature and is
  quasi-nilpotent under the source PD hypotheses.

*Proof sketch.* Use the derived crystal evaluation over the base PD diagonal. Under the explicit
finite locally free/cohomology base-change assumptions, extract the H^i cartesian module and
differentiate its PD stratification. Identify the connection with the boundary map from the
base-form filtration and prove integrability by the PD cocycle. This is the
cohomology-level consequence, under the stated cohomology base-change hypotheses,
of the derived crystal just constructed and the crystal–connection equivalence of Layer CR.1
([Stacks Project](https://stacks.math.columbia.edu/tag/07JH), §60.17,
Proposition 60.17.4; [Du–Moon–Shimizu](https://arxiv.org/abs/2603.00559v1),
Theorem 10.11, p.43). The identification with the base-form boundary is obtained by
differentiating the first PD-diagonal coordinate; it is part of this target. *Needs:* *Proper smooth crystalline base change*; *Integrable logarithmic
connections* (Layer CR.5); Layer CR.1; Layer CR.3; EnhancedDerivedSheaves Layer E1 (*The enhanced derived category*).

**Checks.**

- `constant_family`: For the actual constant proper smooth family X×_S Y→Y, assume its base
  cohomology modules are projective and the stated cohomology base-change hypotheses hold. The
  canonical tensor comparison identifies ∇_GM with d on the O_T factor and zero on H^q_crys(X/S).
- `identity`: For f the identity and structure coefficients, H⁰=O_Y with d and higher degrees
  vanish.
- `torsion_warning`: The perfect complex [ℤ_p --p→ ℤ_p] has nonflat cohomology ℤ_p/pℤ_p and fails
  the additional locally free cohomology hypothesis.
- A constant proper family has the tensor product of constant cohomology with O_Y and its ordinary d
  connection.

**Horizontal Gauss–Manin base change.** For the proper smooth finite-projective coefficient setup, a
compatible smooth/PD base map g:Y′→Y and degrees satisfying the stated locally free cohomology and
cohomology base-change conditions induce g*H^i→H^i′, an isomorphism horizontal for g*∇_GM and ∇′_GM.
If specified coefficient Frobenius, filtration or log monodromy structures are present and the map
respects them, the comparison preserves those structures. No unrestricted singular, nonproper or
stacky theorem is included.

*Proof sketch.* Use the naturality of the PD-diagonal cartesian isomorphism under g. Differentiate
that commuting diagram to prove horizontality; extract H^i using the explicit cohomology base-change
assumptions. Transport only the additional structures actually given on the coefficients.
This is a deduction from the composition-compatible PD cartesian maps and the
stratification–connection equivalence ([Stacks Project](https://stacks.math.columbia.edu),
§60.17, Proposition 60.17.4), rather than a stronger base-change theorem. *Needs:* *Relative Gauss–Manin connections*; *Proper smooth
crystalline base change*; *Filtered Frobenius coefficients on semistable models*.

**Checks.**

- The constant-family base-change diagram commutes on an explicit h⊗a and its differential.

**Compatibility with divided powers.** On every affine evaluation with defining ideal J and its
existing DividedPowers structure δ, the coefficient crystals and the log PD de Rham complexes use
δ₁(x)=x for x∈J and `dδ_n(x)=δ_{n−1}(x)dx` for n≥1. A compatible PD map f carries δ_n(x) to δ′_n(fx),
and the tensor and base-change comparisons respect these identities. The coefficients carry no
divided powers beyond the given δ.

*Proof sketch.* Use the actual defining PD ideal, its first divided-power operation and the
canonical PD log derivation, which satisfies the PD differential relation. Recover the evaluated
connection by differentiating the coefficient crystal’s actual diagonal stratification. Transport
the operations and the connection through a compatible PD base map; its cartesian coefficient
comparison differentiates to a horizontal map. ([Beilinson, *On the crystalline period
map*](https://arxiv.org/abs/1111.3316v4), §1.7(a), PD compatibility criterion, p.10; §1.7(b); [Kato,
*Logarithmic structures of
Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf),
§6.4, coefficient PD log de Rham complex, p.219.) *Needs:* *Finite projective crystalline
coefficients*; *Filtered logarithmic PD de Rham complexes* (Layer CR.5); DerivedDeRhamCohomology
§§PD.1–PD.2, PD.4–PD.7 and DerivedModuleAlgebra §0.DP.3; Mathlib `DividedPowers`.

**Checks.**

- For x∈J, `DividedPowers.dpow_one` applied to x∈J gives δ₁(x)=x on the supplied PD carrier.
- On the PD polynomial algebra A⟨t⟩ with its augmentation PD ideal,
  `dδ₂(t)=t dt`, including over ℤ₂; the relation uses no division by 2.
- Under a compatible PD map f:A⟨t⟩→D′, the preceding relation becomes
  `dδ′₂(f(t))=f(t) d(f(t))`; the base change of the trivial coefficient connection preserves it.

### Dependencies

Layers CR.1, CR.3, CR.5, CR.6; EnhancedDerivedSheaves (Layer E1, Layer E2);
DerivedDeRhamCohomology (Layer 1); Mathlib.

## Downstream consumers

- **PrismaticCohomology** imports crystalline sites and crystals (§§CR.1.1–CR.1.3),
  the smooth-lift comparison and derived limits (§§CR.2.1–CR.2.3), and derived de Rham–Witt with
  its quasiregular semiperfect control (§§CR.DDR.4.5, CR.DDR.5.18, CR.DDR.5.20–CR.DDR.5.22).
- **AInfCohomology** imports crystalline base change, the relative and continuous de
  Rham–Witt complexes, décalage fixed points and the Nygaard comparisons (Layers CR.1–CR.4) and, for
  the semistable case, Layers CR.5 and CR.6.
- **CohomologyComparisons** and **PadicHodgeTheory** import crystalline and log crystalline
  cohomology with Frobenius, the Frobenius isogeny, duality and Hyodo–Kato theory (Layers CR.1–CR.6)
  for the crystalline and semistable comparison theorems.
- **PadicDifferentialEquationsAndRigidCohomology** imports Layers CR.1–CR.3,
  CR.3:Frobenius-isogeny, CR.3:duality, §CR.4.7, §§CR.5.1–CR.5.4 and Layer CR.6;
  **FiniteFlatGroupsAndIntegralPadicHodgeTheory** imports §CR.4.7 and §§CR.7.1, CR.7.3;
  **VectorBundlesAndIsocrystals** imports §CR.4.7.
- **ComplexComparisonPartII** imports `Crystalline.Connection` (CR.1.3),
  `LogCrystalline.PrelogRing`, CR.5:log-algebra.1–CR.5:log-algebra.4 and CR.5.1.
  **FormalConnectionsOpers** imports the shared ordinary connection carrier (CR.1.3).
  **AbelianSchemesAndArithmeticModuli** imports the base-compatible big fppf crystalline site
  (CR.1.1) and the coefficient calculus (CR.7.1).
- **KTheoryFiniteLocalFields**, **HigherLocalFieldsAndHigherClassFieldTheory**,
  **MotivicEtaleKTheory** and **PadicHodgeRegulators** import de Rham–Witt complexes and logarithmic
  Hodge–Witt sheaves (Layer CR.4), log structures (Layer CR.5:log-algebra) and log crystalline
  cohomology (Layer CR.5).
- **HodgeTateAndCanonicalSubgroups**, **ClassicalAdicEtaleCohomology**,
  **HilbertModularVarietiesAndShimuraCurves**, **AutomorphicGaloisRepresentationsPartII**,
  **HodgeStructuresPartII**, **MordellLawrenceVenkatesh**, **PerfectoidQuotients** and
  **HabiroCohomologyFoundations** import log structures, crystals and connections, Hyodo–Kato
  cohomology and Gauss–Manin connections from the layers named in their own
  documents.

## References

- [Du–Moon–Shimizu, *On log crystalline higher direct image*](https://arxiv.org/abs/2603.00559v1),
  28 February 2026, Lemma 5.9 and Theorems 8.1–9.1, 10.11–10.13;
  only their ordinary trivial-log specializations are used for relative cohomology here.

The Stacks Project chapters are cited by section, lemma and tag; other sources by numbered statement
and printed page (or PDF page where stated).

- [Stacks Project](https://stacks.math.columbia.edu), Divided Power Algebra.
- [Stacks Project](https://stacks.math.columbia.edu), Crystalline Cohomology.
- [Stacks Project](https://stacks.math.columbia.edu), de Rham Cohomology.
- [Stacks Project](https://stacks.math.columbia.edu), Weil Cohomology Theories.
- [Stacks Project](https://stacks.math.columbia.edu), Cohomology on Sites.
- [Stacks Project](https://stacks.math.columbia.edu), Étale Cohomology.
- [Stacks Project](https://stacks.math.columbia.edu), Descent.
- [Bhatt–Lurie–Mathew, *Revisiting the de Rham–Witt complex*](https://arxiv.org/abs/1805.05501v3),
  arXiv v3.
- [Bhatt, *p-adic derived de Rham cohomology*](https://arxiv.org/abs/1204.6560).
- [Langer–Zink, *De Rham–Witt cohomology for a proper and smooth
  morphism*](https://www.math.uni-bielefeld.de/~zink/dRW.pdf).
- [Bhatt–Morrow–Scholze, *Integral p-adic Hodge
  theory*](https://people.mpim-bonn.mpg.de/scholze/integralpadicHodge.pdf).
- [Bhatt–Morrow–Scholze, *Topological Hochschild homology and integral p-adic Hodge
  theory*](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf).
- [Esnault–Groechenig, *Rigid connections and
  F-isocrystals*](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf).
- [Berthelot–Ogus, erratum to *Notes on crystalline
  cohomology*](https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf).
- [Ekedahl, *On the multiplicative properties of the de Rham–Witt complex I*, Ark. Mat. 22
  (1984)](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/7414-11512_2006_Article_BF02384380.pdf).
- [Shiho, *On logarithmic Hodge–Witt cohomology of regular
  schemes*](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms140404.pdf).
- [Clausen–Mathew–Morrow, *K-theory and topological cyclic homology of henselian
  pairs*](https://www.imo.universite-paris-saclay.fr/~matthew.morrow/Clausen%2C%20Mathew%2C%20Morrow%2C%20K-theory%20and%20TC%20of%20Henselian%20pairs.pdf).
- [Disegni–Liu, *A p-adic arithmetic inner product
  formula*](https://disegni-daniel.perso.math.cnrs.fr/AIPF.pdf).
- [Gros, *Classes de Chern et classes de cycles en cohomologie de Hodge–Witt
  logarithmique*](http://www.numdam.org/item/MSMF_1985_2_21__1_0.pdf).
- [Illusie, *Complexe de de Rham–Witt et cohomologie
  cristalline*](http://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf).
- [Bhatt–de Jong, *Crystalline cohomology and de Rham
  cohomology*](https://arxiv.org/abs/1110.5001v1).
- [Le Stum–Quirós, *The filtered Poincaré lemma in higher
  level*](https://arxiv.org/abs/math/0409564v1).
- [Le Stum–Quirós, *Transversal crystals of finite
  level*](https://www.numdam.org/article/AIF_1997__47_1_69_0.pdf).
- [Lurie, *Lecture 26:
  Isocrystals*](https://www.math.ias.edu/~lurie/205notes/Lecture26-Isocrystals.pdf).
- [Kato, *Logarithmic structures of
  Fontaine–Illusie*](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf).
- [Hyodo–Kato, *Semi-stable reduction and crystalline cohomology with logarithmic
  poles*](https://www.numdam.org/item/AST_1994__223__221_0.pdf).
- [Beilinson, *On the crystalline period map*](https://arxiv.org/abs/1111.3316v4).
- [Česnavičius–Koshikawa, *The A_inf-cohomology in the semistable
  case*](https://arxiv.org/abs/1710.06145v3).
- [Koshikawa, *Logarithmic prismatic cohomology I*](https://arxiv.org/abs/2007.14037v3).
- [Binda–Kato–Vezzani, *On the p-adic weight-monodromy conjecture for complete intersections in
  toric varieties*](https://arxiv.org/abs/2207.00369v2).
- [Temkin, *Tame distillation and desingularization by
  p-alterations*](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n1-p03-p.pdf).
- [Nizioł, *Toric singularities: log-blow-ups and global
  resolutions*](https://webusers.imj-prg.fr/~wieslawa.niziol/resol7.pdf).
- [Qian, *Ordinarity of local Galois representation arising from Dwork
  motives*](https://arxiv.org/abs/2103.00106v1).
- [Colmez–Dospinescu–Nizioł, *Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension
  1*](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf).
- [Colmez–Dospinescu–Nizioł, *Cohomology of p-adic Stein
  spaces*](https://arxiv.org/abs/1801.06686v2).
- [Grosse-Klönne, *Frobenius and monodromy operators in rigid analysis, and Drinfel’d’s symmetric
  space*](https://arxiv.org/abs/1408.3346v1).
- [Sato, *Cycle classes for p-adic étale Tate twists and the image of p-adic
  regulators*](https://ems.press/content/serial-article-files/26173).
- Berthelot–Ogus, *Notes on crystalline cohomology*, Princeton Mathematical Notes 21 (1978).
- [de Jong, *Crystalline Dieudonné module theory via formal and rigid
  geometry*](https://www.numdam.org/article/PMIHES_1995__82__5_0.pdf).
- [Thompson, *Toric singularities revisited*](https://arxiv.org/abs/math/0305441v2).
- [SGA 1] A. Grothendieck, M. Raynaud, *Revêtements étales et groupe fondamental (SGA 1)*, Documents
  Mathématiques 3, SMF 2003; [arXiv:math/0206203](https://arxiv.org/abs/math/0206203).
- [Illusie, *Grothendieck and the theory of crystals*](https://www.imo.universite-paris-saclay.fr/~luc.illusie/Illusie-Pisa5.pdf).
- [Scholze–Weinstein, *Berkeley lectures on p-adic geometry*](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), March 2020 author version.
- [Panny–Robert–Sferlazza, *Hensel-lifting black-box algorithms and fast trace computation
  for elliptic-curve endomorphisms*](https://www.math.u-bordeaux.fr/~damienrobert/pro/publications/articles/lifting_traces.pdf), 28 September 2026 author version.
- [Madapusi–Mondal, *Perfect F-gauges and finite flat group schemes*](https://www.keerthimadapusi.com/assets/preprints/fflat.pdf), Remark 4.3.3.
- [BBM] P. Berthelot, L. Breen, W. Messing, *Théorie de Dieudonné cristalline II*, Lecture Notes in
  Math. 930, Springer 1982.
- [Messing] W. Messing, *The crystals associated to Barsotti–Tate groups, with applications to
  abelian schemes*, Lecture Notes in Math. 264, Springer 1972.
- [Demazure] M. Demazure, *Lectures on p-divisible groups*, Lecture Notes in Math. 302, Springer
  1972.
- [Serre] J.-P. Serre, *Local Fields*, Graduate Texts in Math. 67, Springer 1979.
- [Berthelot] P. Berthelot, *Cohomologie cristalline des schémas de caractéristique p > 0*, Lecture
  Notes in Math. 407, Springer 1974.
- [Swan] R. G. Swan, *On seminormality*, J. Algebra 67 (1980), 210–229.


- **BL22**: Bhargav Bhatt and Jacob Lurie, *Absolute prismatic cohomology*. arXiv:2201.06120v1.

[BL22]: https://arxiv.org/pdf/2201.06120v1

- **BMS19**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, *Topological Hochschild homology and
  integral p-adic Hodge theory*. Publ. Math. IHÉS 129 (2019), 199–310.

[BMS19]: https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf

- **Bhatt12**: Bhargav Bhatt, *p-adic derived de Rham cohomology*. arXiv:1204.6560v1, 30 April 2012.

[Bhatt12]: https://arxiv.org/pdf/1204.6560v1

- **GR**: Ofer Gabber and Lorenzo Ramero, *Almost ring theory*. LNM 1800 (2003); arXiv:math/0201175v3.

[GR]: https://arxiv.org/abs/math/0201175

- **KY**: Teruhisa Koshikawa and Zijian Yao, *Logarithmic prismatic cohomology II*. arXiv:2306.00364v1.

[KY]: https://arxiv.org/pdf/2306.00364v1

- **Ols05**: Martin C. Olsson, *The logarithmic cotangent complex*. Math. Ann. 333 (2005), 859–931.

[Ols05]: https://doi.org/10.1007/s00208-005-0707-6

- **StacksCoh**: The Stacks Project Authors, *Cohomology of Sheaves* (Chapter 20), §20.25 *Čech
  cohomology of complexes*.

[StacksCoh]: https://stacks.math.columbia.edu/tag/01FP

- **StacksLC**: The Stacks Project Authors, *Local Cohomology* (Chapter 51), Lemma 51.17.6 (Kunz).

[StacksLC]: https://stacks.math.columbia.edu/tag/0EC0

- **StacksSites**: The Stacks Project Authors, *Cohomology on Sites* (Chapter 21), §21.33 *Cup product*.

[StacksSites]: https://stacks.math.columbia.edu/tag/0FPJ

- **StacksSmoothing**: The Stacks Project Authors, *Smoothing Ring Maps* (Chapter 16),
  Theorem 16.12.1 (Popescu), Tag 07GC.

[StacksSmoothing]: https://stacks.math.columbia.edu/tag/07GC
