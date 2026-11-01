# Roadmap: K3 surfaces, cohomology, periods, cones and Torelli

**Summary.** Construct the geometry of K3 surfaces and its integral cohomology, deformation, period and automorphism APIs. The outputs include actual marked families and surface isomorphisms, not an assignment of a lattice or a period to a name. The integral gluing and Enriques-involution applications use the existing IntegralLattices theory. The construction is over actual schemes and complex manifolds; a collection of arbitrary propositions asserting the conclusions is not a surface interface.

## Scope and ownership

This roadmap owns K3-specific differential vanishing, analytic surface positivity,
Ricci-flat geometry, deformation families, periods, Torelli, cones and the realization
of free involutions, including the finite-order clean fixed-locus specialization
of MorseNovikov N6’s topological trace theorem in §7.2. General scheme
cohomology, Picard objects and finite quotients
belong to SchemeAndStackFoundations §§1.17, 1.23, 2.3, 2.6, 2.20, 3.4, 4.9, 4.11 and 5.9–5.10;
analytic GAGA belongs to ComplexComparisonPartII C−1–C2 and C4, and its C5.4
owns the normalized exponential/Chern comparison. The holomorphic Picard-class
identification is the ComplexKahlerGeometry, Part II contract
gap:integral-topology below; linear analytic Hodge theory belongs to ComplexKahlerGeometry K5–K6. Generic discriminant forms and
overlattices belong to IntegralLattices §§1B–1F; their native constructions are used
below. The retained gluing theorem is the extension/restriction criterion for a
specified pair of actions on the two summands, not a second overlattice construction.

EnriquesSurfaces E1 and E6.U0–U4 own the converse canonical-cover comparison,
primitive numerical pullback, and lift/descent of automorphisms, including
Aut(S) ≃ Centralizer(ι)/⟨ι⟩. They consume Layers 0–2 and 6–7 here; this roadmap
consumes no Enriques result. K3SurfacesAndSymplecticBoundedness is the Part II
extension, including its all-characteristic, Picard-lattice and symplectic-boundedness programme.

## Conventions

An algebraic K3 surface over an algebraically closed field k is a smooth proper geometrically integral surface X/k with an invertible-sheaf isomorphism ω_X≃O_X and H¹(X,O_X)=0. Keep a choice of this isomorphism, or equivalently a nonzero two-form σ, as input to constructions that use it. Changing σ by a unit must produce the stated comparison maps. Smooth proper surfaces over a field are projective (Huybrechts draft §1.1, Definition 1.1 and Remark 1.2, p.7). The differential-vanishing theorem here has algebraically closed k of characteristic p>2; the complex lane supplies the characteristic-zero counterpart.

Analytic manifolds and local base charts are finite-dimensional, Hausdorff and second-countable. The complex analytic lane includes compact connected complex surfaces with trivial canonical bundle and H¹(O)=0. K1 constructs their Kähler structure theorem, rather than building Kählerness into an unexplained comparison with the algebraic definition. Analytic surfaces need not be projective. Algebraic surfaces over ℂ and analytic surfaces admitting a positive-square integral (1,1)-class are related by the actual analytification/algebraization equivalence below. Every H² integral object is the actual singular cohomology of the underlying space, with its cup pairing and complex scalar-extension maps.

Use native schemes over Spec k, through `AlgebraicGeometry.Scheme.Over` or the equivalent over-category, and native smooth/proper/finite/étale morphisms. Projective embeddings use the named scheme and moduli suppliers. Use `Scheme.Modules`, native invertible sheaves, pullback, tensor, dual, Hom and global sections; do not give a second Picard group or vector-bundle category. Analytification uses actual charted spaces and the coherent analytic sheaf and bundle constructions of ComplexKahlerGeometry (CKG), with GAGA maps on morphisms and coherent cohomology. A cohomological marking is an integral isometry, not a rational matrix with an asserted determinant.

Cup products use the complex orientation. The hyperbolic plane U has matrix
(0,1;1,0), E₈ is positive definite, and Λ=U³⊕E₈(−1)². The discriminant
quadratic form is the half-norm q(x)=B(x,x)/2 modulo ℤ. A polarization is an
actual ample line bundle, with primitive class h of square 2d and d>0 when
primitivity is stipulated; a positive-square class alone need not be ample.
The symbol O⁺(Λ) means preservation of positive-three-space orientation,
whereas O⁺(T) for signature (2,10) means preservation of a chosen period component.

## Exact supplier contracts

### From Mathlib

Use `AlgebraicGeometry.Scheme`, `AlgebraicGeometry.Scheme.Over`,
`AlgebraicGeometry.SmoothOfRelativeDimension`, `AlgebraicGeometry.IsProper`
and `AlgebraicGeometry.GeometricallyIntegral` for the algebraic carrier.
Use `Projectivization` and `Matrix.toBilin'` for projective lines and matrix
bilinear evaluation; nondegeneracy and symmetry are separate hypotheses.

### From Tau Ceti

Use `AlgebraicGeometry.Scheme.relativeDifferentials` in
TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean,
`SheafOfModules.exteriorPower` in TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower.lean,
and `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` in
TauCeti/AlgebraicGeometry/Cohomology/Basic.lean. These retain the actual structure
morphism, sheaf and cohomology group. Global vector fields are morphisms
from relative differentials to `SheafOfModules.unit`.

Use `TauCeti.IntegralLattice`, `TauCeti.IntegralLattice.Isometry`,
`TauCeti.IntegralLattice.IsNondegenerate`,
`TauCeti.IntegralLattice.discriminantGroupOrthogonalSumEquiv`,
`TauCeti.IntegralLattice.Isometry.discriminantGroupEquiv`,
`TauCeti.IntegralLattice.discriminantQuadraticMap` and
`TauCeti.IntegralLattice.intermediateCarrierOfDiscriminantSubgroup` from the
Basic, Isometry/Basic, Discriminant/Operations, Discriminant/Group,
Discriminant/Quadratic and Overlattice/Basic files under
TauCeti/LinearAlgebra/IntegralLattice. The even construction is
`TauCeti.IntegralLattice.ofIsotropicSubgroup` in Overlattice/Isotropic.lean.
The correspondence is natural under
`TauCeti.IntegralLattice.Isometry.discriminantSubgroup_intermediateCarrierEquiv`
in Overlattice/Naturality.lean.

### From the named roadmaps

Each row specifies the sections consumed and their exact output.

| Input | Exact output used here | What it does not supply |
| --- | --- | --- |
| SchemeAndStackFoundations 0.3, 1.17, 1.23, 2.6, 2.20, 4.9, 4.11, 5.9–5.10 | projective schemes and finite-group quotients; stack/groupoid descent; coherent cohomology, duality, Kähler differentials and proper base change | a K3 period map, analytic Kuranishi space or global Torelli |
| AlgebraicModuliForArithmeticGeometry 1.1–1.3, 7.3, 7.8 and 8.1–8.3 (with SchemeAndStackFoundations Layer4) | projective-space and coherent-quotient carriers (§§1.1–1.3); Picard lifting (§7.3); Artin test groupoids and tangent/obstruction maps (§§8.1–8.3); effective algebraic families under the algebraicity/effectivity hypotheses of §7.8 | the vanishing of K3 obstruction spaces or an unrestricted universal coarse family |
| AlgebraicCurves Layers 9/10/12, JacobianChallenge A–D, StableReduction Layers 4–6 | relative genus-one curves, Jacobians/Picard torsors, Weierstrass and minimal regular models, intersection/coherent-duality and projectivity constructions | the K0.A vector-field theorem or a genus-one fibration on an arbitrary K3 |
| ComplexComparisonPartII C−1.1–C0.7, C1.9, C2, C4.1–C4.4 and C5.4 | actual scheme/space analytification, coherent GAGA and ideal/section/bundle/morphism dictionaries, analytic proper images and cycle currents; C5.4’s exponential sequence and integral first-Chern comparison | a K3 family, positive-square algebraization criterion or global Torelli |
| CKG K1–K4, K5a/K5b, K6.0–K6.1, K7 | type/Dolbeault calculus, analytic sets and coherent gluing, holomorphic bundles, elliptic estimates, compact Hodge/Serre and projective Kähler examples | K3 Kählerness, nonlinear Monge–Ampère existence, K3 periods or Torelli |
| IndexTheory I6, I7.1–I7.3 and I8; CharacteristicClasses C1–C7 | actual Dolbeault index/Todd, Euler/signature and holomorphic fixed-map traces for isolated nondegenerate fixed points (including the empty fixed set), with symbol, orientation and Chern normalizations | the K3-specific numerical specialization, simple connectivity or surface isomorphism |
| SmoothBundlesConnections B1.5; DifferentialGeometry Layers 0–2, 5, 8–9 and AlgebraicTopology Stage 6 | smooth bundles and the componentwise local trivialization of a proper surjective smooth submersion from B1.5; differential forms, singular cup product, Poincaré duality and coefficient comparison from the other named owners | a K3-specific integral marking, monodromy image or period realization |
| IntegralLattices 0G, 1B–1F, 5E–5J, 6A | Λ=U³⊕E₈(−1)², dual/discriminant forms, actual overlattice graph gluing, primitive embeddings and even unimodular normal form, with isometries and inverses | a Hodge structure, a free geometric involution or a surface isomorphism |
| MorseNovikov N5–N7; GeometricTopology Layer 1 | continuous local index, topological trace/local-index equality, vector-field Poincaré–Hopf, and tubular neighbourhoods | the finite-order clean fixed-locus specialization constructed in §7.2 |
| FourManifolds F7 | the independently constructed quartic K3 example and its topological calculation | a theorem about every K3, a period family or a Torelli proof |

### From TauCetiRoadmap.ComplexKahlerGeometry, Part II

**Holomorphic Picard classes (gap:integral-topology).** The base K4 stops at
holomorphic bundles, their section sheaves and cocycle gluing. Supply the group
isomorphism from isomorphism classes of holomorphic line bundles on any complex
manifold M to H¹(M,O_Mˣ). Identify a line bundle with its O_Mˣ-torsor of
frames and use SchemeAndStackFoundations §2.3’s torsor/H¹ comparison;
construct the inverse by K4’s holomorphic cocycle gluing, with tensor, dual,
refinement and holomorphic-pullback laws.
Compose this identification with ComplexComparisonPartII C5.4’s exponential
sequence and integral Chern comparison to give the exact segment

    H¹(M,O_M) → Pic_hol(M) → H²(M,ℤ) → H²(M,O_M).

The connecting map uses u↦exp(2πiu), with frames e_j=e_i g_ij and
integer cocycle u_jk−u_ik+u_ij for g_ij=exp(2πiu_ij). This contract supplies
the Picard-class identification, not a second Chern-class construction.
Its K3 application is Huybrechts draft §1.3.2, pp.15–16, equation (3.1).
For §3.1 apply the same identification to the total spaces of local analytic
families and restrictions to fibres; local lifting and rigidification remain
§3.1’s targets.

*Needs:* ComplexKahlerGeometry K4 for holomorphic bundles and gluing;
SchemeAndStackFoundations §2.3 for abelian torsor classes and sheaf H¹;
ComplexComparisonPartII C5.4 for the exponential sequence and Chern comparison.

**Checks.**

- On ℙ¹, O(1) has Chern number +1 and O(−1) has −1; their tensor product
  has 0. These fix both the exponential sign and the tensor law.
- On a Picard-rank-one complex K3, H¹(O)=0 makes c₁ injective with rank-one
  image in rank-22 H²(X,ℤ); H²(O)≃ℂ prevents an unconditional Pic≃H² assertion.
- On an elliptic curve, H¹(O)≃ℂ and H¹(ℤ)≃ℤ² give
  ker(c₁)≃ℂ/Λ_E for the image lattice Λ_E of H¹(ℤ): a nontrivial degree-zero line has c₁=0.
  Thus the general comparison does not imply injectivity without H¹(O)=0.

## How to read the build

Layer 0 supplies the independent algebraic vanishing theorem. Layers 1–4 construct
complex geometry, the cup lattice, actual families and their local periods.
Layer 5 realizes local chains of twistor lines; Layer 6 proves global periods,
Torelli and the full cone theorem. Layer 7 combines this geometry with integral
gluing to realize and classify free involutions. The acceptance statements are
`algebraicK3_differential_vanishing` and `gluing_isometry_extension_iff`;
Suggested.lean lists the geometric headlines whose carriers are not yet available.

## Layer 0: Algebraic surfaces and the early differential theorem

### 0.1 Surface and differential objects

Define `IsAlgebraicK3` on a native scheme over k by smooth relative dimension two,
properness, geometric integrality, an isomorphism of the second exterior power of
relative differentials with the structure sheaf, and subsingleton first structure-sheaf
cohomology. The predicate explicitly retains the algebraically closed field; the vanishing
theorem below also retains the characteristic and the structure morphism. Construct the actual surface category, pullback of ω, the chosen two-form, tangent/cotangent sheaves and their global-section maps. Contraction v↦ι_vσ is an isomorphism T_X≃Ω¹_X, with inverse in local étale coordinates and compatibility with pullback and rescaling σ. Prove ω trivial gives h⁰(ω)=1 and χ(O)=2. Derive c₂(X)=24 from the algebraic Noether/Riemann–Roch formula and the actual degree of the second Chern class; this computation uses neither an integral numerical-lattice classification nor characteristic-zero topology.

The surface and form API is:

- Transport the K3 conditions under scheme isomorphism and algebraically closed
  field extension, with the cohomology base-change maps and canonical-sheaf comparison.
- Pullback along an isomorphism preserves the chosen nowhere-zero two-form;
  identity and composition act as the corresponding sheaf maps.
- Contraction with cσ is c times contraction with σ for c∈k×, and its inverse
  is c⁻¹ times the inverse contraction (Huybrechts draft §1.1, p.7).

**Checks.**

- A smooth quartic in ℙ³ has ω=O(4−4)=O and H¹(O)=0, so is K3;
  its hyperplane class has square 4. In characteristic 3 the Fermat quartic
  is smooth since its four partial derivatives are the coordinate cubes.
- A smooth double sextic in characteristic different from 2 has
  π_*O=O⊕O(−3), H¹(O)=0 and ω=π*O(−3+3)=O; its plane class has square 2.
  Six general branch lines instead give 15 double points, so only the resolved
  surface satisfies smoothness (Huybrechts draft Example 1.1.3, pp.8–9).
- An abelian surface has trivial ω but h¹(O)=2, so fails the K3 predicate.
  The empty scheme fails geometric integrality; the square-zero thickening
  of a K3 fails smoothness and reducedness.
- In coordinates σ=dx∧dy, contraction sends ∂x to dy and ∂y to −dx;
  when char(k)≠2, contraction with 2σ gives 2dy and −2dx, with inverse
  factor 1/2. In characteristic 2, contraction with σ still has determinant 1,
  but 2σ=0 gives the zero map and cannot trivialize ω: the total-field product
  2·(1/2) is 0, whereas in characteristic 3 it is 2·2=1.
- The numerical identities read χ(O)=1−0+1=2 and c₂=12·2−0=24;
  a torus instead has χ(O)=1−2+1=0 and c₂=0
  (Huybrechts draft §1.2.4, p.13).

*Needs:* native scheme/differential/exterior-power/cohomology carriers;
SchemeAndStackFoundations §§2.6, 2.20, 5.9–5.10 for base change, Serre duality
and surface Riemann–Roch.

### 0.2 Algebraic absence of vector fields in characteristic p>2 (K0.A)

For every algebraically closed k of characteristic p>2 and every algebraic K3 X/k, prove `algebraicK3_differential_vanishing`: H⁰(X,T_X)=0 and H⁰(X,Ω¹_X)=0. In Lean these mean subsingleton morphisms Ω¹_X→O_X and subsingleton degree-zero sheaf cohomology, respectively (Martin v3, Corollary 1.1, p.4 and proof p.40; Huybrechts draft §1.1, p.7, contraction). This is a required early algebraic theorem. It must not consume unobstructed K3 moduli, a Witt lift, Hodge symmetry in positive characteristic, an Enriques numerical lattice or K6 Torelli. The following proof route requires the constructions in steps 1–4 at this layer.

1. First build the surface-resolution adapter needed for these quotients: take a separating projective pencil on the normal excellent projective quotient whose base locus is smooth and whose generic member avoids its finite singular set, resolve its base points, and use StableReduction Layer 4's normalized-blowup resolution of models with smooth generic curve over each relevant local base DVR. Prove the covers glue to a projective resolution and retain canonical discrepancies. Curve normalization in SchemeAndStackFoundations §4.13 is not this surface theorem, and a characteristic-zero Hironaka input is not permitted. From a nonzero global vector field, first produce a nonzero p-closed derivation in the restricted Lie algebra of global derivations; prove this reduction over the algebraically closed field. Its saturated rank-one distribution is p-closed. Construct its height-one purely inseparable quotient from the invariant subalgebras, the normalization, local zero/divisorial data, the canonical-divisor formula and its minimal-resolution comparison. Carry additive and multiplicative p-closed cases separately, with the actual restricted p-power of derivations. Produce from the vector field a primitive nef divisor D₀ with D₀²=0 and the associated relatively minimal genus-one pencil; prove the generic fibre is smooth, that there are no multiple fibres, and that there are at least two singular fibres. In characteristic three, establish the smooth-generic-fibre pencil construction rather than silently substituting a quasi-elliptic fibration. This vector-field-to-pencil lemma is part of K0.A, with its invariant-function, divisor, Riemann–Roch and resolution proof, not an assumption that every K3 is elliptic. In particular it cannot assume Picard rank at least five or the desired differential vanishing.
2. For that actual pencil f:X→ℙ¹, construct the map of connected automorphism group schemes to Aut(ℙ¹), its vertical kernel and horizontal image, and their tangent maps. Use the Jacobian/torsor model to determine the vertical component when there are no multiple fibres. Determine which α_p or μ_p horizontal actions extend across every minimal regular fibre by local Weierstrass coordinates, including wild conductor contributions. The corrected fibre analysis, not an unrestricted linearization assertion about a non-linearly-reductive group, is the producer.
3. Prove the resulting exhaustive alternatives with nonzero vector field: c₂=0; a rational Jacobian isotrivial surface with two singular fibres; the characteristic-three exceptional two-fibre configurations; or a single-singular-fibre isotrivial case in the small characteristics. Compute the local discriminant/conductor and component contributions using the minimal equations and Ogg's formula. Show none of the alternatives with at least two singular fibres has c₂=24. The characteristic-three wild alternatives must be explicitly eliminated, not discarded with the characteristic-two branch.
4. Conclude that D could not exist, transport through contraction, and export zero-section and functorial global-section statements. Supply the algebraic Serre-dual consequence H²(T_X)=0 separately, with its actual duality map; this consequence is not an input to steps 1–3.

One proof route is the corrected algebraic vector-field argument. The historical Rudakov–Shafarevich intermediate elliptic statements require corrections; Martin's *Infinitesimal automorphisms of algebraic varieties and vector fields on elliptic surfaces*, Theorem D and Corollary 1.1, identifies the corrected route. The needed pencil and local-action statements above are explicit K0.A theorem targets with their own construction. A reference to that paper does not install a proof or a new assumed vanishing axiom.

An Enriques consumer may pull back Ω¹_S⊗K_S along its finite étale canonical cover X→S, trivialize the pulled-back K_S by the actual cover algebra, use faithful flatness to obtain an injection on H⁰ and then use K0.A. Algebraic Serre duality identifies its vanishing with H²(S,T_S)=0. This consumer requires no conclusion about Num(S), no Picard-preserving lift and no complex period. Characteristic zero has the independent algebraic-to-complex/spreading or complex Hodge proof with its exact field-of-definition descent; characteristic two is stated separately.

*Needs:* §0.1; AlgebraicCurves Layers 9/10/12, JacobianChallenge A–D and
StableReduction Layers 4–6 for the genus-one and minimal-model inputs;
SchemeAndStackFoundations §§1.17, 2.20, 5.9–5.10 for quotient, duality and
intersection inputs. Steps 1–3 also construct the vector-field-to-pencil
argument used in Martin v3, proof of Corollary 1.1, p.40, citing
Rudakov–Shafarevich, p.1502 (primary locator uncertified); Theorem D alone
has an elliptic-fibration hypothesis and does not produce that pencil.

### Examples

The smooth Fermat quartic in characteristic 3 has both spaces of sections zero.
The rational two-singular-fibre alternative has c₂=12, not 24; the c₂=0
alternative has 0, not 24. In Martin v3, Example 5.12, pp.36–37, the characteristic-three wild
families have c₂=3^(2k)+3 or 3^(2k−1)+9 for k≥1: at k=1 these are
12 and 12, and at k=2 they are 84 and 36. Equality with 24 would require
a power of 3 to be 21 or 15, respectively, which is impossible. The
one-singular-fibre alternative fails the at-least-two hypothesis. Characteristic 2 is outside this theorem's binder,
although the cited vanishing itself holds there (Gounelas–Liedtke v1,
Proposition 2.2(2), p.6).

### Dependencies

§0.1 precedes §0.2. Neither uses analytic periods, a lift, or an Enriques lattice.

## Layer 1: Analytic comparison, positivity and surface foundations

### 1.1 Analytic K3 surfaces and algebraization

Consume ComplexComparisonPartII C−1/C0's actual analytification functors, C1.9 coherent proper GAGA and C2/C4's section, line-bundle and morphism comparisons. Construct their K3-specific canonical-bundle, chosen-form and coherent-cohomology adapters with the canonical exchange maps; no second general analytification or GAGA engine is introduced. In particular an algebraic K3 analytifies to a compact complex surface, and CKG's projective metric gives its Kähler structure. Do not identify a chosen algebraic polarization with an arbitrary Kähler class.

For a compact complex surface with trivial canonical bundle and H¹(O)=0, prove b₁=0 using the degree-one de Rham/Dolbeault comparison and the surface identities, without first assuming the Kähler Hodge theorem. Construct a Kähler class by the compact-complex-surface positive-current/separation criterion: prove the needed Hahn–Banach separation on real (1,1)-currents, regularization and the positive-square representative criterion, and verify its even-b₁ hypothesis. This K3 surface application includes the Kählerness proof; it is not an unnamed Siu theorem input. Its analytic prerequisites are CKG K2–K5's local and elliptic constructions, not K6's conclusion for a manifold already known Kähler.

Construct the analytic surface Riemann–Roch/Noether identity χ(O)=(c₁²+c₂)/12 from the Dolbeault index/Todd comparison, with the actual complex orientation and Chern classes; Specialize the IndexTheory I7.3 Dolbeault-symbol and index normalization to the actual tangent bundle and its Todd degree-four expression. Thus c₂=24 also for nonprojective analytic K3s. After Kählerness, apply CKG compact Hodge and Serre to construct h¹,⁰=h⁰,¹=0, h²,⁰=h⁰,²=1 and h¹,¹=20. Define the real positive component in H¹,¹(X,ℝ), selected by an actual Kähler class. Prove the Hodge–Riemann sign relations for σ, its conjugate, and primitive classes. Use gap:integral-topology’s Picard-class identification and ComplexComparisonPartII C5.4’s exponential/Chern comparison. Since H¹(O)=0, c₁ is injective with image ker(H²(X,ℤ)→H²(X,O)), which compact Kähler Hodge theory identifies with the integral (1,1)-classes; preserve the difference between a line-bundle isomorphism and its Chern class until injectivity is proved.

Construct projectivity from the existence of a positive-square integral (1,1)-class without assuming K6's later chamber theorem. Surface Riemann–Roch and the Kähler pairing select a sign whose powers have quadratically growing sections; construct the resulting meromorphic map of algebraic dimension two, its resolved graph and the projective algebraization of the smooth Moishezon surface by the surface modification/contraction argument. Own these meromorphic-map and algebraization steps here. For an actual positive line bundle also construct the coherent Kodaira embedding proof: the needed Bochner/vanishing, peak sections, separation of points and tangent directions using high powers, and compactness give a finite projective embedding. The resulting algebraic surface is unique by proper GAGA. The output is an equivalence between algebraic K3s and *projective* analytic K3s and an identification of ample algebraic bundles with integral Kähler classes. It does not algebraize every analytic K3.

The analytic surface and positive-cone API is:

- Analytification and algebraization preserve canonical forms and coherent
  cohomology through their exchange maps; the inverse comparisons are natural
  on isomorphisms (Huybrechts draft Proposition 1.3.2, p.14).
- The positive component C_X consists of α with α²>0 and (α,κ)>0 for a fixed
  Kähler κ; a different Kähler selector gives the same component. Pullback by
  biholomorphisms carries both C_X and the Kähler cone to their counterparts.
- The first Chern class identifies Pic(X) with H²(X,ℤ)∩H¹,¹(X), and tensor
  product with addition. Projectivity is equivalent to existence of an integral
  (1,1) class of positive square (Huybrechts draft §1.3.3, p.16, equation (3.2)
  and footnote 9). The Kählerness route is §7.3.2, p.131 of the same draft.

**Checks.**

- A quartic analytifies with h²,⁰=1 and h¹,¹=20; 1+20+1=22 and
  1+22+1=24. An abelian surface instead has h¹,⁰=2 and h¹,¹=4.
- Resolving the quotient of a nonprojective two-dimensional complex torus by
  negation gives a nonprojective analytic K3 with 16 exceptional curves of square
  −2; analytic K3 does not imply algebraic K3 (Huybrechts draft Example 1.3.3,
  pp.14–15).
- In a real (1,1) subspace with form diag(1,−1), κ=(1,0) and −κ have equal
  square 1 but pairings 1 and −1 with κ, so only κ is in C_X. The vector
  (1,1) has square 0 and is outside C_X.
- If a root δ is orthogonal to a positive class h, then (h,δ)=0 prevents
  ampleness when δ is effective. Positivity h²>0 cannot replace the curve tests.
- Replacing a line bundle L by L⊗L changes c₁ from h to 2h and its square
  from 2d to 8d; it preserves positivity but not a primitive polarization.

*Needs:* §0.1; ComplexComparisonPartII C−1–C2, C4 and C5.4;
ComplexKahlerGeometry K1–K6 and gap:integral-topology; IndexTheory I6–I7; CharacteristicClasses C1–C7;
SchemeAndStackFoundations §§5.9–5.10. The positive-current criterion and
surface algebraization arguments are targets of this layer.

### Examples

The quartic and double sextic give degrees 4 and 2. The nonprojective Kummer
surface separates analytic K3 from projective analytic K3.

### Dependencies

The degree-one and positive-current arguments precede compact Kähler Hodge theory;
projectivity uses surface Riemann–Roch, not Layer 6.

## Layer 2: Ricci-flat metrics, topology and twistor ingredients

### 2.1 Ricci-flat forms and the integral cup lattice

For every Kähler class a on a complex K3, construct the unique Ricci-flat Kähler form in a. With a reference form ω and a normalized positive volume form V from σ∧σ̄, solve

    (ω+i∂∂̄φ)² = c V,    ω+i∂∂̄φ>0,    ∫_X φ ω²=0,

where c is fixed by equality of total volumes. Develop the continuity path and its normalization, scalar linearization, openness by the elliptic inverse on mean-zero functions, and closedness using the C⁰, second-order and higher elliptic estimates and positive lower bounds. Keep the estimates' background metric, volume, constants and parameter compactness explicit. These nonlinear estimates and existence are owned here; CKG's linear Laplace and Sobolev theorems alone do not prove them. Prove uniqueness by integration, the Ricci/Chern-curvature calculation, smooth dependence on smooth compact parameter families, and naturality under biholomorphisms.

Construct the parallel holomorphic two-form and the quaternionic parallel complex structures I,J,K from this metric. Prove their algebra, integrability, closed Kähler forms and normalized three-plane orientation. At this stage prove the needed compact Ricci-flat surface splitting statement: the universal cover is a compact simply connected factor times an Euclidean factor; in real dimension four the Euclidean case would give a finite torus quotient. Exclude that case using c₂=24, and exclude a nontrivial finite symplectic deck action by holomorphic Lefschetz/χ(O) multiplicativity. This proves simple connectivity of the K3 surface and torsion-freeness of integral H². The splitting and deck arguments are proved here from their geometric hypotheses, not taken from an unbuilt general hyperkähler classification.

Use actual singular Poincaré duality, Wu's parity formula with c₁=0, Chern–Gauss–Bonnet and the signature formula to obtain the even unimodular H² cup lattice of signature (3,19). Consume IntegralLattices §§6A/0G for an integral marking H²(X,ℤ)≃Λ, Λ=U³⊕E₈(−1)². Provide pullback isometries, orientation and composition laws. No rational isometry or example-specific diffeomorphism substitutes for this marking. The quartic example supplies a nonempty starting family, not the assertion that all surfaces already have its lattice.

The Ricci-flat, quaternionic and marking API is:

- The normalized potential is unique, is unchanged by isomorphisms transporting
  all inputs, and varies smoothly with smooth compact parameter families.
  Its volume constant is c=∫ω²/∫V, where ∫V>0
  (Huybrechts draft Theorem 7.3.6, pp.131–132, and Theorem 9.4.11, p.183).
- Normalize σ so σ=ω_J+iω_K and ω_I²=ω_J²=ω_K² with pairwise wedge
  pairings zero. Then I²=J²=K²=−1 and IJ=K=−JI; changing σ by a unit
  phase rotates the J,K plane, preserving its orientation.
- An integral marking preserves the cup form, and pullback gives inverse and
  composition equations. Its lattice has rank 22, signature (3,19) and absolute
  determinant 1 (Huybrechts draft Proposition 1.3.5 and Remark 1.3.6, p.17).

**Checks.**

- When V=ω² and ω is already Ricci-flat, c=1 and φ=0 solve the equation.
  Replacing V by 2V gives c=1/2 and the same right-hand side; adding a
  nonzero constant t to φ changes the normalization integral by t∫ω²≠0.
- On the quaternion algebra, I(J(1))=k and J(I(1))=−k. For a²+b²+c²=1,
  (aI+bJ+cK)²=−1; for (a,b,c)=(0,0,0) it is 0 and is not a complex structure.
- For normalized orthonormal positive classes ω_I,ω_J,ω_K of square 2,
  (ω_J+iω_K)²=2−2=0 and its pairing with its conjugate is 2+2=4.
  Replacing σ by iσ sends (ω_J,ω_K) to (−ω_K,ω_J), of determinant 1.
- U has determinant −1, while E₈(−1) has determinant 1. Thus Λ has
  determinant (−1)³=−1, rank 3·2+2·8=22, and signature (3,3+16)=(3,19).
- The signature formula gives (0−2·24)/3=−16=3−19. A torus has c₂=0;
  it cannot pass the K3 splitting exclusion using 24.

*Needs:* Layer 1; ComplexKahlerGeometry K5–K6 for elliptic estimates;
DifferentialGeometry Layers 0–2, 5, 8–9; AlgebraicTopology Stages 1, 5–6;
IndexTheory I7–I8; CharacteristicClasses C3/C7; IntegralLattices §§0G, 6A.
The nonlinear estimates and Ricci-flat splitting used here are geometric targets,
not deductions from the linear estimates alone.

### Examples

The normalization computation fixes c and the quaternionic computation fixes
both the metric orientation and the sign of the holomorphic two-form.

### Dependencies

The Ricci-flat construction precedes its parallel quaternionic structures and
simple-connectivity argument. Cup-lattice classification uses the listed
cohomological formulas and IntegralLattices, independently of global Torelli.

## Layer 3: Marked deformation families

### 3.1 Actual local families and polarizations

Construct actual proper analytic Kuranishi families by the Dolbeault differential graded Lie algebra of T_X: fix a Hermitian metric, solve the Maurer–Cartan equation in an elliptic gauge, identify tangent H¹(T_X) and obstruction H²(T_X), and prove the universal property for deformations with a fixed central-fibre identification. Contraction with σ and Serre give H⁰(T_X)=H²(T_X)=0 and h¹(T_X)=20. Thus the base is smooth of dimension20 and the family is locally universal in that pointed sense. Changing gauge/metric yields the comparison germ; prove gluing and cocycles for the marked deformation groupoid.

For a proper smooth family, construct the integral H² local system by actual differentiable local trivializations, cup pairing, Gauss–Manin connection and markings. On a Hausdorff finite-dimensional base chart apply SmoothBundlesConnections B1.5 to the underlying real proper surjective submersion, component by component, with its actual fibre and projection-preserving smooth charts. These local comparisons and their transition maps define the cohomology local system; no global Hausdorff hypothesis is imposed on the later non-Hausdorff marked moduli space. Construct the Hodge filtration as holomorphic subbundles and prove the fibre and base-change equations. For a flat integral class whose restriction is (1,1) on every fibre, use gap:integral-topology on the total space and ComplexComparisonPartII C5.4’s connecting class to prove local extension of its central-fibre line bundle after shrinking the base; construct the relative Picard obstruction, its vanishing on this Hodge locus, and rigidification explicitly. No unconditional lift over the whole deformation base is asserted. For a primitive polarization h with h²=2d>0, construct the smooth19-dimensional polarized deformation slice, and the open subfamily where its actual line bundle is ample. Treat degree2 and special divisibility with the same integral class, not a changed rational polarization.

Until cohomological faithfulness is proved in K6, use the deformation groupoid/atlas and its stabilizers. A marking does not by itself license a global fine moduli family with no inertia. Construct transition maps, descent and base-change on actual families before passing to isomorphism classes.

A marked family comprises the actual proper smooth holomorphic map, its K3
fibres and an isometry from its integral H² local system to the constant Λ
system; it is not just a map from a base to periods. A polarized marked family
also carries an actual relatively ample line bundle with the stipulated
primitive Chern class h. Their API is:

- Pullback and restriction retain the total space and structure morphism, and
  induce the identity/composition/cocycle maps on the local system and marking.
- A central-fibre identification is part of the local universal property; metric
  or gauge changes induce comparison germs commuting with it.
- For nonzero h, the (1,1) condition cuts out a hypersurface in the local base;
  relative ampleness is open there. The line bundle extends locally after the
  Picard obstruction and rigidification, with descent on overlaps
  (Huybrechts draft Corollary 6.2.7, p.107, and §6.2.4, pp.108–109).

**Checks.**

- The constant family X×Δ→Δ has constant H² local system and zero period
  derivative; its one-dimensional base is not a universal deformation base of
  dimension 20. A marking alone cannot impose universality.
- Pulling the constant family back to a point gives X; pulling twice along
  identity maps gives the same marking id∘id=id.
- The first-order base ℂ[ε]/(ε²) has one square-zero parameter, ε²=0;
  deformation classes are H¹(T_X)⊗(ε), of dimension 20. Replacing it by its
  reduced point would incorrectly give zero tangent directions.
- A quartic polarization has h²=4 and imposes one independent tangent
  equation: 20−1=19. A double-sextic polarization has h²=2 and also gives 19;
  the zero class imposes 0 equations and is not a polarization.
- If h²=2, then (2h)²=8 and 2h is divisible by 2; treating 2h as a primitive
  degree-eight class changes the moduli problem.
- A resolved double sextic with a contracted exceptional root has (h,δ)=0;
  its h remains nef but fails relative ampleness at that fibre.

*Needs:* Layers 1–2; ComplexKahlerGeometry K3–K6 for the Dolbeault and
elliptic gauge construction; gap:integral-topology and ComplexComparisonPartII C5.4
for line-bundle classes and their connecting classes; SmoothBundlesConnections B1.5 for local
trivialization; AlgebraicModuliForArithmeticGeometry §§1.1–1.3, 7.3, 7.8,
8.1–8.3 for algebraic deformation/Picard comparisons at their stated hypotheses.

### Examples

Constant families, the first-order square-zero base and the two positive degrees
separate the actual deformation functor from a family of period vectors.

### Dependencies

The analytic Kuranishi construction uses Layers 1–2 and elliptic analysis.
Algebraic effectivity does not produce that analytic family.

## Layer 4: Periods and local Torelli

### 4.1 Period domains and their geometric maps

Let B be the cup form on Λ. In the actual native projectivization of Λ⊗ℂ define

    Ω_Λ = { [z] : B(z,z)=0, B(z,z̄)>0 }.

Prove the second expression is real, the conditions are independent of nonzero complex rescaling, the domain is a smooth complex20-fold, and identify it with oriented positive real two-planes. For h fixed, define Ω_h=Ω_Λ∩ℙ(h⊥⊗ℂ), with its two orientation components, the primitive embedding and the actual marking-change action. For signature (3,19), Ω_Λ itself is connected; do not transfer the two-component statement of Ω_h or the marked-moduli space to it.

The period of a marked family is the image of its holomorphic two-form line under the integral local-system marking and scalar extension. Construct this map and prove it is holomorphic, compatible with base change, pullback and marking changes. Identify its derivative with the Kodaira–Spencer/contraction map H¹(T_X)→Hom(H²,⁰,H¹,¹); prove it is an isomorphism. Obtain local Torelli and the polarized local isomorphism, with actual inverse charts.

Define rational Hodge loci and their equations B(v,z)=0 for each nonzero rational v, prove properness unless the equation is forced by the chosen lattice polarization, and prove the countability/Baire statements on a nonempty period ball. Countable avoidance gives a very-general set; it does not produce a Zariski-open algebraic locus.

The period-domain and Hodge-locus API is:

- The pairing is bilinear; B(z,z̄) is real for a real symmetric B. Rescaling by
  c≠0 multiplies B(z,z) by c² and B(z,z̄) by |c|², so both projective
  conditions descend. A period has a nonzero representative.
- For z=x+iy, the equations say B(x,x)=B(y,y)>0 and B(x,y)=0; the
  oriented plane is spanned by (x,y). Ω_Λ has dimension 20 and is connected;
  Ω_h has dimension 19 and two components (Huybrechts draft §6.1.1–§6.1.5,
  pp.99–101).
- The period map is holomorphic and natural under base change and marking
  change. Its derivative is the contraction/Kodaira–Spencer isomorphism
  (Huybrechts draft Proposition 6.2.8, p.107).
- Hodge hyperplanes for nonzero rational classes are proper unless forced by
  the polarization; their countable union has a dense complement in any
  nonempty period ball not contained in one of them (Huybrechts draft §6.2.5,
  pp.108–109, and §7.3.8–§7.3.9, p.133). The complement is a very-general set, not necessarily Zariski open.

**Checks.**

- In rank zero there is no nonzero representative, so the projective period
  set is empty. In rank one with form (1), z²=0 forces z=0, again giving none.
- With B=I₂ and z=(1,i), B(z,z)=1+i²=0 and B(z,z̄)=2>0. With B=−I₂
  the latter value is −2, so the same isotropic line is rejected.
- For c=3+4i, |c|²=25, so the previous positive value rescales to
  B(cz,overline(cz))=50=25·2. With c=0 the result is 0 and no projective
  representative exists; the nonzero hypothesis is essential.
- Complex conjugation sends (1,i) to (1,−i) and reverses its plane
  orientation, with determinant −1. In signature (2,n) this exchanges the
  two components; it does not disconnect the signature-(3,19) domain.
- A rational class δ with B(δ,z)=0 is (1,1); if B(δ,z)=1 it is not.
  A fixed polarization h has pairing 0 identically on Ω_h, so its hyperplane
  is not proper in that domain.

*Needs:* Layers 2–3; native projectivization and bilinear forms;
ComplexKahlerGeometry K3–K6; the local-system and connection constructions of §3.1.

### Examples

The I₂, −I₂ and rank-zero calculations test positivity, the projective quotient,
and the empty boundary separately; they are API checks, not geometric headlines.

### Dependencies

The domain depends on the cup lattice. The geometric period map and local Torelli
also require the actual marked family and its Kodaira–Spencer map.

## Layer 5: Cone prefix and twistor realization

### 5.1 The cone input before global periods (K5.A)

For K3 with Pic=0, prove its Kähler cone equals the selected positive cone in H¹,¹(X,ℝ). Use the surface positive-current criterion from K1 and the absence of integral curve classes; establish the separating-current/curve alternative and eliminate the latter using Pic=0. Do not use surjectivity or global Torelli in this prefix. The actual Kähler cone and positive component, not just their dimensions, are the outputs.

For the cone, prove invariance under biholomorphisms, independence of the
Kähler selector, and positive scaling. If Pic(X)=0, there are no nonzero
integral curve classes, so the surface positivity criterion tests only α²>0
in the selected component (Huybrechts draft Proposition 7.3.7, p.132).

**Checks.**

- For κ²=2, κ and 2κ have squares 2 and 8 and positive pairing with κ;
  both are Kähler in the Pic=0 case.
- The class −κ has square 2 but pairing −2 with κ, hence is outside the
  selected component. Square positivity alone would admit it incorrectly.
- The zero class has square 0, so neither cone contains it; an effective root
  δ with δ²=−2 cannot occur when Pic=0.

*Needs:* Layer 1's surface positive-current criterion and §4.1's Hodge-locus
comparison. The proof of the cone equality itself does not require Layer 6.

### 5.2 Twistor families and continuation (K5.B)

Construct on the fixed smooth K3 the sphere of parallel complex structures aI+bJ+cK, its integrable total complex structure, and the holomorphic proper family over ℙ¹. Identify its period map with the conic Ω_Λ∩ℙ(W⊗ℂ), W the oriented positive three-plane of the three Kähler forms. Construct restrictions, markings, and gluing to the local Kuranishi families.

Prove by actual positive-plane coordinates that two sufficiently close periods can be connected by a finite chain of generic positive-three-plane conics inside a prescribed small period ball. Choose the extra positive direction outside all integral hyperplanes and prove the required openness estimates, connected arcs and boundary-entry property for a smaller concentric ball. A chain somewhere in Ω is insufficient for local covering/continuation. Generic conics have only countably many points with nonzero Picard group. At Pic=0 points use K5.A to realize the required positive third direction as a Kähler class, then K2 to lift the conic to an actual twistor family. Construct the extension at the remaining points with the actual marking and local charts.

For the twistor construction, prove properness and holomorphicity of the
projection, compatibility of markings and restrictions, and the period-conic
identification. A generic positive three-plane W means W⊥∩Λ={0}.
For each chart ball B with compact closure in Ω_Λ, any x,y∈B admit a
finite chain of generic twistor conics, with consecutive endpoints in the same
connected component of each conic's intersection with B. For every x∈∂B,
a generic conic through x has x in the closure of its intersection with B
(Huybrechts v1, Proposition 3.10 and Lemma 3.11, pp.10–11; draft
Proposition 7.3.4 and Lemma 7.3.5, p.131). These are the precise local
continuation statements; the conic outside B plays no role.

**Checks.**

- In W with orthonormal basis a,b,c of square 1, z=a+ib gives z²=0,
  B(z,z̄)=2, and the conic is x₁²+x₂²+x₃²=0 in ℙ². It is one-dimensional,
  whereas Ω_Λ is twenty-dimensional.
- The quaternionic parameter (1,0,0) gives I, (0,1,0) gives J, and
  (1/√2,1/√2,0) has square −1 because IJ+JI=0.
- On a generic W, each nonzero integral vector supplies a nonzero linear
  equation on the conic with at most two zeros. Countably many such vectors
  give at most countably many non-Pic=0 points. If W⊥ contains an integral
  δ≠0, its equation instead vanishes on the whole conic.
- The constant family has one period point, whereas the twistor family has a
  whole conic; the two cannot be interchanged in the continuation argument.

*Needs:* §§2.1, 3.1, 4.1 and 5.1; the positive-plane linear algebra and local
chain construction of this subsection (Huybrechts v1, §§3 and 5, pp.6–11, 17–21).

### Examples

The explicit conic and the exceptional integral orthogonal vector distinguish
an actual generic twistor deformation from a constant family or nongeneric conic.

### Dependencies

§5.1 uses Layer 1's positivity criterion. §5.2 uses it to choose the third Kähler
direction and Layer 2 to realize it by a metric; Layer 6 uses the local chain
and boundary statements, not merely global chain connectivity.

## Layer 6: Global periods, Torelli and all root walls

### 6.1 The global comparison (K6.A)

Build the marked analytic moduli space from K3's atlas, retaining its non-Hausdorff points. Prove inseparability is an equivalence relation, construct its Hausdorff reduction and identify the descended local period map. The geometric step owns extension of graph cycles across one-parameter deformations: fix the cohomology classes of the graph cycles, prove locally uniform Kähler-volume bounds and the resulting compactness for those bounded graph families, identify the main component as a bimeromorphic graph, and control every residual component as a product of effective rational curves. Retain the projection degrees and their cohomological limits. Properness of an arbitrary entire cycle space is not assumed. Prove a bimeromorphic map between smooth minimal K3s extends to an isomorphism by the surface exceptional-curve and canonical-bundle arguments. These graph/limit assertions are theorem targets here, not consequences asserted from equal periods.

Use K5.B's *local* chains and boundary-entry lemma to prove the period map on each Hausdorff component is a covering, hence is surjective and injective because Ω_Λ is simply connected. Prove the latter using the oriented-positive-plane homogeneous-space model and its actual homotopy sequence. Prove that the marked moduli has exactly two components, distinguished by the orientation of a maximal positive three-space; construct deformation connections to the quartic example and compute the monodromy subgroup as O⁺(Λ) by explicit nodal degenerations/Picard–Lefschetz reflections and integral generation. Here O⁺ refers to positive-three-space orientation. Do not assume this monodromy conclusion as a restatement of Torelli.

Reinsert the non-Hausdorff fibres and the graph-cycle correction to obtain the usable strong theorem: an integral Hodge isometry f:H²(Y,ℤ)→H²(X,ℤ) carrying some Kähler class of Y to a Kähler class of X is the pullback of a unique biholomorphism X→Y. Construct the isomorphism, prove its cohomology equation and uniqueness, and prove the converse and functoriality. The group of automorphisms is therefore isomorphic, with explicit inverse, to integral Hodge isometries preserving the actual Kähler cone. On algebraic K3s use GAGA to get the scheme isomorphism. Bare equality of marked periods is not the same lifting statement for a specified isometry.

The marked-moduli and Hausdorff-reduction API is:

- Local family charts glue with their transition isomorphisms; points retain
  markings and are identified only by marking-compatible biholomorphisms.
- Equal periods in one component become equal after Hausdorff reduction;
  the descended period map on each component is a biholomorphism
  (Huybrechts draft §7.2, pp.128–129, §7.4, pp.133–135 and Corollary 7.5.1, p.135).
- Pullback reverses composition: (g∘f)*=f*∘g*. Strong Torelli constructs
  the unique isomorphism inducing the specified Hodge isometry whenever it
  carries a Kähler class to a Kähler class (draft Theorem 7.5.3, pp.135–136).
  The monodromy computation is draft §7.5.3–§7.5.5, pp.136–139.

**Checks.**

- A marking φ and −φ give the same projective period since [z]=[−z], but
  their positive-three-space orientations differ by (−1)³=−1. The marked
  moduli therefore has two components although Ω_Λ is connected.
- For an effective root δ, its reflection sends δ to −δ. These markings
  have the same period when (δ,z)=0 but cannot be related by an isomorphism
  whose pullback sends an effective curve to its negative. They can be
  inseparable in the marked-moduli space.
- The identity Hodge isometry carrying κ to κ gives exactly the identity
  biholomorphism. Negation carries κ to −κ with (κ,−κ)=−κ²<0 and does
  not meet the Kähler-cone hypothesis.
- For two copies of a disk glued away from the origin, the two origins are
  inseparable and become one in the Hausdorff quotient: two points map to
  one. Requiring the original atlas quotient to be Hausdorff loses this model.

*Needs:* Layers 1–5; ComplexComparisonPartII C4.1/C5.4 for proper images and
cycle currents; IndexTheory I7 and the bounded graph-cycle construction of
this subsection. Graph limits and residual rational-curve components follow
Huybrechts draft Proposition 7.2.2, pp.128–129, and §7.5.5, pp.138–139;
Huybrechts v1, proof of Proposition 4.7, p.14.

### 6.2 Effective roots, polarizations and cone transport (K6.B)

After K6.A's global realization, prove the full Kähler-cone theorem: in the chosen positive component it is cut out by strict positive pairing with every smooth rational curve, equivalently the correctly oriented effective (−2)-walls. Derive effectivity of one of ±δ for an integral (1,1) root by Riemann–Roch, but retain reducible effective divisors and the passage from all effective roots to irreducible wall curves. Prove local finiteness on the positive cone, chamber/reflection action and existence, for every integral class in the positive component, of a finite product of root reflections carrying it into the closed nef chamber; it lies in the interior precisely when no root is orthogonal to it. Give the reflection x↦x+(x,δ)δ and its integral isometry and Hodge equations. A root reflection need not be a surface automorphism.

Construct the Weyl chamber comparison and the precise polarized period image: the primitive polarization h must lie in the chosen positive component and avoid the root walls perpendicular to h for ampleness; nef/quasi-polarized periods and their rational-double-point contractions are distinct outputs. Include all degree/divisibility cases and actual inverse marked-polarized family charts. If NS contains no (−2)-classes, prove its Kähler/ample cone is the relevant positive component (for integral classes, use the line bundle comparison). These outputs provide the cone hypothesis for K7 and the Enriques comparison.

For root walls and chamber transport, prove the reflection identity,
invariance of the set of roots under integral Hodge isometries, local finiteness
inside the positive cone, and the correspondence between effective walls and
Kähler chambers. The full cone theorem is Huybrechts draft Theorem 8.5.2,
p.163; reflection chambers are §8.2, pp.146–151; the polarized image is
§6.4, pp.114–118. For every primitive h with h²=2d>0 the ample image is
Ω_h minus all H_δ with δ∈Λ, δ²=−2 and (δ,h)=0, with the selected component
and h-preserving marking group. The quasi-polarized image allows those
hyperplanes and their rational-double-point contractions.

**Checks.**

- For δ²=−2, s_δ(δ)=δ+(−2)δ=−δ and s_δ²(δ)=δ;
  if (x,δ)=0 then s_δ(x)=x. With (x,δ)=1 and x²=2,
  s_δ(x)²=2+2−2=2. The sign-minus formula would give 2−2−2=−2.
- Riemann–Roch at δ gives χ(O(δ))=2+(−2)/2=1, forcing effectivity
  of δ or −δ. They cannot both be effective, since their pairings with
  an ample class have opposite nonzero signs.
- A nef h with h²=2 and (h,δ)=0 lies on the wall and is not ample;
  a class pairing positively with every rational curve inside C_X is Kähler.
- If NS has no roots, there are zero root inequalities, so the resulting
  Kähler cone is all C_X. The statement refers to H¹,¹(X,ℝ), not just NS_ℝ.

*Needs:* §6.1; Layer 1's integral (1,1), Riemann–Roch and positivity comparisons;
IntegralLattices §§0G, 1B–1F for the integral pairing and primitive embeddings.

### Examples

The reflected effective root distinguishes a Hodge isometry from a surface
automorphism. The degree-two nef class distinguishes a quasi-polarization from
an ample polarization without excluding small degrees.

### Dependencies

The graph-limit and local continuation arguments establish §6.1; the full
root-wall and polarized-image statements of §6.2 then supply the chamber
hypotheses used in §7.2.

## Layer 7: Integral involutions and free quotients

### 7.1 The independent integral model (K7.A)

 Use the single integral lattice Λ=U₀⊕U₁⊕U₂⊕E₈(−1)_a⊕E₈(−1)_b. Define the integral involution

    ι(u₀,u₁,u₂,e_a,e_b)=(−u₀,u₂,u₁,e_b,e_a).

Construct its primitive invariant sublattice S=diag(U₁,U₂)⊕diag(E_a,E_b)≃U(2)⊕E₈(−2)=M(2), and anti-invariant T=U₀⊕antiDiag(U₁,U₂)⊕antiDiag(E_a,E_b)≃U⊕U(2)⊕E₈(−2). Give their inclusions, projections over ℚ, exact integral saturation and inverse isometries. Their signatures are (1,9) and (2,10); their discriminant groups have order2¹⁰ and exponent2.

Use IntegralLattices §§1E–1F to identify Λ with the inverse image of the graph
of the discriminant anti-isometry γ:A_S→A_T. Define `discriminantGraph` for any
integral S,T and ℤ-linear discriminant equivalence γ as Γ_γ={(a,γa)}, transported
by the native orthogonal-sum discriminant equivalence. State
`gluing_isometry_extension_iff` for all nondegenerate even S,T, an anti-isometry γ
in the half-norm convention, and an integral lattice L on S_ℚ×T_ℚ whose form
is the orthogonal-sum form and whose carrier is exactly the inverse image of Γ_γ
in (S⊕T)*. This general statement applies to the K3 model; it is not restricted
to discriminant exponent two (Huybrechts draft §14.0.3(vii), p.284 for the model;
Gritsenko–Hulek v2, §2, p.4 for extension). For g∈O(S), h∈O(T), construct the unique integral extension to L iff γ∘ḡ=h̄∘γ. Prove both directions on the actual inverse image of the graph inside S*⊕T*, preserve the embedding, and give restriction/extension composition and inverse equations. A pair of rational isometries with matching ranks is insufficient.

The integral involution and eigensublattice API is:

- The involution is an integral isometry of order two. The eigensublattice
  inclusions are primitive; their sum has finite index rather than being all Λ.
- Rational eigenspace projections are (1+ι)/2 and (1−ι)/2, with sum id and
  product zero; their denominators do not assert integral splitting.
- Restriction and gluing are inverse on compatible pairs; extensions respect
  composition and inversion (Gritsenko–Hulek v2, §2, pp.3–4).

**Checks.**

- In the two swapped U blocks, (e,0) maps to (0,e), and the invariant
  projection is (e/2,e/2), which is not integral. Diagonal (e,e) and
  anti-diagonal (f,−f) have pairing 1−1=0.
- In the diagonal U, (e,e) pairs with (f,f) to give 2, while in U₀ it
  gives 1. Thus the two forms are U(2) and U, respectively.
- In the two E₈(−1) blocks, a diagonal root has square −2−2=−4.
  Substituting a zero matrix gives square 0 and radical dimension 8;
  the prescribed nondegenerate E₈ lattice excludes it.

The graph API is:

- Membership is exactly b=γ(a); the projections of Γ_γ to either
  discriminant factor are bijective. Under the anti-isometry hypothesis,
  q_S(a)+q_T(γa)=0.
- The carrier is the inverse image in the dual, with its actual form retained.
  A pair g,h preserves it exactly when γḡ=h̄γ.
- Compatible identities extend to id, composites to composites and inverses
  to inverses, by uniqueness on the spanning rational sum.

**Checks.**

- For S=⟨2⟩, T=⟨−2⟩ and γ=id on ℤ/2, the nonzero graph element
  has half-norm 1/4−1/4=0; adjoining (e+f)/2 gives square 0 and index 2,
  so the glued determinant is −4/2²=−1.
- For S=T=⟨2⟩ the same graph has half-norm 1/4+1/4=1/2≠0, so it
  is not an anti-isometry graph of an even overlattice.
- For S=⟨4⟩, T=⟨−4⟩, γ=id on ℤ/4, g=−id and h=id give
  γḡ(1)=3 but h̄γ(1)=1. The glued vector (e+f)/4 maps to (−e+f)/4,
  outside the graph carrier; an extension does not exist. For both signs
  negative, 3=3 and the extension is −id.
- For rank-zero lattices the discriminant groups and graph are trivial; the
  unique action extends to the unique action. A positive-rank zero form fails
  nondegeneracy, whereas a nondegenerate indefinite form is permitted.

*Needs:* native IntegralLattice and discriminant/overlattice APIs;
IntegralLattices §§1E–1F and 5J for the K3 graph identification and its
2-elementary invariants. No geometric surface or Enriques numerical theorem
is an input to the abstract extension criterion.

### 7.2 Geometric involutions (K7.B)

First prove the finite-order clean fixed-locus formula. For every compact smooth
finite-dimensional real manifold M without boundary, Hausdorff and second-countable, and every
smooth diffeomorphism g:M→M with gⁿ=id for some n≥1, construct its fixed locus
as a finite disjoint union of closed smooth submanifolds F and prove

    L(g) = Σ_q (−1)^q tr(g* | H^q(M,ℚ)) = Σ_F χ(F) = χ(Fix(g)).

The rational trace equals its real scalar extension under the de Rham/singular
comparison. No orientation or connectedness assumption is imposed. A proof route starts
with MorseNovikov N5–N6’s local index and trace theorem. Average a Riemannian
metric over the cyclic action and use equivariant exponential charts to
identify T_x Fix(g)=ker(1−dg_x). The normal action has no eigenvalue 1:
its real −1 blocks contribute 2 to det(1−dg|N_F), and its rotation blocks
contribute 2−2cos θ>0. Hence the normal determinant has positive sign.
Using GeometricTopology Layer 1’s tubular neighbourhoods, perturb along F by
the negative-time flow of a vector field with isolated nondegenerate zeros.
Prove its local fixed-point indices are the vector-field indices multiplied
by that normal sign. MorseNovikov N7’s Poincaré–Hopf sum gives χ(F), and
homotopy invariance gives the formula, including the identity and empty fixed
set (Shen, §2.1, Assumption 2.1, Definition 2.2 and equations (2.7)–(2.8),
pp.256–257). All perturbations are confined to disjoint tubular neighbourhoods;
compactness excludes new fixed points in their complement.

The clean fixed-locus API is:

- The normal action is the induced bundle automorphism on TM|F/TF, and
  1−dg is invertible there; the full tangent determinant can vanish.
- The local contribution of each component is χ(F); summing agrees with the
  rational cohomological alternating trace, including nonorientable M.
- Conjugacy transports the fixed submanifolds, normal actions and trace;
  disjoint unions add both sides, and the identity gives χ(M).

**Checks.**

- For the identity on S², the normal rank is 0, its determinant is the empty
  product 1, and L(id)=1+1=2=χ(S²). On the empty manifold both sides are 0.
- Reflection across the equator of S² has fixed circle, normal eigenvalue −1
  and normal determinant 2; L(g)=1−1=0=χ(S¹). No orientation-preservation
  hypothesis is needed. The antipodal map has no fixed points and also gives 0.
- For a smooth double sextic, the deck involution fixes the branch curve of
  genus (6−1)(6−2)/2=10. Its Euler characteristic is 2−20=−18, equal to
  L(j)=2+(1−21). Locally dj has complex eigenvalues (1,−1): the full
  determinant is 0, while the real normal determinant is |1−(−1)|²=4>0.
  The holomorphic trace on O is 1−1=0 and is a different invariant.
- A normal rotation through 2π/3 contributes 2−2cos(2π/3)=3>0;
  an involution on a real normal line contributes 2>0. These fix the sign
  of the normal factor without dividing by a tangent determinant.

*Needs:* MorseNovikov N5–N7 for continuous local index, the topological trace
formula and vector-field Poincaré–Hopf; GeometricTopology Layer 1 for tubular
neighbourhoods; AlgebraicTopology Stages 6–7 for rational cohomology and Euler
characteristic; DifferentialGeometry Layers 0–3, 8 and §12.1 for smooth flows,
cohomology comparison and metrics;
HopfRinow Layer 1 for the Riemannian exponential. Equivariant linearization,
the normal-index comparison and the finite-order specialization are targets here.

 On a K3 with such a marked primitive S in NS and a Kähler chamber compatible with the involution, the lattice involution is Hodge and preserves that chamber. Apply K6 to construct the involution of the surface, prove its square is identity and that its action on the holomorphic two-form is −1. Own the geometric fixed-locus criterion: compute invariant/anti-invariant line bundles and local involution action, use the clean topological Lefschetz formula just constructed and the adjunction identity and the integral two-elementary data to classify the possible fixed curves, and prove that invariant lattice U(2)⊕E₈(−2) is precisely the fixed-point-free Enriques case. For any non-symplectic involution on a complex K3, let r be the rank, a the discriminant length and δ the discriminant parity of its invariant lattice. Its fixed locus is empty for (r,a,δ)=(10,10,0), two elliptic curves for (10,8,0), and otherwise a genus (22−r−a)/2 curve and (r−a)/2 rational curves (Artebani–Sarti–Taki v2, Theorem 3.1, p.10). This includes the exceptional empty-fixed-locus case; the usual genus/component formula cannot be applied to it mechanically. IntegralLattices §5J supplies lattice classification, not this geometric fixed-locus theorem.

Construct the free finite quotient by the actual order-two action, its projectivity in the algebraic case, finite étaleness, canonical character, H¹(O)=0 and nontrivial order-two canonical bundle. (Huybrechts draft §15.4.3(ii), p.330; Artebani–Sarti–Taki v2, Theorem 3.1, p.10.)

For geometric involutions, prove uniqueness from their cohomological action,
isomorphism transport and conjugacy under marking change. The quotient API
includes the degree-two finite étale map, the canonical character and the
identity/composition maps on quotient isomorphisms.

**Checks.**

- A non-symplectic involution acts on σ by −1, so its holomorphic Lefschetz
  number on O is 1−1=0. A symplectic involution instead gives 1+1=2.
- For invariant rank 10, tr(H²)=10−12=−2 and the topological Lefschetz
  number is 1−2+1=0. Both the empty fixed locus and two elliptic curves
  have Euler characteristic zero; the discriminant lengths 10 and 8
  distinguish them.
- For (r,a,δ)=(1,1,1), the ordinary formula gives genus 10 and zero rational
  components, Euler characteristic 2−20=−18; the trace formula gives
  2+2·1−22=−18. For (10,10,0) the same genus formula would give genus 1
  and zero rational components, which is not the empty locus.
- A free quotient has χ(O_X)=2=2·χ(O_Y), hence χ(O_Y)=1. The canonical
  character is −1 of order two; in characteristic 2 that character would be 1,
  so this complex finite-étale argument is not a characteristic-two assertion.

*Needs:* Layers 1–2, §§6.1–6.2, §7.1, IntegralLattices §5J,
the clean fixed-locus formula above and SchemeAndStackFoundations §1.17. The fixed-locus classification
is geometric and is not supplied by classification of 2-elementary lattices.

### 7.3 Free and nodal period loci

Fix one component Ω⁺_T of the type IV domain of the anti-invariant lattice T.
For every nonzero δ∈T define H_δ={ [z]∈Ω⁺_T : B(z,δ)=0 }. Define

    Ω_free = Ω⁺_T ∖ ⋃_{δ∈T, B(δ,δ)=−2} H_δ,
    Ω_nodal = Ω_free ∩ ⋃_{δ∈T primitive, B(δ,δ)=−4, div_T(δ)=2} H_δ,

where div_T(δ) is the positive generator of the ideal B(δ,T)⊂ℤ.
A point belongs to Ω_free if and only if it is the period of a complex K3
with a fixed-point-free involution and an integral marking intertwining its action
with ι. Markings may change by integral isometries of Λ commuting with ι and
preserving Ω⁺_T. Their restrictions to T form O⁺(T), by the gluing criterion
and surjectivity O(S)→O(q_S); fixing the S-marking instead gives the kernel
of O⁺(T)→O(q_T). Prove that O⁺(T)\Ω_free classifies isomorphism classes
of free pairs, with isomorphisms conjugating the involutions. This is a bijection
on isomorphism classes; it does not assert a fine universal family on the quotient
(Gritsenko–Hulek v2, §2, pp.3–5, Theorem 2.1 and Remark 2.2).

For such a free pair (X,j), its smooth quotient contains a smooth rational curve
if and only if its period lies in Ω_nodal. A smooth rational curve downstairs
pulls back along the étale degree-two quotient to two disjoint smooth rational
curves C and jC, each of square −2; their difference is primitive of square −4
and divisibility two in T. Conversely the existence of an even −4 Hodge class
implies the quotient has a rational curve; an arbitrary representative of that
Hodge class is not asserted to be an irreducible curve difference without the
chamber/effectivity argument (Gritsenko–Hulek v2, §3, p.8, equation (8)
and the paragraph citing Namikawa Proposition 6.2; Dolgachev v2, §5, pp.15–17).

*Needs:* §7.1–§7.2; §6.1–§6.2; IntegralLattices §5J for the discriminant
surjectivity; SchemeAndStackFoundations §1.17 for the finite quotient.

The period-locus API is:

- Each H_δ equals H_(−δ), and nonzero scalar multiples of z define the same condition.
- Permitted marking changes carry H_δ to H_(gδ), preserve the two loci, and act
  on free pairs by changing the actual integral marking.
- The free-pair period map is onto Ω_free; its orbit fibres are exactly isomorphism
  classes of free pairs. Its nodal sublocus and complement are invariant under O⁺(T).

**Checks.**

- With (e,f)=1 in U, δ=e−f has square −2 and pairings −1,1, so div_T(δ)=1;
  every point of H_δ is excluded from Ω_free.
- With (e′,f′)=2 in U(2), δ=e′−f′ has square −4 and pairings −2,2,
  so div_T(δ)=2. Points of H_δ outside the −2 arrangement are nodal free periods.
- In U, e−2f has square −4 but divisibility 1; its hyperplane is not included
  in the nodal arrangement by that vector. Square −4 alone is insufficient.
- For disjoint lifted curves, (C−jC)²=−2−2−2·0=−4, whereas (C+jC)²=−4
  is invariant. The eigenspace, not the square alone, determines which arrangement applies.

### Examples

The invariant and anti-invariant lattices have ranks 10 and 12 and discriminant
orders 1024 each. The gluing index is 1024, giving discriminant
1024²/1024²=1 for Λ. The fixed-locus invariant (10,10,0) gives the empty
set; (10,8,0) gives two elliptic curves, also of Euler characteristic zero.
Thus vanishing of the Lefschetz number alone does not prove freeness.

### Dependencies

§7.1 needs the native lattice/discriminant API and IntegralLattices §§1E–1F.
§7.2 needs Layers 1, 2 and 6, IntegralLattices §5J and its clean fixed-locus
formula from MorseNovikov N5–N7 and the geometric inputs on its Needs line.
IndexTheory I8 is used in §2.1 for a fixed-point-free deck action; it is not a
fixed-curve formula.
§7.3 uses precisely the inputs on its Needs line. There is no Enriques supplier.

## Downstream consumers

EnriquesSurfaces E1 uses §0.2 and Layers 1–2. Its E6.U0–U4 uses Layer 7
and strong Torelli for primitive canonical-cover pullback and automorphism
descent with the actual ample cone and discriminant compatibility retained.
K3SurfacesAndSymplecticBoundedness Part II extends these K3 foundations.

## References

- Huybrechts, *Lectures on K3 surfaces*, author-hosted prepublication draft,
  [K3Global.pdf](https://www.math.uni-bonn.de/people/huybrech/K3Global.pdf).
  All chapter/section and printed-page locators here refer to this draft.
- Huybrechts, *A global Torelli theorem for hyperkähler manifolds*,
  [arXiv:1106.5573v1](https://arxiv.org/abs/1106.5573v1), §§3–5, for local
  twistor chains, boundary entry and Hausdorff continuation.
- Martin, *Infinitesimal automorphisms of algebraic varieties and vector fields
  on elliptic surfaces*, [arXiv:2004.07227v3](https://arxiv.org/abs/2004.07227v3),
  Theorem D, pp.3–4; Corollary 1.1, p.4, proof p.40.
- Gounelas–Liedtke, *Symmetric Differentials on K3 Surfaces*,
  [arXiv:2608.17953v1](https://arxiv.org/abs/2608.17953v1), Proposition 2.2(2), p.6.
- Artebani–Sarti–Taki, *K3 surfaces with non-symplectic automorphisms of prime order*,
  [arXiv:0903.3481v2](https://arxiv.org/abs/0903.3481v2), Theorem 3.1, p.10.
  This states the fixed-locus theorem; its attribution is Nikulin, Theorem 4.2.2
  of the full paper listed below, rather than the three-page announcement named
  in its bibliography.
- Gritsenko–Hulek, *Moduli of polarized Enriques surfaces*,
  [arXiv:1502.02723v2](https://arxiv.org/abs/1502.02723v2), §§2–3, pp.3–8.
- Dolgachev, *A brief introduction to Enriques surfaces*,
  [arXiv:1412.7744v2](https://arxiv.org/abs/1412.7744v2), §5, pp.15–17.
- Nikulin, *Factor groups of groups of automorphisms of hyperbolic forms with
  respect to subgroups generated by 2-reflections. Algebrogeometric applications*,
  J. Soviet Math. 22 (1983), 1401–1475,
  [DOI 10.1007/BF01094757](https://doi.org/10.1007/BF01094757), Theorem 4.2.2
  (primary locator uncertified; the fixed-locus statement is certified in
  Artebani–Sarti–Taki Theorem 3.1).
- Rudakov–Shafarevich, *Surfaces of type K3 over fields of finite characteristic*,
  J. Soviet Math. 22 (1983), 1476–1533, p.1502 (primary locator uncertified;
  the pencil implication is quoted in Martin's proof on p.40).
- Shen, *Analytic Torsion and Dynamical Flow: A Survey on the Fried Conjecture*,
  Progress in Mathematics 338 (2021), 247–299,
  [author-hosted text](https://webusers.imj-prg.fr/~shu.shen/publication/SurveyFried),
  §2.1, Assumption 2.1, Definition 2.2 and equations (2.7)–(2.8), pp.256–257.
