# Roadmap: quaternionic modular forms

**Summary.** Specialise the abstract level-form carrier, evaluation equivalence and Hecke action of
AutomorphicFormsOnReductiveGroups §7.4 to the unit group of a quaternion algebra `D` over a number
field `F`, and build on it the classical, analytic and overconvergent theory of quaternionic modular
forms. The inputs are the quaternion norm form and base change of Tau Ceti, the class sets and
definite stabiliser theorem of AdelicAlgebraicGroups §5.3, the restricted-series, Banach-module and
Fredholm libraries of RestrictedPowerSeries, PadicFunctionalAnalysis, CompactOperators and
NewtonPolygons, and the automorphic forms of ArithmeticLocallySymmetricSpaces. The roadmap builds
local integral data and double-coset certificates, analytic weight actions, Banach form spaces with
property (Pr), certified Hecke matrices, compactness of the controlling `U_p`, Fredholm series and
finite-slope summands, an integral annular model over the boundary of weight space, and Bol's
identity with theta maps. Its end theorems are: compactness of the controlling operator on
overconvergent forms of a totally definite algebra (§3.3); the Fredholm series, its finite-slope
summands and slope bounds (§§4.1–4.2); integrality of the annular Fredholm series and its agreement
with the analytic series (§4.4); the factorisation `H_κ(T)=det(1−TU_p|M_cl)·H_κ′(p^{k+1}T)` and
small-slope classicality over `ℚ` (§5.3); the realisation of definite algebraic forms by cuspidal
automorphic representations of `Dˣ` (§2.5); and, for `M₂(F)` over an imaginary quadratic field, the
comparison of weight-`(k,k)` Bianchi cusp forms with Williams's adelic forms and with cuspidal
cohomology of Bianchi threefolds (§2.6).

## Scope and ownership

This roadmap owns:

- the local data of a quaternion algebra at selected split places: local component maps, integral
  units, the levels `U₀(𝔫)`, `U₁(𝔫)`, the finite idelic norm character, the local monoids
  `Σ₀(t)`, `Σ₁(t)` and their double-coset decompositions (Layer 0);
- the structure of `GL_1(D)` as a connected reductive inner form of `GL₂` (§0.1) and the fibres of
  class-set refinement along the levels used here (§0.3);
- analytic and algebraic weight actions on restricted series and polynomial modules, with their
  determinant normalisations (Layer 1);
- the Banach structure on quaternionic form spaces, analytic and overconvergent forms, the
  level/radius comparison, stabiliser averaging and property (Pr) (§§2.1–2.3);
- the specialisation of ArithmeticLocallySymmetricSpaces' automorphic forms to `Dˣ` over every
  number field, the definite automorphic realisation and the Bianchi comparisons (§§2.4–2.6);
- the Hecke operators `U_v`, `T_v`, `S_v` and diamond operators, certified matrices, and compactness
  of the controlling operator (Layer 3);
- the application of the Fredholm and slope theory to these operators, the annular Mahler model
  and its estimates (Layer 4), and Bol's identity, theta maps and classicality over `ℚ` (Layer 5).

It consumes and does not restate:

- the quaternion norm form, its multiplicativity, its invariance under algebra equivalences and
  quaternion base change, from Tau Ceti; the reduced norm `Nrd_A` on `(D ⊗[F] A)ˣ`, its naturality,
  its equality with the determinant under a splitting and its local and global images, from
  AdelicAlgebraicGroups §4.6 (*quaternion-norm-images*);
- the realisation of `GL_1(D)` with points `(D ⊗[F] A)ˣ`, the identification of its finite adelic
  points with the units of `D ⊗[F] 𝔸_{F,f}` in their units topology, finiteness of the class sets
  `Dˣ\(D ⊗[F] 𝔸_{F,f})ˣ/U` for every compact open `U` and every quaternion algebra, representatives,
  factorisations and surjective refinement maps, and finiteness of stabilisers modulo the centre at
  compact levels for totally definite `D`, from AdelicAlgebraicGroups §5.3
  (*quaternion-class-sets*, *definite-quaternion-stabilizers*);
- the abstract level-form carrier `S_Γ(J,M)`, its evaluation/reconstruction equivalence, coefficient
  and level maps, restriction and trace, the slash action, the Hecke operators `T_η` with their
  preservation of level forms, independence of representatives and opposite-ring composition law,
  the inverse-action comparison `inverseActionHeckeEquiv`, Gross's rational covariance model, the
  automorphic realisation `automorphicEquiv` and central-character algebraic forms, from
  AutomorphicFormsOnReductiveGroups §§7.4–7.6;
- automorphic forms, cusp forms, algebraic weights, symmetric spaces, level spaces, local systems,
  Hecke actions on invariants and cuspidal cohomology, from ArithmeticLocallySymmetricSpaces;
- restricted series, Gauss norms, substitution, derivatives and identity theorems, from
  RestrictedPowerSeries; Banach–Tate modules, `C₀` models, property (Pr), Mahler and Amice
  coordinates, analytic stages, characters and the annular ring `H`, from PadicFunctionalAnalysis;
  row compactness, Fredholm determinants, block and diagonal comparisons, Riesz projectors, slopes
  and base change, from CompactOperators; polygon and slope dictionaries, from NewtonPolygons;
- the upper half-space `H^3` and the Bianchi groups `PSL(2,𝒪_F)`, from KleinianGroups.

Quaternionic local and global Jacquet–Langlands, Galois representations, eigenvariety gluing,
weight-space representability, Atkin–Lehner slope symmetries, comparison with Hilbert modular
forms, holomorphic realisations at real split places, `p`-adic families of Bianchi forms, Bianchi
modular symbols and several-variable BGG classicality belong to the consumers listed under
Downstream consumers. Geometric modular forms on stacks, characteristic-`p` theta operators and
Serre weights belong to AlgebraicModularFormsAndSerreWeights; the characteristic-zero coefficient
derivative of Layer 5 is a different operation. Class-set enumerations and operator computations
for individual quaternion orders are not targets of this roadmap.

**Generality.** The local data of Layer 0, the coefficient actions of Layer 1, the Banach form
spaces of §2.1 and the algebraic Hecke operators of §§3.1–3.2 carry no total-reality or
definiteness hypothesis; local analytic constructions need a splitting only at the places where
they are used. The stabiliser finiteness consumed from AdelicAlgebraicGroups §5.3 requires `F`
totally real and `D` ramified at every real place; this condition makes `Dˣ(F⊗ℝ)` compact modulo
its centre (Loeffler, Assumption 3.1.3 and Proposition 3.1.4, p. 15). At a complex place
`D⊗_Fℂ≃M₂(ℂ)` and compactness fails, so nondefinite forms use the archimedean realisation of
§2.4; Layers 3–5 are the definite theory.

## Conventions

1. `F` is a number field and `D` a quaternion algebra over `F`: a central simple `F`-algebra of
   dimension four (Mathlib `Algebra.IsCentral`, `IsSimpleRing`, `Module.finrank F D = 4`). Total
   definiteness means that `F` is totally real and `D ⊗_{F,σ} ℝ ≃ ℍ` for every real embedding
   `σ`. For each selected finite place `v | p` carrying an analytic coefficient construction, a
   splitting `D ⊗[F] F_v ≃ₐ[F_v] M₂(F_v)` is part of the data, compatible with a maximal order for
   integral levels.
2. `D_fˣ = (D ⊗[F] 𝔸_{F,f})ˣ` with the topology of AdelicAlgebraicGroups §5.3 (the units topology
   of the finite free `𝔸_{F,f}`-algebra with its module topology). `Dˣ` is embedded diagonally.
   An arbitrary topology is not an admissible hypothesis for a finiteness statement.
3. Field-valued analysis uses a complete ultrametric extension `K/ℚ_p` containing the local
   embeddings required at the selected places, with `|p|=p⁻¹`. Families use a complete commutative
   Banach–Tate `K`-algebra `R`, possibly nonreduced. Contractivity, invertibility of finite group
   orders and Noetherian hypotheses are stated at the theorem that needs them. Integral variants
   do not invert `p`.
4. Coefficient actions are **right** actions of a submonoid `Δ ≤ D_fˣ`: `(a|δ)|ε = a|(δε)`,
   encoded as a monoid homomorphism `Δᵐᵒᵖ →* Module.End R A`. On functions
   `(φ|δ)(g) = φ(gδ⁻¹)|δ`, so level forms satisfy `φ(γgu)=φ(g)|u` for `γ∈Dˣ`, `u∈U`. This is the
   convention of AutomorphicFormsOnReductiveGroups §7.4, and slash operators compose as
   `S_ε∘S_δ=S_{δε}`.
5. The local weight action, with separately specified determinant twist, is
   `f |κ γ (z) = n(cz+d) ν(det γ) f((az+b)/(cz+d))`, the character value read through its analytic
   expansion in Layers 1–3 and pointwise on `ℤ_p` in §4.4; in several variables take the product
   over embeddings. The extension `ν : F_vˣ → Rˣ` of `ν₀ : 𝒪_vˣ → Rˣ` is normalised by `ν(π_v)=1`.
   Over `ℚ`, Jacobs's single character `κ_J` gives `n(u)=κ_J(u)u⁻²` and `ν=1`.
6. `M(U,A)` is the `Dˣ`-specialisation of AutomorphicFormsOnReductiveGroups §7.4's carrier,
   `G₀=D_fˣ`, `Γ=Dˣ`, `J=U`, coefficient module `A`. For totally definite `D` it is the space of
   quaternionic forms written `L(U,A)` or `S^D` in the sources; no cuspidality is imposed. Bianchi
   forms are not a case of `M(U,A)`; they are the automorphic specialisation of §2.6.
7. `Γ_x = U ∩ x⁻¹Dˣx` is the stabiliser used by evaluation; conjugation by `x` identifies it with
   AdelicAlgebraicGroups §5.3's `Dˣ ∩ xUx⁻¹`. A trivial stabiliser **action** is an explicit
   hypothesis; it is not the definition of a neat level.
8. In matrices `aᵢⱼ` is the output-`i`, input-`j` entry. The controlling operator at several
   selected places is the product `U_π=∏_v U_v`, which contracts every analytic coordinate. Slopes
   refer to nonzero eigenvalues counted with algebraic multiplicity, for an explicitly chosen
   normalisation of the operator.
9. Automorphic forms on `Dˣ` are those of ArithmeticLocallySymmetricSpaces ALS.F.6 for
   `G=GL_1(D)`, with its `K_∞`, `A_∞`, `X^G=G(F_∞)/K_∞A_∞` and `X_U`. An archimedean type is an
   irreducible algebraic representation `W` of `Res_{F/ℚ}G` over a splitting field (ALS.F.7);
   forms of type `W` pair with the coefficient system `W^∨`. `[UηU]` acts on `U`-invariants by
   `Σ_i f(·η_i)` for `UηU=⊔_i η_iU` (ALS.3.1); the operator `T_η` of §3.1 on trivial coefficients
   is `[Uη⁻¹U]`, by AutomorphicFormsOnReductiveGroups §7.4's `inverseActionHeckeEquiv`.
10. Absolute values. On `ℂ`, `|z|` is the Euclidean absolute value and `|z|_ℂ = z z̄` the
    normalised one; `|·|_𝔸` is the adelic norm, so `|z|_𝔸 = |z_∞|_ℂ ∏_v |z_v|_v` over an imaginary
    quadratic field, trivial on `Fˣ` by the product formula.

## Exact supplier contracts

### From Mathlib

- `QuaternionAlgebra`, `Quaternion` (`ℍ[R,a,b]`, `ℍ[R]`), `Algebra.TensorProduct`,
  `Algebra.IsCentral`, `IsSimpleRing`, `Module.finrank`.
- `NumberField`, `NumberField.IsTotallyReal`, `IsDedekindDomain.FiniteAdeleRing`,
  `IsModuleTopology`.
- `DoubleCoset.Quotient`, `IsHeckeTriple` and `HeckeCosetModule` (`Mathlib/NumberTheory/HeckeRing/Defs.lean`).
- `PowerSeries.IsRestricted` (`Mathlib/RingTheory/PowerSeries/Restricted.lean`) and
  `PowerSeries.derivative` (`Mathlib/RingTheory/PowerSeries/Derivative.lean`).
- `SymmetricPower` (`Mathlib/LinearAlgebra/TensorPower/Symmetric.lean`), `Representation`.
- `ContinuousLinearMap`, `IsCompactOperator`, `ZeroAtInftyContinuousMap` (`C₀(ℕ,R)`),
  `Matrix.det`, `Matrix.charpoly`.

### From Tau Ceti

- `QuaternionAlgebra.normForm`, `QuaternionAlgebra.normForm_mul`
  (`TauCeti/Algebra/Quaternion/NormForm.lean`); `QuaternionAlgebra.normForm_eq_of_algEquiv`,
  `QuaternionAlgebra.reducedTrace_eq_of_algEquiv`, `QuaternionAlgebra.map_star_of_algEquiv`,
  `QuaternionAlgebra.trace_mulLeft` (`TauCeti/Algebra/Quaternion/AlgEquiv.lean`), each assuming `2`
  regular; `TauCeti.QuaternionAlgebra.baseChange` (`TauCeti/Algebra/Quaternion/BaseChange.lean`);
  the splitting and central-simple comparisons of `TauCeti/Algebra/Quaternion/{Split,CentralSimple}.lean`.
- The Hecke ring and coset sums of `TauCeti/NumberTheory/HeckeRing/{Basic,Multiplication,Associativity,One,Representation}.lean`.
- The Tate algebra `PowerSeries.IsRestricted.subring c` with its Gauss norm as a complete
  ultrametric normed ring (`TauCeti/RingTheory/PowerSeries/TateAlgebra.lean`,
  `TauCeti.PowerSeries.norm_eq_gaussNorm`).
- `TauCeti.SU2.symPower` (`TauCeti/RepresentationTheory/SU2/SymmetricPower.lean`) and
  `TauCeti.SU2.isIrreducible_symPower` (`TauCeti/RepresentationTheory/SU2/Irreducible.lean`).

### From TauCetiRoadmap.AdelicAlgebraicGroups

- §1.2 restricted-product realisation of adelic points and §1.5 compact open levels; §3.4
  *class-number-finite*; §4.5 the class-set bijection
  `G(F)\G(𝔸_{F,f})/U ≃ ν(G(F))\D(𝔸_{F,f})/ν(U)`, `D=G/G^der`, for connected reductive `G` with
  `G^der` simply connected and `G^der(F_∞)` noncompact on each `F`-simple factor, used here only for
  `G=GL₂`, where `SL₂(F_∞)` is noncompact and `ν(GL₂(F))=Fˣ`; it is not available for `GL_1(D)`
  with `D` totally definite, whose `D¹(F_∞)` is compact (§2.4 Checks); §4.6
  *quaternion-norm-images*; §5.3 *quaternion-class-sets* and
  *definite-quaternion-stabilizers*. Assumed: the class set is finite for every compact open level
  and every quaternion algebra over every number field; for totally definite `D` and compact `U`,
  `Γ_x/(Γ_x∩Fˣ)` is finite, and `Γ_x` is finite when `F=ℚ`.

### From TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

- ALS.F.1 maximal compact subgroups; ALS.F.5 relative cochains; ALS.F.6
  `LocallySymmetric.AutomorphicForm`, its finite-dimensionality (i), constant terms, cusp forms and
  discreteness of the cuspidal spectrum (iv); ALS.F.7 algebraic weights, Wigner's lemma and the
  invariants `(q₀,ℓ₀)`; ALS.0.4 `X^G`; ALS.0.6–0.8 `X_U`, its decomposition and proper
  discontinuity; ALS.1.1 local systems; ALS.1.3 neat refinement; ALS.3.1 Hecke action on
  invariants; ALS.5b.1 level maps; ALS.5b.4 boundary restriction; ALS.5b.5 cuspidal cohomology and
  its decomposition.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

- §2.3 normalised real induction; §2.6 `GL₂` modules and the archimedean unitary dual of
  `GL_m(ℂ)`; §4.3 genericity of cuspidal `GLₙ` representations; §7.2 the `GL₂` adelisation;
  §7.4 the abstract level-form carrier, evaluation equivalence, slash and Hecke action,
  `inverseActionHeckeEquiv`, `LevelAlgebraicModularForm` and Gross's rational covariance model with
  `algebraicModularForm_iff_levelCovariant`; §5.5 `clozelPurity`, Clozel's purity lemma: the
  archimedean parameter exponents of an algebraic cuspidal representation of `GL_n` have a common
  sum; §7.5 finite stabilisers and `automorphicEquiv`; §7.6
  `CentralCharacterAlgebraicModularForm`. Assumed: §7.4's results hold for an arbitrary group,
  subgroup, level and right module, with no finiteness hypothesis.

### From TauCetiRoadmap.RestrictedPowerSeries

- §0.1 native restricted-series algebra; §1.1–1.3 Gauss norms, radii and the coefficient model;
  §2.1 evaluation; §2.2 analytic substitution; §2.3 derivatives; §2.4 identity theorem.

### From TauCetiRoadmap.PadicFunctionalAnalysis

- §§0.3–0.4 Banach modules and Tate gauges; §§1.1–1.4 operator norms; §§2.1–2.2 model spaces and
  property (Pr); §2.6 matrices; §3.2 Mahler's theorem and finite differences; §§4.1–4.6 analytic
  stages, Amice bases and analyticity of characters; §§5.2–5.5 continuous weights, universal
  characters and scalar analytic factors; §5.6 the annular ring `H`, its gauge `‖T‖=α`, its
  specialisations `T↦t` and the identity `(p,T)=(T)`.

### From TauCetiRoadmap.CompactOperators

- §§0.1–0.3 complete continuity, `IsRowCompact` and improvement of radius; §1.2 principal-minor
  bounds; §1.4 cyclicity, invariance and diagonal intertwining; §1.5 determinants on (Pr) modules;
  §1.6 block-triangular factors; §1.7 coefficients and the completed base-change comparison
  `c0_completedBaseChange`; Layers 3–4 Riesz projectors, slopes and finite-slope summands.

### From TauCetiRoadmap.NewtonPolygons and others

- NewtonPolygons Layers 2 and 4: coefficient polygons, slope factors and root counts.
- AdicSpacesPartII R0.5 *completed-tensor-banach-module*: completed scalar extension.
- ReductiveGroups Layer 6: reductivity criteria.
- KleinianGroups Layers 0 and 3: `H^3` with its Möbius action and the Bianchi groups `bianchi`.

## How to read the build

Layer 0 fixes the local and adelic data of a quaternion algebra: integral models, levels, the norm
character, class-set refinement and the local double-coset certificates. Layer 1 builds the weight
actions on restricted series and on polynomial coefficients. Layer 2 forms the Banach spaces of
forms, the analytic and overconvergent stages and property (Pr), and in §§2.4–2.6 specialises the
automorphic theory to `Dˣ`, realises definite algebraic forms automorphically and treats Bianchi
forms. Layer 3 defines the Hecke operators, their certified matrices and proves compactness. Layer 4
applies the Fredholm and slope theory, including the annular model. Layer 5 proves Bol's identity,
the theta–Hecke relation, the determinant factorisation and classicality over `ℚ`.

## Layer 0: quaternion algebras, levels and certificates

### 0.1 Quaternionic and local data

**Division algebras from definiteness.** Prove that a totally definite quaternion algebra is a
division algebra: `D` embeds in `D ⊗_{F,σ} ℝ ≃ ℍ`, which is a division ring, so `D` is a
finite-dimensional domain. Deduce that the reduced norm of a nonzero element is positive at every
real embedding, from AdelicAlgebraicGroups §4.6's local image `ℝ_{>0}` at a ramified real place.
Under a splitting, the determinant of left multiplication on the four-dimensional algebra is the
square of the reduced norm and its trace is twice the reduced trace (Tau Ceti
`QuaternionAlgebra.trace_mulLeft`). *Needs:* AdelicAlgebraicGroups §4.6; Tau Ceti
`QuaternionAlgebra.normForm`, `QuaternionAlgebra.trace_mulLeft`,
`TauCeti.QuaternionAlgebra.baseChange`.

**The algebraic group `GL_1(D)`.** With AdelicAlgebraicGroups §5.3's realisation of `GL_1(D)`,
prove that it is connected reductive, an inner form of `GL₂` split by every splitting field of `D`,
with centre `G_m`, derived group the norm-one group `D¹` and `GL_1(D)/D¹ ≃ G_m` through the reduced
norm; for `D=M₂(F)` it is `GL₂`. This is the group to which §§2.4–2.6 apply the automorphic
suppliers. *Needs:* AdelicAlgebraicGroups §§4.6, 5.3; ReductiveGroups Layer 6; Tau Ceti
`TauCeti/Algebra/Quaternion/{Split,CentralSimple}.lean`.

**Local integral models.** For a chosen order `𝒪_D` and a split place `v` with
`𝒪_D ⊗ 𝒪_v` mapped onto `M₂(𝒪_v)` by the splitting, construct the local component maps
`D_fˣ → (D⊗F_v)ˣ ≃ GL₂(F_v)` and identify the local integral units with `GL₂(𝒪_v)`. The
comparison is basis-independent and continuous for the topology of Convention 2. *Needs:*
AdelicAlgebraicGroups §§1.2, 5.3.

- The division theorem holds for every totally real `F` and every totally definite `D`; no
  maximal-order or class-number hypothesis enters.
- The structure theorem for `GL_1(D)` holds over every number field and for every quaternion
  algebra, split or not.
- The local component map is a continuous group homomorphism, and its restriction to the units of
  a maximal order lands in `GL₂(𝒪_v)` exactly when the splitting is compatible with that order.

**Checks.**
- For `ℍ[ℚ]` the reduced norm is the sum of four squares and every nonzero value is positive; for
  `M₂(ℚ)` the element `diag(1,−1)` has norm `−1`, so the positivity statement needs definiteness.
- In `M₂(F)`, `nrd(diag(a,b))=ab`, whereas the determinant of left multiplication is `(ab)²`; using
  the regular determinant as the norm gives `nrd(diag(2,1))=4` instead of `2`.
- The derived group of `GL_1(ℍ[ℚ])` is `D¹`, of dimension three; the derived group of `GL₂` is
  `SL₂`. A model with centre `D¹` instead of `G_m` would give the wrong dimension `3` for the
  centre.
- At a split place of `ℍ[ℚ]` (any odd `p`), the Hurwitz order maps onto `M₂(ℤ_p)` under a suitable
  splitting; at `p=2`, where `ℍ[ℚ]` ramifies, no splitting exists and no local `GL₂` model is
  claimed.

### 0.2 Adelic levels and norm characters

**Levels.** In `GL₂(𝒪_v)` put `U₀(π_v^t)={γ : c∈π_v^t𝒪_v}` and
`U₁(π_v^t)={γ : c∈π_v^t𝒪_v, d−1∈π_v^t𝒪_v}`; the latter fixes the last row modulo `π_v^t` and
imposes no condition on `a`. At `t=0` both are `GL₂(𝒪_v)`. Assemble `U₀(𝔫)` and `U₁(𝔫)` in `D_fˣ`
from local exponents at split places of a maximal-order level. Prove compactness and openness,
finite index under level inclusion, and the reduction descriptions
`U₀(π_v^t)\GL₂(𝒪_v) ≃ ℙ¹(𝒪_v/π_v^t)` and `U₁(π_v^t)\GL₂(𝒪_v) ≃` primitive rows of
`(𝒪_v/π_v^t)²`, both through `γ ↦ (0,1)γ mod π_v^t`. *Needs:* §0.1; AdelicAlgebraicGroups §1.5.

- `U₁(π_v^t) ⊂ U₀(π_v^t)` is normal, with quotient `(𝒪_v/π_v^t)ˣ` through `d mod π_v^t`.
- `[GL₂(𝒪_v):U₀(π_v^t)] = q_v^{t−1}(q_v+1)` and `[GL₂(𝒪_v):U₁(π_v^t)] = q_v^{2t−2}(q_v²−1)` for
  `t≥1`, `q_v=#𝒪_v/π_v`.
- A level with `p`-component in the monoid of a coefficient action is a **wild** level; analytic
  Tate coefficients need a wild level, classical polynomial coefficients allow the full
  maximal-order level.

**Norm character.** Define the finite idelic absolute norm `|nrd(g)|_f ∈ ℚ_{>0}` for `g∈D_fˣ`.
Prove that it is a continuous homomorphism, trivial on compact subgroups, and that
`|nrd(γ)|_f = ∏_{w|∞}|nrd γ|_w⁻¹` for `γ∈Dˣ`, with normalised archimedean absolute values, by the
product formula. Over `ℚ` with `D`
definite and split at `p`, define `c(g)=|nrd(g)|_f·det(g_p) ∈ K^×`. Prove `c(Dˣ)=1` (the reduced
norm of a global element of a definite algebra is positive) and `c(u)=det(u_p)` for `u` in a
compact subgroup. *Needs:* §0.1; AdelicAlgebraicGroups §4.6; Mathlib
`IsDedekindDomain.FiniteAdeleRing`.

- `c` is a continuous homomorphism `D_fˣ → Kˣ`, used only over `ℚ` in Layer 5.
- The theta–Hecke scalar `|nrd(η)|_f^{−r}` depends only on the double coset of `η`.

**Checks.**
- For `η_p=diag(π_p,1)` supported at `p`, `c(η_p)=π_p/p`, which is `1` exactly when `π_p=p`; for
  `ℓ≠p`, `c(diag(π_ℓ,1))=ℓ⁻¹` independently of the unit in `π_ℓ`.
- `|nrd(η_p)|_f^{−r}=p^r` for `η_p=diag(π_p,1)`, whatever unit multiplies `π_p`.
- Over `ℚ` a global `γ` with `nrd(γ)=2` has `|nrd γ|_f=1/2` and `c(γ)=1/2·2=1`; omitting the
  absolute value gives `2`, contradicting `c(Dˣ)=1`.
- At `t=1`, `p=3`: `U₀(3)` has index `4` in `GL₂(ℤ₃)` and `U₁(3)` has index `8`; confusing the two
  conditions gives the wrong reduction quotient `ℙ¹(𝔽₃)` versus primitive rows of `𝔽₃²`.

### 0.3 Class-set refinement

Write `Cl(U)=Dˣ\D_fˣ/U`, finite with representatives and factorisations by AdelicAlgebraicGroups
§5.3. **Refinement fibres.** For compact open `U′ ⊂ U` and `x∈D_fˣ`, prove that the fibre of the
refinement map `Cl(U′) → Cl(U)` over the class of `x` is in bijection with the orbit set
`Γ_x\U/U′`, where `Γ_x=U∩x⁻¹Dˣx` acts on `U/U′` by left multiplication, through
`Γ_x u U′ ↦ Dˣ x u U′`. Deduce
`#Cl(U′) = Σ_{[x]∈Cl(U)} #(Γ_x\U/U′)`, and, when every `Γ_x` lies in the normal core
`∩_{u∈U}uU′u⁻¹` (so acts trivially on `U/U′`), `#Cl(U′)=[U:U′]·#Cl(U)`. *Needs:* AdelicAlgebraicGroups §5.3; Mathlib `DoubleCoset.Quotient`.

- The bijection is natural in `U′` and compatible with composition of refinements.
- For a normal `U′ ⊲ U`, the fibre is the quotient of `U/U′` by the image of `Γ_x`.
- No definiteness hypothesis is used; finiteness of the fibres is the finiteness of `U/U′`.

**Checks.**
- For `U′=U` every fibre has one element, and the formula gives `#Cl(U)`.
- For Hamilton's algebra over `ℚ` at the Hurwitz level `U` (one class, `Γ_1` the 24 Hurwitz units)
  and `U′=U∩U₁(3)`, `uU′ ↦ (0,1)u⁻¹ mod 3` identifies `U/U′` with the 8 nonzero rows of `𝔽₃²`, and
  `Γ_1` acts through its reduction, which is all of `SL₂(𝔽₃)` (order 24, injective on finite-order
  units at an odd prime). `SL₂(𝔽₃)` is transitive on nonzero rows, so `#Cl(U′)=1`, not `8`.
- For `D=M₂(F)` over an imaginary quadratic field (§0.5 setting), the fibres are still finite
  although `Γ_x` is infinite: finiteness comes from `U/U′`, not from `Γ_x`.

### 0.4 Local monoids and double-coset certificates

At a selected local field `L=F_v`, define `Σ₀(t)` for `t≥1` as the matrices with
`a,b,c,d∈𝒪_L`, `d∈𝒪_Lˣ`, `c∈π^t𝒪_L`, `det γ≠0`, and `Σ₁(t)` as its submonoid with
`d−1∈π^t𝒪_L`. Prove closure, the action on `𝒪_L` by `z ↦ (az+b)/(cz+d)`, and the comparison with
the norm-bound formulation `‖c‖≤ρ<1`. On invertible integral matrices these give `U₀` and `U₁`.
Jacobs's `Σ_α` is our `Σ₀(α)` (Jacobs, §1.5, p. 18). *Needs:* §0.2.

**Certificates.** For a level with local component `U₀(π^t)` or `U₁(π^t)`, `t≥1`, prove the disjoint
decomposition `Uη_vU=⊔_α Ux_α` into right cosets of `U`, with `η_v=diag(π,1)`,
`x_α=((π,0),(π^tα,1))` and `α` running over a section of the residue field; prove independence of
the section, and the decompositions for good-prime `T_v` (`#k_v+1` cosets) and central `S_v` (one
coset). *Needs:* §0.2; Mathlib `IsHeckeTriple`.

- Each `x_α` lies in `Σ₀(t)`, and in `Σ₁(t)` for the `U₁` level.
- The decomposition is stated only for these levels, not for every compact open subgroup contained
  in an Iwahori.
- The cosets are right cosets `Ux_α`, representatives of `U\(Uη_vU)`.

**Checks.**
- There are `#k_v` cosets for `U_v`, `#k_v+1` for `T_v` at an unramified good prime and one for a
  normalising element; at `𝔽₂` these are `2`, `3`, `1`.
- `x_αx_{α′}⁻¹=((1,0),(π^{t−1}(α−α′),1))` lies in `U₀(π^t)` exactly when `α≡α′ mod π`, so
  representatives from distinct residues give distinct right cosets; taking all `α∈𝒪_L/π^t`
  instead of a residue section would repeat each coset `q_v^{t−1}` times.
- The matrix `((1,0),(1,1))` has `c=1∉π𝒪_L` and is not in `Σ₀(1)`; the Möbius map it defines sends
  `−1` to `∞`, so the action on `𝒪_L` needs the condition on `c`.

### Examples

For `D=M₂(F)` over an imaginary quadratic field, the adelic carrier, local split matrices and
levels of §§0.1–0.4 are defined with no total-reality assumption. At maximal integral level the
stabiliser `Γ_1` contains the upper unipotent matrices `((1,n),(0,1))`, `n∈ℤ`, which are distinct
modulo scalars, so `Γ_1` is infinite modulo its central subgroup. This shows that the definiteness
hypothesis of AdelicAlgebraicGroups §5.3's stabiliser theorem cannot be dropped; the Bianchi form
space is the automorphic specialisation of §2.6.

### Dependencies

AdelicAlgebraicGroups §§1.2, 1.5, 4.6, 5.3; ReductiveGroups Layer 6; Tau Ceti quaternion norm form,
base change, splitting and Hecke ring; Mathlib `DoubleCoset.Quotient`, `IsHeckeTriple`,
`IsDedekindDomain.FiniteAdeleRing`.

## Layer 1: weights and coefficient actions

These local constructions apply at the chosen split finite places of a quaternion algebra over any
number field. Finite-image conditions on central units are separate hypotheses, used in §2.3.

### 1.1 Analytic weight data

Let `Σ_v` index the embeddings `F_v ↪ K` and work in the restricted algebra `R⟨z_σ : σ∈Σ_v⟩` of
RestrictedPowerSeries §0.1. Define **analytic weight data** as a continuous automorphy character
`n : 𝒪_vˣ → Rˣ`, a continuous determinant character `ν₀ : 𝒪_vˣ → Rˣ` extended to `F_vˣ` by
`ν(π_v^e u)=ν₀(u)`, a wild level `t` and an expansion radius on which `n` is analytic. The untwisted
constructor sets `ν₀=1`; normalising `ν(π_v)=1` alone does not make `ν₀` trivial. Over `ℚ`, the
constructor from Jacobs's `κ_J : ℤ_pˣ → Rˣ` sets `n(u)=κ_J(u)u⁻²`, `ν=1`, and its action is
`f|κ_J γ(z)=κ_J(cz+d)(cz+d)⁻² f((az+b)/(cz+d))`; prove equality of the two actions and hence of the
form spaces and Hecke operators (Jacobs, §1.5, Definition 1.27 and equation (1.5.13), p. 19).
*Needs:* RestrictedPowerSeries §§0.1, 2.2; PadicFunctionalAnalysis §§4.6, 5.2–5.5.

- The pair `(n,ν₀)` is equivalently one character `χ : 𝒪_vˣ × 𝒪_vˣ → Rˣ`, `χ(x,y)=n(x)ν₀(y)`,
  with inverse `n(x)=χ(x,1)`, `ν₀(y)=χ(1,y)`; both constructions preserve continuity and are
  mutually inverse (Buzzard, *Eigenvarieties*, §8, uses the product-group character).
- A scalar unit `uI` acts through `n(u)ν₀(u)²`.
- Coefficient actions are built either from bounded restricted automorphy factors with their
  substitution cocycle, or from characters with analytic expansions, proving the cocycle; the
  first allows nonreduced or integral coefficient rings without testing at field-valued points.
- For `0≤η<1` with `‖coeff_m j_κ(γ)‖≤η^{|m|}`, the factor is restricted at every radius `r` with
  `rη<1`, not at the endpoint `r=η⁻¹`.
- A continuous field-valued character is analytic on a sufficiently small principal-unit subgroup,
  with depth depending on the character (PadicFunctionalAnalysis §§4.6, 5.4–5.5). For general
  `F_v` the change between a `ℤ_p`-basis and the `Σ_v` coordinates is invertible but need not be
  an isometry; shrink the polydisc accordingly. Expansions are unique by the coefficient-recovery
  theorem of RestrictedPowerSeries §2.4 under its hypotheses on `R`.

**Checks.**
- Jacobs's `κ_J(u)=u²` gives `n=1`, with the constant line as weight-two classical coefficients;
  `κ_J(u)=u^kε(u)` has polynomial degree `k−2`, and our degree `m` corresponds to
  `κ_J(u)=u^{m+2}ε(u)`.
- On `diag(u,1)` the constant function transforms by `ν₀(u)` although `cz+d=1`; a model ignoring
  `ν₀` gives `1`.
- The scalar `2I` (at `p` odd, `2∈ℤ_pˣ`) with `n(u)=u^k`, `ν₀=1` acts by `2^k`; with `ν₀(u)=u` it
  acts by `2^{k+2}`.
- A weight with values in `K[ε]/(ε²)`, `n(u)=1+ε log u`, is a nonreduced character. At `p=2` the
  exponential converges only on `4ℤ₂`, so `u ↦ exp(w log u)` is formed on `1+4ℤ₂` with the sign
  `±1` treated as torsion; using `1+2ℤ₂` would require `exp` on `2ℤ₂`, where it diverges.
- A geometric series whose coefficients attain `η^m` fails restrictedness at radius `η⁻¹`.

### 1.2 Slash action and generating functions

Construct the action by bounded multiplication and analytic substitution:
`w_{γ,σ}=(σ(a)z_σ+σ(b))/(σ(c)z_σ+σ(d))` and `f|γ=j_κ(γ)·f(w_γ)`. Prove preservation of the
restricted algebra, boundedness, the identity and right-action laws, and independence of equivalent
expansion data. On an integral norm model the bounds `‖j_κ(γ)‖≤1` and `‖w_γ‖≤1` give
`‖slash γ‖≤1`. *Needs:* §1.1; RestrictedPowerSeries §§1.1–1.3, 2.2; PadicFunctionalAnalysis §1.1.

- The column indexed by `r` is `j_κ(γ)∏_σ w_{γ,σ}^{r_σ}`, and
  `∑_r (z^r|γ) X^r = j_κ(γ)∏_σ(1−X_σ w_{γ,σ})⁻¹` as formal series in the input variables with
  restricted coefficients (a deduction from the geometric series).
- For `‖c‖≤ρ<1`, `‖det γ‖≤σ<1`, `ρ≤σ` and `‖coeff_m j_κ(γ)‖≤η^{|m|}` with `η≤σ`, the matrix entries
  satisfy `‖a_{m,r}(slash γ)‖≤σ^{|m|}`; with several variables, one contraction factor per
  variable.
- Without a geometric bound on `j_κ`, the slash is the composite of bounded multiplication and a
  strictly contracting substitution, which gives compactness (CompactOperators §0.3) but no explicit
  row estimate.
- Compactness of the domain of a character does not by itself bound `‖slash γ‖` for an arbitrary
  Banach-algebra norm.

**Checks.**
- For trivial weight and `γ=diag(p,1)`, `z^r|γ=p^r z^r`: the matrix is diagonal with entries `p^r`
  and the bound `σ^{|m|}` holds with `σ=|p|`.
- For `γ=((1,0),(p,1))`, `w=z/(pz+1)=z−pz²+p²z³−⋯`; the column of `z` has entry `(−p)^{m−1}` in
  row `m`. Here `det γ=1`, so the stated row bound does not apply, although this column decays.
- With trivial weight, `(f|γ)|δ(z)=f(w_γ(w_δ(z)))=f|(γδ)(z)` since `w_{γδ}=w_γ∘w_δ`. For
  `γ=diag(p,1)`, `δ=((1,0),(p,1))` and `z=1` this is `f(p/(p+1))`, whereas the reversed order gives
  `f(p/(p²+1))`; a left-action formula fails the stated law.

### 1.3 Algebraic weights and normalisation

For `n_σ∈ℕ`, `v_σ∈ℤ`, define `L_{n,v}=⊗_σ Sym^{n_σ}(K²)⊗det^{v_σ}` in the polynomial convention whose
action is `∏_σ(c_σz_σ+d_σ)^{n_σ}(det γ_σ)^{v_σ}` times substitution. Identify it with the
coordinatewise degree-bounded polynomials, prove dimension `∏_σ(n_σ+1)`, stability and injection
into analytic coefficients, allowing a finite-order character constant on the discs of the level.
The dictionary to the sources' weights is `k_σ=n_σ+2`, `w_σ=v_σ+n_σ+1` (Buzzard, *Eigenvarieties*,
§8, p. 70). Comparing with Mathlib's `SymmetricPower` with its left action uses the
opposite-action/dual adapter of §2.5. *Needs:* §1.2;
Mathlib `SymmetricPower`.

- Over a totally real field, global algebraicity requires `n_σ+2v_σ` parallel, equivalently finite
  image of the central unit action; over a general number field the finite-image hypothesis is
  kept explicitly.
- The algebraic determinant character is `ν_alg(x)=∏_σ σ(x)^{v_σ}`; with `ord_v(π_v)=1` the
  normalised extension is `ν_norm(x)=ν_alg(π_v^{−ord_v(x)}x)`, and
  `ν_alg(x)=ν_alg(π_v)^{ord_v(x)}ν_norm(x)`.
- The two actions coincide on level units; on a double coset of determinant valuation `e` the
  algebraic-twist operator is `ν_alg(π_v)^e` times the normalised one. This scalar is carried
  through the classical inclusion, eigenvalues, Fredholm rescaling and slope shifts, and changes
  by `ν_alg(u)^e` when `π_v` is replaced by `uπ_v`.

**Checks.**
- At degree zero the classical coefficient space is a line while the analytic one is infinite
  dimensional.
- On `diag(π,1)` with `n=0`, `v=1`: `ν_alg(π)=π` and `ν_norm(π)=1`, so the operators differ by `π`;
  a scalar unit `u` gets `ν_alg(u)=ν_norm(u)=u`.
- An odd scalar action of `−1∈Γ_x` (for example `n=1`, `v=0`, where `−I` acts by `−1`) kills
  `A^{Γ_x}` in characteristic zero.
- Over `ℚ(√2)` with `(n_1,n_2)=(0,2)`, `v=(0,0)`, `n_σ+2v_σ` is not parallel and the unit
  `1+√2` acts by `σ_2(1+√2)^{2}≠1`, an element of infinite order.

### 1.4 Several places and disc stages

Tensor the local constructions over all selected places and embeddings, with finite algebraic
factors at places not varied analytically, using the completed tensor and `c₀` identifications of
AdicSpacesPartII R0.5. Write `B_r` for the union of the closed radius-`r` polydiscs about the
embedded points of `𝒪_v` and `A_{κ,r}` for its analytic functions with the weight action. At radii
`|π_v|^s` the discs are indexed by `𝒪_v/π_v^s`; at `F_v=ℚ_p` their coordinates are `z=a+p^sw`. Use
the finite product of Tate algebras with the explicit permutation of discs and rescaled local
substitutions. Prove compatibility of the weight actions with change of radius, refinement of
discs and restriction. *Needs:* §§1.1–1.3; AdicSpacesPartII R0.5; PadicFunctionalAnalysis
§§4.1–4.3.

- Restriction `A_{κ,r} → A_{κ,r′}` for `r′≤r` is injective, bounded and compatible with the action.
- Reindexing the tensor factors intertwines the arithmetic actions.
- On one disc of radius `|p|^s`, `z=a+p^sw` identifies `A_{κ,|p|^s}` restricted to that disc with
  a Tate algebra in `w`.

**Checks.**
- At `s=1`, `p=3` there are three discs `z∈{0,1,2}+3ℤ₃`; a single-disc model has one.
- The function `z ↦ 1` on `0+3ℤ₃` and `0` elsewhere is in `A_{κ,1/3}` but not in `A_{κ,1}`; this
  separates locally analytic from analytic coefficients.
- Changing radius twice equals changing it once; the rescaling `z=a+p^sw` followed by `w=b+pw′`
  equals `z=(a+p^sb)+p^{s+1}w′`.

### Examples

For `p=3`, trivial determinant twist and `n_w(u)=exp(w log u)` on `1+3ℤ₃`, extended trivially on
`{±1}`, over `K⟨w⟩`: the Jacobs label is `κ_{J,w}(u)=u²n_w(u)`, so `w=k∈ℕ` gives classical weight
`k+2`, with `n_k(u)=u^kω(u)^{−k}` for the torsion character `ω`.

### Dependencies

Layer 0; RestrictedPowerSeries §§0.1, 1.1–1.3, 2.2–2.4; PadicFunctionalAnalysis §§1.1, 4.1–4.6,
5.2–5.5; CompactOperators §0.3; AdicSpacesPartII R0.5; Mathlib `SymmetricPower`.

## Layer 2: spaces of quaternionic forms

### 2.1 Forms on `D_fˣ` and their Banach structure

Specialise AutomorphicFormsOnReductiveGroups §7.4's carrier to `G₀=D_fˣ`, `Γ=Dˣ` and a level `U`
contained in the monoid `Δ` of a right coefficient action, giving `M(U,A)` over any number field,
with its evaluation equivalence `M(U,A) ≃ ∏_i A^{Γ_{c_i}}` at representatives `c_i` of `Cl(U)`.
For a finite class set and a Banach `R`-module `A` with bounded `U`-action, transfer the supremum
norm of the invariant product to `M(U,A)`. Prove completeness, boundedness of the change of
representatives (an isometry when `U` acts isometrically), and boundedness of coefficient maps and
level restriction/trace maps with their norm constants. *Needs:* AutomorphicFormsOnReductiveGroups
§7.4; AdelicAlgebraicGroups §5.3; PadicFunctionalAnalysis §§0.3, 1.1.

- The norm is independent of the representatives up to the constant `sup_u ‖·|u‖`.
- Restriction `M(U,A)→M(U′,A)` has norm at most `sup_{u∈U}‖·|u‖` (one for an isometric action),
  since a representative `c_iu` of `Cl(U′)` has value `φ(c_i)|u`; the trace `Σ_{u∈U/U′}φ|u` has
  the same bound by the ultrametric inequality.
- Neither the algebraic definition nor the norm needs finite stabilisers, total reality or
  definiteness; finiteness of the class set is used only to make the product finite.

**Checks.**
- For the zero module `M(U,0)=0`; for a one-element class set with trivial stabiliser action,
  `M(U,A)≅A` isometrically.
- For two classes with trivial stabilisers, `‖(a,b)‖=max(‖a‖,‖b‖)`; a sum norm `‖a‖+‖b‖` is
  equivalent but not ultrametric.
- For a non-isometric action with `‖·|u‖=|p|^{−1}` on one class, changing that representative
  by `u` multiplies the coordinate norm by up to `p`, so the change is bounded but not isometric.

### 2.2 Classical, analytic and overconvergent spaces

Assume `F` totally real and `D` totally definite. Define classical forms `M(U,L_{n,v})`, analytic
forms `M(U,A_{κ,r})` at each admissible radius, and overconvergent forms as the filtered colimit
under restriction `M(U,A_{κ,r}) → M(U,A_{κ,r′})`, `0<r′≤r` tending to zero coordinatewise. Prove the
restriction maps injective, using the coefficient-recovery hypotheses, before describing the
colimit as a union; a norm or a Fredholm determinant always refers to one Banach stage (Buzzard,
*Eigenvarieties*, §10). Prove the polynomial inclusion and its Hecke compatibility with §1.3's
scalar. *Needs:* §§1.3–1.4, 2.1.

**Level/radius comparison.** For `U` with full `GL₂(𝒪_v)` component at each selected place, `t≥1`,
`s≥0`, and a weight with analytic thickening on the neighbourhood of radius `r|π|^{s+t}`, prove the
Hecke-compatible isomorphism
`M(U∩U₀(π^t),A_{κ,r|π|^s}) ≃ M(U∩U₀(π^{t+s}),A_{κ,r})`, with the analogous tuple of bounds at
several places, including nebentypus and disc indices (Buzzard, *Eigenvarieties*, Proposition 11.1,
p. 75, and Lemma 12.1, p. 78). *Needs:* §§0.3, 0.4, 1.4.

- The comparison is natural in the weight and commutes with change of radius.
- On polynomial coefficients it identifies locally polynomial forms on `p^s` discs with classical
  forms of level `U∩U₀(π^{t+s})`.

**Checks.**
- At `s=0` the comparison is the identity.
- With one class, trivial stabilisers and degree-`k` coefficients, the dimension of locally
  polynomial forms on `p^s` discs is `p^s(k+1)`, matching `[U₀(p^t):U₀(p^{t+s})]=p^s` classes
  times `k+1` on the right, by §0.3.
- Without the thickening hypothesis the weight is not defined on the larger neighbourhood, and
  the left side is not formed; a radius condition `r|π|^s` alone does not suffice.

### 2.3 Stabiliser actions and property (Pr)

Assume `Cl(U)` finite. If every stabiliser acts trivially, evaluation gives
`C₀(Cl(U) × ℕ^Σ,R)`, with a finite algebraic index when needed, and classical forms have dimension
`#Cl(U)·∏_σ(n_σ+1)`. For totally definite `D`, prove that an admissible weight's stabiliser action
factors through a finite group once its central action has finite image, from AdelicAlgebraicGroups
§5.3; for families require a common finite quotient. If each image group `H_i` has order invertible
in `R`, define `E_i=|H_i|⁻¹∑_{h∈H_i} slash(h)`, prove it is a bounded idempotent with image
`A^{Γ_i}`, and deduce property (Pr) for `M(U,A)` from PadicFunctionalAnalysis §2.2. *Needs:* §§1.3,
2.1; AdelicAlgebraicGroups §5.3; PadicFunctionalAnalysis §2.2.

- For an isometric action `‖E_i‖≤‖|H_i|⁻¹‖`, which can exceed one.
- `E=∏_iE_i` is a bounded projection of the block model onto `M(U,A)`.

**Checks.**
- With one class and trivial stabiliser action, degree-zero coefficients give a one-dimensional
  space.
- An infinite central stabiliser acting trivially (a real quadratic field at maximal level, §1.3
  with parallel weight) still gives finite image.
- `H=C₂` acting by sign on `ℤ_2`-coefficients: `|H|=2` is not a unit and averaging is undefined;
  integral invariants are `0` while invariants modulo `2` are everything.
- At `p=3`, `H=C₂` has `‖1/2‖=1`, so `‖E‖≤1`; at `p=2`, `‖1/2‖=2`.

### 2.4 Automorphic forms on `Dˣ` over any number field

Let `G=GL_1(D)` (§0.1) over an arbitrary number field `F`. The space of automorphic forms on `Dˣ`
is ArithmeticLocallySymmetricSpaces ALS.F.6's `LocallySymmetric.AutomorphicForm` for this `G`,
written `𝒜(Dˣ)`, a `(𝔤,K_∞)×D_fˣ`-module. When `D` is a division algebra, `G` has no proper rational
parabolic, so every automorphic form is cuspidal; when `D=M₂(F)`, cuspidality is vanishing of the
constant term along the upper Borel.

**Type, level and central character.** Fix a number field `E` with `D⊗_{F,τ}E≃M₂(E)` for every
`τ:F↪E`, and `ι:E↪ℂ`. For an archimedean type `W=V_λ=⊗_τSym^{a_τ−b_τ}(E²)⊗det^{b_τ}`,
`λ_τ=(a_τ≥b_τ)`, let `J_W⊂Z(𝔤)` be the annihilator of `ι(W)`, `U` compact open and
`ω:Fˣ\𝔸_Fˣ→ℂˣ` continuous with archimedean component the central character of `ι(W)`. Define

```text
𝒜_W(U,ω) = {f ∈ 𝒜(Dˣ) : f(zgu)=ω(z)f(g) for z∈𝔸_Fˣ, u∈U, and J_W^m f=0 for some m},
S_W(U,ω) = its cuspidal subspace,
```

and the `τ`-valued forms `Hom_{K_∞}(τ,𝒜_W(U,ω))` for irreducible `τ` of `K_∞`. Prove that for each
`m` the `τ`-valued forms killed by `J_W^m` are finite dimensional (ALS.F.6(i)), that `S_W(U,ω)` is
an admissible `(𝔤,K_∞)`-module, and that `S_W(U,ω)=⊕_π m(π)·(π^∞)^U⊗π_∞` over the finitely many
cuspidal `π` with central character `ω` and the infinitesimal character of `ι(W)` (ALS.F.6(iv),
ALS.F.7). The Hecke algebra acts by ALS.3.1 and preserves type, central character, `K_∞`-types and
cuspidality. *Needs:* §0.1; ALS.F.1, F.6, F.7, 3.1.

**Restriction to components.** For representatives `g_1,…,g_h` of `Cl(U)` (AdelicAlgebraicGroups
§5.3, for every quaternion algebra including `M₂(F)`) and `Γ_i=Dˣ∩g_iUg_i⁻¹`, prove that
`f ↦ (g_∞ ↦ f(g_ig_∞))_i` identifies `𝒜_W(U,ω)` with a direct sum of function spaces on
`Γ_i\G(F_∞)` with the transported central-character, growth, `K_∞`-finiteness and `Z(𝔤)`
conditions, compatibly with reconstruction and the Hecke action. For `D=M₂(F)`, `Cl(U)` is
`Fˣ\𝔸_{F,f}ˣ/det(U)` by AdelicAlgebraicGroups §4.5. *Needs:* AdelicAlgebraicGroups §§4.5, 5.3;
ALS.0.7.

- Replacing `W` by `W^∨` inverts the archimedean central character.
- The restriction map is injective because `Dˣ g_i U` cover `D_fˣ`.

**Checks.**
- For totally definite `D` over `ℚ` and `W=ℂ`, `𝒜_ℂ(U,1)` is the space of functions on
  `Dˣ\D_fˣ/U𝔸_{ℚ,f}ˣ=Cl(UẐˣ)` (as `𝔸_{ℚ,f}ˣ=ℚ_{>0}Ẑˣ`): the central condition is imposed by all
  of `𝔸_ℚˣ`, and the Casimir acts on the `Sym^n` isotypic part of a `K_∞=ℍ¹`-finite function by a
  scalar different from its value on `Sym^0` when `n>0`, so `J_ℂ^mf=0` forces `ℍ¹`-invariance.
  The trivial-coefficient `M(U,ℂ)` is the sum of the `𝒜_ℂ(U,ω)` over the finitely many `ω`
  trivial on `ℝˣ` and on `𝔸_{ℚ,f}ˣ∩U` (§2.5). The two agree when `U⊇Ẑˣ`, for instance at
  `U₀(𝔫)` or at maximal level, and not in general: for Hamilton's algebra with `U=U₁(13)` at `13`
  and maximal elsewhere, `U₁(13)ℤ₁₃ˣ=U₀(13)`, so `dim 𝒜_ℂ(U,1)=#Cl(U₀(13))`, while
  `#Cl(U₁(13))≥2·#Cl(U₀(13))` by §0.3: each `Γ_x` is a finite subgroup of `Dˣ` whose reduction
  modulo `13` is injective and lies in a Borel of `SL₂(𝔽₁₃)`; having no element of order `13`, it
  is cyclic, of order at most `6` because `D` contains no cyclotomic field of degree above `2`;
  it acts on `U₀(13)/U₁(13)≅(ℤ/13)ˣ` through `d mod 13`, so every fibre of
  `Cl(U₁(13))→Cl(U₀(13))` has at least `12/6=2` elements.
- The class-set bijection of AdelicAlgebraicGroups §4.5 needs its noncompactness hypothesis: for
  `D` over `ℚ` ramified at `{11,∞}` and `U` the units of a maximal order, `nrd(U)=Ẑˣ` and
  `ℚ_{>0}\𝔸_{ℚ,f}ˣ/Ẑˣ` has one element, whereas `#Cl(U)=2` (Eichler's mass formula:
  `(11−1)/24=5/12=1/4+1/6`, the two classes having unit groups of orders `4` and `6`).
- For `D=M₂(ℚ)` the adelic lift of a weight-`k` cusp form (AutomorphicFormsOnReductiveGroups §7.2)
  lies in `S_W(U,ω)` for `W|_{SL₂}=Sym^{k−2}`, in the `K_∞`-type containing `SO(2)`-weight `k`;
  the constant `1` lies in `𝒜_ℂ(GL₂(Ẑ),1)` and is not cuspidal.
- For an indefinite division algebra over `ℚ`, `S_W=𝒜_W` and `X_U` is compact.
- The central character of `Sym²` is `z ↦ z²` and of its dual `z ↦ z^{−2}`, so `W` and `W^∨`
  give different `ω_∞` unless `W` is self-dual.

### 2.5 The definite comparison

Let `F` be totally real, `D` totally definite and split at the places `v|p` where §1.3's
coefficients are formed, and `λ_σ=(n_σ+v_σ,v_σ)`. Homogenising `f(z)` to `P(X,Y)=Y^{n_σ}f(X/Y)`,
the right action of §1.3 reads `(P|γ)(X,Y)=(det γ)^{v_σ}P(aX+bY,cX+dY)`, so `u↦(·)|u⁻¹` is the
contragredient of `Sym^{n_σ}(std)⊗det^{v_σ}`; hence `L_{n,v}` is `V_λ^∨` restricted to `U` through
the splittings at `p`. Fix a number field `E` with `D⊗_{F,τ}E≃M₂(E)` for every `τ`, an embedding
`j:E↪K` such that the splittings over `E` base-changed along `j` agree with the local splittings at
`p` composed with the embeddings `F_v↪K`, and `ι:E↪ℂ`. No map `K→ℂ` is assumed: `K` may have
cardinality larger than that of `ℂ`.

**The `E`-rational model.** Define `M_E(U,λ)` as Gross's rational covariance model of
AutomorphicFormsOnReductiveGroups §7.4 over `E`: functions `Φ:D_fˣ→V_λ^∨(E)` with
`Φ(γgu)=ρ(γ)Φ(g)` for `γ∈Dˣ`, `u∈U`, where `ρ:Dˣ→GL(V_λ^∨(E))` is the algebraic representation
through the splittings over `E`, with Hecke operators `T_η^E Φ=Σ_tΦ(·x_t)` for `UηU=⊔_t x_tU`
(right-invariance makes these well defined and `E`-rational for every `η∈D_fˣ`); on the automorphic
side `T_η^E` is `[UηU]` of ALS.3.1. Prove that `M_E(U,λ)` is finite
dimensional. *Needs:* §§0.1, 1.3; AutomorphicFormsOnReductiveGroups §§7.4–7.5; AdelicAlgebraicGroups
§5.3.

**Theorem (`p`-adic comparison).** Prove the isomorphism
`M_E(U,λ)⊗_{E,j}K ≅ M(U,L_{n,v})`, `Φ⊗1 ↦ (g ↦ ρ(g_p)⁻¹Φ(g))`. If `UηU=⊔_tUy_t`, then
`Uη⁻¹U=⊔_ty_t⁻¹U` and `Σ_tρ(g_p)⁻¹Φ(gy_t⁻¹)=Σ_t(f|y_t)(g)`, so the isomorphism carries
`T_{η⁻¹}^E⊗1` to §3.1's `T_η` with the algebraic determinant twist, which is `ν_alg(π_v)^e` times
the normalised `T_η` on a double coset of determinant valuation `e` at `v` (§1.3). The base-change step uses the evaluation equivalence on
both sides and that `V^Γ⊗_EK=(V⊗_EK)^Γ` for a finite-dimensional `V` and any group `Γ` (the
invariants are cut out by finitely many `γ`). *Needs:* AutomorphicFormsOnReductiveGroups §7.4
(`algebraicModularForm_iff_levelCovariant`); §1.3.

**Theorem (definite automorphic realisation).** Prove a Hecke-equivariant isomorphism

```text
M_E(U,λ) ⊗_{E,ι} ℂ ≅ ⊕_ω Hom_{K_∞}(ι(V_λ), S_{V_λ}(U,ω))
                   ≅ ⊕_π m(π)·(π^∞)^U ⊗ Hom_{D_∞ˣ}(ι(V_λ), π_∞),
```

over the finitely many `ω` with archimedean component the central character of `ι(V_λ)` and
trivial on `𝔸_{F,f}ˣ∩U`, and the cuspidal `π` with `π_∞≅ι(V_λ)` as representations of
`D_∞ˣ=∏_σℍˣ`; `T_η^E` corresponds to `[UηU]` on `(π^∞)^U`, so §3.1's `T_η` corresponds to
`[Uη⁻¹U]` (Convention 9). `K_∞=∏_σℍ¹` acts on `ι(V_λ)` through
`⊗_σSym^{n_σ}(ℂ²)` (Tau Ceti `TauCeti.SU2.symPower`). Over `ℚ` the second isomorphism is
AutomorphicFormsOnReductiveGroups §7.5's `automorphicEquiv`, whose two hypotheses hold. For
`[F:ℚ]>1` the rational centre is not discrete in `𝔸_{F,f}ˣ`; decompose into the central-character
summands of §7.6 (`CentralCharacterAlgebraicModularForm`), using §1.3's parallel-weight hypothesis
for the finite central image, and prove the realisation of each summand from ALS.F.6(iv) for the
compact-modulo-centre quotient (Loeffler, Proposition 3.8.1, p. 22, which also fixes an embedding
of its coefficient field into `ℂ`). *Needs:* §2.4; AutomorphicFormsOnReductiveGroups §§7.5–7.6;
ALS.F.6; Tau Ceti `TauCeti.SU2.symPower`.

- Combining the two theorems gives `M(U,L_{n,v})` and the automorphic side as the two scalar
  extensions of the single `E`-rational space `M_E(U,λ)`, with matching Hecke actions up to §1.3's
  scalar on the `p`-adic side.
- At `n=0` the norm characters `χ∘nrd` with `χ` trivial on `nrd(U)` occur, since every form on `Dˣ`
  is cuspidal.

**Checks.**
- In rank one (`n=0`, `v=0`), `M_E(U,λ)` is the `E`-valued functions on `Cl(U)` and its two
  extensions are `M(U,K)` and `M(U,ℂ)`, both of dimension `#Cl(U)`; no map between `K` and `ℂ`
  is used.
- `(P|γ)` sends `X^n` to `(aX+bY)^n`, whereas `Sym^n(std)` sends `e_1^n` to `(ae_1+ce_2)^n`; the two
  differ by the transpose, which is the inverse up to `det` and the Weyl element, so `π_∞` is
  `ι(V_λ)` and not its dual.
- Over a real quadratic field at maximal level `Fˣ∩U=𝒪_Fˣ` is infinite, so §7.5's discreteness
  hypothesis fails and the central-character summands are needed, while `n=0` is parallel.
- With trivial stabiliser action over `ℚ`, `dim M(U,L_n)=h(n+1)` equals `Σ_π m(π)·dim(π^∞)^U` over
  the `π` with `π_∞≅ι(V_λ)`, since `dim Hom_{D_∞ˣ}(ι(V_λ),π_∞)=1` by Schur's lemma; the factor
  `n+1` is the dimension of `π_∞`, not a multiplicity.
- For `v=1`, `n=0`, `π_p=p` and `η=diag(p,1)`, Gross's `T_{η⁻¹}^E` corresponds to `p` times the
  normalised `T_η`; omitting §1.3's scalar gives eigenvalues off by `p`.

### 2.6 Bianchi forms

Let `F` be imaginary quadratic with complex embeddings `τ, τ̄`, `D=M₂(F)`, `G=GL₂`,
`G(F_∞)=GL₂(ℂ)`, `K_∞=U(2)`, `A_∞=ℝ_{>0}`. Identify `X^G=GL₂(ℂ)/ℂˣU(2)` (ALS.0.4) with
KleinianGroups' upper half-space `H^3` by the orbit map of the base point, equivariantly for
`GL₂(ℂ)` acting through `PGL₂(ℂ)=PSL₂(ℂ)`. For compact open `U⊂GL₂(𝔸_{F,f})` the level space `X_U`
(ALS.0.6) is the Bianchi threefold, with components `Γ_x\H^3`, `Γ_x=GL₂(F)∩xUx⁻¹` (ALS.0.7),
indexed by `Fˣ\𝔸_{F,f}ˣ/det(U)` (§2.4). At `U=GL₂(Ô_F)` and the trivial class the image of
`GL₂(𝒪_F)` in `PSL₂(ℂ)` contains KleinianGroups' `bianchi` group `PSL₂(𝒪_F)` with finite index.
*Needs:* §2.4; ALS.0.4, 0.6–0.8; KleinianGroups Layers 0 and 3.

**Weight `(k,k)`.** For `k≥0` let `V_{k,k}=Sym^k(ℂ²)⊗conj(Sym^k(ℂ²))`, with `conj` the
complex-conjugate representation (`GL₂(ℂ)` acting through `g↦ḡ`), the `V_λ` of `Res_{F/ℚ}GL₂`
with `λ_τ=λ_τ̄=(k,0)`, with central character `z↦(zz̄)^k`. Take `W=V_{k,k}^∨`, so
`ω_∞(z)=(zz̄)^{−k}=|z|_ℂ^{−k}`, and the `K_∞`-type `τ_k=Sym^{2k+2}(ℂ²)⊗det^{−(k+1)}`, trivial on
the centre `U(1)` and `Sym^{2k+2}` on `SU₂(ℂ)`. Define

```text
S_{k,k}(U,ω) = Hom_{K_∞}(τ_k, S_{V_{k,k}^∨}(U,ω)).
```

Prove that it is finite dimensional with the action of §2.4 and that
`S_{k,k}(U,ω)≅⊕_π m(π)·(π^∞)^U` over the cuspidal `π` with central character `ω` whose `π_∞` is the
irreducible principal series of `GL₂(ℂ)` with the infinitesimal character of `V_{k,k}^∨` and
minimal `K_∞`-type `τ_k`. **Archimedean target.** For the principal series of `GL₂(ℂ)` induced
from a character of the diagonal torus whose restriction to `U(1)×U(1)` has weights `(n₁,n₂)`,
that is `(e^{iθ₁},e^{iθ₂}) ↦ e^{i(n₁θ₁+n₂θ₂)}`, prove by Frobenius reciprocity that the `U(2)`-types are
`Sym^m(ℂ²)⊗det^{(n₁+n₂−m)/2}` for `m≥|n₁−n₂|`, `m≡n₁−n₂ mod 2`, each with multiplicity one; for
`n₁+n₂=0`, `|n₁−n₂|=2k+2` the minimal type is `τ_k`. Compute the Casimir eigenvalue and match it
with Williams's normalisation `k²/2+k`. The other irreducible `(𝔤,K_∞)`-module with this
infinitesimal character is the finite-dimensional `V_{k,k}^∨`; it is not the archimedean component of
a cuspidal `π`, since cuspidal representations of `GL₂(𝔸_F)` are generic
(AutomorphicFormsOnReductiveGroups §4.3) and a finite-dimensional algebraic representation has no
nondegenerate Whittaker functional (the unipotent radical acts by polynomials in `x`, which cannot
equal a nontrivial unitary character `ψ(x)`). **Purity.** Prove that `S_{V_λ^∨}(U,ω)=0` for
`λ_τ=(a,b)`, `λ_τ̄=(a′,b′)` unless `a−b=a′−b′`. A cuspidal `π` contributing to it has
`π_∞=Ind(χ₁,χ₂)` with `χ_i(z)=z^{p_i}z̄^{q_i}`, the finite-dimensional module being excluded by
genericity as above, and the infinitesimal character of `V_λ^∨`, of highest weights `(−b,−a)` at
`τ` and `(−b′,−a′)` at `τ̄`, is `{p₁,p₂}={−b+1/2,−a−1/2}`, `{q₁,q₂}={−b′+1/2,−a′−1/2}`. Clozel's
purity lemma (AutomorphicFormsOnReductiveGroups §5.5, `clozelPurity`, for `n=2`) gives
`p₁+q₁=p₂+q₂`: pairing `−b+1/2` with `−b′+1/2` would give `a+a′−b−b′=−2`, impossible, and the
other pairing gives `a−b=a′−b′`. *Needs:* §2.4; AutomorphicFormsOnReductiveGroups §§2.3, 2.6, 4.3,
5.5.

**Comparison with Williams.** Williams's level is `Ω₁(𝔫)={γ∈GL₂(Ô_F) : c∈𝔫Ô_F, a−1,d−1∈𝔫Ô_F}`
(Williams, Definition 1.1, p. 4), the kernel of `det mod 𝔫` on §0.2's `U₁(𝔫)` (on `U₁(𝔫)`,
`det γ≡a mod 𝔫`), hence normal in `U₁(𝔫)` of index `#(𝒪_F/𝔫)ˣ`. His cusp forms (Definition 1.2,
pp. 4–5) are the functions `GL₂(𝔸_F)→V_{2k+2}(ℂ)` with the right `SU₂(ℂ)`-action `ρ′`, archimedean
central factor `|z|^{−k}` for `z∈ℂˣ`, right `Ω₁(𝔫)`-invariance, left `GL₂(F)`-invariance, the
single Casimir condition `∂Φ=(k²/2+k)Φ` and vanishing of the unipotent integral, leaving the finite
central character free. These five conditions include no growth condition, and without one the
Casimir eigenspace is infinite dimensional; his Fourier expansion (Williams, §1.2.1, p. 6, taken
from Hida) presupposes moderate growth, which is imposed here as part of his definition, so that
his space consists of cusp forms in the sense of ALS.F.6 and §2.4. His `|·|` on `ℂ` is the
Euclidean absolute value: he writes `N(α)^{−s}=|α|^{−2s}` and `|a|_f=|a|_∞^{−2}` for `a∈Fˣ`
(Williams, §1.2, p. 7, and §2.6, p. 13), so his central factor is `(zz̄)^{−k/2}`. Prove that

```text
Φ ↦ Φ·|det|_𝔸^{−k/4}
```

is an isomorphism from Williams's space onto `⊕_ω S_{k,k}(Ω₁(𝔫),ω)`, over the `ω` with
`ω_∞=|·|_ℂ^{−k}` trivial on `𝔸_{F,f}ˣ∩Ω₁(𝔫)`; a form with central character `ω_W` goes to central
character `ω_W·|·|_𝔸^{−k/2}`. The twist is trivial on `GL₂(F)` (product formula), on `Ω₁(𝔫)` and on
`SU₂(ℂ)`, and is killed by `𝔰𝔩₂`, so it preserves the level, the `SU₂`-type and the Casimir
condition. For right translation by `η∈GL₂(𝔸_{F,f})` it gives
`[UηU]_ours∘twist = |det η|_𝔸^{−k/4}·twist∘[UηU]_W`, and `|det η|_𝔸^{+k/4}` for `[Uη⁻¹U]`. On cusp
forms of type `τ_k` with this central character, unitarity of `π_∞` up to a twist makes Williams's
Casimir condition equivalent to the full infinitesimal character, since the other unitary principal
series containing `τ_k` have different Casimir eigenvalues; his descent to functions on `H^3`
(Williams, Theorem 1.3, p. 5) is the restriction map of §2.4, whose component set is
`Fˣ\𝔸_{F,f}ˣ/det Ω₁(𝔫)` with `det Ω₁(𝔫)=Ô_Fˣ∩(1+𝔫Ô_F)`, the ray class group modulo `𝔫`; Williams
indexes the components by the class group, which is the right count exactly when
`𝒪_Fˣ→(𝒪_F/𝔫)ˣ` is onto (the kernel of the ray class group's map onto the class group is the
cokernel of that map), for example at `𝔫=𝒪_F`. *Needs:* §2.4; Convention 10.

**Cohomological comparison.** Let `U` be neat and `V_{k,k}` the local system of ALS.1.1 on `X_U`.
Prove `H^1_cusp(X_U,V_{k,k})≅⊕_ωS_{k,k}(U,ω)`, that `H^2_cusp` carries the same multiplicity spaces,
and that `H^j_cusp=0` for `j≠1,2`, Hecke-equivariantly: for `H(G^S,U^S)` by ALS.5b.5, and for the
remaining double cosets through ALS.5b.1's compatibility with level maps and translations. This is
ALS.5b.5's decomposition `H^*_cusp=⊕_πm(π)·H^*(𝔪_G,K_∞;π_∞⊗V_{k,k})⊗(π^∞)^U` together with the
archimedean computation `dim H^j(𝔪_G,K_∞;π_∞⊗V_{k,k})=1` for `j=1,2` and `0` otherwise, with
`(q₀,ℓ₀)=(1,1)` (ALS.F.7(iii)); the relative cochains are ALS.F.5's and `Λ^1𝔭≅Λ^2𝔭≅Sym²(ℂ²)` as
`SU₂(ℂ)`-modules. At non-neat level take invariants of a neat normal refinement (ALS.1.3). The
cuspidal classes lie in interior cohomology and inject into `H^1`; `H^1_cusp` is not replaced by
`H^1` or `H^1_c`. (Harder 1987, §3, uncertified; Şengün, §5, for `S_{k+2}(Γ)` as the weight-`(k,k)`
space.) *Needs:* ALS.F.5, F.7, 1.1, 1.3, 5b.1, 5b.5.

**Checks.**
- At `k=1` and the central element `z=2`: Williams's factor is `|2|^{−1}=1/2`, ours is
  `(2·2)^{−1}=1/4`, and `|det(2I)|_ℂ^{−1/4}=|4|_ℂ^{−1/4}=16^{−1/4}=1/2` bridges them; with the
  normalised reading of `|·|` no twist would be needed, and the Euclidean reading is the one fixed
  by Williams's §1.2.
- For `η=diag(ϖ_v,1)` at a prime `v` of norm `q_v`, `|det η|_𝔸=q_v^{−1}`, so the eigenvalue of
  `[UηU]` on the twisted form is `q_v^{k/4}` times Williams's; at `k=0` the two agree.
- At `k=0`, `τ_0=Sym²(ℂ²)⊗det⁻¹` is three dimensional and `S_{0,0}(U,ω)` consists of the
  vector-valued harmonic forms of Şengün §5, matching `H^1_cusp(X_U,ℂ)`.
- Cuspidal cohomology is a proper summand of `H^1(X_U,ℂ)` in general: restriction to the boundary
  tori is nonzero on Eisenstein classes (ALS.5b.4).
- For `λ_τ=(1,0)`, `λ_τ̄=(0,0)`: `a+b′=1≠0=b+a′`, so `S_{V_λ^∨}(U,ω)=0` although `V_λ` is a local
  system on `X_U`; `λ_τ=λ_τ̄=(k,0)` has `a+b′=k=b+a′` and gives `V_{k,k}`.
- `diag(u,1)` with `u∈Ô_Fˣ`, `u≢1 mod 𝔫` lies in `U₁(𝔫)` and not in `Ω₁(𝔫)`; since `Ô_Fˣ→(𝒪_F/𝔫)ˣ`
  is onto, such `u` exist exactly when `(𝒪_F/𝔫)ˣ` is nontrivial, that is unless `𝔫` is a product
  of distinct primes of norm `2`, and then Williams's level is strictly smaller than §0.2's; at
  `𝔫=𝒪_F` both are `GL₂(Ô_F)`.
- Negative control: for `F=ℚ(√−7)`, where `2` splits, and `𝔫=2𝒪_F`, the ring `𝒪_F/𝔫≅𝔽₂×𝔽₂` has
  four elements but trivial unit group, so `det≡1 mod 𝔫` holds on all of `U₁(𝔫)` and
  `Ω₁(𝔫)=U₁(𝔫)`: the size of `𝒪_F/𝔫` alone does not decide whether the inclusion is strict.
- For `F=ℚ(i)` and `𝔫=3𝒪_F`, `3` is inert, `(𝒪_F/𝔫)ˣ` is cyclic of order `8`, and the four units
  of `𝒪_F` stay distinct modulo `3`; as the class number is `1`, `𝔸_{F,f}ˣ=FˣÔ_Fˣ` and
  `Fˣ\𝔸_{F,f}ˣ/det Ω₁(𝔫)=𝒪_Fˣ\(𝒪_F/𝔫)ˣ` has `8/4=2` elements, so a form of level `Ω₁(3)`
  restricts to two functions on `H^3`, not to one per ideal class; for `𝔫=𝒪_F` the two counts
  agree.

### Examples

The infinite stabilisers of Layer 0's Examples are conjugates of the `Γ_x` of §2.6; no
finite-stabiliser or averaging hypothesis of §2.3 enters the Bianchi theory. For `D` definite over
`ℚ` with one class, trivial stabiliser action and degree `k`, the classical space has dimension
`k+1` and §2.5 realises it by the cuspidal `π` with `π_∞≅Sym^k(ℂ²)` as `ℍˣ`-representations.

### Dependencies

Layers 0–1; AutomorphicFormsOnReductiveGroups §§2.3, 2.6, 4.3, 5.5, 7.2, 7.4–7.6;
AdelicAlgebraicGroups §§4.5, 5.3; ArithmeticLocallySymmetricSpaces ALS.F.1, F.5–F.7, 0.4, 0.6–0.8,
1.1, 1.3, 3.1, 5b.1, 5b.4, 5b.5; PadicFunctionalAnalysis §§0.3, 1.1, 2.2; KleinianGroups Layers 0
and 3; Tau Ceti `TauCeti.SU2.symPower`.

## Layer 3: Hecke operators and compactness

### 3.1 Hecke operators at the places used here

On `M(U,A)` use AutomorphicFormsOnReductiveGroups §7.4's operators `T_ηφ=∑_tφ|x_t` for
`UηU=⊔_tUx_t⊂Δ`, with their preservation of level forms, independence of representatives and
opposite-ring composition law. Define `U_v`, good-prime `T_v=[U diag(ϖ_v,1) U]` and
`T_{v²}=[U diag(ϖ_v²,1) U]`, central `S_v=[Uϖ_vU]` and diamond operators from the double cosets of
§0.4; prove the local relation `T_v²=T_{v²}+(q_v+1)S_v` at good primes: the three double cosets
have `q_v+1`, `q_v²+q_v` and `1` right cosets, the coefficient of `T_{v²}` in `T_v²` is `1`, and the
degree homomorphism of the Hecke ring forces the remaining coefficient,
`(q_v+1)²=(q_v²+q_v)+(q_v+1)` (a deduction from Tau Ceti's Hecke ring). Every term has determinant
valuation `2` at `v`, so in §1.3's normalisation each of `T_v²`, `T_{v²}` and `S_v` is
`ν_alg(ϖ_v)^{−2}` times its algebraic-twist counterpart and the relation is the same in both
normalisations. Prove the commutation of operators at distinct places, and boundedness on
the Banach model of §2.1 with norm at most `max_t‖slash(x_t)‖`. Define the Hecke algebra used for
eigenforms as the subalgebra generated by the specified commuting operators, without assuming
commutativity as input. *Needs:* §§0.4, 2.1; AutomorphicFormsOnReductiveGroups §7.4; Tau Ceti
`TauCeti/NumberTheory/HeckeRing`.

- `U_v` has `#k_v` terms and `T_v` has `#k_v+1`; both preserve `M(U,A)` for the levels of §0.4.
- With isometric slash operators `‖T_η‖≤1`.

**Checks.**
- Singleton cosets for two noncommuting normalising elements detect the composition order;
  commuting good-prime operators alone cannot detect a reversed convention
  (AutomorphicFormsOnReductiveGroups §7.4's `S₃` check).
- On constants with trivial coefficients `T_v`, `T_{v²}`, `S_v` and `U_v` have eigenvalues `q_v+1`,
  `q_v²+q_v`, `1` and `q_v`, and `(q_v+1)²=(q_v²+q_v)+(q_v+1)·1`; the coefficient `q_v` in place of
  `q_v+1` is the relation for the operator attached to all integral matrices of determinant
  valuation `2`, which is `T_{v²}+S_v`, not the single double coset.
- At `t=0` the double coset of `diag(π_v,1)` has `q_v+1` right cosets, at every `t≥1` it has `q_v`:
  `U_v` is not the specialisation of `T_v` to a deeper level.

### 3.2 Certified matrices

A **Hecke certificate** consists of representatives `cᵢ` of `Cl(U)`, coset representatives `x_t`
and factorisations `cᵢx_t⁻¹=d(i,t)c_{σ(i,t)}u(i,t)` with `d(i,t)∈Dˣ`, `u(i,t)∈U`. Prove
`(T_ηφ)(cᵢ)=∑_tφ(c_{σ(i,t)})|(u(i,t)x_t)` and the block entry
`B_{ij}=∑_{t:σ(i,t)=j}slash(u(i,t)x_t)` (Jacobs, §1.6, pp. 20–21, for `F=ℚ`). Prove the transport
identity on the invariant product: different certificates give the same operator there, though not
necessarily the same extension to the ambient block coordinates when stabilisers act nontrivially.
For a split invariant model use `BE` as ambient extension, with image in the invariant part.
*Needs:* §§2.1, 2.3, 3.1.

- The operator on forms and its determinant are independent of the certificate, the representatives
  and the chosen splitting.
- `B` is a finite matrix of bounded operators on `A`.

**Checks.**
- With one class and trivial stabilisers, `B_{11}=∑_t slash(u(1,t)x_t)`, a sum of `#k_v` terms for
  `U_v`.
- If `s∈Γ_{c_j}`, then `c_js=δc_j` with `δ∈Dˣ`, and replacing `(d,u)` by `(dδ⁻¹,su)` gives a second
  certificate; it changes the term `a|(ux_t)` to `(a|s)|(ux_t)`, equal on `A^{Γ_{c_j}}` but not on
  all of `A` when `s` acts nontrivially.
- The factorisation with `cᵢx_t` in place of `cᵢx_t⁻¹` computes the operator of the inverse coset,
  `[Uη⁻¹U]`, which differs from `T_η` for `U_v`.

### 3.3 Radius improvement and compact operators

For the totally definite spaces of §§2.2–2.3, prove the norm bounds and radius improvement for the
standard `U_v` from §1.2's local formulas and §0.4's representatives: `U_π` is the composite of the
restriction `M(U,A_{κ,r})→M(U,A_{κ,r|π|})` and a norm-decreasing map back, so it is norm-decreasing
and compact on each stage (Buzzard, *Eigenvarieties*, Lemma 12.2, pp. 78–79). At several analytic
places prove the same for `U_π=∏_vU_v`. Use `IsRowCompact` and finite-image approximation from
CompactOperators §§0.1–0.2, invoking the converse only under its finite-lifting hypotheses, and
transport compactness through finite blocks and bounded invariant projections. For quantitatively
bounded weights prove `‖B_{(i,m),(j,r)}‖≤∏_σs_σ^{m_σ}` with every `s_σ<1`. Prove that for
`r′≤r` admissible the restriction between stages is a link in Buzzard's sense (Buzzard,
*Eigenvarieties*, Lemma 13.1, pp. 79–80). *Needs:* §§1.2, 2.2, 2.3, 3.2; CompactOperators
§§0.1–0.3.

- If one analytic variable is uncontracted the row bound does not tend to zero cofinitely; if the
  other coefficient factors are finite dimensional, contraction in the remaining analytic
  variables suffices.
- Compactness holds on every stage `r` at or below the weight's admissible radius.

**Checks.**
- For trivial weight in one variable, `diag(π,1)` acts by `f(z)↦f(πz)` with diagonal `1,π,π²,…`,
  a null row bound; a finite direct sum repeats these degree weights.
- `f(z₁,z₂)↦f(pz₁,z₂)` restricts to the identity on `K⟨z₂⟩` and is not completely continuous.
- An individual `U_v` at one of two analytic places is not compact: it leaves the other place's
  infinite-dimensional factor uncontracted.

### Examples

At `p=3` with the family of Layer 1's Examples, a class set of size `h` and trivial stabiliser
action, the coefficient model is `C₀(Fin h × ℕ,K)`, the classical dimension at `w=k` is `h(k+1)`,
and the row bound is `|3|^m`.

### Dependencies

Layers 0–2; AutomorphicFormsOnReductiveGroups §7.4; CompactOperators §§0.1–0.3; Tau Ceti Hecke
ring.

## Layer 4: Fredholm theory for the forms spaces

### 4.1 Intrinsic determinant and finite-slope parts

For the compact controlling operator define `H_κ(T)=det(1−TU_π)` by CompactOperators §1.5's
determinant on property-(Pr) modules. Prove the comparison with the block model and with `BE`,
independence of all choices, and independence of the radius on overlapping admissible stages, using
the actual restriction/factorisation maps and CompactOperators §1.4 (a dense inclusion alone is not
a proof). Over a complete field identify nonzero eigenvalues with reciprocal zeros of `H_κ`, and
apply CompactOperators Layers 3–4 for finite-dimensional cutoff summands; over Noetherian affinoid
coefficients obtain finite projective summands whose image Hecke algebra is a finite module. Over a
complete algebraically closed field every nonzero finite-slope summand contains a simultaneous
eigenvector and has finitely many eigensystems. Define the ordinary subspace by slope zero.
*Needs:* §§2.3, 3.3; CompactOperators §§1.4–1.5, Layers 3–4.

- Commuting Hecke operators preserve the finite-slope summands.
- The zero eigenvalue is invisible to `H_κ`; no globally free eigenbasis is claimed.
- When `‖U_π‖≤1` the ordinary subspace equals the slope-`≤0` part.

**Checks.**
- With no analytic variables the coefficient model is finite dimensional and `H_κ` is
  `det(1−TU)` of a matrix.
- The single operator `f(z)↦f(πz)` on `K⟨z⟩` has `H(T)=∏_{j≥0}(1−π^jT)`, slopes `0,1,2,…` in
  `v_π`.
- A nilpotent `U` gives `H_κ=1` and no finite slopes although the space is nonzero.

### 4.2 Coefficient bounds and classical factors

If the ambient rows are bounded by a decreasing sequence `b₀,b₁,…`, use CompactOperators §1.2's
bound `‖coeff_nH_B‖≤∏_{j<n}b_j`. With trivial stabiliser action, one variable, `h=#Cl(U)` and
`b_j=s^{⌊j/h⌋}`, obtain `v_p(coeff_nH_κ)≥(−log_ps)∑_{j<n}⌊j/h⌋`; for `d≥1` variables enumerate
multi-indices by total degree, degree `m` repeated `h·binomial(m+d−1,d−1)` times. For an invariant
projection of norm at most `C`, `BE` has rows `Cb_j` and coefficient bound `C^n∏_{j<n}b_j`.
Translate through NewtonPolygons Layer 2. In the one-variable contractive case with `s=|π|`, deduce
`dim M_{≤h} ≤ max{n : v_p(π)∑_{j<n}⌊j/h_U⌋ ≤ nh}`, with the convenient bound
`h_U(⌊2h/v_p(π)⌋+2)` for `h≥0`. For a stable finite-dimensional classical subspace identify its
factor as `det(1−TU_cl)=reflect d (charpoly U_cl)` of degree at most `d`, a factor of the full
series. *Needs:* §§3.3, 4.1; CompactOperators §§1.2, 1.6; NewtonPolygons Layer 2; Mathlib
`Matrix.charpoly`.

- These are bounds on partial sums of ordered slopes, not termwise bounds.
- Exact attainment needs a dominant-minor or noncancellation argument.
- The sharper bound needs a contractive projection or an estimate on the invariant model; it does
  not follow from property (Pr) alone.

**Checks.**
- At `h=1`, `s=|p|`: `v_p(coeff_n)≥0+1+⋯+(n−1)=n(n−1)/2`, attained by `∏(1−p^jT)`.
- At `h=2` the lower polygon has slopes `0,0,1,1,2,2,…`, not `0,1,2,…`.
- A classical `U_cl=((0,1),(0,0))` has `det(1−TU_cl)=1` of degree `0<d=2`.

### 4.3 Scalar extension and families

For compatible bounded scalar extension prove compatibility of weight factors, form spaces,
matrices, determinants and separated finite-slope summands, using completed scalar extension for
infinite-dimensional modules via CompactOperators §1.7's `c0_completedBaseChange`; for finite field
extensions prove the algebraic/completed comparison. For an affinoid family of weights with common
level and radius construct the Banach module of forms and the entire Fredholm series, with uniform
analytic bounds and a common finite stabiliser quotient; prove specialisation, compatibility on
smaller domains and preservation of nilpotent coefficients. For the universal unit character
construct ordinary analytic families on domains with `‖T‖≤b<1`, `T=κ(exp(q))−1`, `q=p` for odd
`p` and `q=4` for `p=2`, proving a uniform version of PadicFunctionalAnalysis §§5.4–5.5 with depth
and radius depending on `b`. *Needs:* §§4.1–4.2; CompactOperators §1.7; AdicSpacesPartII R0.5;
PadicFunctionalAnalysis §§5.3–5.5.

- Restriction to a smaller domain or deeper stage commutes with the action and its Fredholm
  comparison uses the maps of §4.1.
- There is no common ordinary analytic stage over all `p⁻¹<|T|<1`; the annular construction is
  §4.4.

**Checks.**
- Scalar extension to a finite splitting field preserves `H_κ` coefficientwise.
- Over `K[ε]/(ε²)` the series specialises at `ε=0` to the base series; its `ε`-part is invisible
  to every field-valued point, so compatibility is a series identity.
- The zero form space has `H_κ=1`.
- At `p=3` the family `n_w` of Layer 1's Examples has `T=exp(3w)−1`, of Gauss norm `|3|=1/3<1` on
  `K⟨w⟩` (the terms `3^nw^n/n!` have `v_3≥2` for `n≥2`), inside the ordinary range.

### 4.4 Integral annular forms in weighted Mahler coordinates

Over `ℚ` with `D` split at `p` and trivial determinant twist, let `H`, `R=H[1/T]` and the gauge
`‖T‖=α∈(0,1)` be PadicFunctionalAnalysis §5.6's, with the finite torsion factor `H_Δ=H[Δ]`,
`R_Δ=R[Δ]` (group ring at `p=2`). **Coefficient module.** With `w(n)=⌊n/2⌋`, use
`B=C₀(ℕ,R_Δ)` and its realisation `ι(b)(z)=Σ_nT^{w(n)}b_n binom(z,n)`, `z∈ℤ_p`. Prove uniform
convergence and continuity from `‖binom(z,n)‖≤1`, and injectivity from finite differences and
invertibility of `T` (PadicFunctionalAnalysis §3.2). The integral lattice is the sequences `b_n∈H_Δ`
tending to zero; no factorial or `p` is inverted. *Needs:* PadicFunctionalAnalysis §§3.2, 5.6.

**Continuous-character action.** For `γ∈Σ₀(v_p(q))` set
`f|γ(z)=κ_univ(cz+d)f((az+b)/(cz+d))` on continuous functions and prove the right-action law. If
`P_{mn}(γ)` is the `m`th Mahler coefficient of `κ_univ(cz+d)binom((az+b)/(cz+d),n)`, prove

```text
P_{mn}(γ) ∈ T^{max(m−n,0)} H_Δ;
P_{mn}(γ) ∈ T^{max(m−⌊n/p⌋,0)} H_Δ   if a∈pℤ_p.
```

LWX Proposition 3.14, p. 21, gives membership in `𝔪^{max(m−n,0)}Λ` and `𝔪^{max(m−⌊n/p⌋,0)}Λ` with
`𝔪=(p,T)`; transporting to §5.6's ring, where `(p,T)=(T)`, gives the displayed `T`-divisibility (a
deduction here). For `p=2` use `c∈4ℤ₂`. The weighted matrix `Q_{mn}=T^{w(n)−w(m)}P_{mn}` has bounded
entries and null columns; extend the action to `B` by PadicFunctionalAnalysis §2.6, prove that `ι`
intertwines it and obtain the cocycle by injectivity of `ι`. For `a∈pℤ_p`,
`w(n)−w(m)+max(m−⌊n/p⌋,0) ≥ m−w(m)=⌈m/2⌉` (using `⌊n/p⌋≤⌊n/2⌋`), so `‖Q_{mn}‖≤α^{⌈m/2⌉}`
uniformly in `n`. The weighting is new here; LWX §5.4, p. 34, motivates it. *Needs:*
PadicFunctionalAnalysis §§2.6, 3.2, 5.3, 5.6; §0.4.

**Forms and Fredholm series.** At a level with local `U₀(q)` condition and trivial stabiliser
action, `M(U,B)≅C₀(Fin h×ℕ,R_Δ)` for `h=#Cl(U)`. Prove from the certificates that every summand of
`U_p` has `a∈pℤ_p`; construct the entire series `det(1−XU_p)` by CompactOperators, with coefficients
in `H_Δ` and rows in degree-first order bounded by `α^{⌈⌊j/h⌋/2⌉}`. For `T↦t`, `p⁻¹<|t|<1`, and a
torsion character, compare with `C₀(ℕ,K)` weighted by `t^{w(n)}` via the completed base-change
comparison, and prove equality of the specialised series with §4.3's analytic series at the same
level and normalisation: the weighted and Amice matrices have the same finite principal determinants
because the diagonal scalings cancel (CompactOperators §1.4), and both series converge. Changing the
gauge gives the same coefficientwise determinant. *Needs:* §§3.2, 4.3; CompactOperators §§1.4–1.7.

- The zero-class-set case gives the series `1`.
- The module maps boundedly to analytic stage `s` once `v_p(t)/2>1/(p^s(p−1))`.
- No bounded inverse to an infinite diagonal map and no isomorphism with one fixed analytic stage
  is asserted.

**Checks.**
- `w(n)−w(m)+max(m−⌊n/p⌋,0)` at `p=2`, `m=5`, `n=4`: `2−2+3=3=⌈5/2⌉`; at `n=0`: `0−2+5=3`.
- At `p=3`, for `m≥h≥1` and `ψ_m` trivial on `{±1}` with `ψ_m(exp(3))=ζ_{3^m}`, the function
  `z↦ψ_m(1+3^hz)` equals `1` on `3^{m+1−h}ℤ₃` but is `ζ_{3^m}^{3^{h−1}}≠1` at
  `(exp(3^h)−1)/3^h`, so it is not a restricted series on the unit disc (RestrictedPowerSeries
  §2.4); its universal counterpart is in `B` by the null-column estimate.
- The unweighted model `w(n)=0` gives no row decay: for `⌊n/p⌋≥m` the guaranteed exponent
  `max(m−⌊n/p⌋,0)` is `0`, so row `m` is bounded only by `1`.

### Examples

For `h=1` and `α=|t|`, the annular series specialises to a series whose `n`th coefficient has
`|·|≤|t|^{Σ_{j<n}⌈j/2⌉}`; at `n=3` the exponent is `0+1+1=2`.

### Dependencies

Layers 0–3; CompactOperators §§1.2, 1.4–1.7, Layers 3–4; NewtonPolygons Layer 2; PadicFunctionalAnalysis
§§2.6, 3.2, 5.3–5.6; AdicSpacesPartII R0.5.

## Layer 5: theta and small-slope classicality over ℚ

This layer takes `F=ℚ`, `D` definite and split at `p`, and classical-shape weights of polynomial
degree `k≥0`; put `r=k+1`. The finite-order part is constant on the discs of the wild level. The
target weight has degree parameter `−k−2`, with the same finite character and normalised
determinant factor.

### 5.1 Derivatives and Bol's identity

Use RestrictedPowerSeries §2.3's bounded derivative `D^rz^m=(m)_rz^{m−r}`, of norm at most one on
the unit disc, with kernel the polynomials of degree at most `k` in characteristic zero; on a disc
`z=a+p^sw` carry the scale `p^{−sr}`. Prove the local Bol identity, for `N=az+b`, `L=cz+d`,
`d≠0`: `D^r(N^{j+r}L^{−(j+1)})=(ad−bc)^r(j+r)_rN^jL^{−(j+r+1)}`, and deduce
`D^r(f|κγ)=det(γ)^r(D^rf)|κ′γ` when the automorphy factors are exactly `u_γL^k` and `u_γL^{−k−2}`
for the same constant `u_γ`, first on polynomials and then by continuity (Buzzard, *On p-adic
families of automorphic forms*, §7, p. 19). *Needs:* §1.2; RestrictedPowerSeries §2.3; Mathlib
`PowerSeries.derivative`.

- The kernel of `D^r` on a union of discs is the locally polynomial functions.
- For `r>0`, `D^r` on the closed unit disc has dense range but is not surjective.

**Checks.**
- At `r=1`, `j=0`: `D(N/L)=(ad−bc)/L²`.
- At `r=1`, differentiating an extra factor `1+cz` at `f=1` gives `c`, whereas a formula in `D(f)`
  alone gives `0`; Bol fails for arbitrary locally analytic characters.
- For `γ=1`, Bol reduces to `D^r(z^{j+r})=(j+r)_rz^j`.

### 5.2 Theta on forms and Hecke compatibility

Using §0.2's `c`, define `(Θ^rφ)(g)=c(g)^{−r}D^r(φ(g))`. Prove that it maps weight-`κ` forms to
weight-`κ′` forms boundedly and that `Θ^rT_η=|nrd(η)|_f^{−r}T′_ηΘ^r` (Buzzard, *On p-adic families
of automorphic forms*, §7, p. 19). Its kernel on a single-disc stage is the classical subspace; on
several discs, locally polynomial forms, identified with classical forms of deeper level by §2.2.
*Needs:* §§0.2, 2.2, 3.1, 5.1.

- In representative coordinates `Θ^r=diag(c(cᵢ)^{−r})·D^r`.
- The dimension of the kernel is `h(k+1)` (or `h·p^s(k+1)` on `p^s` discs) under trivial stabiliser
  action.

**Checks.**
- The scalars for `U_p`, `T_ℓ` and `S_ℓ` are `p^r`, `ℓ^r` and `ℓ^{2r}`.
- At `k=0`, `Θ^1=c(g)^{−1}D` kills exactly the forms with constant values.
- Omitting `c(cᵢ)^{−r}` changes the intertwining by the factor `c(cᵢ)^r/c(c_j)^r` between blocks,
  nontrivial when the representatives have distinct `c`.

### 5.3 Determinant identity and classicality

At a single-disc level with trivial stabiliser action, let `M=M(U,A_κ)` and `W=M_cl` its
`U_p`-stable polynomial subspace, with bounded decomposition `M=W⊕N`, so that
`U_p=((U_cl,B),(0,V))` with `V` the induced operator on `M/W`. Prove
`H_κ(T)=det(1−TU_cl)·H_V(T)` by CompactOperators §1.6, after checking the coordinate projections
and compactness of `V`. On `N`, theta is a shift followed by the nonzero factorial diagonal `D` and
§5.2's constants, with `DV=p^rU_p′D`; CompactOperators §1.4's diagonal intertwining gives
`H_V(T)=H_κ′(p^rT)`, hence

```text
H_κ(T) = det(1−TU_p|M_cl) · H_κ′(p^rT),
```

without a bounded inverse to `D`. **Classicality.** For all levels where both actions are defined
and the target `U_p` has norm at most one, prove: if `(U_p−λ)^Nf=0`, `λ≠0` and `v_p(λ)<r`, then
`Θ^rf=0`, since `U′_p−λ/p^r` is invertible by the Neumann series; hence the classical and
overconvergent slope-`≤h` summands agree for `h<r`, with no trivial-stabiliser hypothesis (Buzzard,
*On p-adic families of automorphic forms*, Proposition 4, p. 19, whose `θ^{1−k}` and cutoff
`k−1` are our `Θ^r` and `r` after the shift `k_Buzzard=k+2`). *Needs:* §§4.1, 5.2; CompactOperators
§§1.4, 1.6.

- Other determinant normalisations shift the cutoff through §1.3's scalar.
- No converse bound on classical slopes, critical-slope classification or Jacquet–Langlands
  comparison is claimed.

**Checks.**
- Degree zero has cutoff `1`: `v_p(λ)<1` forces classicality.
- Rescaling `U_p` by `p` shifts the cutoff by one.
- The strict inequality is needed: at `v_p(λ)=r` the eigenvalue `λ/p^r` of `U′_p` is a unit and
  the Neumann argument fails.

### Examples

For `k=0` over `ℚ` with one class and trivial stabiliser action, `M_cl` is the line of constants,
on which `U_p` acts by the number `p` of cosets (trivial weight, `ν=1`), so
`H_κ(T)=(1−pT)·H_κ′(pT)`. The constants are classical of slope exactly `r=1`: at the boundary the
classicality theorem says nothing, and classicality here comes from the definition of `M_cl`.

### Dependencies

Layers 0–4; RestrictedPowerSeries §2.3; CompactOperators §§1.4, 1.6; Mathlib
`PowerSeries.derivative`.

## Downstream consumers

- GL2AutomorphicRepresentationsAndTransfer, R17.3: quaternionic Jacquet–Langlands and the
  comparison with Pan's spaces use §§1.3, 2.1–2.2 and 3.1.
- HilbertModularVarietiesAndShimuraCurves, R18.3: definite quaternionic class sets, integral weights
  and fixed-central-character forms use §§0.1–0.3, 1.3, 2.1–2.2 and 3.1, with the class-set
  finiteness of AdelicAlgebraicGroups §5.3.
- AutomorphicGaloisRepresentations: quaternionic eigenvarieties use §§1.1–1.4, 2.1–2.3, 3.1–3.3,
  Layer 4 and §5.3.
- PadicFamilies: definite class sets and refinement maps, through AdelicAlgebraicGroups §5.3 and
  §0.3 here.
- CompletedCohomologyAndLocalGlobalCompatibility, QuaternionArithmetic and HilbertModularForms use
  the forms and Hecke operators of §§2.1 and 3.1.

## References

- R. Liu, D. Wan and L. Xiao, *The eigencurve over the boundary of weight space*, arXiv:1412.2584v4:
  Proposition 3.14, p. 21 (Mahler matrix estimates); §5.4, p. 34 (integral models); Example 5.2
  and Remark 5.3 (limits of unweighted continuous coefficients).
- K. Buzzard, *Eigenvarieties*, author's copy: §8, p. 70 (weights), §10 (`r`-overconvergent forms),
  Proposition 11.1, p. 75 (level/radius), Lemma 12.1, p. 78, Lemma 12.2, pp. 78–79 (compactness),
  Lemma 13.1, pp. 79–80 (links).
- K. Buzzard, *On p-adic families of automorphic forms*, author's copy: §7, p. 19, Bol's identity,
  the theta–Hecke relation and Proposition 4.
- D. Jacobs, *Slopes of compact Hecke operators*, Imperial College PhD thesis (2003): §1.5,
  Definition 1.27 and equation (1.5.13), p. 19; §1.6, pp. 20–21.
- D. Loeffler, *Overconvergent algebraic automorphic forms*, arXiv:0901.2279v3: Assumption 3.1.3
  and Proposition 3.1.4, p. 15; Proposition 3.8.1, p. 22.
- B. H. Gross, *Algebraic modular forms*, Israel J. Math. 113 (1999), 61–93: the rational
  covariance model, consumed through AutomorphicFormsOnReductiveGroups §7.4.
- C. Williams, *P-adic L-functions of Bianchi modular forms*, Proc. London Math. Soc. 114 (2017),
  arXiv:1404.2100v2: Definitions 1.1–1.2, pp. 4–5; Theorem 1.3, p. 5; §1.2.1, p. 6 (the Fourier
  expansion); §1.2, p. 7, and §2.6, p. 13, for the absolute-value convention.
- G. Harder, *Eisenstein cohomology of arithmetic groups. The case GL₂*, Invent. Math. 89 (1987),
  37–118, §3 (uncertified): the Eichler–Shimura–Harder isomorphism for Bianchi groups.
- M. H. Şengün, *Arithmetic aspects of Bianchi groups*, arXiv:1204.6697: §5, the statement
  `H^1_cusp(Γ,V_{k,k}(ℂ))≃S_{k+2}(Γ)` and the weight dictionary.

## Existing Lean work

The [WilliamCoram/PhD sources](https://github.com/WilliamCoram/PhD/tree/eefb3d91f34b27d0bc7822140fa85fecae029884)
are secondary implementation references, not the specification. A supplied finite-class-set
hypothesis there is discharged by AdelicAlgebraicGroups §5.3, not counted as its proof.

| Source subtree | Interface to compare |
| --- | --- |
| `PhD/TauCeti/Code/OverconvergentForms/{Quaternion,Adelic,Level,Weight}` | Arithmetic carriers, levels, local splittings and weight actions (Layers 0–1). |
| `PhD/Main/QMF` | Right-action forms, Hecke and theta interfaces (Layers 2–5). |
| `PhD/Main/LWX` | Arithmetic matrix estimates (§4.4). |
