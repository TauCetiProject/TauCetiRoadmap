# Roadmap: Siegel and PEL moduli problems, part II: unitary integral and formal moduli

**Summary.** This roadmap builds the integral and formal moduli of unitary type that the arithmetic of
unitary Shimura varieties uses: the O-displays of strict formal O-modules; the unitary
Rapoport–Zink spaces of principal, almost self-dual, exotic and Krämer type, with their special
homomorphism spaces; the integral CM moduli at every prime; the integral models of
Rapoport–Smithling–Zhang, Li–Liu, He–Li–Shi–Yang and Liu–Tian–Xiao–Zhang–Zhu built from pairs of a
CM abelian scheme and a unitary abelian scheme; and the formal uniformization of their basic loci.
It starts from the generic PEL data, determinant condition, levels, canonical models, displays and CM
moduli of PELModuli, where that roadmap stops at good primes, at the principal unramified case and at
primes unramified in the CM field. Its end theorems are the formal smoothness or regular semistable
reduction of the four families of local spaces (§§1.2, 2.2, 3.4, 5.7) and the two connected
components of the exotic space over every p-adic field (§3.7); the finite étaleness of the CM moduli
at every prime (§6.6); the smoothness, regular semistable reduction and quasi-projectivity of the
global integral models (§§7.6, 7.7, 7.8, 7.9, 8.4, 8.7); and the uniformization of their basic loci by
the local spaces (§§9.5–9.10). A polarization kernel, a signature convention, an integral Lie
annihilation equation and a coefficient field are part of every statement: none of them can be
recovered from the generic Shimura variety.

## Scope and ownership

This roadmap owns: the Witt O-frame over an arbitrary O-algebra, O-displays of strict formal
O-modules, the relative isocrystal of a strict formal O-module, relative duality, the Lubin–Tate frame
comparison and the f-O-display comparison for an unramified extension (§0.1); representability of EL
framed functors and of polarized PEL framed functors for an arbitrary self-dual periodic multichain, and
the representability criterion that Layers 1–5 apply to their relative unitary framed functors (§0.2); principal hermitian
modules, Mihatsch's relative comparison and the conjugation of signature conventions (§§0.3–0.7);
the unitary Rapoport–Zink spaces of principal, almost self-dual, exotic and Krämer type, their
special homomorphism spaces, the rank-raising embedding and the diagonal graph (Layers 1–5), with
the two connected components of the exotic space over every finite K/ℚ_p (§3.7); the
absolute-to-relative exotic comparison (Layer 4); the global CM and lattice data of the
Rapoport–Smithling–Zhang (RSZ) setting, including the integral CM moduli at every prime, which extends
PELModuli §M4.7 beyond primes unramified in the CM field (Layer 6); the RSZ, Li–Liu, He–Li–Shi–Yang and
Liu–Tian–Xiao–Zhang–Zhu integral models, in particular the models of LTXZZ22 §§4.2 and 5.2 (Layers 7
and 8); and the Tate–Dieudonné comparison for basic CM pairs, quotients of formal schemes by discrete
groups and the basic-locus uniformizations (Layer 9).

It leaves to other roadmaps, by section:

- Zink displays over rings of characteristic p and the functor BT to formal p-divisible groups are
  PELModuli §M2.15; their definition over every ring in which p is nilpotent, with base change and
  duals, and the equivalence there are the contract gap:zink-display-equivalence.
- The strict O_K-action on a p-divisible group (O_K acting on Lie through the structure map), its
  O_K-relative height h, characterized by rank X[π]=q^h, the relative height of an O_K-linear
  quasi-isogeny, and the formula height_p=[K:ℚ_p]·h are HilbertModularVarietiesAndShimuraCurves
  §R18.5.4; §0.1 applies them over every O-algebra in which π is nilpotent and adds formality,
  O-displays, the relative isocrystal and relative duality.
- Relative (ramified) Witt vectors of an arbitrary O-algebra and isocrystals with a ramified
  coefficient field are VectorBundlesAndIsocrystals Layer 0, “Ramified coefficient rings and
  coefficient changes”, and Layer 1, “Finite isocrystals over the completed maximal unramified
  coefficient field”, with its slope classification; §0.1 adds the Witt O-frame (F, V and `I_O(R)`
  over an arbitrary O-algebra), its windows and their duality, and the relative isocrystal of a
  strict formal O-module.
- The PEL Rapoport–Zink space of an unramified local PEL datum with a single self-dual lattice, and
  the unstructured framed deformation functor of a p-divisible group, are IgusaVarietiesAndTorsionConcentration
  §0.27. §0.2 differs in two clauses: it treats an arbitrary self-dual periodic multichain over a
  ramified or unramified datum, and EL data without polarization, which the almost self-dual, exotic and
  Krämer spaces need since their polarizations are relative, not Cartier.
- Strict dimension-one Dieudonné classification and strict O-module deformations with Drinfeld
  levels are EndoscopicTransferAndUnitaryTraceComparison §§7.6 and 10.2; Tate full faithfulness over
  finite fields, Honda theory and the B-linear isogeny classification are its §§8.3 and 8.10.
- The split Drinfeld-level integral models at a split distinguished place are
  IgusaVarietiesAndTorsionConcentration §0.31.
- Locally noetherian formal schemes and the Berthelot generic fibre are AdicSpacesPartIII Layer F0
  and §R2.9; descent, algebraic spaces and stacks are SchemeAndStackFoundations Layer 1, formal
  deformation theory its Layer 4; the Grassmannian scheme of a module over an affine base is already
  in Tau Ceti (`Module.Grassmannian.scheme`), and Grassmannians of locally free sheaves over an
  arbitrary base, their smoothness and their tangent spaces are AlgebraicModuliForArithmeticGeometry
  §1.3.
- p-divisible groups and their Dieudonné theory are FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer
  R07.1 and §§R07.2.10, R07.2.17, R07.2.20, R07.2.26; Grothendieck–Messing, effectivity of polarized
  formal lifts and Serre–Tate with structures are AbelianSchemesAndArithmeticModuli §§A4.7–A4.9.
- Hermitian lattices and local hermitian forms are GeometryOfNumbersAndQuadraticArithmetic §§2.7 and
  2.9, the forms of a unitary datum and the Hasse principle are PELModuli §§M3.1–M3.2; the existence of
  a global hermitian space with prescribed local invariants is the contract gap:hermitian-local-global.
- Smoothness of the automorphism group scheme of a polarized unitary lattice multichain is the
  contract gap:unitary-multichain-stabilizer.
- Quasi-projectivity and properness of PEL moduli at good primes are ShimuraCompactifications §§7.3,
  7.5 and 7.18; at the remaining primes and parahoric levels they are the contract
  gap:bad-prime-projectivity.

The special-fibre geometry built on the models of Layers 7 and 8 — the basic isogeny correspondence
of LTXZZ22 Theorem 4.3.5, the balloon, ground and link strata, link cohomology, the semistable
product resolution and the first geometric reciprocity law — is SelmerIwasawaCohomologyPartII Layer 2
and §5.2, a consumer of this roadmap (see Downstream consumers). Zhang21 Lemmas 7.10(b) and 7.11 on
F-linear characteristic polynomials are not used here.

## Conventions

*Local notation.* K is a finite extension of ℚ_p, L/K is quadratic, p>2, and a↦ā is the nontrivial
automorphism of L/K. ϖ is a uniformizer of K and q the cardinality of its residue field. When L/K is
ramified, u is a uniformizer of L with ū=−u, so u²=ϖ·(unit). A breve accent (K̆, L̆, Ĕ) denotes the
completion of a maximal unramified extension.

*Bases.* For a complete local ring O with residue characteristic p, Nilp_O is the category of locally
noetherian schemes over Spf O on which p is locally nilpotent, with the Zariski topology. Formal moduli
are functors on Nilp of the appropriate coefficient ring. A framing is defined over the subscheme cut
out by the uniformizer, which need not be reduced. A formal space is locally formally of finite type;
quasi-compactness and the p-adic topology are not presumed.

*Strict modules and heights.* Strict O_K-modules have the structural O_K-action on Lie, and the
relative height of a strict O_K-module or of an O_K-linear quasi-isogeny is its O_K-relative height,
both as in HilbertModularVarietiesAndShimuraCurves §R18.5.4; the height of the underlying p-divisible
group is called its absolute p-height. Relative height
2n means absolute p-height 2n[K:ℚ_p]. The unitary local objects of this roadmap of relative height 2n
have dimension n by definition (§§0.3 and 3.1); the height does not force it, since over 𝔽̄_q there is a
strict formal O_K-module of relative height 2n and dimension 1, the base object of Lubin–Tate
deformation theory. Forgetting the O_K-action keeps the Lie algebra, so the underlying p-divisible
group has the same dimension as the strict object. The relative dual of
§0.1 depends on the chosen uniformizer and is not the Cartier dual. For a hermitian Hom pairing
h(x,y) the first argument is L-linear and the second conjugate-linear. GeometryOfNumbersAndQuadraticArithmetic
§§2.7 and 2.9 write forms conjugate-linear in the first argument; every result imported from them is
applied to the transposed form H(x,y)=h(y,x), which equals ε times the conjugate of h(x,y) when h is
ε-hermitian (ε=±1). H is conjugate-linear in x, linear in y and ε-hermitian for the same ε. H and h
have the same isometries and the same adjoint of endomorphisms (h(ax,y)=h(x,a*y) exactly when
H(ax,y)=H(x,a*y)); since O_L is stable under conjugation they have the same dual lattice
{x : h(x,Λ)⊆O_L}={x : H(x,Λ)⊆O_L}, hence the same invariant factors; and their Gram matrices on a
basis are transposes of each other, so their Gram determinants are equal and define the same
determinant class. Exact preservation of a
polarization, preservation up to an O_K-unit, and a common rational scalar on a pair are three
separately specified arrow conventions.

*Signature conventions.* The unramified local Layers 1–2 use signature (1,n−1), with rank-one source
ℰ̄ of signature (0,1). The global convention of Zhang21 is (n−1,1); switching conventions conjugates
the target action, the source action and the framing together (§0.7). Layers 3–4 use the even-rank
exotic convention (n−1,1) with a separate principal CM source of signature (1,0), and the local form
h^exo(x,y)=u⁻²λ₀⁻¹y^∨λx. Layer 5 uses the Krämer convention (1,n−1), with conjugate rank-(n−1)
subbundle and structural rank-one quotient; its comparison with the global Krämer model of §7.4
conjugates these actions.

*Global notation.* F/F⁺ is a CM extension, Φ a CM type, r the unitary signature, v₀ the distinguished
finite place and E the reflex field indicated. For a fixed p-adic embedding, F_u is the closure of F,
the completion at the place above u induced by the embedding, and the Li–Liu coefficient field is
K=F_uE_Φ, used only under the admissibility and unramifiedness hypotheses of §§6.2 and 6.4. In the
exotic global setting the hermitian form is h′=ϖ⁻¹λ₀⁻¹y^∨λx with `ϖ∈O_{F⁺}` totally positive and
val_u(ϖ)=1, so that h′=(u²/ϖ)·h^exo with u²/ϖ a unit at u (§9.6). A polarization ideal a, a nonzero
ideal of `O_{F⁺}` for which the CM moduli M₀^a of §6.6 is nonempty, and a component of M₀^a are input
data; every component of a nonempty M₀^a is itself nonempty (§6.6). Neatness is imposed on both factors whenever a scheme rather than
a stack is asserted. A claimed regular or semistable model is always over the named coefficient
discrete valuation ring.

*Conventions fixed by a computed witness.*

1. At n=3 and [K:ℚ_p]=2 a principal hermitian module of rank 3 (§0.3) has relative height 6, absolute
   height 12 and dimension 3; absolute height 6 would specify a different carrier.
2. In the unramified mixed construction at n=2 signatures add as (1,1)+(0,1)=(1,2); adding the
   unconjugated source gives (2,1). At q=3 the source product polarization has degree 9·9 and the
   principal target forces the isogeny degree 9, not q^(n+1)=27; the first generic projection has
   degree 4. A global representative also carries away-p degree factors.
3. Over 𝔽₃ the nonzero matrix with rows (0,1) and (0,0) has characteristic polynomial T² and square
   zero, so the characteristic polynomial T² does not force the action to vanish: the Eisenstein
   equations of §§0.4 and 6.5 are imposed as equations on the action.
4. A crossing over a discrete valuation ring is uv=ϖ. After a ramified coefficient extension ϖ=tᵉ with
   e>1, uv=tᵉ has embedding dimension 3 and dimension 2 at (u,v,t), so it is not regular there.
   Smoothness is stable under arbitrary base change; this regularity is not.
5. In the rank-two Krämer chart y(1+x²)=2u every geometric root of 1+x² is simple because p is odd;
   with z=(1+x²)/2 the chart is étale locally yz=u. It lives over `O_L̆=O_{F̆_{v₀}}`, where u stays a
   uniformizer after an unramified extension `E_ν/F_{v₀}`, so it gives a regular global rank-two
   Krämer model (§7.8). The ramified base change of RSZ21 Remark 6.8 concerns the wedge model, whose
   rank-two chart uv=ϖ lives over `O_{F⁺_{v₀}}` and fails by item 4.
6. For the graph of §1.6 at n=4 the relative dimensions are 2 and 5 and the arithmetic dimensions 3
   and 6; "half-dimensional" refers to the latter.
7. For a complex point of the smooth model of rank N=3 the source Hodge subspace at τ∞ is zero, so
   requiring maps to carry it into the target Hodge subspace imposes nothing and leaves dimension 3;
   the period line `Hom_ℂ(H₁^dR(A₀)_{τ∞},ω_{A∨,τ∞})` has dimension 1.
8. In the exotic global setting at n=2 the global and local forms on the same Hom space differ by
   u²/ϖ: with val_u(ϖ)=1 this is a unit and lattice duality agrees; with val_u(ϖ)=0 the dual of a
   self-dual lattice moves by one valuation.
9. For L=ℚ₃(u) with u²=3 and the rank-one form h(x,y)=xȳ of this roadmap's convention, h(u,1)=u,
   while the unit form x̄y of GeometryOfNumbersAndQuadraticArithmetic §2.7 takes the value ū=−u at
   (u,1); the latter is the transposed form H, with H(u,1)=h(1,u)=−u. On the diagonal both give the
   norm xx̄, so norms, Gram determinants and dual lattices do not detect the convention; since H is
   the conjugate of h, a value outside K, such as h(u,1)=u, does.

## Exact supplier contracts

Each supplier is consumed at the sections named. What a supplier must add is stated as a gap contract
in that supplier's subsection, and every target that needs it lists it in its *Needs:* line.

### From Mathlib

The pinned Mathlib has no formal schemes, no p-divisible groups or strict modules over a base and no
abelian schemes with PEL structure; these are the carriers the targets below construct or import.
The declarations consumed, with what is assumed of them:

- `LinearMap.charpoly` (`Mathlib/LinearAlgebra/Charpoly/Basic.lean`): the characteristic polynomial of
  an endomorphism of a finite free module over a commutative ring, with `LinearMap.charpoly_monic` and
  `LinearMap.charpoly_natDegree` (the latter under `StrongRankCondition`). It carries the Lie
  characteristic polynomials of §§0.3, 0.4 and 6.5; it does not express the annihilation equations,
  which are separate.
- `Matrix.charpoly` (`Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean`): the characteristic polynomial
  of a square matrix, used in item 3 of the Conventions.
- `Module.Grassmannian` (`Mathlib/RingTheory/Grassmannian.lean`): submodules of a module whose
  quotient is finite projective of constant rank k. It is the set of R-points of the Grassmannians of
  quotients used in §§0.6, 1.2, 5.1 and 7.5. Over an affine base the representing scheme is Tau
  Ceti's (below); the Grassmannian of rank-k quotients of a locally free sheaf of rank m over an
  arbitrary base, its smoothness of relative dimension k(m−k) and its tangent Hom formula are
  imported from AlgebraicModuliForArithmeticGeometry §1.3.
- `WittVector` (`Mathlib/RingTheory/WittVector/Defs.lean`), with `WittVector.ghostComponent`,
  `WittVector.frobenius` and `WittVector.verschiebung` (`Mathlib/RingTheory/WittVector/Basic.lean`,
  `.../Frobenius.lean`, `.../Verschiebung.lean`), and `WittVector.Isocrystal`
  (`Mathlib/RingTheory/WittVector/Isocrystal.lean`): p-typical Witt vectors of an arbitrary
  commutative ring with their ghost components, Frobenius and Verschiebung, and isocrystals over the
  fraction field of W(k) for a perfect field k; they are the case O=ℤ_p, π=p of §0.1. The ring
  `W_O(R)` of relative O-Witt vectors of an O-algebra R with respect to π, with its ghost map and its
  functoriality in R, is VectorBundlesAndIsocrystals Layer 0; the isocrystals over K̆ with
  coefficient field K, their morphisms and their slope classification are its Layer 1 (see the
  subsection of that supplier). §0.1 adds what that roadmap states on perfect algebras only: the
  Frobenius F, the Verschiebung V with respect to π and the augmentation ideal `I_O(R)` over an
  arbitrary O-algebra R, and the relative isocrystal of a strict formal O-module.
- `IsRegularLocalRing` (`Mathlib/RingTheory/RegularLocalRing/Defs.lean`): regularity of a noetherian
  local ring, the notion meant by "regular" in §§2.2, 5.6, 5.7, 7.8, 7.9 and 8.4.
- `AlgebraicGeometry.Scheme`, `AlgebraicGeometry.Flat`, `AlgebraicGeometry.Smooth` and
  `AlgebraicGeometry.SmoothOfRelativeDimension` (`Mathlib/AlgebraicGeometry/Scheme.lean`,
  `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean`, `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean`):
  schemes and flat and smooth morphisms; formal smoothness of a formal moduli space is a different
  notion, built over AdicSpacesPartIII Layer F0.

### From Tau Ceti

- `TauCeti.AlgebraicGeometry.AbelianVariety` (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean`):
  abelian varieties over a field, with smooth structure morphism. It is the carrier of the abelian
  varieties over F̄_p in §9.1; abelian schemes over a discrete valuation ring or a nilpotent thickening
  are not supplied and are imported from AbelianSchemesAndArithmeticModuli.
- `Module.Grassmannian.scheme` and `Module.Grassmannian.toSpec`
  (`TauCeti/AlgebraicGeometry/Grassmannian/Basic.lean`), `Module.Grassmannian.schemeHomEquiv`
  (`.../Grassmannian/Points.lean`) and `Module.Grassmannian.isSeparated_toSpec` and
  `Module.Grassmannian.isProper_toSpec` (`.../Grassmannian/Proper.lean`): for a module M over a
  commutative ring R, in the universe of R, and k≥0, the scheme over Spec R glued from the standard
  affine charts; its morphisms from Spec A over Spec R, for an R-algebra A, are the points of
  Mathlib's `Module.Grassmannian` of rank-k quotients of A⊗_R M; it is separated over Spec R, and
  proper when M is finite. It is the carrier of the Grassmannian of rank-r quotients of a free
  rank-n module in §0.6, over Spec O_L̆. Smoothness and the tangent space are not at the pin; they
  are AlgebraicModuliForArithmeticGeometry §1.3.
- `TauCeti.FormalScheme.Spf.carrier` and `TauCeti.FormalScheme.Spf.structureSheaf`
  (`TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean`, `.../Spf/StructureSheaf.lean`): the
  underlying space of the formal spectrum of a topological ring and its structure sheaf for an adic
  ideal. This is the only formal-scheme carrier at the pin: there is no category of formal schemes,
  no morphism of formal schemes and no formal smoothness, so the framed moduli of Layers 1–5 and
  the completions and quotients of Layer 9 are README targets whose carriers Tau Ceti does not yet
  have, and no target consumes these two declarations.

### From TauCetiRoadmap.PELModuli

§§M0.4, M0.6, M0.7, M0.10, M0.16–M0.18, M0.22–M0.25 (symplectic lattices, PEL data, the similitude group, bad primes and the good-prime base,
reflex fields, the Kottwitz determinant condition, hermitian and skew-hermitian spaces, generalized CM
types); §§M1.1, M1.3, M1.6, M1.7, M1.9, M1.13 (quasi-isogenies, unitary O_F-abelian schemes and their signature type, level structures, the moduli problem M_H
over a base of good primes, the adelic problem, level change and Hecke action); §§M2.8, M2.11, M2.12,
M2.14, M2.15 (representability and smoothness at good primes, properness when End_B(V) is a division
algebra, deformations of unitary abelian schemes, kernel ranks of isogenies, displays); §§M3.1–M3.2,
M3.8 (forms of the skew-hermitian module, the Hasse principle, the hermitian space of homomorphisms
from a CM object); §§M4.3, M4.5–M4.8 (canonical models, normalized models at higher p-level, CM moduli
at primes unramified in F); §M5.5 (unitary PEL data with prescribed signatures). These are assumed
as stated there, in particular only over a base of good primes where PELModuli says so.

What PELModuli must provide (gap:zink-display-equivalence): For every ring R in which p is nilpotent, define displays over R with their base change and duals and the functor BT to formal p-divisible groups over R (§M2.15 defines them over rings of characteristic p), and prove that BT is an equivalence from nilpotent displays over R to formal p-divisible groups over R, compatible with base change and with duality of biformal objects.

### From TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves

§R18.5.4 (the strict O_K-action on a p-divisible group, O_K acting on Lie through the structure map;
the O_K-relative height h of a p-divisible group with O_K-action, characterized by rank X[π]=q^h, and
of an O_K-linear quasi-isogeny, the q-logarithm of its degree after clearing a power of π; and the
formula height_p(X)=[K:ℚ_p]·h). These are assumed as stated there; they use nothing of the base
beyond the structure map from O_K, and §0.1 applies them over every O_K-algebra in which π is
nilpotent.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

§§A4.1, A4.3, A4.7, A4.8, A4.9 (integral Tate modules, first de Rham cohomology, Grothendieck–Messing,
effectivity of polarized formal lifts, Serre–Tate with structures); §§A6.10, A6.11, A6.13
(characteristic polynomials, their Tate-module form, degrees of polarized isogenies).

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

Layer R07.1 (finite flat group schemes and p-divisible groups); §§R07.2.10, R07.2.17, R07.2.20,
R07.2.26 (Dieudonné classification over perfect fields, isogeny classification, the covariant
Dieudonné module and the comparison of conventions, rigidity along nilpotent thickenings).

### From TauCetiRoadmap.VectorBundlesAndIsocrystals

Layer 0, “Ramified coefficient rings and coefficient changes” (the ring `W_O(R)` of an arbitrary
O-algebra R for a finite extension K of ℚ_p with residue field 𝔽_q and uniformizer π, with ghost
components `w_n(x)=Σ_{i≤n} π^i x_i^(q^(n−i))`, its ring operations given by universal integral
polynomials, its functoriality in R, and the strict π-adic lift over a perfect 𝔽_q-algebra with its
Frobenius and Verschiebung); Layer 1, “Finite isocrystals over the completed maximal unramified
coefficient field” (K-isocrystals: finite-dimensional K̆-vector spaces with a bijective σ-semilinear
operator, σ the lift of the q-power Frobenius fixing K, and their morphisms), “Mixed-characteristic
supplier comparison” (`W_O(k)[1/π]≅K̆` for k=𝔽̄_q, intertwining the Frobenius of `W_O(k)` with σ)
and “Dieudonné–Manin classification of finite isocrystals” (slopes normalized by v(π)=1,
decomposition into simple blocks, vanishing of Hom between distinct slopes). These are assumed as
stated there; F, V and `I_O(R)` over an arbitrary O-algebra R (agreeing with that layer's on
perfect 𝔽_q-algebras), and the relative isocrystal of a strict formal O-module, are §0.1.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

§7.6 (PEL Dieudonné comparison and quasi-isogeny groups, used for strict O-linear modules of dimension
one); §10.2 (strict O-module deformations with Drinfeld levels, used at height one for the canonical
rank-one lifts); §§8.3, 8.10 (Tate full faithfulness over finite fields and Honda classification; the
B-linear isogeny classification).

### From TauCetiRoadmap.IgusaVarietiesAndTorsionConcentration

§0.27 (PEL Rapoport–Zink spaces of an unramified local PEL datum, and the unstructured framed
deformation functor, whose formal representability is the first step of §0.2); §0.31 (Drinfeld-level
integral models at a split distinguished place for the signature-(1,n−1) datum, with the CM-type
matching of RSZ20 §4.3).

### From TauCetiRoadmap.AdicSpacesPartIII

Layer F0 (locally noetherian formal schemes, adic and finite-type morphisms, completions); §R2.9 (the
Berthelot generic fibre on Conrad's category FS_C and étaleness of generic fibres).

### From TauCetiRoadmap.SchemeAndStackFoundations

Layer 1 (descent, algebraic spaces and stacks) for the algebraic integral models; Layer 4
(deformations, formal schemes and models) for the local-model charts.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

§1.3 (coherent quotients, Plücker embeddings and the tangent Hom formula of Grassmannians).

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

§§2.7, 2.9 (hermitian lattices, duals and invariant factors; signed hermitian forms over local fields of
odd residue characteristic). Their forms are conjugate-linear in the first argument; they are applied
here to the transposed form H(x,y)=h(y,x) of the Conventions, which has the same isometries, adjoints,
dual lattices, invariant factors and determinant class as h (Conventions, item 9).

### From TauCetiRoadmap.PadicHodgeTheory

§§3.3–3.5 (Fontaine's functors, filtered Frobenius modules, crystalline classification); §8.3 (abelian
varieties and good reduction).

### From TauCetiRoadmap.ShimuraVarieties

§1.7 (compact-open level category); §§2.5–2.7 (Baily–Borel quotients and their algebraization); §4.5
(torus canonical models); §5.10 (main theorem of complex multiplication); §6.7 (canonical models of
abelian type).

### From TauCetiRoadmap.AdelicAlgebraicGroups

§4.1 (weak approximation and torsors) is the section that receives the following contract.

What AdelicAlgebraicGroups must provide (gap:hermitian-local-global): For a CM extension F/F⁺, prove that a global F/F⁺-hermitian space with prescribed real signatures and finite local invariants exists exactly when the invariants satisfy the product formula, and is unique up to isometry.

### From TauCetiRoadmap.ReductiveGroupsPartII

§RG2.3.5 (integral models of stabilizers for classical and Hodge-type groups), which treats lattice
chains for GL and GSp.

What ReductiveGroupsPartII must provide (gap:unitary-multichain-stabilizer): For a quadratic extension of p-adic fields, with p>2 or the extension unramified (for p=2 this is RSZ21 Theorem A.1, p. 37), and a polarized periodic lattice multichain, prove its automorphism group scheme smooth, including the Weil-restricted factors when the ground field is ramified over ℚ_p, and identify it with the corresponding stabilizer group scheme.

### From TauCetiRoadmap.ShimuraCompactifications

§7.3 (the integral toroidal model, the open immersion of the PEL moduli of PELModuli §M2.8 into it
and its stratification by cusp and cone labels; when the datum has no nonzero cusp label the open
stratum is the only one, so the open immersion is surjective and hence an isomorphism), §7.5
(properness of the integral toroidal model for a complete cone system) and §7.18
(quasi-projectivity of the neat PEL moduli of PELModuli §M2.8), all over a base of good primes in the
sense of PELModuli §M0.10. Together, §§7.3 and 7.5 make the PEL moduli proper when its datum has no
nonzero cusp label. §8.7, and §7.6 on a base all of whose
primes are good for the product datum, consume them through finite comparison morphisms from CM-pair
moduli to the PEL moduli of the product A₀×A; §7.6 on a base with a bad prime, §7.7 and §8.4 consume
gap:bad-prime-projectivity through the same kind of finite comparison morphism, into the multichain
moduli that contract names.

What ShimuraCompactifications must provide (gap:bad-prime-projectivity): Pose the PEL moduli problem of PELModuli §M1.7 over an integral base, a localization of the ring of integers of the reflex field or the ring of integers of one of its completions, that contains primes at which ShimuraCompactifications Layer 7 does not apply (primes dividing the discriminant of the PEL order, or primes whose local level is not the stabilizer of a single self-dual lattice), replacing the abelian scheme at each such prime by a multichain of abelian schemes indexed by a polarized lattice multichain of the PEL order and taking the level there to be the stabilizer of that multichain, as in RZ96 Definition 6.9, p. 279; prove that this moduli problem is represented by a separated Deligne–Mumford stack of finite type over the base, at neat level by a quasi-projective scheme through an ample Hodge line, and that it is proper over the base when its generic fibre is proper.

## How to read the build

Layer 0 sets up the local objects every later layer uses: strict formal O-modules, their displays and
duals, representability of framed functors, principal hermitian modules, Mihatsch's relative
comparison and the conjugation of signature conventions. Layers 1–5 build the four local families on Layer 0:
the unramified principal space and its special homomorphisms (Layer 1), the almost self-dual and mixed
spaces (Layer 2, which also uses the rank-one source and special-Hom space of Layer 1), the relative
exotic space (Layer 3), its comparison with the absolute exotic space over an unramified K (Layer 4,
which uses Layer 3), and the Krämer space (Layer 5); the principal, exotic and Krämer families do not
use one another. Layer 6 fixes the
global data: the RSZ group, admissible CM types and their coefficient fields, the integral Eisenstein
and sign conditions, the integral CM moduli at every prime and the lattice levels. Layer 7 builds the
RSZ, exotic and Krämer integral models and transfers the local geometry of Layers 1–5 to them through
the local-model diagram; Layer 8 builds the neat models of LTXZZ22 and the mixed isogeny model. Layer 9
uniformizes the basic loci of the models of Layers 7–8 by the local spaces of Layers 1–5. Each target's
*Needs:* line lists what its statement and its route use, item by item.

## Layer 0: Strict modules, representability and relative unitary conventions

Strict formal O-modules, their O-displays and relative duality; a representability criterion for relative unitary framed functors as formal schemes locally formally of finite type, which Layers 1–5 apply; principal hermitian modules and simultaneous conjugation of signature, source and framing. For unramified L/K and ℚ_p⊂K₀⊂K construct Mihatsch’s relative comparison of supersingular hermitian modules with a signature, using the full P(r,s) determinant and structural-action clause, and apply it to supersingular framings; compare framed deformations and the rank-r Grassmannian local model of relative dimension rs.

### 0.1 Strict formal modules, O-displays and relative duality

Let K be a finite extension of ℚ_p with ring of integers O, uniformizer π and residue field 𝔽_q. Over an O-algebra R in which π is nilpotent, a strict O-module is a p-divisible group X with a strict O-action ι:O→End(X) in the sense of HilbertModularVarietiesAndShimuraCurves §R18.5.4, that is, O acts on Lie X by the structure map O→R; it is formal when X is a formal group. The Witt O-frame of an O-algebra R is (W_O(R),I_O(R),F,V): W_O(R) is the ring of relative O-Witt vectors of R with respect to π, with ghost components w_n; F is the ring endomorphism given by universal integral polynomials and characterized by `w_n(Fx)=w_{n+1}(x)` over π-torsion-free O-algebras; V is the additive map (x₀,x₁,…)↦(0,x₀,x₁,…), so that w_0(Vx)=0 and `w_n(Vx)=π·w_{n−1}(x)` for n≥1; and `I_O(R)=V W_O(R)` is the kernel of w_0:W_O(R)→R. Then FV=π, and V depends on π. An O-display over R is a window over this frame, and strict formal O-modules over R are equivalent to nilpotent O-displays, compatibly with base change; the relative height of X is the rank of its O-display P and its dimension is the rank of P/Q. Over k=𝔽̄_q, regarded as an O-algebra, `W_O(k)[1/π]` is K̆ and the rational O-display (P[1/π],F) of a strict formal O-module X over k is a K-isocrystal, the relative isocrystal of X; its K̆-dimension is the relative height of X. A strict formal O-module is biformal when its dual O-display is again nilpotent; its relative dual X^∨ is the strict O-module of that dual display, and it depends on π; over k=𝔽̄_q, X is biformal exactly when the slopes 0 and 1 do not occur in its relative isocrystal. A polarization (resp. principal polarization) is an isogeny (resp. isomorphism) λ:X→X^∨ with λ^∨=−λ. The relative crystal D_X on O-divided-power thickenings carries the Hodge filtration; deformations along such thickenings correspond to lifts of the filtration, and for principally polarized biformal X to Lagrangian lifts for the perfect alternating pairing on D_X. For a finite totally ramified extension O⊂O′, strict formal O′-modules are equivalent to nilpotent windows over the Lubin–Tate O′-frame, compatibly with duality after rescaling the pairing by a unit of the frame. For a finite unramified extension O⊂O′ of degree f and an O′-algebra R in which π is nilpotent, `A_{O′/O}(R)=(W_O(R),I_O(R),F^f,F^{f−1}V⁻¹)` is an O′-frame, whose windows are the f-O-displays; the map `W_O(R)→W_{O′}(R)` is a strict morphism of O′-frames from it to the Witt O′-frame, so base change δ from f-O-displays to O′-displays is compatible with duality, and the Z/f-grading of the O-display of a strict formal O′-module gives a functor γ from strict formal O′-modules to nilpotent f-O-displays. For noetherian R, γ and δ are equivalences, δ on nilpotent windows. (Mih19, Part III: §10, p. 40; (11.2), Lemma 11.2 and Definition 11.6, pp. 41–42; Definitions 11.7–11.9, Remark 11.11, the crystal paragraph and footnote 8, p. 43; Proposition 12.11, pp. 47–48; §13, Definition 13.1 and Proposition 13.2 with its proof, pp. 48–49.)

Here K, O, π and q are as stated. The Witt O-frame is defined over every O-algebra R, displays and strict modules over O-algebras R in which π is nilpotent, and duals and polarizations for biformal objects only; the equivalences γ and δ of the unramified case are asserted over noetherian O′-algebras R in which π is nilpotent.

*Route.* Take the ring W_O(R), its ghost map and its functoriality in R from VectorBundlesAndIsocrystals Layer 0, “Ramified coefficient rings and coefficient changes”. Define on it, for every O-algebra R, the Frobenius F and the Verschiebung V by the ghost identities above and put `I_O(R)=V W_O(R)=ker w_0`; over a perfect 𝔽_q-algebra these F and V are that layer's Frobenius and Verschiebung. This is the Witt O-frame, whose windows are the O-displays (Mih19 Definition 11.7). Over 𝔽̄_q identify `W_O(k)[1/π]` with K̆ and its Frobenius with σ by VectorBundlesAndIsocrystals Layer 1, “Mixed-characteristic supplier comparison”, so that (P[1/π],F) is a K-isocrystal of that layer's “Finite isocrystals over the completed maximal unramified coefficient field”; its slopes are those of “Dieudonné–Manin classification of finite isocrystals” (Mih19 footnote 8). Deduce the equivalence of strict formal O-modules with nilpotent O-displays from the equivalence between nilpotent displays and formal p-divisible groups (gap:zink-display-equivalence) by the Ahsendorf–Cheng–Zink construction recalled in Mih19 §11.2. Define duals of biformal objects through the dual window, polarizations by λ^∨=−λ, and the relative crystal and Hodge filtration (Mih19 Definitions 11.6, 11.9 and §11.2); prove the Lubin–Tate frame equivalence and its duality compatibility (Mih19 Proposition 12.11 and Lemma 11.2). For O⊂O′ unramified of degree f, the unique lift O′→W_O(R) of the structure map grades the O-display P of a strict formal O′-module as `P_0⊕…⊕P_{f−1}`, strictness puts `P_1,…,P_{f−1}` inside Q, and γ(P) is P_0 with Q_0 and the f-fold composite Frobenius; δ is base change along the strict frame morphism, compatible with duals by (11.2). The composite δ∘γ is the O′-display functor of the first clause for O′ (Mih19 §13, p. 49, recalling Ahsendorf), hence an equivalence on nilpotent objects; the quasi-inverse of γ built from an O′-stable normal decomposition in the proof of Mih19 Proposition 13.2 makes γ, and therefore δ, an equivalence for noetherian R.

**API.**

- For every O-algebra R, F is a ring endomorphism of W_O(R) and V an additive endomorphism, both natural in R, with FV=π, the projection formula V(F(a)·x)=a·V(x) and `I_O(R)=V W_O(R)=ker w_0`.
- The O-display of a strict formal O-module and its quasi-inverse, natural in the base.
- The rank of P is the O-relative height of X of HilbertModularVarietiesAndShimuraCurves §R18.5.4 (rank X[π]=q^(rank P)); by the formula there it is the p-height divided by [K:ℚ_p].
- Over 𝔽̄_q the relative isocrystal (P[1/π],F) is a K-isocrystal of K̆-dimension the relative height; X↦(P[1/π],F) is a fully faithful functor from strict formal O-modules up to quasi-isogeny to K-isocrystals (an F-equivariant map of rational displays, multiplied by a power of π, preserves the lattices P and Q=πF⁻¹P), and the slopes avoid 0 and 1 exactly for biformal X.
- For biformal X the relative dual X^∨, depending on the chosen uniformizer, with biduality.
- Deformations along an O-divided-power thickening correspond to lifts of the Hodge filtration of D_X, Lagrangian lifts in the principally polarized case.
- For O⊂O′ totally ramified, strict formal O′-modules are equivalent to nilpotent Lubin–Tate O′-windows.
- For O⊂O′ unramified of degree f and noetherian R in which π is nilpotent, γ is an equivalence from strict formal O′-modules over R to nilpotent f-O-displays over R, and δ is an equivalence from nilpotent f-O-displays to nilpotent O′-displays over R, compatible with duality.

**Checks.**

- For O=ℤ_p the strictness condition is automatic and an O-display is a display: `μ_{p^∞}` over a perfect field has P of rank 1 with P/Q of rank 1, while the étale ℚ_p/ℤ_p has P/Q=0 and is not a nilpotent display.
- For K=ℚ_p(√p) the Lubin–Tate group is a strict O_K-module of relative height 1; precomposing its action with the nontrivial automorphism of K makes √p act on Lie by −√p, so over R=O_K/(p), where √p≠−√p because p is odd, the twisted module is not strict.
- A strict O-module of relative height 1 and dimension 1 has dual of dimension 0, hence étale, so it is not biformal and has no polarization in this sense; the rank-one sources of Layer 1, Layer 3 and Layer 5 have relative height 2 and dimension 1 and are biformal.
- The first two ghost components are x₀ and `x₀^q+π·x₁`. For O=ℤ_p, π=p they are Mathlib's p-typical ghost components, and F and V are Mathlib's Frobenius and Verschiebung; for K=ℚ_p(√p), π=√p, q=p the second is `x₀^p+√p·x₁`. Over R=𝔽_p, W_O(𝔽_p)=O_K, F is the identity and V is multiplication by √p, with image `I_O(𝔽_p)=(√p)`. Replacing π by −√p replaces V by −V: the coordinate change x_i↦(−1)^i x_i matches the two ghost maps because q is odd, while `w_1(Vx)=π·x₀` changes sign; this is why the dual O-display depends on π (Mih19 Remark 11.11). A Verschiebung normalized with p in place of π would be multiplication by p on O_K, with image (p)=(√p)²⊊(√p), so it would not be invertible onto `I_O(𝔽_p)` and gives no frame.
- For K/ℚ_p unramified of degree 2 and the Lubin–Tate O_K-module over 𝔽̄_p (relative height 1), the relative isocrystal is a K̆-line with a q-Frobenius-semilinear operator, q=p², whereas the Dieudonné isocrystal of the underlying p-divisible group, of height 2, is a plane over K̆=ℚ̆_p with a p-Frobenius-semilinear operator; taking the absolute isocrystal with its K-action as the relative one doubles the dimension.
- For f=1 the frame `A_{O/O}(R)` is the Witt O-frame and γ and δ are the identity. For O=ℤ_p and `O′=W(𝔽_{p²})`, so f=2, a strict formal O′-module of relative height 2 and dimension d has p-typical display P of rank 4=[O′:ℤ_p]·2, graded as P_0⊕P_1 with both pieces of rank 2 and Q=Q_0⊕P_1; its 2-ℤ_p-display (P_0,Q_0) has rank 2 over W(R) with P_0/Q_0 of rank d, and δ of it is an O′-display of rank 2, the relative height. Taking the whole rank-4 display as the f-display would double the relative height, and putting P_1 outside Q would contradict strictness, O′ acting on Lie=P/Q only through the structure map.

*Needs:* PELModuli §M2.15; gap:zink-display-equivalence; FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.1; HilbertModularVarietiesAndShimuraCurves §R18.5.4; EndoscopicTransferAndUnitaryTraceComparison §7.6; VectorBundlesAndIsocrystals Layer 0, “Ramified coefficient rings and coefficient changes”; VectorBundlesAndIsocrystals Layer 1, “Finite isocrystals over the completed maximal unramified coefficient field”, “Mixed-characteristic supplier comparison” and “Dieudonné–Manin classification of finite isocrystals”.

### 0.2 Representability of framed functors

For local EL or PEL data in the sense of RZ96 Definition 3.18 (a semisimple ℚ_p-algebra B, with an involution in the PEL case, a maximal order O_B, a multichain 𝓛 of O_B-lattices, self-dual and periodic in the PEL case, a cocharacter with local reflex field E and a framing object over F̄_p), the functor 𝓜 of RZ96 Definition 3.21 on schemes over Spf O_Ĕ on which p is locally nilpotent, of 𝓛-sets of p-divisible groups with O_B-action satisfying the Kottwitz condition, in the PEL case with the polarizations prescribed by 𝓛, and a framing quasi-isogeny over the special fibre, is represented by a formal scheme locally formally of finite type over Spf O_Ĕ. Consequently, for a quadratic extension L/K and a biformal framing object 𝕏 with O_L-action over the residue field of O_L̆, every relative unitary framed functor is represented by a separated formal scheme locally formally of finite type over Spf O_L̆ (O_L̆=O_K̆ when L/K is unramified). Here a relative unitary framed functor is a subfunctor of the EL functor 𝓜 for B=L, O_B=O_L and a single lattice, applied to the underlying p-divisible group of 𝕏 with its O_L-action, cut out by finitely many conditions of the following kinds: closed conditions (the strictness of §0.1; a determinant, Eisenstein or wedge equation on Lie X; that the lift to X of the relative quasi-polarization pulled back from 𝕏 along the framing is an isogeny; a kernel condition on that lift); open and closed conditions (a height or a degree); open conditions on Lie X at geometric points; and the adjunction of an O_L-stable locally direct summand of Lie X cut out by closed conditions in a Grassmannian bundle. The subfunctor of a product of two relative unitary framed functors cut out by the condition that the lift of a fixed framing quasi-isogeny between objects built from the two universal objects is an isogeny with a prescribed kernel condition is again represented by a separated formal scheme locally formally of finite type over Spf O_L̆, closed in the product. The relative polarization is a quasi-isogeny from X to its relative dual X^∨ of §0.1, not to the Cartier dual of the underlying p-divisible group, so these functors are not PEL functors of RZ96 for their underlying groups; every point is biformal, its special fibre being quasi-isogenous to the biformal 𝕏, so X^∨ exists over the whole functor. Layers 1, 2, 3 and 5 apply this criterion to their framed functors (§§1.2, 2.2, 2.4, 3.3, 5.3 and 5.7). None of these formal schemes is asserted to be quasi-compact or to carry the p-adic topology. (RZ96, Proposition 2.9, p. 52; Theorem 2.16, p. 54; Definition 3.18, p. 77; Definition 3.21, pp. 81–82; Theorem 3.25 and its proof, p. 88.)

The relative unitary criterion assumes p>2 and a biformal framing object; the general statement takes the data of RZ96 Definition 3.21.

*Route.* Represent the unstructured functor of framed p-divisible groups (RZ96 Theorem 2.16; it is the unstructured functor of IgusaVarietiesAndTorsionConcentration §0.27) and cut out the O_B-stable locus and the 𝓛-set conditions as closed subfunctors; the Kottwitz condition is closed (RZ96 proof of Theorem 3.25). For the relative functors start from the EL functor: strictness and the determinant, Eisenstein and wedge conditions are closed conditions on Lie of the absolute p-divisible group with its O_L-action. Impose the relative polarization through the relative dual of §0.1, not the Cartier dual: by Drinfeld rigidity the quasi-isogeny ρ^∨∘λ_𝕏∘ρ over the special fibre lifts uniquely to a quasi-isogeny λ:X→X^∨ over the base; that λ is an isogeny is a closed condition (RZ96 Proposition 2.9), and each kernel condition says that a quasi-isogeny built from λ (λ itself for a principal polarization, λ∘i(u)⁻¹ for the exotic kernel X[i(u)], ϖλ⁻¹ for an almost self-dual kernel inside X[ϖ]) is an isogeny of prescribed degree, a closed condition followed by an open and closed one; when the framing is to preserve the polarization only up to O_K^×, the lift is required to be principal and arrows allow O_K^×-multiples. The height condition is open and closed. Add a filtration of Lie X as a closed subscheme of a Grassmannian bundle and a nonvanishing condition on Lie X at geometric points as an open condition. For a subfunctor of a product, the fixed framing quasi-isogeny lifts uniquely by rigidity, and that the lift is an isogeny with the prescribed kernel is closed by RZ96 Proposition 2.9. Separatedness follows from rigidity of quasi-isogenies.

**Checks.**

- For L/K unramified, the relative unitary framed functor of strict O_L-modules of relative height 2, dimension 1 and signature (1,0) with principal relative polarization and height-zero framing (the functor N_1 of §1.1) is Spf O_L̆ (LZ22 §2.2): the strict O_L-action leaves no deformation parameter, whereas the unstructured deformation space of the underlying p-divisible group, of height 2[K:ℚ_p] and dimension 1 (forgetting the action keeps the Lie algebra), has 1·(2[K:ℚ_p]−1)=2[K:ℚ_p]−1 parameters; a dimension [K:ℚ_p] would give [K:ℚ_p]² and confuse the underlying group with the different object that §0.4 produces.
- A relative polarization is not a polarization of the underlying p-divisible group. For K/ℚ_p totally ramified of degree 2, the rank-one source of §1.3 (relative height 2, dimension 1) has underlying p-divisible group of height 4 and dimension 1, whose Cartier dual has dimension 4−1=3, while its relative dual has relative height 2 and dimension 2−1=1; a principal relative polarization is therefore not an isomorphism with the Cartier dual, and the relative functors are cut out of the EL functor, not of the PEL functor of their underlying groups.
- The spin condition is open, not closed: imposing only the closed conditions on the exotic functor adds the locus where i(u) acts by zero on Lie at some geometric point.
- For the same data in relative height 4, dimension 2 and signature (1,1) (the functor N_2 of §1.1), the completed local ring at a point is O_L̆[[t]], whose ideal of definition contains t; the topology is not the p-adic one.
- IgusaVarietiesAndTorsionConcentration §0.27 is the case of an unramified datum with a single self-dual lattice; the almost self-dual chain Λ⊂Λ^♯ of Layer 2, with Λ^♯/Λ of length one, and the ramified data of Layer 3 and Layer 5 lie outside it.

*Needs:* §0.1; IgusaVarietiesAndTorsionConcentration §0.27 (unstructured framed functor); AdicSpacesPartIII Layer F0; SchemeAndStackFoundations Layer 4; AbelianSchemesAndArithmeticModuli §A4.7; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.26.

### 0.3 Strict polarized unitary modules

For a quadratic extension L/K of p-adic fields with p odd, fix an embedding L into the completed maximal unramified extension L̆. A principal hermitian O_L-module of signature (r,s), r+s=n>0, is a strict formal O_K-module X of relative K-height 2n and dimension n, with O_L-action i and principal relative polarization λ satisfying λ i(a)=i(ā)^∨ λ and det(T−i(a)|Lie X)=(T−a)^r(T−ā)^s for every a∈O_L. Strictness refers to the O_K-action on the Lie algebra. The absolute p-height is 2n[K:ℚ_p]. The relative dual and polarization are those of §0.1; they depend on the chosen uniformizer of K and are not the absolute Cartier dual. (Mih19, Definitions 2.2 and 2.8, pp. 7, 9 (unramified quadratic case); Appendix §11, pp. 41–43 (strict modules and duality); LL22 Definition 2.1, pp. 9–10 (ramified conventions).)

This target assumes that p>2, L/K is quadratic, r and s are nonnegative and n=r+s>0. All local moduli are evaluated on locally noetherian schemes over the completed maximal unramified coefficient ring on which the residue characteristic is locally nilpotent; reduction means the scheme cut out by the uniformizer, not the reduced scheme.

*Route.* Specialize §0.1 to O=O_K, keeping the structural O_K-action on Lie X. Impose the two-embedding determinant equation and the relative adjoint equation; inherit base change and isomorphisms from §0.1. Record the absolute-height conversion of HilbertModularVarietiesAndShimuraCurves §R18.5.4; forgetting the O_K-action keeps Lie X, so the dimension stays n.

**API.**

- A strict formal O_K-module with an O_L-action, a principal relative polarization and the two displayed equations is a principal hermitian module; isomorphisms are O_L-linear isomorphisms preserving λ.
- For relative height 2n and dimension n, the underlying p-divisible group has p-height 2n[K:ℚ_p] and dimension n.
- Base change preserves strictness, signature and relative polarization; identity and iterated base changes have canonical compatible isomorphisms.
- For every a∈O_L the existing finite-free characteristic polynomial on Lie X is the stated two-factor polynomial.

**Checks.**

- For [K:ℚ_p]=2 and n=3 the relative height is 6 and absolute height 12; the dimension is 3 for the strict module and for its underlying p-divisible group, not 3[K:ℚ_p]=6.
- For n=1, signature (1,0) gives Lie action a, while signature (0,1) gives ā.
- An action whose adjoint fixes a with a≠ā fails the polarization condition.
- An unramified quadratic extension with K ramified over ℚ_p still has relative height 2n.
- The polarization adjoint is conjugation on O_L.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.1; §0.1; HilbertModularVarietiesAndShimuraCurves §R18.5.4; PELModuli §M0.18; Mathlib `LinearMap.charpoly`.

### 0.4 Mihatsch relative comparison

Suppose L/K is unramified quadratic and ℚ_p⊂K₀⊂K. A hermitian O_L–O_K₀-module over a scheme over Spf O_L̆ is a supersingular strict formal O_K₀-module X (all relative slopes 1/2) with an O_L-action i and a principal relative polarization λ of §0.1 (for O=O_K₀) such that λ⁻¹i(a)^∨λ=i(ā); it has rank n when its K₀-relative height is 2n[K:K₀], and its dimension is then n[K:K₀]. On locally noetherian schemes over Spf O_L̆ on which p is locally nilpotent, construct Mihatsch’s equivalence C from the stack of hermitian O_L–O_K₀-modules that have a signature (Zariski locally on the base they satisfy the condition P(r,s) below, with its structural-action Eisenstein clause, for some (r,s)) to the stack of supersingular principal hermitian O_L-modules of §0.3 that have a signature, sending signature (r,s) to signature (r,s). Supersingularity is part of the carrier, as in the source: C is built from O-displays and relative duals, which exist only for formal, resp. biformal, objects (§0.1). For K/K₀ unramified of degree f, contract the embedding-graded display by a full Frobenius round trip; the result is a principally polarized f-O_K₀-display with O_L-action, which the base change δ of §0.1 (O=O_K₀, O′=O_K) turns into a principally polarized strict formal O_K-module. For K/K₀ totally ramified, lift the pairing through the inverse-different trace, pass through the Lubin–Tate frame and rescale by the frame-change unit. Compose along the unramified/totally ramified factorization. C is compatible with Rosati adjoints and polarized quasi-isogenies. Write Ψ for the K₀-embeddings of the maximal subfield Lᵘ⊂L unramified over K₀, split into conjugate halves Ψ₀,Ψ₁ with distinguished ψ₀∈Ψ₀. Put `P₀₁(a;T)=∏_{ψ∈Ψ₁}ψ(charpoly_{L/Lᵘ}(a;T))`, P₁₀=P₀₁(T−a)/(T−ā), and P(r,s)=P₁₀^r P₀₁^s; the indicated quotient is polynomial. Require this characteristic polynomial on Lie and `(i(a)−a)|Lie_{ψ₀}=0` for every a∈O_L. This last zero-endomorphism equation is part of the input. The condition P(r,s) concerns only Lie X with its O_L-action, so it is defined for every p-divisible group with O_L-action over such a base, formal or not; for the global signatures whose Lie ranks it matches, §6.5 identifies it with the Eisenstein condition imposed on abelian schemes at every point, where C is not used. On the O_K₀ side the relative height and dimension are 2n[K:K₀] and n[K:K₀]; the strict O_K side has height 2n and dimension n. C changes the p-divisible group: the strict O_K₀-module underlying C(X) has K₀-relative height 2n[K:K₀] but dimension n, so C(X) is not X with its action restricted or forgotten. (Mih19, Definition 2.2 and its footnote 3 (supersingularity), p. 7; Definitions 2.7–2.8, pp. 8–9; the opening of §3 (the lift of the pairing through a generator of the inverse different), p. 11; Definition 3.2 and Theorem 3.3, p. 12; Propositions 3.4 and 3.6, Lemma 3.9 and Corollary 3.10, pp. 12–18.)

*Route.* Use the O-display, f-O-display and Lubin–Tate window equivalences of §0.1 and normal decompositions. In the totally ramified case keep the inverse-different generator and the unit correcting the change of frame. Identify contracted Hodge crystals and homomorphism lifting across square-zero thickenings, then induct along the nilpotent nilradical of a noetherian base.

**API.**

- C(X) carries an O_L-action and a relative principal polarization transported from those of X, and has signature (r,s) when X has signature P(r,s).
- The display reconstruction is a quasi-inverse, with unit and counit natural on the nilpotent base category.
- C(f†)=C(f)† for polarized quasi-homomorphisms.
- The equivalence commutes with coefficient/base changes allowed by its chosen embeddings and frame data.

**Checks.**

- For K₀=K choose the identity frame data; C is naturally the identity.
- For [K:K₀]=e f, contraction divides the K₀-relative height 2n e f to K-relative height 2n.
- An absolute Lie action satisfying only multiplicity ranks but violating the structural-action clause is not an input to C.
- The comparison applies when K/ℚ_p is ramified; this is distinct from the exotic comparison in Layer 4.
- On the relative side the height is 2n, not the absolute height.
- The domain of C is cut out by supersingularity, not by failure of μ-ordinarity, so whether a μ-ordinary object is an input of C depends on the signature. Take K₀=K=ℚ_p and `L=ℚ_{p²}`, where C is the identity. For signature (r,s) the Hodge cocharacters at the two embeddings of L are (1^r,0^s) and (1^s,0^r); Frobenius interchanges them, and the μ-ordinary slopes are their average: slope 1 with multiplicity min(r,s), slope 1/2 with multiplicity |r−s| and slope 0 with multiplicity min(r,s), each slope taken twice, 2n slopes in all. So the μ-ordinary object is supersingular, hence an input of C, exactly when rs=0. At n=1 and signature (1,0) the average is 1/2: the μ-ordinary object is the supersingular module 𝔈 of §1.3, of height 2 and dimension 1, and C(𝔈)=𝔈. At n=2, the μ-ordinary principally polarized p-divisible group with O_L-action of signature (1,1) is the product of an étale and a multiplicative O_L-module of O_L-height 1: its slopes are 0,0,1,1 and its étale part has height 2, so it is not formal, has no nilpotent O-display (§0.1) and is not supersingular. The ordinary and μ-ordinary points of the global models of Layer 7 are handled through the Grothendieck–Messing local-model diagram of §7.5, which uses the Lie condition of §6.5 and not C.
- C changes the dimension, which forgetting an action never does: for K₀=ℚ_p, K/ℚ_p totally ramified of degree 2 and n=1, a hermitian O_L–ℤ_p-module has height 4 and dimension 2, while C(X) has relative height 2 and dimension 1 and its underlying p-divisible group has height 4 and dimension 1.

*Needs:* §0.3; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10; AbelianSchemesAndArithmeticModuli §A4.7.

### 0.5 Equivariance and deformation comparison

With the data of §0.4 and a fixed polarized supersingular framing, C induces an isomorphism of the height-zero framed moduli functors and their formally locally finite type representing spaces, equivariant for the quasi-isogeny group identified through C. C identifies the relevant Hodge filtrations and the condition that an O_L-linear homomorphism lifts across a square-zero thickening. (Mih19, Theorem 3.1 and its proof, pp. 11–12, 18; Lemma 3.9 and Corollary 3.10, pp. 17–18.)

*Route.* Choose an identification of C of the absolute framing with the relative framing. Transport every framing quasi-isogeny using the unit/counit and identify quasi-isogeny actions by conjugation. Use the Hodge-crystal comparison for infinitesimal compatibility and Yoneda for the representing isomorphism.

**Checks.**

- The result is an isomorphism of formal spaces, not just of geometric point sets.
- The isomorphism depends on the chosen identification of C(𝕏) with the relative framing: changing it by a polarized self-quasi-isogeny g of the relative framing composes the isomorphism with the action of g, and conjugates the identification of the two quasi-isogeny groups by g; a version independent of the identification would be false whenever g is not central.

*Needs:* §0.4; §0.2.

### 0.6 Relative unitary Grassmannian chart

For unramified quadratic L/K, intermediate K₀⊂K and the signature P(r,s) with structural-action clause on the distinguished maximal-unramified L-embedding summand, the polarized local-model functor is the Grassmannian of rank-r quotients of a free rank-n module on that summand. The remaining Hodge submodules are fixed on banal summands and determined by orthogonal complement on the conjugate summand. It is smooth of relative dimension rs, including when K/K₀ is ramified. (Mih19, Definition 2.11 and Proposition 2.12, pp. 9–10.)

*Route.* Use the embedding decomposition and actual structural-action equation, not just multiplicities. Keep the distinguished quotient, fix the banal summands, and reconstruct the conjugate summand by the perfect pairing. Identify the two functors and apply the imported Grassmannian graph charts and tangent formula.

**API.**

- The local model is the functor on schemes S over Spec O_L̆ of O_L-stable Lagrangian subbundles F of D⊗O_S, where D is the free module of rank n over `O_L ⊗_{O_{K₀}} O_L̆` with its split perfect alternating pairing for which the O_L-action is adjoint to its conjugate, such that the O_L-action on the quotient D⊗O_S/F satisfies the characteristic-polynomial condition (i) for P(r,s) and the structural-action clause (ii) on the distinguished summand; it is a closed subfunctor of the Grassmannian of O_L-stable Lagrangian subbundles of D (Mih19, Definition 2.11, p. 9).
- The subfunctor cut out by clause (ii) and the rank conditions (i′) on the embedding-graded pieces of the quotient (zero on the banal summands of the chosen half-system, full on the banal summands of its conjugate, r on the distinguished summand and the complementary rank on its conjugate; Mih19, Lemma 2.10, p. 9) is a closed subscheme isomorphic to the Grassmannian of rank-r quotients of the free rank-n O_L̆-module obtained from the distinguished summand of D by the structural action, the banal pieces being forced and the conjugate piece the orthogonal complement of the distinguished one. It contains the local model, the two have the same generic fibre, and they coincide (Mih19, Proposition 2.12 and its proof, pp. 9–10). The Grassmannian is the R-points functor of `Module.Grassmannian` of the Mathlib contract, represented over Spec O_L̆ by Tau Ceti's `Module.Grassmannian.scheme` of the free O_L̆-module of rank n with k=r; its smoothness of relative dimension rs is AlgebraicModuliForArithmeticGeometry §1.3.
- The local model is integral and smooth over Spec O_L̆ of relative dimension rs, and its relative tangent space at a point is the module of homomorphisms from the rank-s kernel to the rank-r quotient on the distinguished summand (Mih19, Proposition 2.12, p. 9; the tangent formula of AlgebraicModuliForArithmeticGeometry §1.3).
- For a hermitian O_L–O_K₀-module over a scheme over Spf O_L̆, the Hodge filtration of its relative Dieudonné crystal D_X of §0.1 is, Zariski locally after trivializing the crystal by a basis adapted to the embedding grading, a point of the Lagrangian Grassmannian of D, and the module has signature (r,s) exactly when that point lies in the local model; this is the chart through which §0.4 and §1.2 compute deformations (Mih19, Lemma 2.13 and the proof of Lemma 2.10, pp. 9–10).

**Checks.**

- At (r,s)=(1,n−1) the dimension is n−1.
- At r=0 or s=0 the local model is the base.
- Replacing the characteristic-polynomial condition (i) by the rank conditions (i′), keeping clause (ii), does not change the functor: the subfunctor so defined is the integral smooth Grassmannian of the second API bullet, it contains the local model because (i) evaluated on the maximal unramified subring of O_L over O_K₀ forces the ranks of the graded pieces, and the two have the same generic fibre (Mih19, Proposition 2.12, pp. 9–10). A definition that only recorded multiplicities of embeddings, without the equality of generic fibres, would not know that (i) imposes nothing beyond (i′) integrally.
- Clause (ii) is not implied by (i) when K/K₀ is ramified. Take K₀=ℚ_p, K=ℚ_p(√p), n=2, (r,s)=(2,0) and S the spectrum of the residue field k. The local model has a single k-point, the subbundle whose distinguished part is the image of √p, on whose rank-2 quotient √p acts by zero, as clause (ii) demands since the structural image of √p vanishes in k. The O_L-stable Lagrangian F whose distinguished part is the second coordinate copy of `O_L ⊗_{O_{K₀}} k` inside the free rank-2 module, with conjugate part forced by the pairing, has a rank-2 quotient on which √p acts as a nonzero square-zero nilpotent; for every a in O_L both sides of (i) equal `(t − a₀)²(t − ā₀)²` in k[t], where a₀ and ā₀ are the images of a under the two residue embeddings, so F satisfies (i) and the rank conditions (i′) but not (ii). A definition without clause (ii) therefore has a larger special fibre; when K/K₀ is unramified clause (ii) is automatic (Mih19, Remark 2.9, p. 9).

*Needs:* §0.4; §0.1; Tau Ceti `Module.Grassmannian.scheme`; AlgebraicModuliForArithmeticGeometry §1.3; AbelianSchemesAndArithmeticModuli §A4.7.

### 0.7 Comparison of signature conventions

Precomposing i with the nontrivial automorphism of L/K gives an involutive equivalence between principal hermitian modules of signatures (r,s) and (s,r), carrying λ and every polarized framing along the same relabelling. Thus Zhang21 signature (n−1,1) and LZ22 signature (1,n−1) define corresponding spaces only after conjugating both the O_L-action and the rank-one source; the underlying p-divisible group is unchanged. (Zhang21, §3.1, equations (3.1)–(3.6), pp. 879–881; compare LZ22 §2.1, p. 10.)

*Route.* Substitute ā in the determinant and Rosati equations. Conjugate source and framing actions as well; verify equivariance of quasi-isogenies. Apply conjugation twice to obtain the identity equivalence.

**Checks.**

- For n=1 the two rank-one Lie characters are interchanged.
- Conjugating the target from signature (1,n−1) to (n−1,1) while keeping the rank-one source 𝔈̄ of signature (0,1) pairs the target with a source of the wrong signature: in the conjugated convention the source is 𝔈 of signature (1,0), as in §1.4, and the special-Hom space is formed from it.
- At n=3 the equivalence sends signature (1,2) to (2,1): with i′(a)=i(ā), det(T−i′(a)|Lie X)=(T−ā)(T−a)² replaces (T−a)(T−ā)², while the relative height 6, the dimension 3 and λ are unchanged, and λi′(a)=λi(ā)=i(a)^∨λ=i′(ā)^∨λ is again the polarization relation. An operation that changed λ or the height would not be this equivalence.

*Needs:* §0.3.

### Examples

- Heights. Take K=ℚ_p(√p), so [K:ℚ_p]=2, L/K unramified quadratic and n=3. A principal hermitian O_L-module of signature (1,2) has relative height 6 and dimension 3 as a strict O_K-module, and its underlying p-divisible group has height 12 and dimension 3. The absolute height 6 is the height of a different carrier. When the module is supersingular, the inverse of the comparison C of §0.4 with K₀=ℚ_p attaches to it a hermitian O_L–ℤ_p-module of height 12 and dimension n[K:ℚ_p]=6: a different p-divisible group, not the underlying one.
- Deformation parameters. For the same K and n=1, the unstructured deformation space of the underlying p-divisible group (height 4, dimension 1) has 1·(4−1)=3 parameters, whereas N_1=Spf O_L̆ has none: the strict O_L-action removes all three.
- Relative comparison. For K₀=ℚ_p and K/ℚ_p unramified of degree f=2, a supersingular O_L–ℤ_p-hermitian module of signature (1,1) in the sense of §0.4 has height 2n[K:K₀]=8 and dimension 4; the comparison C sends it to a strict O_K-module of relative height 4 and dimension 2, whose underlying p-divisible group has height 8 and dimension 2.
- Local model. At (r,s)=(1,2) the local model of §0.6 is the Grassmannian of rank-one quotients of a free module of rank 3, the projective plane, of relative dimension rs=2.

### Dependencies

Within this roadmap: none; this is the first layer.

Suppliers: PELModuli §M2.15, §M0.18; FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.1, §R07.2.26, §R07.2.10; HilbertModularVarietiesAndShimuraCurves §R18.5.4; EndoscopicTransferAndUnitaryTraceComparison §7.6; IgusaVarietiesAndTorsionConcentration §0.27 (unstructured framed functor); AdicSpacesPartIII Layer F0; SchemeAndStackFoundations Layer 4; AbelianSchemesAndArithmeticModuli §A4.7; AlgebraicModuliForArithmeticGeometry §1.3; VectorBundlesAndIsocrystals Layer 0, “Ramified coefficient rings and coefficient changes”, and Layer 1, “Finite isocrystals over the completed maximal unramified coefficient field”, “Mixed-characteristic supplier comparison” and “Dieudonné–Manin classification of finite isocrystals”; Mathlib `LinearMap.charpoly`; Tau Ceti `Module.Grassmannian.scheme`.

Supplier contracts: gap:zink-display-equivalence (see Exact supplier contracts).

## Layer 1: Unramified unitary formal moduli

Construct the exact-polarization height-zero unitary framed functor for unramified quadratic L/K, p>2, signature (1,n−1); prove formal smoothness of dimension n−1. Construct its canonical principal rank-one source, nonsplit Hermitian special-Hom space, rank-raising closed immersion and equivariant diagonal graph, keeping relative and arithmetic dimensions distinct.

### 1.1 Unramified unitary framed functor

Fix a supersingular principally polarized strict hermitian O_L-module 𝕏 of signature (1,n−1). N_n(S) consists of (X,i,λ,ρ), with X of the same type and ρ a height-zero O_L-linear quasi-isogeny from the restriction of X to the closed subscheme S̄⊂S cut out by the uniformizer to the base change of 𝕏 to S̄, such that ρ*λ_𝕏=λ over S̄. Arrows are O_L-linear isomorphisms preserving λ and commuting with ρ. The exact polarization normalization selects this component; a moduli problem allowing arbitrary similitude factors is a different functor. (LZ22, §2.1, p. 10; compare Zhang21 §3.1, pp. 879–881.)

This target assumes that L/K is unramified quadratic, p>2 and n≥1; its bases lie in Nilp (see Conventions), and a supersingular framing of the indicated signature and polarization is fixed.

*Route.* Form the structured p-divisible-group groupoid and reduce only the framing map. Use quasi-isogeny rigidity for descent and to kill automorphisms fixing ρ. Transport along §0.7 when the opposite convention is required.

**API.**

- A point of N_n over S is the same as (X,i,λ) of signature (1,n−1) over S with a height-zero polarized framing over the subscheme cut out by the uniformizer.
- Forgetting the framing gives the underlying principal hermitian module (X,i,λ).
- Pullback gives a nilpotent-base functor, with canonical identity and composition isomorphisms.
- A polarized O_L-linear isomorphism commuting with ρ determines the arrow; an automorphism inducing identity under ρ is identity.

**Checks.**

- For n=1 the deformation has no relative parameters; its representing space is Spf O_L̆.
- An O_L-linear quasi-isogeny of nonzero height does not define a point of N_n.
- Replacing λ by cλ with c≠1 while fixing ρ fails the exact polarization equation.

*Needs:* §0.3; §0.2.

### 1.2 Representability and smoothness

The functor N_n is represented by a separated formal scheme locally formally of finite type over Spf O_L̆, formally smooth of relative dimension n−1. The topology is the representing Rapoport–Zink topology, not an assertion that the whole space is quasi-compact or p-adic. (LZ22, §2.1, p. 10; RZ96 Theorem 3.25, p. 88.)

This target assumes that L/K is unramified quadratic, p>2 and n≥1; its bases lie in Nilp (see Conventions), and a supersingular framing of the indicated signature and polarization is fixed.

*Route.* Apply §0.2 to the polarized height-zero component. Use strict-module Grothendieck–Messing theory: the unramified two-character Hodge filtration is determined by a line in a rank-n summand. The local Grassmannian is smooth of dimension n−1; descend formal charts.

**Checks.**

- For n=1 obtain Spf O_L̆.
- For n=2 completed local charts at geometric points have one formally smooth parameter.

*Needs:* §1.1; AbelianSchemesAndArithmeticModuli §A4.7; §0.2; PELModuli §M2.12; §0.6.

### 1.3 Canonical rank-one source

For a fixed supersingular signature-(1,0) principal module 𝔈, construct its unique deformation ℰ over O_L̆ with framing. Conjugating the O_L-action gives ℰ̄ of signature (0,1), and its special fibre 𝔈̄. Uniqueness is in the framed groupoid; changing the framing is retained as an automorphism-group action. (LZ22, §2.2, p. 11.)

*Route.* Apply the dimension-zero deformation calculation to n=1. Glue the unique compatible Artin-level lifts using formal representability. Conjugate the integral action and framing.

**API.**

- The framed signature-(1,0) module 𝔈 has a framed lift ℰ over O_L̆, unique up to unique isomorphism.
- Conjugation yields signature (0,1) and preserves the principal polarization.
- Every framed deformation is uniquely isomorphic to the base change of ℰ.

**Checks.**

- Both ℰ and ℰ̄ have relative height 2 and dimension 1.
- Conjugating twice recovers the framed lift.
- The Lie action on ℰ̄ is conjugate to the structural embedding.

*Needs:* §1.2; §0.7; EndoscopicTransferAndUnitaryTraceComparison §§7.6, 10.2.

### 1.4 Rank-raising framed embedding

After fixing `𝕏_{n+1}=𝕏_n×𝔈̄` and product principal polarization, define `δ:N_n→N_{n+1}` by X↦X×ℰ̄, with product action, polarization and framing. Its signature is (1,n), and δ is a closed immersion. Under conjugate Zhang conventions the added source is ℰ of signature (1,0). (LZ22, §2.11, equation (2.11.0.1), p. 15; Zhang21 §3.1, equation (3.2), p. 880.)

*Route.* Form products of strict modules and check that signatures add. Recover the fixed factor by its integral projection; its liftability cuts out a closed subfunctor. Use rigidity of quasi-isogenies and §0.2 to identify the closed immersion.

**API.**

- δ is defined once the identification `𝕏_{n+1}=𝕏_n×𝔈̄` of framings is fixed, and changing that identification changes δ by the corresponding framing isometry.
- The product construction commutes with base change.
- The pullback object carries λ_X×λ_ℰ̄, not a rescaled second factor.

**Checks.**

- At n=1 the product has signature (1,1) and relative height 4.
- Adding ℰ instead of ℰ̄ in the (1,n−1) convention gives signature (2,n−1)≠(1,n) for every n≥1; already at n=1 it gives (2,0) instead of (1,1).
- For a deformation on the target, membership is equivalent to lifting the specified fixed direct factor and its orthogonal projection.

*Needs:* §1.3; §1.1; §1.2; AbelianSchemesAndArithmeticModuli §A4.7.

### 1.5 Unramified Hermitian special Hom space

Set `V_n=Hom^0_{O_L}(𝔈̄,𝕏)`, with h(x,y)=λ_𝔈̄^−1 y^∨ λ_𝕏 x, viewed as an element of L through `End^0_{O_L}(𝔈̄)=L`. Use the convention linear in x and conjugate-linear in y. This is an n-dimensional nonsplit nondegenerate L/K-Hermitian space; composition identifies U(V_n) with the O_L-linear polarized self-quasi-isogenies of 𝕏. (LZ22, §2.2, p. 11.)

*Route.* Identify Hom^0 with the L-linear maps of the relative isocrystals of §0.1, both isoclinic of slope 1/2, and compute its rank by the Dieudonné–Manin classification of K-isocrystals, or through the absolute rational Dieudonné classification of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10 with the O_K-action. Apply the Rosati equation to prove sesquilinearity and Hermitian symmetry. Calculate the determinant invariant of the supersingular framing; faithful action on Hom identifies the isometry group.

**API.**

- On V_n, h(x,y)=λ_𝔈̄⁻¹y^∨λ_𝕏x is an L-valued pairing on rational homomorphisms.
- h(ax,by)=a h(x,y) b̄ and h(y,x) is the L/K-conjugate of h(x,y).
- Composition induces an isomorphism from framing isometries to U(V_n).
- An isometry g acts on N_n by ρ↦g∘ρ, with (gh) acting as g after h.

**Checks.**

- For n=2 the L-dimension is 2, while the framing has relative height 4.
- Replacing 𝔈̄ by 𝔈 without conjugating the framing is not the declared special-Hom convention.
- For a∈L with a ā=1, scalar composition is an isometry and acts through the same quasi-isogeny on ρ.

*Needs:* §1.3; PELModuli §M0.22; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10; VectorBundlesAndIsocrystals Layer 1, “Finite isocrystals over the completed maximal unramified coefficient field” and “Dieudonné–Manin classification of finite isocrystals”; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9.

### 1.6 Unitary diagonal graph

For n≥2 and the chosen recursive framings, let `δ:N_{n−1}→N_n` be §1.4 and set `Δ=(id,δ):N_{n−1}→N_{n−1}×N_n`. It is a closed immersion, equivariant for the diagonal copy of `U(V_{n−1})` through the fixed unit-vector inclusion `V_{n−1}→V_n`. Its image has relative dimension n−2 in an ambient product of relative dimension 2n−3. In the arithmetic dimension convention including the coefficient DVR, its dimension n−1 is half the ambient dimension 2n−2; this distinction is retained for consumers. (Zhang21, §3.1, equations (3.3)–(3.6), pp. 880–881.)

*Route.* Take the graph of the closed product-embedding map. Use the chosen unit-vector summand to verify diagonal equivariance of its two components. Compute relative and absolute dimensions separately.

**API.**

- Δ=(id,δ) is a closed immersion, being the graph of δ into a separated target.
- The first projection restricted to Δ is the identity on `N_{n−1}`.
- The second projection restricted to Δ is δ.
- The graph action is compatible with the diagonal subgroup inclusion determined by the unit vector.

**Checks.**

- For n=2 the graph has relative dimension zero in relative dimension one.
- For n=3 absolute dimensions are 2 and 4, while relative dimensions are 1 and 3.
- The graph uses the canonical conjugate rank-one factor in the (1,n−1) convention.

*Needs:* §1.4; §1.5; §1.2; §0.2.

### Examples

- Dimensions of the graph. For n=4, Δ:N_3→N_3×N_4 has image of relative dimension 2 in an ambient space of relative dimension 2+3=5; counting the coefficient DVR, the dimensions are 3 and 6, and only the second count gives "half the ambient dimension".
- Rank raising. δ:N_2→N_3 sends a point of signature (1,1) to one of signature (1,1)+(0,1)=(1,2), and relative dimension 1 to relative dimension 2; adding ℰ instead of ℰ̄ would give (2,1).
- Rank one. For n=1, V_1 is a hermitian line, U(V_1) is the group of a∈L^× with aā=1, and it acts on the one-point formal scheme N_1=Spf O_L̆ through framing automorphisms.

### Dependencies

Within this roadmap: Layer 0 (§0.1, §0.2, §0.3, §0.6, §0.7).

Suppliers: AbelianSchemesAndArithmeticModuli §A4.7; PELModuli §M2.12, §M0.22; EndoscopicTransferAndUnitaryTraceComparison §§7.6, 10.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10; VectorBundlesAndIsocrystals Layer 1, “Finite isocrystals over the completed maximal unramified coefficient field” and “Dieudonné–Manin classification of finite isocrystals”; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9.

## Layer 2: Almost self-dual and mixed moduli

For n≥2 define the signature-(1,n−1) framed functor with polarization kernel killed by ϖ of order q², and prove flat regular semistable geometry over its natural coefficient ring. Construct its split Hermitian special-Hom space and the mixed isogeny functor using the conjugate source ℰ̄, fixed rational framing, unique lift and pullback λ_Y×ϖλ_ℰ̄. Prove the first projection generically finite étale of degree q+1 and the second generically an isomorphism onto the special divisor Z(x₀) of §2.4; the local isogeny degree is q².

### 2.1 Almost self-dual framed functor

N_n^1(S) classifies signature-(1,n−1) strict hermitian O_L-modules Y with relative polarization λ whose kernel is contained in Y[ϖ] and is finite locally free of order q², and a height-zero framing ρ to 𝕐 with ρ*λ_𝕐=λ. Here ϖ is a uniformizer of K and q=#k_K. Keep the kernel containment and its order as independent clauses; this is not the principal-polarization functor. (LZ22, §10.1, pp. 63–64; Cho18 Theorem 1.2, p. 4.)

This target assumes the local field conditions of Layer 1 and n≥2, and fixes a supersingular signature-(1,n−1) framing 𝕐 with the polarization kernel specified in §2.1.

*Route.* Replace the principal condition in the Layer 1 framed construction by the prescribed finite flat kernel type. Check duality and Rosati on the isogeny rather than assuming an everywhere perfect Hodge pairing. Descend the kernel and framing conditions along the base site.

**API.**

- A point of N¹_n is (Y,i,λ,ρ) with ker λ⊂Y[ϖ] finite locally free of order q², and these two kernel conditions are independent.
- The polarization kernel of a point is a finite locally free subgroup scheme of Y[ϖ] of order q².
- Kernel type, signature and framed polarization commute with base change.
- The framing carries λ exactly to the fixed almost self-dual polarization.

**Checks.**

- For q=3 the required kernel order is 9, independent of n≥2.
- A principal polarization has kernel order 1 and is rejected.
- A kernel of order q² not killed by ϖ is rejected.

*Needs:* §0.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.1; §0.2.

### 2.2 Almost self-dual deformation theorem

N_n^1 is a separated locally formally finite type formal scheme, regular and flat of relative dimension n−1 with semistable reduction over O_L̆. This assertion is over its natural unramified local coefficient ring. A ramified extension of the coefficient ring need not preserve regularity or semistability. (Cho18, Theorem 1.2, p. 4; §3.9; compare LZ22 §10.1, p. 64.)

This target assumes the local field conditions of Layer 1 and n≥2, and fixes a supersingular signature-(1,n−1) framing 𝕐 with the polarization kernel specified in §2.1.

*Route.* Use formal representability with fixed kernel type. Apply the almost self-dual unitary local model (Cho18 §3.9) and its smooth deformation comparison. Read the semistable local equations over the natural coefficient ring; use them for flatness and regularity.

**Checks.**

- At a crossing a completed local chart is an étale/formally smooth extension of uv−ϖ.
- Under ramified base change uv−t^e for e>1 is not a regular crossing chart.

*Needs:* §2.1; AbelianSchemesAndArithmeticModuli §A4.7; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10; §0.2.

### 2.3 Almost self-dual special Hom space

Put `W_n=Hom^0_{O_L}(𝔈̄,𝕐)` with h(x,y)=λ_𝔈̄^−1 y^∨λ_𝕐 x. It is the split n-dimensional Hermitian space. Choose the rank-one vector x_0 of norm ϖ in a nonsplit `V_{n+1}` and a framing identification `V_{n+1}=W_n⊥Lx_0`. Use the same conjugate rank-one source 𝔈̄ as in Layer 1; the changed target polarization type and norm scaling are part of this identification. (LZ22, §10.1, p. 64; §10.2, equation (10.2.0.1) and the orthogonal decomposition following it, pp. 64–65.)

*Route.* Compute rational Hom from the same relative isocrystals (§0.1) with the new polarization lattice. Use Hermitian discriminant classification to identify the split invariant. Choose an isometry of the orthogonal sum with `V_{n+1}`; retain the chosen identification.

**API.**

- h on W_n is formed with the conjugate source 𝔈̄ of signature (0,1), as in Layer 1.
- The chosen framing identification gives an isometry `W_n⊥⟨ϖ⟩≅V_{n+1}`.
- An isometry of W_n extends by identity on x_0 and gives a homomorphism `U(W_n)→U(V_{n+1})`.

**Checks.**

- The distinguished vector in the extension has norm ϖ, not 1.
- The split invariant of W_n differs from the nonsplit invariant of the principal-framing V_n.
- The extended isometry fixes x_0 and preserves its orthogonal complement.

*Needs:* §1.3; §2.1; §1.5; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10; VectorBundlesAndIsocrystals Layer 1, “Finite isocrystals over the completed maximal unramified coefficient field” and “Dieudonné–Manin classification of finite isocrystals”.

### 2.4 Auxiliary isogeny space

Construct Ñ_n with points (Y,X,α), where Y∈N_n^1, `X∈N_{n+1}`, and α:Y×ℰ̄→X is an O_L-linear isogeny with kernel contained in (Y×ℰ̄)[ϖ], compatible with the fixed rational framings, and satisfying α*λ_X=λ_Y×ϖλ_ℰ̄. Write π_1 and π_2 for the two forgetful maps. In the induced rational special-Hom description the distinguished rank-one direction has norm ϖ. For a fixed pair (Y,X) and the chosen rational framing isogeny, the integral lift α is unique if it exists; Ñ_n is a closed subfunctor of `N_n^1×N_{n+1}`. The source has signature (1,n), since ℰ̄ has signature (0,1), and deg α=q². (LZ22, §10.2, p. 65.) Write Z(x₀) for the special divisor on `N_{n+1}` of the vector x₀ of §2.3: the closed formal subscheme over which the quasi-homomorphism ρ_X⁻¹∘x₀∘ρ_ℰ̄ from ℰ̄ to X, given over the uniformizer-zero subscheme, lifts to a homomorphism ℰ̄_S→X. The map π₂ factors through Z(x₀), the lift being the restriction of α to the factor ℰ̄. (LZ22, §2.3, p. 11; diagram (10.2.0.3), p. 65.)

*Route.* Choose once the framing isogeny matching W_n⊥Lx_0. Impose the prescribed finite flat kernel and pullback-polarization conditions as closed conditions on `N¹_n×N_{n+1}` (§0.2). Construct the two projections and verify their base changes. Z(x₀) is closed: by rigidity the quasi-homomorphism lifts uniquely over S, locally on S some p^m times it is a homomorphism, and it is a homomorphism exactly where p^m times it kills ℰ̄[p^m], a closed condition (RZ96, proof of Proposition 2.9 and Lemma 2.10, pp. 52–53).

**API.**

- A point of Ñ_n is (Y,X,α) with ker α⊂(Y×ℰ̄)[ϖ] and α*λ_X=λ_Y×ϖλ_ℰ̄.
- π₁ forgets X and α and lands in N¹_n.
- π₂ forgets Y and α and lands in `N_{n+1}`; it factors through the special divisor Z(x₀), the restriction of α to ℰ̄ being the lift of x₀.
- Both projections commute with nilpotent-base pullback.
- For the same pair (Y,X) and fixed rational framing isogeny, two integral lifts agree by rigidity; this is not uniqueness of the target given Y alone.

**Checks.**

- The polarization degree equation forces deg α=q²: deg λ_Y=q² and deg(ϖλ_ℰ̄)=q², while the target is principal, so (deg α)²=q⁴. At n=2, q=3 the degree is 9; the value q^(n+1)=27 is rejected, since 27²=729≠81=9·9.
- Replacing ϖλ_ℰ̄ by λ_ℰ̄ changes the polarization equation and does not define the same auxiliary functor.
- Two objects with the same Y can have distinct isogeny choices; π_1 does not discard a uniqueness datum.
- At n=2, Y×ℰ̄ has signature (1,2). Substituting ℰ gives (2,1) and cannot be isogenous in characteristic zero to the specified N₃ target.
- The restriction β of α to ℰ̄ has λ_ℰ̄⁻¹β^∨λ_Xβ=λ_ℰ̄⁻¹(ϖλ_ℰ̄)=ϖ, read off from α*λ_X=λ_Y×ϖλ_ℰ̄ on the second factor; this is h(x₀,x₀), as it must be for β to lift x₀, and β is never the lift of a vector of unit norm, so reading π₂ as landing in the divisor of a unit vector of W_n is excluded.

*Needs:* §2.1; §2.3; §1.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.1; §0.2.

### 2.5 Generic projection comparison

On rigid/adic generic fibres of the representing spaces, π_1:Ñ_n→N_n^1 is finite étale of degree q+1, and π_2, as a map to the special divisor Z(x₀) of §2.4, is an isomorphism, so the image of π_2 in the generic fibre of `N_{n+1}` is the generic fibre of Z(x₀). These generic assertions do not supply an integral isomorphism or integral closed immersion for π_2. (LZ22, §10.2, Remark 10.2.1, p. 65; Conjecture 10.4.1, p. 67.)

*Route.* Invert the coefficient uniformizer and describe the isogeny choices by the residual two-dimensional Hermitian quotient. There are q+1 admissible isotropic directions; in characteristic zero the finite torsion is étale. Recover the isogeny from its target and the lift of the fixed distinguished direction x₀, which exists exactly over Z(x₀), to identify the second map over the generic fibre with Z(x₀).

**Checks.**

- For q=3 the first generic projection has degree 4.
- At n=2, Ñ_2 is finite over N¹_2 and so has relative dimension n−1=1, and Z(x₀) is a divisor in N_3, of relative dimension 2−1=1; reading the generic image of π₂ as the whole generic fibre of N_3, of relative dimension 2, contradicts this count.
- The generic assertions follow without an integral resolution theorem; LRZ26 Theorem 14.6.2 proves integral finite flatness of π₁ and a proper resolution by π₂, not an integral isomorphism of Ñ_n with the special divisor Z(x₀) of §2.4.

*Needs:* §2.4; AdicSpacesPartIII Layer F0; AdicSpacesPartIII §R2.9; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9.

### Examples

- Degrees at q=3. For K=ℚ_3 and n=2 the polarization kernel of a point of N¹_2 has order 9; in Ñ_2 the isogeny α:Y×ℰ̄→X has deg λ_Y·deg(3λ_ℰ̄)=9·9=(deg α)², so deg α=9, while π₁ is generically finite étale of degree q+1=4.
- Hermitian invariants. For L/K unramified every unit is a norm, so a hermitian space is classified by its dimension and the parity of the valuation of its determinant. W_2 is split (even valuation); adjoining x₀ of norm ϖ makes the valuation odd, so W_2⊥Lx₀ is the nonsplit V_3, as §2.3 requires.
- Regularity and base change. A crossing chart of N¹_n is uv=ϖ over O_L̆; after a ramified extension with ϖ=t² it becomes uv=t², whose maximal ideal at u=v=t=0 needs three generators in dimension 2.

### Dependencies

Within this roadmap: Layer 0 (§0.1, §0.2, §0.3); Layer 1 (§1.1, §1.3, §1.5).

Suppliers: FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.1, §R07.2.10; VectorBundlesAndIsocrystals Layer 1, “Finite isocrystals over the completed maximal unramified coefficient field” and “Dieudonné–Manin classification of finite isocrystals”; AbelianSchemesAndArithmeticModuli §A4.7; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9; AdicSpacesPartIII Layer F0, §R2.9.

## Layer 3: Relative exotic ramified moduli

For ramified quadratic L/K, p>2 and even n≥2 impose the exact exotic polarization kernel X[i(u)], signature, wedge and nonzero-spin conditions; distinguish the symmetric principal factor. Construct the relative framed space, smooth of relative dimension n−1, its principal rank-one CM source and u^−2-normalized nonsplit special-Hom form, and prove that the space has exactly two connected components for every finite K/ℚ_p.

### 3.1 Relative exotic unitary modules

Define Exo(n−1,1) over the nilpotent base category by strict formal O_K-modules of relative height 2n and dimension n with O_L-action, determinant (T−u)^(n−1)(T+u) on Lie, wedge equation Λ²(i(u)−u)=0, and spin condition that i(u) is nonzero on Lie at every geometric point. The O_L-compatible relative polarization λ satisfies ker λ=X[i(u)] and Rosati conjugation. Morphisms pull λ back exactly. Define Exo(n,0) by structural O_L-action on Lie and the same height, dimension and polarization-kernel condition. Restrict to supersingular objects for the framed basic functor. (LL22, §2.1, Definition 2.1 and Remark 2.2, pp. 9–10; Remark 2.9, p. 11, for Exo(n,0).)

This target assumes that L/K is ramified quadratic, p>2, u is a uniformizer of L with ū=−u, and n is even with n≥2; strict relative O_K-modules follow the conventions of Layer 0.

*Route.* Use the strict-module carrier, keeping the nonprincipal polarization instead of inheriting the principal condition. Impose determinant, wedge, spin and exact finite-kernel conditions separately. Verify that each condition is preserved under the permitted base changes.

**API.**

- An exotic module of type Exo(n−1,1) is a strict module with the determinant, wedge, spin and kernel conditions, each imposed separately.
- For an exotic module, ker λ=X[i(u)] as finite flat subgroup schemes.
- Base change preserves the defining conditions and exact-polarization arrows.
- At each geometric point i(u) on Lie is nonzero, in addition to the wedge equation.

**Checks.**

- At n=2 the relative height is 4 and dimension 2.
- A geometric Lie action i(u)=0 satisfying determinant and wedge equations is excluded by spin.
- Since X[i(u)] has nontrivial order, a principal polarization is not the required exotic polarization.

*Needs:* §0.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.1; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10; PELModuli §M0.18.

### 3.2 Symmetric principal form comparison

For an exotic module λ there is a unique O_L-compatible symmetric principal isomorphism σ:X→X^∨ with λ=σ∘i(u). Thus σ^∨=σ, whereas λ is the relative alternating polarization. This comparison does not turn λ into a principal polarization. (LL22, §2.1, Remark 2.2, p. 10.)

*Route.* Factor λ through i(u) using equality of their kernels. The quotient factor is principal; use Rosati conjugation and ū=−u to compute its transpose. Use surjectivity of i(u) to obtain uniqueness.

**Checks.**

- The factor σ is symmetric, not alternating.
- σ∘i(u) recovers λ, with kernel X[i(u)] of order q^n; σ∘i(u²) has kernel X[ϖ] of order `q^{2n}`, so the factorization fixes the single power of i(u).
- The symmetry of σ is forced by ū=−u: if σ^∨=σ and σi(a)=i(ā)^∨σ, then λ^∨=(σi(u))^∨=i(u)^∨σ=σi(ū)=−σi(u)=−λ, as a polarization requires; an alternating σ, σ^∨=−σ, would give λ^∨=+λ, which is not a polarization in the sense of §0.1.

*Needs:* §3.1; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10.

### 3.3 Relative exotic framed space

Fix a supersingular framing 𝕏∈Exo(n−1,1). N^exo classifies X∈Exo(n−1,1) with a height-zero O_L-linear framing ρ to 𝕏 on the uniformizer-zero subscheme and ρ*λ_𝕏=λ_X. Arrows preserve the action, exact polarization and framing. This functor is represented by a separated formal scheme locally formally of finite type over O_L̆. (LL22, §2.1, Definition 2.3 and Lemma 2.4, p. 10.)

*Route.* Apply polarized formal PEL representability on the fixed-height component. Impose wedge and spin and the fixed kernel condition in the local-model chart. Use rigidity to identify the representing groupoid with the framed set-valued functor.

**API.**

- A point of N^exo is an exotic module with a height-zero framing over the subscheme cut out by the uniformizer, carrying λ_𝕏 to λ exactly.
- Forgetting the framing gives the underlying relative exotic module.
- Pullback transports both the integral module and its reduced framing.
- A polarized framing self-quasi-isogeny acts by postcomposition on ρ.

**Checks.**

- A framing with multiplier c≠1 is rejected in this normalization.
- The framing is required only over the uniformizer-zero subscheme, while X is defined over S.
- An O_L-linear quasi-isogeny with nonzero height is not an allowed framing.

*Needs:* §3.1; §3.2; §0.2.

### 3.4 Exotic good reduction theorem

For every finite extension K/ℚ_p with p>2, L/K ramified quadratic and n even with n≥2, N^exo is formally smooth of relative dimension n−1 over Spf O_L̆. Its connected components are described in §3.7. (LL22, §2.1, Lemma 2.4 and its proof, p. 10, with footnote 8. The local model is the π-modular local model of signature (n−1,1) with the wedge and spin conditions; its smoothness of relative dimension n−1 is RSZ17, Definition 3.9 and Proposition 3.10 with its proof, pp. 18–19, written there for K=ℚ_p, whose affine chart is PaRa09, §5.c, pp. 38–39, set up over any complete discretely valued K with perfect residue field of odd characteristic and for n≥3 (PaRa09, §1.b.1, p. 10); the chart at n=2 is computed in the route.)

This target assumes that L/K is ramified quadratic, p>2, u is a uniformizer of L with ū=−u, and n is even with n≥2; strict relative O_K-modules follow the conventions of Layer 0.

*Route.* Represent N^exo by §0.2; the spin condition cuts out an open formal subscheme. Use the even-rank exotic local-model smoothness calculation: the open chart of the wedge local model around the point F1 of PaRa09 §5.c is the product of a point with an affine space of dimension n−1 when one signature entry is 1 (PaRa09, end of §5.c, p. 39, for even n≥4; at n=2, which PaRa09 §1.b.1 excludes, the same isotropy and π-stability equations force the 2×2 block to be diag(x,x) and impose nothing more, so the chart is the affine line), and the special fibre of the local model is a single orbit of the stabilizer group scheme, which the chart meets, so the local model is smooth everywhere (RSZ17, proof of Proposition 3.10, p. 19). Read the relative dimension off the local model; no comparison with an absolute space over an unramified K is used.

**Checks.**

- At n=2 the relative dimension is 1.
- The coefficient ring is O_L̆, not O_K̆: at n=2 the completed local ring at a point is O_L̆[[t]], whose fibre over the closed point of Spf O_K̆ is k[u]/(u²)[[t]], nonreduced, so N^exo is not formally smooth over Spf O_K̆, while over O_L̆ the special fibre k[[t]] is smooth of dimension 1.
- For K/ℚ_p ramified, where the absolute comparison of Layer 4 is unavailable, smoothness still follows from the relative local model.

*Needs:* §3.3; §0.2; AbelianSchemesAndArithmeticModuli §A4.7.

### 3.5 Principal ramified CM source

Fix a supersingular strict O_K-module X₀ of relative height 2 and dimension 1, with O_L-action of signature (1,0) and principal relative polarization λ₀ with conjugate Rosati involution. Its chosen exact-polarization, height-zero framed deformation has a unique canonical lift over O_L̆. This is a principal CM source; it is not an object of the even-rank exotic category and does not have polarization kernel X₀[i(u)]. Its rational O_L-linear endomorphism algebra is L. (LL22, §2.1, the rank-one triple fixed before (2.1), pp. 10–11; §2.8, paragraph preceding (2.25), p. 43.)

*Route.* Use the strict CM deformation theorem with the structural O_L Lie character. Choose the framing component and transport the principal polarization through the unique CM lift. Compute rational endomorphisms from the rank-one CM display.

**API.**

- The chosen framed CM source has a canonical principal lift over O_L̆, unique up to unique isomorphism.
- `End⁰_{O_L}(X₀)=L`.
- The source polarization is principal, even though the target exotic polarization is not.
- The framed CM lift commutes with nilpotent base change.

**Checks.**

- The relative height is 2 and dimension is 1.
- The principal source has trivial polarization kernel, so the target exotic kernel equation is rejected.
- The source Lie character is structural; replacing it by the conjugate character changes the chosen source.

*Needs:* §0.3; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10; §0.2; EndoscopicTransferAndUnitaryTraceComparison §§7.6, 10.2.

### 3.6 Exotic normalized special Hom space

On `V^exo=Hom^0_{O_L}(X_0,𝕏)`, use h(x,y)=u^−2 λ_0^−1 y^∨λ_𝕏 x. It is a nondegenerate nonsplit L/K-Hermitian space of dimension n. The u^−2 normalization, the principal rank-one CM source and the target’s symmetric principal factor are retained when identifying its unitary group with the framing isometries. (LL22, §2.1, the pairing (2.1) and footnote 9, p. 11.)

*Route.* Compute Hom and adjoints through the relative isocrystals of §0.1: those of X₀ and of 𝕏 are isoclinic of slope 1/2, of K̆-dimensions 2 and 2n, and the full faithfulness of the relative isocrystal functor identifies V^exo with their O_L-linear maps. Since L/K is totally ramified, L⊗_K K̆ is the completion L̆ of the maximal unramified extension of L, so these are the maps of the associated L-isocrystals, isoclinic of L̆-ranks 1 and n and of one common slope; the Dieudonné–Manin classification with coefficient field L gives the L-dimension n. Use the principal source polarization and target adjoint relation to prove Hermitian symmetry; retain the declared u^−2 scalar and the target symmetric factor. Compute the Hermitian invariant and identify the group action by composition.

**API.**

- V^exo carries the u⁻²-normalized form h(x,y)=u⁻²λ₀⁻¹y^∨λ_𝕏x.
- Composition identifies framing isometries with the unitary group of h.
- Isomorphisms of both polarized framings induce isometries of the resulting Hom space.

**Checks.**

- Omitting u^−2 multiplies h by u²; it is not equality of the declared forms.
- The L-dimension is n, not 2n.
- The normalized pairing obeys h(y,x) is the L/K-conjugate of h(x,y) despite the alternating λ factors.

*Needs:* §3.2; §3.3; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10; §3.5; VectorBundlesAndIsocrystals Layer 1, “Finite isocrystals over the completed maximal unramified coefficient field” and “Dieudonné–Manin classification of finite isocrystals”.

### 3.7 Exotic connected components

Let K/ℚ_p be finite with p>2, L/K ramified quadratic, n even with n≥2, and N^exo the relative exotic framed space of §3.3. For a point (X,ρ) of N^exo over an algebraically closed field, the minimal cover of the height-zero framing ρ is the triple (X̃,ρ₁,ρ₂) of a p-divisible group X̃ with isogenies ρ₁:X̃→X and ρ₂:X̃→𝕏 such that ρ∘ρ₁=ρ₂, through which every other such triple (Y,α₁,α₂) factors: α₁=ρ₁∘β and α₂=ρ₂∘β for a unique isogeny β:Y→X̃. Its Dieudonné module is the intersection of those of X and 𝕏 in the common isocrystal identified through ρ, so X̃ inherits the O_L-action and ρ₁, ρ₂ are O_L-linear; heights are O_K-relative (Conventions; HilbertModularVarietiesAndShimuraCurves §R18.5.4), and ht(ρ₁)=ht(ρ₂) because ρ has height zero. The parity invariant is κ₂(ρ)=ht(ρ₁) mod 2. Then N^exo has exactly two connected components: the loci where κ₂ is 0, respectively 1.

Lattices of V^exo are taken with the conventions of LL22. For an O_L-lattice Λ of V^exo let Λ^♯={x : h(x,Λ)⊆O_L} be its dual lattice in the sense of the Conventions, and `Λ^∨={x : Tr_{L/K}h(x,y)∈O_K for all y∈Λ}` its dual for the trace form; since p is odd the inverse different of L/K is u⁻¹O_L, so Λ^∨={x : h(x,Λ)⊆u⁻¹O_L}=u⁻¹Λ^♯. Λ is a vertex lattice when Λ⊆Λ^∨ and uΛ^∨⊆Λ, that is Λ^♯⊆Λ⊆u⁻¹Λ^♯, and its type is t(Λ)=dim_k(Λ^∨/Λ). Since V^exo is nonsplit, Λ^∨/Λ with the form induced by `u²·Tr_{L/K}h` is a nonsplit quadratic space over k, so t(Λ) is even and positive, and t(Λ)≤n because uΛ^∨⊆Λ and Λ^∨/uΛ^∨ has k-dimension n. This type is not the invariant t of GeometryOfNumbersAndQuadraticArithmetic §2.7, which is computed from Λ^♯/Λ for lattices with Λ⊆Λ^♯. (LL22, Definition 2.10 and Remark 2.13, pp. 12–13; Definition 2.27(1), p. 22.)

Write N^ε, ε∈{0,1}, for the two components, V_Λ for the closed Bruhat–Tits stratum of N^exo_red indexed by a vertex lattice Λ of V^exo (the reduced locus of the special cycle of Λ, which meets both components), and `V_Λ^ε=V_Λ∩N^ε_red`. Each reduced locus N^ε_red is connected and is the union of the V_Λ^ε; each V_Λ^ε is a nonempty connected smooth projective variety of dimension t(Λ)/2−1, hence irreducible, so V_Λ=V_Λ^0⊔V_Λ^1 is disconnected. V_Λ∩V_Λ′ is `V_{Λ+Λ′}` or empty according as Λ+Λ′ is a vertex lattice or not, and correspondingly `V_Λ^ε∩V_Λ′^ε` is `V_{Λ+Λ′}^ε` or empty. The irreducible components of N^ε_red are the V_Λ^ε with t(Λ)=n; in particular each N^ε_red has pure dimension n/2−1. (LL22, Lemma 2.4 and footnote 8, p. 10; Proposition 2.28 and Remark 2.29, pp. 22–23; Wu16, §3.4, the minimal cover (3.18)–(3.20) and equations (3.21)–(3.26), pp. 12–13; Theorems 5.17–5.18 and proof, pp. 30–31.)

This target assumes that L/K is ramified quadratic, p>2, u is a uniformizer of L with ū=−u, and n is even with n≥2; strict relative O_K-modules follow the conventions of Layer 0. K/ℚ_p is an arbitrary finite extension.

*Route.* Define κ₂ by the minimal cover of the framing; it is locally constant, so the two loci are open and closed (Wu16 §3.4). Construct the Bruhat–Tits stratification over K by the special-Hom lattices of §3.6 and identify each closed stratum with the generalized Deligne–Lusztig variety of the orthogonal group of Λ^∨/Λ over the residue field (LL22 Proposition 2.28). Restrict the stratification to each κ₂-locus: V_Λ^ε is connected (LL22 Proposition 2.28(2)), hence irreducible, being smooth. Every stratum lies in a stratum of maximal type t=n and the simplicial complex of vertex lattices is connected; hence each κ₂-locus has connected reduced locus whose irreducible components are the V_Λ^ε of maximal type (the argument of Wu16 Theorem 5.18(2), stated there for the strata of one component and with the stratum Wu16 attaches to Λ equal to `V_{uΛ^∨}` here (LL22, proof of Proposition 2.28, p. 23), which uses only the hermitian lattice combinatorics of L/K and so applies over every K, as LL22 footnote 8 records). Both loci are nonempty, since every stratum V_Λ meets each of them (LL22 Proposition 2.28(2)); a framing self-quasi-isogeny g with κ₂(g)=1 maps one isomorphically onto the other (Wu16 (3.24)).

**Checks.**

- At K=ℚ_p and n=2 there are two components, each formally smooth of relative dimension 1, with reduced locus of dimension n/2−1=0; reading the dimension of the reduced locus as the relative dimension would give 0 instead of 1.
- At n=2 the space V^exo is two-dimensional and nonsplit, hence anisotropic, with an orthogonal basis e₁,e₂ of norms 1 and −ε, ε a nonsquare unit of O_K. Λ₀=O_Le₁+O_Le₂ has Λ₀^♯=Λ₀ and Λ₀^∨=u⁻¹Λ₀, so it is a vertex lattice of type 2, and it is the only one: a vertex lattice has even type between 2 and n=2, so Λ^∨/Λ=u⁻¹Λ^♯/Λ has the same dimension 2 as u⁻¹Λ^♯/Λ^♯ and Λ=Λ^♯, whence h(x,x)∈O_K on Λ; since ε is a nonsquare, h(x,x) has K-valuation the minimum of those of the norms of its two coordinates, so Λ⊆Λ₀, and then Λ=Λ^♯⊇Λ₀^♯=Λ₀. Read with the dual Λ^♯ alone, Λ₀ would have type 0 and V_Λ₀ dimension −1, and no lattice would have type 2. Each V_Λ₀^ε has dimension 2/2−1=0, so each N^ε_red is the single point V_Λ₀^ε and V_Λ₀ is two points, one in each component.
- κ₂ is the parity of a relative height. If ρ is an isomorphism, the minimal cover is (X,id,ρ) and κ₂(ρ)=0. For K/ℚ_p unramified of degree 2, the absolute height of every O_K-linear isogeny is twice its relative height (HilbertModularVarietiesAndShimuraCurves §R18.5.4), so the parity of the absolute height of ρ₁ is 0 at every point and does not separate the two components.
- The full stratum is not irreducible: at n=4 and t(Λ)=4, V_Λ is two disjoint copies of ℙ¹ (LL22 Remark 2.29), while each V_Λ^ε is one ℙ¹; at t(Λ)=2, V_Λ is two points and each V_Λ^ε one point. Calling V_Λ an irreducible component, or a nonempty intersection `V_{Λ+Λ′}` of type 2 a single point, contradicts LL22 Proposition 2.28(2); within one component both statements hold for V_Λ^ε.
- The labels depend on the framing, not on the geometry of one component: a framing self-quasi-isogeny g exchanges the two components when κ₂(g)=1 and preserves each when κ₂(g)=0 (Wu16 (3.24)).

*Needs:* §3.3; §3.4; §3.6; §0.1; HilbertModularVarietiesAndShimuraCurves §R18.5.4; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10.

### Examples

- Rank two. For K=ℚ_p and n=2, N^exo has two connected components, each of relative dimension 1 over Spf O_L̆ with reduced locus a single point; each component is Spf O_L̆[[t]].
- Polarization kernel. For n=2 the exotic polarization has kernel X[i(u)] of order q²; a principal polarization (kernel of order 1) is not an exotic polarization.
- Rank four. For n=4 the reduced locus N^ε_red of each component is a union of projective lines V_Λ^ε with t(Λ)=4, of dimension t(Λ)/2−1=1, while the full stratum V_Λ=V_Λ^0⊔V_Λ^1 is two disjoint lines, one in each component. Two lines V_Λ^ε and V_Λ′^ε of the same component meet, if at all, in `V_{Λ+Λ′}^ε`, which is a single point when t(Λ+Λ′)=2; the full `V_{Λ+Λ′}` is then two points.

### Dependencies

Within this roadmap: Layer 0 (§0.1, §0.2, §0.3).

Suppliers: FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.1, §R07.2.10; HilbertModularVarietiesAndShimuraCurves §R18.5.4; VectorBundlesAndIsocrystals Layer 1, “Finite isocrystals over the completed maximal unramified coefficient field” and “Dieudonné–Manin classification of finite isocrystals”; PELModuli §M0.18; AbelianSchemesAndArithmeticModuli §A4.7; EndoscopicTransferAndUnitaryTraceComparison §§7.6, 10.2; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9.

## Layer 4: Absolute and relative exotic comparison

With K/ℚ_p unramified, construct the absolute embedding-graded exotic category and banal Frobenius contraction with all pairing units. Prove the supersingular display equivalence and identify framed formal moduli. Contract the principal CM source separately and prove the normalized Hermitian rational-Hom isometry, retaining integral Hom lifting and chosen framing identifications.

### 4.1 Absolute exotic module category

Assume K/ℚ_p is unramified of degree f and L/K is ramified quadratic as in Layer 3. For an admissible local CM type Φ, define Exo_Φ(n−1,1) using absolute p-divisible groups of height 2nf and dimension nf with O_L-action and the exotic polarization kernel. Decompose the display by the f embeddings of O_K. The distinguished summand has the signature, wedge and spin clauses of Layer 3; every other summand has the prescribed banal O_L Lie character. Exact-polarization arrows and the supersingular subcategory are retained. (LL22, §2.8, Definition 2.59, p. 38.)

This target assumes that L/K is ramified quadratic, p>2, u is a uniformizer of L with ū=−u, and n is even with n≥2; strict relative O_K-modules follow the conventions of Layer 0. In addition K/ℚ_p is unramified and Φ satisfies the local admissibility convention of LL22 §2.8.

*Route.* Use the unramified idempotent decomposition of the polarized display of §0.1. Impose the distinguished and banal conditions on the appropriate summands. Verify that the absolute height and dimension sum over f embeddings.

**API.**

- An object of Exo_Φ(n−1,1) is determined by its embedding-indexed Lie and polarization data satisfying the distinguished and banal conditions.
- Each object decomposes into embedding components, exactly one of which is distinguished and the others banal.
- Base change preserves the labeled decomposition and all conditions.
- The absolute height and dimension are 2nf and nf.

**Checks.**

- For f=2 and n=2 the absolute height is 8 and dimension 4.
- An object with a nonbanal Lie action at a nondistinguished embedding is rejected.
- For f=1 the absolute data have the single relative signature and kernel condition.

*Needs:* §3.1; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10; PELModuli §M0.25.

### 4.2 Banal display contraction

For a nondistinguished component i of an Exo_Φ object, Q_i=(u⊗1−1⊗[φ_i(u)])P_i+I(R)P_i and the normalized Frobenius F_i′ used by LL22 is a Frobenius-linear isomorphism. Its pairing correction is the unit ε_i defined by Vε_i=[ψ_i(u²)]−ψ̂_i(u²). These identities permit contraction without losing the integral display lattice. (LL22, §2.8, Lemma 2.60, pp. 38–39.)

*Route.* Use the banal Lie condition to identify Q_i modulo I(R). Apply the display relations and the ε_i unit to normalize F_i. Check integrality in a normal decomposition, not solely after inverting p.

**Checks.**

- For f=1 there are no nondistinguished components to contract.
- A rational Frobenius isomorphism alone does not prove this integral statement.

*Needs:* §4.1; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10.

### 4.3 Exotic relative functor

Choose μ in the coefficient Witt units satisfying `F^f(μ)/μ=∏_{i=1}^{f−1}F^{f−1−i}(ε_i)`. Define rel by retaining (P_0,Q_0), contracting F_0 through the normalized banal Frobenius maps `F′_1,…,F′_{f−1}`, and multiplying the retained pairing by μ. The result is an f-ℤ_p-display with O_L-action, hence by the unramified case of §0.1 (O=ℤ_p, O′=O_K) a strict formal O_K-module. This gives a functor `rel:Exo_{Φ,b}(n−1,1)→Exo_b(n−1,1)` over noetherian nilpotent bases, preserving polarized morphisms and rational homomorphisms. (LL22, §2.8, equations (2.20)–(2.22) and the pairing correction, pp. 38–40.)

*Route.* Solve the Frobenius difference equation for a unit μ in the chosen unramified coefficient ring. Compose the normalized maps around the embedding cycle to obtain the relative display. Check its display relations and pairing identities, using μ to cancel the ε-product.

**API.**

- rel(X) is the contracted display with the μ-scaled pairing.
- Restrict a compatible display morphism to P_0 and preserve identities and composition.
- The μ correction gives the required relative polarization and kernel.
- Contraction commutes with inversion of p and sends rational homomorphisms to rational homomorphisms.

**Checks.**

- For f=1 choose μ=1; contraction and pairing correction are identities.
- For f=2 relative height is 2n, while absolute height is 4n.
- A ramified K/ℚ_p has no input to this unramified-idempotent construction.

*Needs:* §4.2; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10; §3.2.

### 4.4 Exotic display equivalence

The functor rel is an equivalence of the supersingular exotic module categories on noetherian nilpotent bases. A quasi-inverse reconstructs the banal components, and the equivalence identifies endomorphisms, adjoints and polarized rational Hom spaces. The hypotheses K/ℚ_p unramified and the noetherian nilpotent base are retained. (LL22, §2.8, Proposition 2.62 and Lemma 2.63, pp. 40–42; Remark 2.68, p. 44.)

*Route.* Use a normal decomposition of the retained display to reconstruct each omitted component. Check the unit and counit are integral display isomorphisms. Descend endomorphisms through the component equations and check compatibility of the pairing.

**Checks.**

- The equivalence has a quasi-inverse on morphisms, not just a map of isomorphism classes.
- The source does not establish the ramified-K/ℚ_p version.

*Needs:* §4.3; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10.

### 4.5 Absolute principal CM source comparison

With unramified K/ℚ_p of degree f, let X₀,Φ be the principal CM source of absolute height 2f and dimension f: each ψ_i Lie summand has rank one and O_L acts through φ_i∈Φ. The principal polarized display contraction constructed as in LL22 (2.21), an f-ℤ_p-display read as a strict formal O_K-module by the unramified case of §0.1, sends it to §3.5 and gives `End_{O_L}(X₀,Φ)≅O_L` and the matching rational Hom map into an exotic target. It is a separate principal-source comparison, not an application of the even-rank exotic category to rank one. Contracting source and target compatibly gives the isometry of the u^−2-normalized forms in (2.25). (LL22, §2.8, paragraph preceding equation (2.25) and Corollary 2.66, p. 43.)

*Route.* Contract the principal CM display around its embedding cycle, keeping its principal pairing. Identify its retained rank-one relative source and O_L endomorphisms. Restrict a Hom display morphism to the distinguished component and compare the source and target pairing corrections to obtain (2.25).

**API.**

- The contraction of X₀,Φ is the relative principal source of §3.5, with a framed identification.
- Absolute height 2f and dimension f become relative height 2 and dimension 1.
- The induced Hom map agrees with restriction to the distinguished display component and preserves the normalized form.
- The source comparison and its Hom map commute with allowed base changes.

**Checks.**

- For f=1 and compatible choices the source comparison is the identity.
- A source with kernel X₀[i(u)] is excluded from this principal comparison.
- For f=2 the absolute source has height 4 and dimension 2, while its relative source has height 2 and dimension 1.

*Needs:* §3.5; §4.3; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10.

### 4.6 Absolute and relative exotic spaces

Fix a supersingular object 𝕏_Φ of Exo_Φ(n−1,1) over the residue field of O_L̆. Define N_Φ as the functor of pairs (X,ρ) with X an object of Exo_Φ(n−1,1) over S and ρ a height-zero O_L-linear framing quasi-isogeny from X to 𝕏_Φ on the uniformizer-zero subscheme with `ρ*λ_{𝕏_Φ}=λ_X`, arrows preserving the action, the exact polarization and the framing, as in §3.3. Put `V_Φ=Hom^0_{O_L}(X₀,Φ,𝕏_Φ)`, with X₀,Φ the principal source of §4.5 taken over the residue field, and give it the u^−2-normalized form `h_Φ(x,y)=u^−2 λ_{X₀,Φ}^−1 y^∨ λ_{𝕏_Φ} x` of §3.6, read in `End^0_{O_L}(X₀,Φ)=L`. (LL22, §2.8, Definition 2.64 and the paragraph preceding (2.25), p. 43.)

After choosing an identification rel(𝕏_Φ)≅𝕏 and the principal-source contraction of `X_{0,Φ}≅X_0`, rel induces an equivariant isomorphism N_Φ≅N^exo of framed formal schemes and an isometry V_Φ≅V^exo for the normalized u^−2 special-Hom forms. It transports the condition that a rational homomorphism is integral on a deformation; changing the chosen framing identifications conjugates the comparison. (LL22, §2.8, Corollaries 2.65–2.66, pp. 42–43.)

*Route.* Transport framed objects and the two framings under the categorical equivalence. Use Lemma 2.63 for quasi-homomorphism descent and the polarization calculation for its isometry. Apply formal Yoneda and compare the postcomposition actions.

**Checks.**

- For f=1 and identity framing choices the comparison is identity.
- Integrality of a rational homomorphism is preserved; no intersection-number theorem is needed.
- For f=2 and n=2, 𝕏_Φ has absolute height 8 and dimension 4 and X₀,Φ height 4 and dimension 2, while V_Φ has L-dimension n=2 (ℚ_p-dimension 8), the dimension of V^exo; a framing with `ρ*λ_{𝕏_Φ}=c·λ_X` for a unit c≠1 is not a point of N_Φ, as for N^exo in §3.3.

*Needs:* §4.1; §4.4; §3.3; §3.6; §0.2; §4.5.

### Examples

- Contraction for f=2. For K/ℚ_p unramified of degree 2 and n=2 an object of Exo_Φ(1,1) has height 8 and dimension 4, with one banal component; the unit μ solves F²(μ)/μ=ε₁, and rel produces a relative exotic module of height 4 and dimension 2.
- f=1. With one embedding there is no banal component, the product defining μ is empty, μ=1, and rel is the identity.
- Principal source for f=2. X₀,Φ has height 4 and dimension 2 with a rank-one Lie summand at each embedding; its contraction is the principal source of §3.5, of relative height 2 and dimension 1.

### Dependencies

Within this roadmap: Layer 0 (§0.1, §0.2); Layer 3 (§3.1, §3.2, §3.3, §3.5, §3.6).

Suppliers: FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10; PELModuli §M0.25.

## Layer 5: Krämer formal moduli

At a ramified quadratic odd prime construct the principal-polarization Krämer framed functor with its rank-(n−1) conjugate Lie filtration and unit-compatible framing. Prove flat regular semistable geometry via the actual Krämer charts, treating rank two directly. Construct the canonical ramified rank-one source, Hermitian isocrystal fixed space, its trace recovery and scaled evaluation comparison; retain odd/even framing signs.

### 5.1 Krämer filtration

For a principal hermitian module X of signature (1,n−1), a Krämer filtration is an O_L-stable locally direct summand F_X⊂Lie X of rank n−1 on which O_L acts by the conjugate structural embedding, with structural O_L-action on the rank-one quotient. The structural/conjugate assignment is exactly that of HLSY23 Definition 2.2; comparing another signature convention requires conjugating both actions. The filtration is integral extra data, not just the determinant condition. (HLSY23, Definition 2.2, p. 10.)

This target assumes that L/K is ramified quadratic, p>2, ū=−u and n≥2, and fixes a supersingular principal hermitian framing of signature (1,n−1).

*Route.* Form the relative Grassmannian of rank-(n−1) locally direct summands of Lie X. Impose stability and the two scalar-action equations on subbundle and quotient. Check local freeness and descent under the base site.

**API.**

- A Krämer filtration is an O_L-stable rank-(n−1) locally direct summand of Lie X with conjugate action, whose quotient has the structural action.
- The quotient Lie X/F_X is locally free of rank one with the structural O_L-action.
- Pullback preserves the subbundle and quotient conditions.
- On the characteristic-zero fibre the two distinct eigencharacters determine the filtration uniquely.

**Checks.**

- At n=3 the filtration has rank 2 and quotient rank 1.
- A rank-one subbundle at n=3 fails the Krämer condition even when it is stable.
- After inverting u the filtration is the prescribed conjugate eigenspace, not the structural one.

*Needs:* §0.3; §0.7.

### 5.2 Ramified rank-one source

Fix a supersingular strict principal hermitian O_L-module Y of relative height 2 and dimension 1, of signature (0,1). Its chosen height-zero exact-polarization deformation component has a canonical lift G over O_L̆ with conjugate structural Lie action. Distinguish this chosen component from Howard19’s full rank-one space, which permits arbitrary quasi-isogeny height and is a countable disjoint union of Spf O_L̆. Fix an O_L-generator e of the integral fixed lattice `M(Y)^{τ=1}`, where M(Y) is the relative Dieudonné module of Y and τ=i(u)V⁻¹ with the covariant convention of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.20, the operator used in §5.4; it is a free O_L-module of rank one, because V M(Y)=i(u)M(Y) makes τ bijective on M(Y). Its norm (e,e)_Y is an O_K-unit, because λ_Y is principal, and rescaling λ_Y by that unit normalizes (e,e)_Y=1 when an isometry is required. A mere basis of the rational line `C_Y=M(Y)[1/u]^{τ=1}` does not suffice: u·e is such a basis, of norm −u²(e,e)_Y, of K-valuation 1. (HLSY23, §§2.2–2.3, pp. 11–12; Howard19 Proposition 2.1, p. 6.)

*Route.* Use the height-one strict deformation theory of EndoscopicTransferAndUnitaryTraceComparison §10.2 for the rank-one signature and chosen framing component. Compute its integral fixed lattice using relative Dieudonné theory: V M(Y) is the unique O_L̆-submodule of colength one, i(u)M(Y), so τ is a bijective σ-semilinear map of M(Y) and its fixed points form an O_L-lattice spanning M(Y) over O_K̆; rationally, (M(Y)[1/u],τ) is a K-isocrystal of K̆-dimension 2 and slope 1/2−1/2=0, so its fixed space C_Y has K-dimension 2, an L-line. Retain the polarization normalization and its effect on the source-line norm.

**API.**

- The chosen framed rank-one source has a canonical lift G over O_L̆ with conjugate structural Lie action.
- Its special fibre with framed polarization is the chosen Y.
- For an O_L-generator e of `M(Y)^{τ=1}`, (e,e)_Y is an O_K-unit and rescaling the source polarization by (e,e)_Y⁻¹ gives (e,e)=1; another generator is ae with a∈O_L^×, of norm aā(e,e)_Y, again a unit.
- Pullback of the canonical lift is compatible with its framing and source action.

**Checks.**

- The Lie action of a∈O_L is ā, not a.
- The relative height is 2 and the absolute height is 2[K:ℚ_p].
- The chosen height-zero component does not equal the countable union allowing arbitrary height.
- The generator must be integral: if e₀ generates `M(Y)^{τ=1}` with (e₀,e₀)_Y=1, then u e₀ is a basis of the rational fixed line with norm uū=−u², of K-valuation 1, and rescaling λ_Y by (−u²)⁻¹ gives a quasi-polarization that is not principal, indeed not an isogeny.

*Needs:* §0.3; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.20; §0.2; EndoscopicTransferAndUnitaryTraceComparison §§7.6, 10.2; VectorBundlesAndIsocrystals Layer 1, “Finite isocrystals over the completed maximal unramified coefficient field” and “Dieudonné–Manin classification of finite isocrystals”.

### 5.3 Krämer framed formal space

Construct N_n^Kra from quintuples (X,i,λ,ρ,F_X), with X principal hermitian of the indicated signature, a Krämer filtration, and height-zero O_L-linear framing to 𝕏 carrying λ to the fixed framing polarization locally up to a unit in O_K×. Morphisms commute with the framing and carry polarization to a unit multiple, as in HLSY23. The polarization compatibility of ρ is required explicitly even though it is omitted in the printed definition. (HLSY23, Definition 2.2, pp. 10–11; Howard19 §2 and Proposition 2.2, pp. 5–6.)

This target assumes that L/K is ramified quadratic, p>2, ū=−u and n≥2, and fixes a supersingular principal hermitian framing of signature (1,n−1).

*Route.* Construct the principal polarized framed groupoid with the unit-similitude normalization. Adjoin the Krämer Grassmannian filtration and its scalar equations. Use formal PEL representability and rigidification of the framing.

**API.**

- A point of N_n^Kra is (X,i,λ,ρ,F) with F a Krämer filtration and ρ carrying the framing polarization to an O_K-unit multiple of λ.
- Forgetting F maps N_n^Kra to the principal ramified framed functor with the wedge condition.
- The full quintuple and its unit-similitude arrow relation commute with base change.
- Replacing λ by an O_K-unit multiple leaves the declared polarized class; arbitrary nonunits do not.

**Checks.**

- An O_L-linear height-zero framing failing unit-polarization compatibility is rejected.
- For c∈O_K×, λ and cλ represent the same polarization class with corresponding data.
- A polarization with kernel X[i(u)] is not a principal Krämer object.

*Needs:* §5.1; §0.2.

### 5.4 Krämer Hermitian isocrystal

Let N be the relative isocrystal of the framing (§0.1), its covariant rational relative Dieudonné module, a K-isocrystal of K̆-dimension 2n; put Π=i(u) and τ=ΠV^−1 with the covariant convention of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.20. Set `C=N^{τ=1}`. Choose δ in O_K̆× with σ(δ)=−(u²/ϖ)δ, where ϖ is the uniformizer of K with respect to which N and the relative polarization are formed (§0.1); such δ exists because x↦σ(x)x⁻¹ maps O_K̆× onto itself (Lang's theorem over 𝔽̄_q and successive approximation), and for ϖ=u², the normalization of HLSY23 §1.2, p. 2, the condition is σ(δ)=−δ. The formula (x,y)=δ(⟨Πx,y⟩+u⟨x,y⟩) on C is a nondegenerate L/K-Hermitian form, and ⟨x,y⟩=(2δ)^−1 `Tr_{L/K}(u^−1(x,y))` recovers the alternating form. C has dimension n over L. (HLSY23, §2.2, equations (2.1)–(2.2), pp. 11–12.)

*Route.* Use the relative covariant isocrystal and compute τ as a slope-zero descent operator. Apply descent for the fixed vectors, retaining Π and V conventions. Verify Hermitian symmetry and the inverse trace identity, including the factor 2δ.

**API.**

- `C=N^{τ=1}` is an L-vector space of dimension n.
- For δ∈O_K̆× with σ(δ)=−(u²/ϖ)δ, (x,y)=δ(⟨Πx,y⟩+u⟨x,y⟩) is a nondegenerate hermitian form on C.
- `⟨x,y⟩=(2δ)⁻¹Tr_{L/K}(u⁻¹(x,y))` recovers the alternating form.
- Polarized framing isomorphisms induce Hermitian isometries of C.

**Checks.**

- For n=3 the L-dimension of C is 3 and the relative K-isocrystal dimension is 6.
- With A=⟨Πx,y⟩ and B=⟨x,y⟩, `Tr_{L/K}(u^−1·δ(A+uB))=δ(Tr_{L/K}(u^−1)A+2B)=2δB`, because `Tr_{L/K}(u^−1)=u^−1+ū^−1=0` and δ∈K̆. So (2δ)^−1Tr recovers B, whereas δ^−1Tr returns 2B, which differs from B whenever B≠0; since 2 is a unit for odd p, no integrality test detects the wrong factor.
- The normalization of δ is forced. For x,y∈C, τx=x gives Vx=Πx and Fx=ϖΠ⁻¹x, and ⟨Fx,y⟩=σ⟨x,Vy⟩ with ⟨x,Πy⟩=−⟨Πx,y⟩ and Π²=u² gives σ⟨x,y⟩=−(ϖ/u²)⟨x,y⟩; so σ fixes δ(⟨Πx,y⟩+u⟨x,y⟩) exactly when σ(δ)=−(u²/ϖ)δ. For K=ℚ₃, ϖ=3 and L=ℚ₃(√−3), every u with ū=−u is a√−3 with a∈ℤ₃^×, so u²/ϖ=−a²≠1, −1 not being a square in ℚ₃; at n=1 and e≠0 in C, σ(δ)=−δ would give σ(δ⟨Πe,e⟩)=−a⁻²·δ⟨Πe,e⟩≠δ⟨Πe,e⟩, so (e,e) would not lie in L. With ϖ=−3=u² for u=√−3 the factor is 1 and σ(δ)=−δ is the condition.
- Replacing V^−1 by F^−1 without changing conventions is not the stated τ.
- Omitting the factor 2 changes recovery of the alternating form when p is odd.

*Needs:* §5.3; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10; VectorBundlesAndIsocrystals Layer 1, “Finite isocrystals over the completed maximal unramified coefficient field” and “Dieudonné–Manin classification of finite isocrystals”; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.20.

### 5.5 Krämer framing parity

The two determinant signs `χ((−1)^{n(n−1)/2} det C)` give the two framing polarization classes. Their resulting ramified unitary formal moduli spaces are isomorphic for n odd; for n even they are not isomorphic. Keep a specified sign when comparing them to a global basic locus; a self-dual lattice alone does not select the sign at a ramified place. (HLSY23, §2.2, p. 11; RSZ21 Remark 6.9, p. 33.)

*Route.* Apply ramified Hermitian determinant classification. Check the effect of unit rescaling on the determinant sign in odd and even rank. Compare the framing categories, retaining the selected sign in the global input.

**Checks.**

- For n=3 unit rescaling relates the two formal spaces.
- For n=2 the sign choice cannot be discarded.

*Needs:* §5.4; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9.

### 5.6 Krämer normal-crossing charts

Over the natural ramified coefficient DVR with p odd, the principal Krämer local-model charts meeting the exceptional locus have equation `y(Σ_{i=1}^n x_i²)=2u` with x_k=1, for some k. At an intersection point the residue quadric Σx_i²=0 is smooth, so this is étale locally yz=u times n−2 smooth parameters. For n≥3 this is the chart in Krämer03 (4.11). For n=2 the same equations give y(1+x²)=2u; at either geometric root of 1+x² the derivative 2x is invertible, giving the same crossing chart. This rank-two extension asserts local normal crossings and does not assert the global irreducibility of the n≥3 quadric. (Kraemer03, Definition 4.1, p. 7; proof of Theorem 4.5, equations (4.3)–(4.11), pp. 11–13; the rank-two case is the computation given here.)

*Route.* Choose the invertible Hodge minor and normalize the kth coordinate of the extra line. Eliminate the symmetric matrix A and γ using A+uI=λγᵗ and λ_k=1 to obtain yΣx_i²=2u. At quadric points use its nonzero gradient for an étale coordinate z=Σx_i²/2; away the quadric or y=0 use the smooth equation. For n=2 check the two geometric roots explicitly, without importing the n≥3 geometric irreducibility assertion.

**Checks.**

- The n=2 crossing is étale locally yz=u over O_L̆.
- The n=2 residue quadric consists of two geometric points, so it is not claimed irreducible.
- The chart after u=t^e with e>1 need not be regular.

*Needs:* §5.3; AlgebraicModuliForArithmeticGeometry §1.3; SchemeAndStackFoundations Layer 4.

### 5.7 Krämer regularity theorem

N_n^Kra is flat, regular and locally formally of finite type over O_L̆, of relative dimension n−1, and has semistable reduction over this natural coefficient ring. Its forgetful map to the wedge-model framed functor is proper and an isomorphism on the generic fibre. Global models after a ramified coefficient extension require a separate regularity check; the global n=2 case is not obtained from RSZ21 Theorem 6.7(ii). (HLSY23, §2.1, p. 10; Howard19 Proposition 2.2, p. 6; RSZ21 Theorem 6.7 and Remark 6.8, pp. 32–33.)

This target assumes that L/K is ramified quadratic, p>2, ū=−u and n≥2, and fixes a supersingular principal hermitian framing of signature (1,n−1).

*Route.* Use the Krämer local-model filtration calculation for the representing formal chart. The filtration resolves the isolated wedge-model singularity; check the normal-crossing local equation over O_L̆. Transfer flatness and regularity through the smooth local-model chart; record coefficient base change separately.

**Checks.**

- The absolute dimension over the DVR is n, and relative dimension is n−1.
- For n=2 the global local-model reflex field and ramified base change in RSZ21 Remark 6.8 must be distinguished from the formal Krämer model.

*Needs:* §5.3; AbelianSchemesAndArithmeticModuli §A4.7; §0.2; §5.6.

### 5.8 Krämer special Hom space

For the ramified principal framing 𝕏 and the rank-one source Y of Layer 5, define `V=Hom^0_{O_L}(Y,𝕏)` with h(x,y)=λ_Y^−1 y∨λ_𝕏x in `End^0_{O_L}(Y)=L`. This is a nondegenerate dimension-n Hermitian space. The group of exact-polarization framing quasi-isogenies acts by postcomposition and identifies with U(V)(K). The fixed-space comparison includes the source-line norm and becomes an isometry only in Layer 5’s normalized choice. (HLSY23, §2.2, equations (2.3)–(2.6), p. 11.)

*Route.* Use the full faithfulness of the relative isocrystal functor of §0.1 to form the rational O_L-linear Hom space. Compute the adjoint formula for h and prove its nondegeneracy. Identify the postcomposition isometries, retaining the precise source polarization normalization.

**API.**

- V carries the λ_Y-normalized pairing h(x,y)=λ_Y⁻¹y^∨λ_𝕏x with values in `End⁰_{O_L}(Y)=L`.
- The L-dimension is n and the endomorphism field of the source is L.
- The exact-polarization framing self-quasi-isogenies of 𝕏 form the group U(V)(K), acting by postcomposition.
- Isomorphisms of both polarized source and target induce the corresponding Hom-space isometry.

**Checks.**

- h(y,x) is the L/K-conjugate of h(x,y).
- For n=2 this space has L-dimension 2, not relative-isocrystal dimension 4.
- Rescaling λ_Y by c multiplies h by c^−1, which is tracked in the comparison.

*Needs:* §5.2; §5.3; §5.4; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10; VectorBundlesAndIsocrystals Layer 1, “Finite isocrystals over the completed maximal unramified coefficient field” and “Dieudonné–Manin classification of finite isocrystals”; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9.

### 5.9 Special Hom and fixed-space comparison

Fix a principal rank-one source Y and a nonzero vector e of its rational fixed line C_Y. Evaluation b:x↦x(e) identifies `Hom^0_{O_L}(Y,𝕏)` with C as L-vector spaces, and (b(x),b(y))_C=h(x,y)(e,e)_Y. When e is an O_L-generator of the integral fixed lattice `M(Y)^{τ=1}` of §5.2, (e,e)_Y is an O_K-unit, and b is an isometry after rescaling the principal source polarization by that unit to normalize (e,e)_Y=1; for any other basis ae₀ of C_Y, with e₀ such a generator and a∈L^× not a unit, (e,e)_Y=aā(e₀,e₀)_Y has K-valuation val_L(a)≠0, so no unit rescaling makes b an isometry while keeping λ_Y principal. Do not silently replace a similarity by an isometry. (HLSY23, §2.2, pp. 11–12.)

*Route.* Identify O_L-linear rational homomorphisms by the full faithfulness of the relative isocrystal functor of §0.1. Evaluate at the chosen basis of the source line. Compute adjoints and keep its Hermitian norm factor.

**Checks.**

- The norm factor is 1 exactly in the chosen normalization.
- Changing e to ae multiplies the factor by a ā: for a∈O_L^× by a unit, for a=u by −u², of K-valuation 1.
- The factor is (e,e)_Y, not its inverse. Rescaling λ_Y by c∈O_K^× multiplies h by c⁻¹ (§5.8) and the norm (e,e)_Y by c, while C_Y, e, b and the left side (b(x),b(y))_C, which uses only λ_𝕏, are unchanged; so h(x,y)(e,e)_Y is invariant, as the identity requires, whereas h(x,y)(e,e)_Y⁻¹ would be multiplied by c⁻², which is not 1 for c=2.

*Needs:* §5.2; §5.4; §5.8; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10; VectorBundlesAndIsocrystals Layer 1, “Finite isocrystals over the completed maximal unramified coefficient field”.

### Examples

- The rank-two chart. For n=2 the Krämer chart is y(1+x²)=2u over O_L̆. Since p is odd the roots x=±i of 1+x² are simple, z=(1+x²)/2 is an étale coordinate there, and the chart becomes yz=u: regular, with special fibre the two smooth branches y=0 and z=0 crossing transversally.
- Ranks of the filtration. For n=3 the Krämer filtration is a rank-2 summand of Lie X with conjugate action and a rank-1 structural quotient; for n=2 both have rank 1, and only the actions distinguish them.
- Parity. For n=3 the two framing classes of §5.5 give isomorphic formal spaces (a unit rescaling changes the determinant sign in odd rank); for n=2 they do not, so the sign is part of the datum.

### Dependencies

Within this roadmap: Layer 0 (§0.1, §0.2, §0.3, §0.7).

Suppliers: FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10, §R07.2.20; VectorBundlesAndIsocrystals Layer 1, “Finite isocrystals over the completed maximal unramified coefficient field” and “Dieudonné–Manin classification of finite isocrystals”; EndoscopicTransferAndUnitaryTraceComparison §§7.6, 10.2; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9; AlgebraicModuliForArithmeticGeometry §1.3; SchemeAndStackFoundations Layer 4; AbelianSchemesAndArithmeticModuli §A4.7.

## Layer 6: Global CM and unitary comparison data

Specialize the imported PEL and torus data to the RSZ fibre-product group, integral lattice/polarization levels and CM component. Prove that the integral CM moduli are finite étale at every prime. Define local admissibility at every p-place, justify the unramified coefficient compositum under its actual hypotheses, and impose the crystalline/Tate sign and actual Eisenstein annihilation conditions. Compare the auxiliary CM product conventions with RSZ arrows without discarding the common scalar quotient.

### 6.1 Strict fake Drinfeld datum

From the existing rank-one CM datum W₀ and unitary PEL datum V, specialize the positive norm torus `Z^ℚ={z∈Res_{F/ℚ}𝔾_m:Nm_{F/F⁺}(z)∈𝔾_m}` and rational-similitude group `G^ℚ={g∈Res_{F⁺/ℚ}GU(V):c(g)∈𝔾_m}`. Construct `G̃=Z^ℚ×_{𝔾_m}G^ℚ` and the isomorphism (z,g)↦(z,z^−1g) with `Z^ℚ×Res_{F⁺/ℚ}U(V)`. Transport the existing Shimura cocharacter, whose φ-component has z and z̄ eigenspaces of dimensions r_φ and r_φ̄. Its reflex field is E=E_Φ E_r, containing φ₀(F). Generic torus canonical models and generic PEL data are imported, not reconstructed. (Zhang21, §6.1, equations (6.1)–(6.6), pp. 901–902; LZ22 §11.1, p. 73.)

This target assumes that F/F⁺ is a CM extension, Φ a CM type with distinguished φ₀ and n≥2, with signature (n−1,1) at φ₀ and (n,0) at the other members of Φ; the carriers, the rational similitude convention and the positive CM norm torus are those of PELModuli.

*Route.* Restrict the existing similitude character to rational multipliers and form the fibre product with the norm torus. Verify the product isomorphism and its inverse (z,u)↦(z,zu). Compute the stabilizer of the labeled signature and CM type to identify the compositum reflex field.

**API.**

- G̃ has two projections, to Z^ℚ and to G^ℚ, on which the multiplier characters agree.
- (z,g)↦(z,z⁻¹g) is an isomorphism of algebraic groups `G̃≅Z^ℚ×Res_{F⁺/ℚ}U(V)`, with inverse (z,u)↦(z,zu).
- The reflex field of the transported cocharacter is E_ΦE_r, with the specified embedding of F.
- Product compact open levels correspond under the product isomorphism.

**Checks.**

- For (z,g) the equation c(g)=Nm(z) is necessary; arbitrary independent factors in Z^ℚ×G^ℚ are rejected.
- The inverse of (z,u) is (z,zu), rather than (z,u).
- Exactly one real place has signature (n−1,1); the others have (n,0).

*Needs:* PELModuli §M0.6; PELModuli §M0.7; PELModuli §M0.23; PELModuli §M0.16; ShimuraVarieties §4.5; ShimuraVarieties §6.7; PELModuli §M5.5.

### 6.2 Admissible CM coefficient data

For a chosen p-adic embedding and distinguished place u, retain an admissible CM type Φ in the sense used by Li–Liu: at a split v|p all embeddings inducing the selected F-place lie on the same side of Φ; at an inert v the local type is pulled back from the maximal unramified subfield. In the exotic extension, each ramified v additionally has compositum of F_u with the local CM-type reflex field unramified over F_u. Set K=F_uE_Φ, the subfield of ℚ̄_p generated by the closure F_u of F under the fixed p-adic embedding (which induces the place above u) and by the reflex field E_Φ. The exotic condition is imposed at every ramified v above p, not only at u. (LL21, Notation 5.6, p. 28; LL22 Definition 1.1, p. 3, and Notation 4.19, p. 57.)

*Route.* Use the existing generalized CM type and its embeddings at p. Impose the three place-type clauses and compute the local reflex field by its stabilizer. Form the compositum in the chosen algebraic closure of ℚ_p.

**API.**

- An admissible CM datum consists of Φ, the selected p-adic embedding, and the split, inert and ramified admissibility clauses at every v|p.
- Its coefficient field is K=F_uE_Φ inside ℚ̄_p, with the fixed embeddings.
- At each ramified v|p the compositum of F_u with the local CM-type reflex field is unramified over F_u.
- Admissibility is preserved by simultaneous relabelling of the embeddings and places.

**Checks.**

- A split local CM type choosing embeddings on both sides is rejected.
- Admissibility can fail because of a ramified place v≠u above the same p.
- Let F⁺_v=ℚ_p(√p) and F_v=F⁺_v(√ε) unramified quadratic over F⁺_v, so the maximal subfield of F_v unramified over ℚ_p is `ℚ_{p²}` and the four embeddings of F_v are the pairs (σ,±) of an embedding σ of `ℚ_{p²}` and a sign of √p, with conjugation acting by σ↦σ̄. The type {(σ,+),(σ,−)} is pulled back from `ℚ_{p²}` and is admissible at the inert v; the CM type {(σ,+),(σ̄,−)} is not pulled back and is rejected. When F_v/ℚ_p is unramified every local type is pulled back and the clause is vacuous.

*Needs:* PELModuli §M0.25; PELModuli §M0.16; §6.1.

### 6.3 Auxiliary CM product comparison

For the Li–Liu even-rank unitary canonical model X_L and auxiliary positive-CM canonical model Y at neat rational-norm torus level, identify the generic moduli of sextuples with (X_L×_E Y) over E′=EE_Φ. Retain the Li–Liu equivalence by paired quasi-isogenies (A₀,A) pulling both polarizations back by one common rational scalar. It is compared to the RSZ groupoid through its torus fibre product and rigidifications; it is not identified objectwise with the groupoid whose A₀ arrows are exact isomorphisms. Change-of-complex-embedding maps are compatible with the transported level and CM actions. (LL21, §5, Lemmas 5.2 and 5.5, pp. 26–28.)

*Route.* Apply the generic PEL/CM equivalence with the common multiplier on both factors. Use the product group isomorphism and CM reciprocity to descend the complex identification to E′. Track the torus rigidification and the embedding change, rather than discarding the scalar equivalence relation.

**Checks.**

- The same scalar is used for both λ₀ and λ in the Li–Liu arrows.
- The CM factor Y remains in the generic-fibre identification.

*Needs:* §6.1; PELModuli §M1.9; PELModuli §M4.3; ShimuraVarieties §5.10; §6.2.

### 6.4 Unramified CM coefficient extension

Let Φ satisfy §6.2 at every v|p. Then K=F_uE_Φ is unramified over F_u: split factors contribute only unramified embedding data, inert factors come from unramified subfields, and each ramified factor has `F_uE_{Φ_v}/F_u` unramified by the actual admissibility clause. The local reflex field E_Φ lies in the compositum of these fields. In the split/inert distinguished range the Galois-closure condition of LL22 Definition 1.1 is a sufficient existence criterion for such a Φ. At a ramified exotic distinguished u retain existence of an admissible Φ as an explicit datum; no membership of u in the split/inert set is asserted. Smoothness and semistability transfers use the resulting unramified K/F_u. (LL21, Notation 5.6, p. 28; LL22 Definition 1.1 and Remark 1.2, p. 3, Notation 4.19, p. 57.)

*Route.* Express the stabilizer of the global CM type as the intersection of its local stabilizers and embed its reflex field in their compositum. Use the single-side split and unramified-pullback inert conditions. Use `F_uE_{Φ_v}/F_u` unramified at every ramified v; finite composita and subextensions of unramified local extensions remain unramified.

**Checks.**

- The conclusion includes all ramified factors above p, not just the distinguished one.
- A ramified coefficient extension is not declared semistability-preserving.

*Needs:* §6.2; PELModuli §M0.17.

### 6.5 Integral Eisenstein conditions

After the maximal-unramified embedding decomposition Lie `A=⊕_{w,ψ}Lie_{w,ψ}A`, at a banal factor form `Q_{A_ψ}(T)=∏_{φ∈A_ψ}(T−φ(π_w))`, where A_ψ is the set of embeddings extending ψ with r_φ=n, and require `Q_{A_ψ}(i(π_w))=0` as an endomorphism of that Lie summand. At the fake-Drinfeld factor of a distinguished place v₀ inert in F, with w₀ the place of F above v₀, r=n−1 at φ₀ and r=1 at φ̄₀, let ψ̄₀ be the restriction of φ̄₀ to the maximal subfield of `F_{v₀}` unramified over ℚ_p, and impose on `Lie_{w₀,ψ̄₀}A` the condition of RZ17 (8.2) with φ̄₀ as its distinguished embedding: `(i(π_{w₀})−φ̄₀(π_{w₀}))∘Q_{A_ψ̄₀}(i(π_{w₀}))=0` and `Λ²Q_{A_ψ̄₀}(i(π_{w₀}))=0` on that summand, for every CM type. Call the signature at v₀ of Mihatsch type when, for every embedding ψ of that maximal unramified subfield, the embeddings of `F_{v₀}` above ψ other than φ₀ and φ̄₀ all have the same r_φ; this holds whenever `F⁺_{v₀}/ℚ_p` is unramified. Exactly for signatures of Mihatsch type the conditions at v₀ are Mihatsch’s P(r,s) with its structural-action clause for K₀=ℚ_p (§0.4): with structural embedding φ̄₀ and (r,s)=(1,n−1) when A_ψ̄₀ is empty, and with structural embedding φ₀ and (r,s)=(n−1,1) when A_ψ̄₀ contains every other embedding above ψ̄₀. For any other signature no P(r,s) has the Lie ranks the Kottwitz condition prescribes, and §§0.4–0.6 do not apply at v₀. These are actual annihilation/subquotient conditions, independent of the uniformizer and descended to `O_{E,ν}`; a determinant polynomial or the ranks alone is insufficient in ramified absolute extensions. (RSZ21, §5.2, cases (1)–(2), p. 25 and footnote 11; Mih19 §2, Lemma 2.10 and Proposition 2.12, pp. 7–10; RSZ20 equation (4.10), pp. 16–17; RZ17, equations (8.1)–(8.2), p. 28, the condition RSZ21 case (2) imports; Zhang21, footnote 3, p. 908, and LZ22, §13.1, footnote 5, p. 81, assert the agreement with Mih19 without the restriction to signatures of Mihatsch type (see References).)

*Route.* Construct the embedding summands over a common unramified splitting coefficient ring. Impose the actual polynomial zero-endomorphism condition on banal factors and the condition of RZ17 (8.2) on the distinguished factor. For a signature of Mihatsch type, that condition and P(r,s) each cut out a flat closed subscheme of the naive local model at v₀ with the same generic fibre (RZ17 Lemma 8.6, p. 30; Mih19 Proposition 2.12, p. 9), hence the same subscheme, the closure of that generic fibre; for any other signature compare the Lie ranks of the Kottwitz condition with those of Mih19 Lemma 2.10. Use the uniformizer-independence argument and faithfully flat descent to the reflex coefficient ring.

**API.**

- At a banal factor the condition is the zero-endomorphism equation `Q_{A_ψ}(i(π_w))=0` on the Lie summand.
- At the fake-Drinfeld factor of an inert v₀ the condition is that of RZ17 (8.2) on the summand of φ̄₀, for every CM type; it is the P(r,s) condition of §0.4 exactly when the signature at v₀ is of Mihatsch type.
- The resulting condition is unchanged by replacing π_w by another uniformizer.
- Pullback preserves the annihilation equations and their descended formulation.

**Checks.**

- If A_ψ is empty, Q=1 forces the banal Lie summand to vanish.
- When the local absolute field is unramified, the Kottwitz condition already implies this clause.
- A nonzero nilpotent Jordan block with the correct characteristic polynomial can fail the required zero-endomorphism equation.
- Not every signature is of Mihatsch type. Take `F⁺_{v₀}=ℚ_p(p^{1/3})`, `F_{v₀}=F⁺_{v₀}ℚ_{p²}` and n=2; write the embeddings of `F_{v₀}` as (σ,j) and (σ̄,j), with σ,σ̄ the embeddings of `ℚ_{p²}` and j=1,2,3 indexing the cube roots of p, and take φ₀=(σ,1) and `Φ_{v₀}={(σ,1),(σ,2),(σ̄,3)}`. Then r is 1 at (σ,1) and (σ̄,1), 2 at (σ,2) and (σ̄,3), and 0 at (σ̄,2) and (σ,3), so both Lie summands have rank 3, whereas every P(r,s) for K₀=ℚ_p prescribes ranks r and 6−r with r≤2 (Mih19 Lemma 2.10): no P(r,s) applies. The condition of RZ17 (8.2) applies with A_ψ̄₀={(σ̄,3)}, the summand of φ̄₀=(σ̄,1) having rank 2·1+1=3 as RZ17 (8.1) requires, and its local model is smooth of relative dimension n−1=1 (RZ17 Lemma 8.6). For `Φ_{v₀}={(σ,1),(σ,2),(σ,3)}` the ranks are 5 and 1, A_ψ̄₀ is empty, and the conditions at v₀ are P(1,1) with structural embedding φ̄₀.

*Needs:* §0.4; §6.2; PELModuli §M0.18; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10.

### 6.6 Integral CM moduli at every prime

Let F/F⁺ be a CM field, Φ a CM type with reflex field E_Φ, and `a⊆O_{F⁺}` a nonzero ideal. The moduli problem M₀^a over `O_{E_Φ}` of triples (A₀,ι₀,λ₀), with A₀ an abelian scheme, ι₀:O_F→End(A₀) satisfying the Kottwitz condition `char(ι₀(a)|Lie A₀)=∏_{φ∈Φ}(T−φ(a))` for all a∈O_F, and λ₀ a polarization with ker λ₀=A₀[a] whose Rosati involution induces conjugation on O_F, with arrows the O_F-linear isomorphisms pulling λ₀ back exactly, is a Deligne–Mumford stack finite and étale over Spec `O_{E_Φ}`, at every prime, including the primes ramified in F. For `a=O_{F⁺}` the kernel condition says that λ₀ is principal. It is the disjoint union of open and closed substacks `M₀^{a,ξ}` indexed by the classes ξ of pairs (Λ₀,⟨,⟩₀) of a locally free rank-one O_F-module with an O_F-hermitian alternating ℤ-valued form, positive for Φ, whose dual lattice is a⁻¹Λ₀, up to local similarity by `Ẑ^×` and global similarity by `ℚ^×_{>0}`. Every `M₀^{a,ξ}` is nonempty: the pairs (Λ₀,⟨,⟩₀) are in bijection with the isomorphism classes of complex points of M₀^a, a pair of class ξ giving the complex torus (Λ₀⊗ℝ)/Λ₀ with the complex structure of Φ and the Riemann form ⟨,⟩₀, a complex point of `M₀^{a,ξ}`; being finite étale over the connected Spec `O_{E_Φ}`, `M₀^{a,ξ}` then maps onto it. What can be empty is the set of classes, that is M₀^a itself; M₀^a is nonempty for every a when F/F⁺ is ramified at some finite place. The ideal is integral: the dual of Λ₀ contains Λ₀ for every polarization, so a⁻¹Λ₀ ⊇ Λ₀ forces `a⊆O_{F⁺}`. This extends the CM moduli of PELModuli §M4.7, which assumes p unramified in F, to every prime. (RSZ21, §3.4, the bijection of the set of pairs with the complex points of M₀^a, (3.15)–(3.16) and Remark 3.7, pp. 11–12; §4.1, (4.2), p. 17; LL22, Notation 4.19, pp. 57–58.)

This target assumes that F/F⁺ is a CM extension, Φ a CM type and a a nonzero ideal of `O_{F⁺}`; no condition is placed on the residue characteristic.

*Route.* On a local Artinian thickening, after an étale extension of the base, decompose O_F⊗O_S by places and unramified embeddings; each piece is O_S[x]/(E(x)) for an Eisenstein-type polynomial, and a quotient that is locally free with characteristic polynomial `∏_{φ∈Φ}(T−φ(π))` is R[x]/(H) with H that polynomial, so the Kottwitz condition determines the Hodge filtration. By Grothendieck–Messing and Serre–Tate, (A₀,ι₀) and its polarization therefore deform uniquely: M₀^a is formally étale. Properness from potentially good reduction of CM abelian varieties and finiteness of the polarized objects of fixed type; an étale proper quasi-finite Deligne–Mumford stack is finite étale. The ξ-decomposition is by the Betti lattices on complex points and descends to E_Φ.

**API.**

- An object of M₀^a over an `O_{E_Φ}`-scheme S is a triple (A₀,ι₀,λ₀) as stated, with ker λ₀ equal to the finite flat subgroup scheme A₀[a], the common kernel of the ι₀(x) for x∈a; an arrow (A₀,ι₀,λ₀)→(A₀′,ι₀′,λ₀′) is an O_F-linear isomorphism μ₀ with μ₀^∨∘λ₀′∘μ₀=λ₀, with no similitude factor.
- Pullback along a morphism of `O_{E_Φ}`-schemes preserves the Kottwitz condition, the kernel equation and exact arrows, and M₀^a is a stack for the fppf topology.
- The structure morphism M₀^a→Spec `O_{E_Φ}` is finite étale: an object over a field of characteristic p has, over every Artinian thickening, a deformation with its ι₀ and λ₀ that is unique up to unique isomorphism.
- For each class ξ the substack `M₀^{a,ξ}` is open and closed, nonempty and surjective onto Spec `O_{E_Φ}`; the `M₀^{a,ξ}` are pairwise disjoint and cover M₀^a, and on complex points ξ is the class of H₁(A₀,ℤ) with the Riemann form of λ₀. M₀^a is empty exactly when there is no class ξ.

**Checks.**

- A non-integral ideal is not a polarization type: for F⁺=ℚ, F=ℚ(i) and a=(1/2)ℤ the lattice condition would ask for Λ₀^∨=2Λ₀, a proper sublattice of Λ₀, whereas a polarization makes ⟨,⟩₀ integral on Λ₀ and so Λ₀⊆Λ₀^∨. For a=ℤ the condition Λ₀^∨=Λ₀ is met by a principally polarized elliptic curve with CM by ℤ[i], and for a=2ℤ the condition Λ₀^∨=(1/2)Λ₀ is met by twice that polarization, whose kernel is A₀[2].
- Arrows pull λ₀ back exactly. For F⁺=ℚ(√2), F=F⁺(i) and any object (A₀,ι₀,λ₀), the unit c=1+√2 of `O_{F⁺}` gives an O_F-linear automorphism ι₀(c) of (A₀,ι₀), and, c being fixed by the CM involution, ι₀(c)^∨∘λ₀∘ι₀(c)=λ₀∘ι₀(c²) with c²=3+2√2≠1 totally positive. By the arrow law of the first API bullet, ι₀(c) is therefore an arrow from (A₀,ι₀,λ₀∘ι₀(3+2√2)) to (A₀,ι₀,λ₀); the source is an object, its polarization being the pullback of λ₀ along the automorphism ι₀(c), with the same kernel A₀[a] and the same Rosati involution. It is not an automorphism of (A₀,ι₀,λ₀), since it pulls λ₀ back to λ₀∘ι₀(3+2√2)≠λ₀, and it is not an arrow in the opposite labelling, from (A₀,ι₀,λ₀) to (A₀,ι₀,λ₀∘ι₀(3+2√2)), since it pulls the latter back to λ₀∘ι₀(c⁴)=λ₀∘ι₀(17+12√2)≠λ₀; the arrow in that labelling is ι₀(c⁻¹)=ι₀(√2−1). A groupoid whose arrows allowed `O_{F⁺}^×`-similitudes would count ι₀(c) as an automorphism of (A₀,ι₀,λ₀) and define a different stack.
- For F imaginary quadratic, Φ={φ} and p ramified in F, the p-divisible group of A₀ is a strict `O_{F_p}-module` of relative height 1, whose deformation is unique; so M₀^a is étale at p, a case excluded by the hypothesis that p is unramified in PELModuli §M4.7.
- Over R=k[ε] with k of characteristic p, the x-stable submodules of R[x]/(x²) with free rank-one quotient are exactly the ideals (x+εc), c∈k, since (x+α) contains x² only when α²=0. The Kottwitz condition prescribes the characteristic polynomial T+εc of x on the quotient and so fixes c, whereas the condition rank Lie=|Φ| alone allows every c: rank conditions do not give étaleness.
- Emptiness is a property of M₀^a, not of a component. Take F⁺=ℚ(√3), F=F⁺(i)=ℚ(ζ₁₂), a=`O_{F⁺}` and Φ the two embeddings sending i to the same square root of −1 in ℂ. F/F⁺ is unramified at every finite place (the discriminants are 12 and 144=12²) and O_F has class number one, so a pair is, up to isomorphism, O_F with `⟨x,y⟩₀=Tr_{F/ℚ}(θxȳ)`, θ̄=−θ, and self-duality forces θO_F=(2√3)⁻¹O_F, (2√3) being the different of ℤ[√3]. The units ε of O_F with ε̄=−ε are ±iη with η a unit of ℤ[√3], all of norm +1; so θ=±iη/(2√3), and since √3 changes sign between the two members of Φ while the two images of η have the same sign, the imaginary parts of the two images of θ have opposite signs and θ is never Φ-positive. Hence M₀^a is empty, there is no class ξ and no pair moduli problem over it (RSZ21, Remark 3.7(ii), p. 12); a rescaling of Λ₀ multiplies θ by a totally positive αᾱ and changes nothing. For F imaginary quadratic, ramified over ℚ at some prime, M₀^a is nonempty for every a with a single class ξ (RSZ21, Remark 3.7(i), (iv)), and its one component is nonempty.

*Needs:* PELModuli §§M0.23–M0.25; PELModuli §§M4.7–M4.8; PELModuli §M2.11; AbelianSchemesAndArithmeticModuli §A4.7; AbelianSchemesAndArithmeticModuli §A4.9; §0.1.

### 6.7 Integral unitary level data

Fix O_F-lattices Λ_v of V_v, V being the hermitian space of the Hom-Tate level (`V⊗_F𝔸_{F,f}` is identified with `Hom(V̂(A₀),V̂(A))` carrying the form `h(x,y)=λ₀⁻¹∘y^∨∘λ∘x` of PELModuli §M3.8), and their Hermitian duals Λ_v^♯; fix the CM polarization ideal `a⊆O_{F⁺}` of §6.6 (nonzero, and prime to p when working semi-globally) with M₀^a nonempty, and a selected CM component ξ of M₀^a. Record for every v|p whether F_v/F⁺_v is split, unramified quadratic or ramified quadratic, and its self-dual, almost self-dual or π-modular lattice type. K_v is the lattice stabilizer, except at explicitly named split Drinfeld congruence levels. When a is prime to p the CM lattice Λ₀ is self-dual at every v|p, and the polarization condition at v is that ker λ_v has order #Λ_v^♯/Λ_v. RSZ21 states the same condition on the n-dimensional space W of the Tate module of A, with V=Hom_F(W₀,W): for the hermitian form ( , ) of W and the alternating form `Tr_{F_v/ℚ_p}(c⁻¹( , ))`, c the chosen trace scalar (RSZ21's √Δ), a lattice M of W_v has alternating dual `M^∨=c·𝔇_{F_v/ℚ_p}⁻¹·M^*`, M^* its hermitian dual, and the kernel has order #M^∨/M. The two agree for M=Λ_v·b, b a generator of Λ₀,v: `(x(b),y(b))=(b,b)₀·h(x,y)`, and self-duality of Λ₀,v for its alternating form says `(b,b)₀·O_{F_v}=c·𝔇_{F_v/ℚ_p}⁻¹`, so M^∨=Λ_v^♯·b, whereas M^*=(b,b)₀⁻¹Λ_v^♯·b measures no kernel. A lattice Λ₀⊕Λ of a product datum (§§7.6, 7.7, 8.1, 8.4), Λ a lattice of the Hom-Tate space, means Λ₀,v⊕Λ·b, whose alternating dual is Λ₀,v⊕Λ^♯·b. (RSZ21, Remark 3.4, p. 10; §3.4, Definition 3.9 and Remarks 3.11–3.12, pp. 13–14; §4.1, footnote 7, p. 17, and Definition 4.1(i), p. 18; Remark 6.5, pp. 30–31; LZ22 §11.2, (M6)–(M7), pp. 74–75.)

This target assumes that F/F⁺ is a CM extension, Φ a CM type with distinguished φ₀ and n≥2, with signature (n−1,1) at φ₀ and (n,0) at the other members of Φ; the carriers, the rational similitude convention and the positive CM norm torus are those of PELModuli.

*Route.* Import generic lattice, dual and stabilizer operations from GeometryOfNumbersAndQuadraticArithmetic §2.7. Specify the local dual quotient and the trace-duality conversion for each chosen polarization. Store the local coefficient extension and CM component as part of the level datum.

**API.**

- A level datum consists of the local lattice types, their stabilizers, the trace scalar and the CM component.
- When a is prime to p, at each v|p the polarization kernel has order #Λ_v^♯/Λ_v, the Hermitian dual of Λ_v in V_v, and is contained in the ϖ_v-torsion.
- A lattice M of W_v has alternating dual `c·𝔇_{F_v/ℚ_p}⁻¹·M^*`; for M=Λ_v·b with Λ₀,v self-dual it is Λ_v^♯·b.
- Changing compact open level away p keeps the local p-type and coefficient data fixed.

**Checks.**

- For an unramified quadratic extension with length-one Λ_v^♯/Λ_v over `k_{F_v}`, the kernel order is q_v².
- At an unramified inert place, a nonsplit Hermitian space is not assigned a good self-dual hyperspecial lattice.
- If the local different is nontrivial, omitting its factor does not give the stated alternating-dual comparison.
- Let F⁺_v=ℚ_p, F_v/ℚ_p unramified quadratic, a prime to p and c=pδ with δ a unit, δ̄=−δ. Self-duality of Λ₀,v forces (b,b)₀ to have valuation 1. A principal λ_v has Λ_v^♯=Λ_v, so M=Λ_v·b has M^∨=M and kernel order 1, whereas M^*=p⁻¹M and #M^*/M=p^(2n): the Hermitian dual of the lattice of W_v is the wrong measure of the kernel.

*Needs:* §6.1; PELModuli §M0.22; PELModuli §M3.8; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9; PELModuli §M0.4; §6.6.

### 6.8 Adjusted unitary sign condition

For a polarized CM pair (A₀,A) and nonsplit finite place v, define inv_v using `(−1)^{n(n−1)/2}` times the determinant of the Hermitian Tate-Hom space when reschar(v) is invertible. In characteristic reschar(v), use the Frobenius-fixed determinant line Λⁿ `Hom_{F_v}(D(A₀),D(A))` with its induced Hermitian form; multiply its raw invariant by `(−1)^{Σ_{φ∈Φ_{ν,v}}r_φ}` in RSZ20’s opposite-CM convention. For the positive CM convention transport both r₀ and Φ as in RSZ20 Remark A.2. Impose inv_v^r(A₀,A)=inv_v(V) at every geometric point. The split-place condition is vacuous. Explicitly, the convention-independent parity exponent is `Σ_{φ∈Φ_v}(n·r₀,φ−r_φ)`, where r₀,φ is the CM source multiplicity. It becomes Σr_φ in the opposite-CM convention r₀|Φ=0, and `Σ(n−r_φ)=Σ_{Φ̄_v}r_φ` in the positive-CM convention r₀|Φ=1. (RSZ20, Appendix A, equations (A.1)–(A.8), Remarks A.2–A.3 and Proposition A.1, pp. 54–58.)

*Route.* Apply the Tate-Hom pairing away from the residue characteristic. Construct the determinant isocrystal and its slope-zero fixed line in residue characteristic. Include the CM/signature adjustment and prove base-change invariance and local constancy by the integral comparison in Proposition A.1.

**API.**

- When the residue characteristic of v is invertible on the base, the invariant is the norm class of `(−1)^{n(n−1)/2}` times the determinant of the hermitian Tate-Hom space.
- In residue characteristic p the invariant is the adjusted invariant of the Frobenius-fixed determinant line.
- The adjusted sign is locally constant in a connected family, including specialization between the two realization regimes.
- A polarized CM-pair isomorphism preserves the sign; exact comparison includes the chosen CM convention.

**Checks.**

- For a split quadratic algebra the norm quotient is trivial and the sign condition imposes nothing.
- In the opposite-CM convention an odd Σr_φ changes the raw crystalline sign.
- For even n at a ramified place, self-duality of a lattice alone does not force the required sign.

*Needs:* PELModuli §M3.8; §6.1; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9; AbelianSchemesAndArithmeticModuli §A4.1; PadicHodgeTheory §8.3; PadicHodgeTheory §§3.3–3.5.

### Examples

- Characteristic polynomials do not see the action. Over 𝔽₃ the matrix with rows (0,1) and (0,0) has characteristic polynomial T² and is nonzero; so a Lie action with the right characteristic polynomial need not satisfy the annihilation equation Q(i(π))=0 of §6.5.
- CM moduli at a ramified prime. For F=ℚ(√−p) with p odd and Φ={φ}, the p-divisible group of a point of M₀^a is a strict `O_{F_p}-module` of relative height 1 and dimension 1, so it has a unique deformation and M₀^a is étale at p, a prime that PELModuli §M4.7 excludes.
- Parity exponent of the sign. For n=3, one embedding φ∈Φ_v and r_φ=2, the exponent `Σ_{φ∈Φ_v}(n·r₀,φ−r_φ)` of §6.8 is 3·1−2=1 in the positive-CM convention and −2, of even parity, in the opposite-CM convention: the two conventions differ, so the convention is part of the datum.

### Dependencies

Within this roadmap: Layer 0 (§0.1, §0.4).

Suppliers: PELModuli §M0.6, §M0.7, §M0.23, §M0.16, §M5.5, §M0.25, §M1.9, §M4.3, §M0.17, §M0.18, §§M0.23–M0.25, §§M4.7–M4.8, §M2.11, §M0.22, §M0.4, §M3.8; ShimuraVarieties §4.5, §6.7, §5.10; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10; AbelianSchemesAndArithmeticModuli §A4.7, §A4.9, §A4.1; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9; PadicHodgeTheory §8.3, §§3.3–3.5.

## Layer 7: RSZ integral models and local geometry

Construct localized and semi-global CM-pair models, the polarized multichain local-model diagram and their self-dual, split and almost self-dual geometry with exact coefficient restrictions. Construct ramified wedge/Krämer and exotic even-rank models, their geometry and global level gluing, importing the split Drinfeld levels. In rank two the regular global Krämer model comes from the Krämer local charts, not from the blowup description of RSZ21 Theorem 6.7(ii); normalizations alone imply no regularity.

### 7.1 Localized RSZ moduli

Let D contain all places of residual characteristic 2, all ramified quadratic places, and all inert places where V_v is nonsplit; enlarge it to the pullback of a finite rational-prime set, with product d. Away d choose self-dual lattices and hyperspecial levels; at d choose compact open levels. Over O_E[1/d], define the groupoid of CM pairs (A₀,i₀,λ₀;A,i,λ;η_d) in Zhang21 Definition 6.1: A₀ lies on a chosen component of the principal CM moduli `M₀=M₀^{O_{F⁺}}` of §6.6, which is assumed nonempty, A has the fake-Drinfeld Kottwitz signature and Rosati conjugation, λ is principal in the category localized at d, η_d is the prescribed Hermitian Hom-Tate level, and the Eisenstein clauses hold at every remaining place. Arrows have A₀ an exact polarized isomorphism and A an O_F-linear d-isogeny pulling back λ and the level exactly. (Zhang21, Definition 6.1, pp. 904–905, with §6.2.2, pp. 903–904.)

This target assumes that F/F⁺ is a CM extension, Φ a CM type with distinguished φ₀ and n≥2, with signature (n−1,1) at φ₀ and (n,0) at the other members of Φ; the carriers, the rational similitude convention and the positive CM norm torus are those of PELModuli.

*Route.* Use the localized abelian-scheme PEL carrier and select the CM component. Impose the exact Hom-Tate level and Eisenstein conditions at the places not inverted. Specify the arrow relation in the localized category and verify descent.

**API.**

- An integral point is a polarized CM pair (A₀,i₀,λ₀;A,i,λ;η_d) over O_E[1/d] with the conditions listed.
- Forgetting A and η_d maps to the selected CM component.
- Over E the groupoid identifies with the canonical RSZ Shimura model at the chosen level.
- Pullback preserves the localized polarization and d-isogeny arrows.

**Checks.**

- An inert nonsplit Hermitian place belongs to D and is not assigned good self-dual reduction.
- If the principal CM moduli M₀ is empty, as for F⁺=ℚ(√3), F=F⁺(i) and the CM type of the last Check of §6.6, there is no component to select and no localized RSZ moduli; nonemptiness of M₀ is a hypothesis, not automatic.
- An arrow scaling λ by c≠1 without the corresponding exact localized polarization equality is rejected.

*Needs:* §6.1; §6.7; §6.5; §6.6; PELModuli §M1.7; PELModuli §M1.1.

### 7.2 Semi-global RSZ moduli

Fix ν|p of E and distinguished v₀ of F⁺. Over `O_{E,(ν)}`, the semi-global functor has a CM abelian scheme (A₀,i₀,λ₀) in `M₀^{a,ξ}`, a unitary abelian scheme A with `O_{F,(p)}-action`, Kottwitz signature and Rosati quasi-polarization λ, a prime-to-p Hermitian Hom-Tate K^p-level, and at split v≠v₀ above p the specified étale Hom-level at the CM-selected factor. Require ker λ_v⊂A[ϖ_v] of order #Λ_v^♯/Λ_v at every v|p; impose Eisenstein at the distinguished fake-Drinfeld factor and sign plus Eisenstein at all other p-factors. At v₀ impose the matching sign when needed. Arrows are polarized CM isomorphisms on A₀ and prime-to-p O_F-linear quasi-isogenies on A pulling λ and all levels back exactly. (LZ22, §11.2, conditions (M1)–(M9), pp. 74–75; §11.3, p. 75; RSZ21 Definition 4.1, pp. 18–19.)

This target assumes that F/F⁺ is a CM extension, Φ a CM type with distinguished φ₀ and n≥2, with signature (n−1,1) at φ₀ and (n,0) at the other members of Φ; the carriers, the rational similitude convention and the positive CM norm torus are those of PELModuli. Every place above 2 is unramified in F, at v₀ one of the local cases stated below holds, and K^p is sufficiently small whenever a scheme rather than a stack is asserted.

*Route.* Assemble the generic PEL/CM pair with prime-to-p quasi-isogeny arrows. Use the local kernel types and the split étale Hom-levels; retain their chosen CM-side orientation. Impose the descended sign and Eisenstein clauses and the selected CM component.

**API.**

- A point is a CM pair with all local p-types, prime-to-p levels and split Hom-levels.
- Its CM factor is a point of `M₀^{a,ξ}`, with a prime to p.
- The generic functor recovers the chosen RSZ canonical model.
- Changing K^p gives the forgetful/Hecke maps of the generic PEL level system while retaining p-data.

**Checks.**

- Since a is prime to p, λ₀ induces a principal polarization on the local CM p-divisible factor.
- An almost self-dual length-one Hermitian quotient has polarization-kernel order q_v².
- An object satisfying the distinguished-place condition but violating the sign at another nonsplit p-place is rejected.
- At a split v₀ with self-dual lattice, signature (1,n−1) and the CM-type matching of RSZ20 (4.19), this functor is the level-zero model Y₀ to which IgusaVarietiesAndTorsionConcentration §0.31 adds Drinfeld level: its strict height-n module is `Hom_{O_{F,w₀}}(A₀[w₀^∞],A[w₀^∞])`, not A[w₀^∞] itself.

*Needs:* §6.1; §6.7; §6.5; §6.8; §6.6; PELModuli §M1.6; PELModuli §M1.1.

### 7.3 Exotic integral model

For n even, a ramified quadratic distinguished place u with F⁺_u/ℚ_p unramified, an admissible Φ and K/F_u unramified as in Layer 6, construct the unitary integral model over O_K with π-modular exotic local polarization. Require (A[u^∞],i,λ)∈Exo_Φ(n−1,1), while A₀ remains the rank-one CM factor. At every other place v above p that ramifies in F, take Λ_v π_v-modular for a uniformizer π_v of F_v, so that ker λ[v^∞]=A[v^∞][i(π_v)], and impose on Lie A[v^∞] the banal Eisenstein condition of §6.5; the signature of A at the embeddings inducing v is banal, and neither condition needs a hypothesis on F⁺_v/ℚ_p (RSZ21, §5.2, case (1), p. 25, and Theorem 5.4(b)). When F⁺_v/ℚ_p is unramified, the banal Eisenstein condition says that O_F acts on each embedding summand of Lie A[v^∞] through the member of Φ above that embedding, and with the kernel condition it is membership of (A[v^∞],i,λ) in the category Exo_Φ(n,0) of LL22 (Remark 2.67, p. 44). Impose the split/banal/inert conditions at the remaining p-places and retain the chosen CM component or auxiliary CM product according to its arrow convention. LL22 prints A₀ in place of A in the conditions at the ramified places; only A has the height and dimension of Exo_Φ(n−1,1) (see References, LL22). (LL22, §4.5, pp. 65–66, and Remark 2.67, p. 44; RSZ21, Theorem 5.4(b), (e) and Theorem 5.7, pp. 26–27.)

*Route.* Apply the unitary local-model diagram with the π-modular wedge and spin conditions at u and the banal Eisenstein conditions at the other ramified places, where the local-model factor is a point (RSZ21, proof of Theorem 5.4). Identify the absolute distinguished factor at u with Exo_Φ(n−1,1), of rank n, apart from the rank-one CM factor. Use the generic CM-product comparison to identify the chosen canonical model.

**API.**

- A point is a CM pair (A₀,A) with the exotic conditions imposed on the rank-n factors of A.
- At u, A[u^∞] is an absolute exotic object of height 2nf and dimension nf.
- The generic fibre is the auxiliary-CM unitary canonical model.
- At fixed p-type the permitted prime-to-p split-level changes give the integral Hecke/forgetful system.

**Checks.**

- For n≥2 the rank-one A₀[u^∞] cannot satisfy the height and dimension of Exo_Φ(n−1,1).
- The distinguished kernel is A[i(u)] and is not principal.
- Omitting the banal Eisenstein condition at another ramified v above p changes the functor. Take n=2 and F⁺_v=ℚ_p, so that a single embedding summand of Lie A[v^∞] has rank 2: over a field of characteristic p, i(π_v) acting by the matrix with rows (0,1) and (0,0) has square 0, as π_v² requires there, and characteristic polynomial T², the one the Kottwitz condition prescribes, but it is nonzero, whereas the Eisenstein condition demands i(π_v)=φ(π_v)=0 there (Conventions, item 3).
- When F⁺_v=ℚ_p the condition at v says that O_F acts on Lie A[v^∞], of rank n, through the member φ of Φ inducing v, with polarization kernel A[v^∞][i(π_v)]: A[v^∞] has height 2n and dimension n, and with the structural action taken to be φ it is the relative Exo(n,0) of §3.1 for K=ℚ_p and L=F_v.

*Needs:* §4.1; §7.2; §6.4; §6.3; §6.5; §6.7.

### 7.4 Global Krämer modification

Assume p odd, `F_{v₀}/F⁺_{v₀}` ramified quadratic, `F⁺_{v₀}/ℚ_p` unramified and `Λ_{v₀}` self-dual. Impose the wedge equations for signature (n−1,1) on the distinguished Lie factor and Eisenstein on banal factors. Construct the global Krämer enhancement by a stable locally direct summand P⊂Lie A whose embedding-summand ranks are `r^Φ_{w,ψ}=Σ_{φ∈Hom_{w,ψ}∩Φ}r_φ` and which is annihilated on P and Lie A/P by the respective products ∏(T−φ(π_w)) for the two CM halves with nonzero r_φ. This is the Krämer–Eisenstein condition of RSZ21 (6.10), independent of π_w. At the distinguished rank-n factor P has structural rank n−1 and quotient conjugate rank 1; compare Layer 5 by conjugating the local actions. (RSZ21, Definition 6.10, equations (6.6)–(6.10) and Lemma 6.11, pp. 33–34; LZ22 §11.6, p. 77.)

*Route.* Construct the global relative Grassmannian of the prescribed embedding ranks. Impose the two annihilator equations on the subbundle and quotient, with faithfully flat descent. Identify its local distinguished factor with the Layer 5 filtration after the stated conjugation.

**API.**

- A point of the Krämer enhancement is a point of the wedge model with an embedding-indexed P satisfying the Krämer–Eisenstein equations.
- Forgetting P maps to the wedge RSZ model.
- After conjugating the local O_L-actions (§0.7), the distinguished formal factor is Layer 5’s Krämer functor.
- The filtration and uniformizer-independent annihilator equations commute with base change.

**Checks.**

- On the distinguished global rank-n factor, P has rank n−1 with structural action.
- The Layer 5 comparison swaps the local structural/conjugate labels, rather than imposing both contradictory rank conditions.
- On a banal factor the equation reduces to the corresponding Eisenstein annihilator clause.

*Needs:* §7.2; §5.1; §6.5; SchemeAndStackFoundations Layer 4; AlgebraicModuliForArithmeticGeometry §1.3.

### 7.5 Unitary local-model comparison

For the semi-global functor, construct its torsor of trivializations of the polarized de Rham lattice multichain generated by Λ_p and its dual, and its Hodge-filtration map to the corresponding unitary Grassmannian local model times the CM base. The torsor group is the automorphism group scheme of the polarized multichain, smooth by gap:unitary-multichain-stabilizer. The torsor map and Hodge map are smooth of equal relative dimension, with the imposed Eisenstein, wedge/spin or Krämer equations on the local model. This is the particular unitary local-model diagram, built from Grothendieck–Messing and the Grassmannians of AlgebraicModuliForArithmeticGeometry §1.3. (RSZ21, §5.1, diagram (5.5) and decompositions (5.6)–(5.7), pp. 23–24; Theorem 5.4, pp. 26–27.)

*Route.* Associate to the polarization isogeny the self-dual periodic chain of de Rham modules and Hodge quotients. Represent its trivialization torsor under the automorphism group scheme of the polarized multichain (gap:unitary-multichain-stabilizer). Apply Grothendieck–Messing to lifting of a trivialization and Hodge filtration; compare their relative dimensions.

**API.**

- The torsor of trivializations of the polarized de Rham multichain maps to the integral moduli and is a torsor under the automorphism group scheme of the multichain.
- The Hodge-filtration map from the torsor to the local model times the CM base is equivariant.
- The diagram and the two smooth maps commute with coefficient base change.
- Étale/formally smooth charts transfer the local-model flatness and geometric singularity type to the moduli, with the CM factor retained.

**Checks.**

- For a self-dual unramified type the local model is the rank-one Grassmannian chart of dimension n−1.
- An almost self-dual polarization gives a lattice multichain, not the perfect-pairing single-lattice chart.
- After ramified base change the diagram still exists, but a chart uv−ϖ becomes uv−t^e and cannot certify regularity.

*Needs:* §7.2; AbelianSchemesAndArithmeticModuli §A4.7; AbelianSchemesAndArithmeticModuli §A4.3; SchemeAndStackFoundations Layer 4; §6.7; AlgebraicModuliForArithmeticGeometry §1.3; gap:unitary-multichain-stabilizer.

### 7.6 Localized smoothness and representability

The localized RSZ functor is a smooth separated finite-type Deligne–Mumford stack over O_E[1/d] of relative dimension n−1. For sufficiently small levels on both the CM and unitary factors it is represented by a quasi-projective scheme, and sending a point to the product A₀×A with the action of O_F×O_F, the product polarization and the level structure induced by η₀ and η (through V(A)≅V(A₀,A)⊗V(A₀), V(A₀) being free of rank one) is a finite morphism to the PEL moduli of the product datum: the moduli of PELModuli §M2.8 when every residue characteristic of O_E[1/d] is unramified in F⁺ (then every prime of the base is good for the product datum in the sense of PELModuli §M0.10), and otherwise the multichain moduli of gap:bad-prime-projectivity, whose multichain at every prime of the base is generated by the single self-dual lattice Λ₀⊕Λ in the sense of §6.7. The theorem uses the prescribed good local types and Eisenstein condition, not just the generic Kottwitz signature. (Zhang21, Theorem 6.2, p. 905; Stacks, Tags 0B3G, 0B3H, 0C4M (quasi-projectivity along finite morphisms and under base change); RZ96, Definition 6.9, p. 279 (the multichain moduli problem of the bad case).)

*Route.* Apply PELModuli §M2.8 and §6.6 and impose the local conditions. Compute deformations at every point of characteristic p, ordinary, μ-ordinary or basic, through the Grothendieck–Messing local-model diagram built as in §7.5 from the self-dual lattices at the places above p, which needs no formality of A[p^∞]: at the distinguished factor the local model is the Lubin–Tate local model of RZ17 Lemma 8.6, p. 30, smooth of relative dimension n−1 for every CM type: directly when the place is split, and when it is inert through the summand indexed by ψ̄₀ of §6.5, which determines the summand indexed by the conjugate of ψ̄₀ as its orthogonal complement (RSZ21, proof of Theorem 5.4, case (c), p. 27); at the banal factors the Eisenstein equations of §6.5 make the local model a point, and the CM factor is étale by §6.6 (RSZ21, Theorem 5.4 and Theorem 5.7 with their proofs, pp. 26–28). The comparison C of §0.4 is defined on supersingular objects only and is not used. Kill stabilizers by sufficiently small levels on both factors. For quasi-projectivity prove the comparison with the product PEL moduli finite (the pair is recovered from its image: A₀ and A as the images of the two idempotents of O_F×O_F, η from the product level structure and η₀; the conditions defining the source are closed, so the comparison is proper and quasi-finite) and pull back quasi-projectivity of that PEL moduli, base-changed to O_E[1/d] (a finite morphism is quasi-affine of finite type, hence quasi-projective; quasi-projective morphisms compose over a quasi-compact base and are stable under base change: Stacks Tags 0B3H, 0C4M, 0B3G): it is ShimuraCompactifications §7.18 when every residue characteristic of O_E[1/d] is unramified in F⁺, so good in the sense of PELModuli §M0.10, and gap:bad-prime-projectivity for the multichain generated by Λ₀⊕Λ when O_E[1/d] keeps a prime ramified in F⁺; quasi-projectivity is not local on the base, so the second case is not reduced to the first prime by prime.

**Checks.**

- For n=2 relative dimension is 1.
- Small unitary level alone does not remove a nontrivial CM automorphism.
- For F⁺=ℚ(√3), F=F⁺(i) and p=3: 3 is ramified in F⁺ and the place of F⁺ above 3 is inert in F (−1 is not a square modulo 3), so 3 need not divide d; it divides the discriminant of O_F×O_F, 3 is a bad prime in the sense of PELModuli §M0.10, and the comparison lands in the multichain moduli of gap:bad-prime-projectivity, not in that of PELModuli §M2.8. On a base all of whose residue characteristics are unramified in F⁺ the target is the PELModuli §M2.8 moduli and ShimuraCompactifications §7.18 applies unchanged.

*Needs:* §7.1; §7.5; §6.5; §6.6; §6.7; PELModuli §M0.10; PELModuli §M2.8; SchemeAndStackFoundations Layer 1; AbelianSchemesAndArithmeticModuli §A4.7; ShimuraCompactifications §7.18; gap:bad-prime-projectivity.

### 7.7 Exotic integral smoothness

Under §7.3’s hypotheses and sufficiently small/neat levels, the model is smooth over O_K of relative dimension n−1. Sending a point to the product A₀×A with the action of O_F×O_F, the product polarization and the induced level structure is a finite morphism to the multichain moduli of gap:bad-prime-projectivity for the product datum, base-changed to O_K, whose multichain at u is generated by Λ₀⊕Λ_u in the sense of §6.7, with Λ_u π-modular (Λ_u^♯=π⁻¹Λ_u for a uniformizer π of F_u, matching ker λ[u^∞]=A[π]) and at the other places above p by the lattices of §7.3; hence the model is quasi-projective over O_K. It is projective in the compact Li–Liu setting F⁺≠ℚ: V is then definite at a real place, hence anisotropic, so the product datum has no cusp label and its generic fibre is proper. Changes of split prime-to-p level are finite étale. The absolute-to-relative identification used for its formal basic factor requires F⁺_u/ℚ_p unramified and is Layer 4’s comparison. (LL22, §4.5, p. 66, where projectivity is attributed to RSZ20 Theorem 4.7, which does not prove it (see References, LL22), and Assumption 1.3, p. 4; RSZ21 Theorem 5.7, p. 27; RZ96, Definition 6.9, p. 279 (the multichain moduli problem); Stacks, Tags 0B3G, 0B3H, 0C4M, 01WN, 0BCL (quasi-projectivity and properness along finite morphisms).)

*Route.* Use the even-rank π-modular local-model smoothness theorem at the distinguished place (RSZ21, Theorem 5.4(e) and the proofs of Theorems 5.4 and 5.7, pp. 26–28; the local model is that of §3.4, smooth by RSZ17 Proposition 3.10 and PaRa09 §5.c). Use the banal smooth factors (RSZ21, Theorem 5.4(b) and Theorem 5.7) and the étale CM base at the other p-places. Prove the comparison with the product PEL moduli finite as in §7.6 (the pair is recovered from the two idempotents of O_F×O_F; the exotic Lie and polarization conditions are closed, so the comparison is proper and quasi-finite) and pull back the quasi-projectivity of gap:bad-prime-projectivity (Stacks Tags 0B3G, 0B3H, 0C4M). For F⁺≠ℚ the generic fibre of the product datum is proper (ShimuraCompactifications §§7.3 and 7.5 over the reflex field, no cusp label), so the gap’s properness clause makes its moduli proper, the model is proper as it is finite over it (Stacks Tag 01WN), and proper quasi-projective is projective (Stacks Tag 0BCL). Use the prime-to-p level torsor for finite étaleness.

**Checks.**

- Smooth relative dimension is n−1, not the absolute p-divisible-group dimension nf.
- The projectivity assertion retains the compact global hypotheses.
- The multichain of the comparison at u is Λ₀⊕Λ_u⊂Λ₀⊕π⁻¹Λ_u up to the periodicity by π on the second factor, so its multichain of abelian schemes is determined by A₀×A and λ; the comparison separates λ from cλ for c≠1, since λ₀×cλ is not a rational multiple of λ₀×λ.
- For F⁺=ℚ and even n≥4, V of signature (n−1,1) has a trace form that is an indefinite rational quadratic form in 2n≥8 variables, isotropic by Meyer’s theorem, so V is isotropic, the product datum has a cusp label and the projectivity clause would fail; this is why it keeps F⁺≠ℚ.

*Needs:* §7.3; §7.5; §3.4; §4.6; §6.3; §6.7; SchemeAndStackFoundations Layer 1; gap:bad-prime-projectivity; §7.6; ShimuraCompactifications §7.3; ShimuraCompactifications §7.5.

### 7.8 Ramified wedge and Krämer geometry

The self-dual ramified wedge model is flat, with isolated singularities; the global model is smooth away from ramified quadratic places (subject to its other local types). For every n≥2 the Krämer enhancement is regular with semistable reduction at ν when `E_ν/F_{v₀}` is unramified; for n≥3 it is moreover the blowup of those isolated singularities. For n=2 the wedge model itself is not regular over `O_{E,ν}`: its local model has reflex field `F⁺_{v₀}` and is semistable over `O_{F⁺_{v₀}}`, but E_ν contains `F_{v₀}`, which is ramified over `F⁺_{v₀}`; the Krämer local model is defined over `O_{F_{v₀}}` and keeps its crossing chart after an unramified extension. (RSZ21, Theorem 6.7(ii), its proof and Remark 6.8, pp. 32–33; HLSY23, §10.2, p. 78, where regular semistable reduction is asserted for every n≥2 without the unramifiedness hypothesis on E_ν kept here (see References, HLSY23); LZ22 §11.6, p. 77.)

*Route.* Identify the distinguished wedge local-model factor and the trivial banal factors. Use the explicit Krämer local-model resolution and the equal-dimension smooth chart. Transfer the Krämer charts of §5.6 (étale locally yz=u times n−2 smooth parameters over `O_{F̆_{v₀}}`) through the local-model diagram; u stays a uniformizer over `O_{Ĕ_ν}` because `E_ν/F_{v₀}` is unramified, so the charts remain regular crossings for every n≥2. For n≥3 identify the enhancement with the blowup through the local reflex field `F_{v₀}`; for n=2 record that the wedge model loses semistability.

**Checks.**

- For n≥3 the resolved relative dimension is n−1.
- At n=2 the wedge local model has a chart uv=ϖ over `O_{F⁺_{v₀}}`; after the ramified extension with ϖ=t²·(unit) it becomes uv=t²·(unit), whose maximal ideal at u=v=t=0 needs three generators in a ring of dimension 2, so it is not regular: semistability is lost, as RSZ21 Remark 6.8 states.
- At n=2 the Krämer chart yz=u lives over `O_{F̆_{v₀}}`; after an unramified extension `E_ν/F_{v₀}` the element u is still a uniformizer, so at y=z=0 the maximal ideal is generated by y and z in a ring of dimension 2: the Krämer model is regular and strictly semistable there, unlike the wedge chart of the previous Check.

*Needs:* §7.4; §7.5; §5.7; §5.6; SchemeAndStackFoundations Layer 4.

### 7.9 Self-dual and almost self-dual geometry

If v₀ is split in F, with self-dual `Λ_{v₀}` and the Eisenstein condition of Layer 6 at the CM-selected factor w₀ (the Lubin–Tate condition of RZ17 §8, automatic when v₀ is unramified over p), the semi-global model is smooth of relative dimension n−1. If v₀ is inert, `V_{v₀}` is split and `Λ_{v₀}` self-dual, the semi-global model is smooth of relative dimension n−1, for every CM type; `F⁺_{v₀}/ℚ_p` may be ramified, the Eisenstein condition of §6.5 being imposed at v₀. If v₀ is inert, `V_{v₀}` nonsplit, `Λ_{v₀}` almost self-dual and `F⁺_{v₀}/ℚ_p` unramified, the model is flat of relative dimension n−1; it is regular and semistable when E_ν/ℚ_p is unramified. At the other p-places assume the banal or permitted local types of LZ22 §11.2. For sufficiently small K^p it is representable over the CM stack by a scheme; after neat CM level it is a scheme. (LZ22, §11.2, p. 75; §11.3, pp. 75–76 (semistability when ν is unramified over p, p. 76); §11.4, p. 76; RZ17, §8, equations (8.1)–(8.2), p. 28, and Lemma 8.6, p. 30; RSZ21, Theorem 5.4(c) and Theorem 5.7 with their proofs, pp. 26–28.)

*Route.* Apply the local-model diagram of §7.5, which computes deformations at every point by Grothendieck–Messing, ordinary or not. At a split v₀ the distinguished factor is the Lubin–Tate local model of RZ17 Lemma 8.6, p. 30, smooth of relative dimension n−1. At an inert v₀ with self-dual lattice it is determined by its summand indexed by ψ̄₀ of §6.5, the conjugate summand being its orthogonal complement, and that summand is the local model of RZ17 Lemma 8.6, p. 30, cut out by the condition of RZ17 (8.2) that §6.5 imposes; it is smooth of relative dimension n−1 for every CM type, also when `F⁺_{v₀}/ℚ_p` is ramified (RSZ21, proofs of Theorems 5.4 and 5.7, case (c), pp. 27–28). Neither the local model of §0.6, which needs a signature of Mihatsch type, nor the comparison C of §0.4 is used. In the almost self-dual case use the semistable chart of the almost self-dual local model, as in §2.2; after an unramified base change that local model is the local model of GL_n over `O_{F_{w₀}}` for the periodic lattice chain generated by `Λ_{v₀}` and its dual, whose computation does not use p>2, so the chart serves at a place above 2 as well (RSZ21, proofs of Theorems 5.2 and 5.8, pp. 23–24, 28). Check unramifiedness of the coefficient extension before transferring the latter regularity assertion.

**Checks.**

- The split self-dual inert case and nonsplit almost self-dual inert case have different polarization kernels.
- Flatness survives coefficient extension; regularity is asserted only with the stated unramified base hypothesis.
- At a split v₀ with self-dual lattice the model is smooth; principal congruence levels at v₀ are the Drinfeld levels of IgusaVarietiesAndTorsionConcentration §0.31, not a target here.

*Needs:* §7.5; §6.5; §1.2; §2.2; SchemeAndStackFoundations Layer 1.

### 7.10 Global integral gluing and levels

Under LZ22’s global lattice conditions: at 2 the CM extension is unramified; inert split V has self-dual lattice; inert nonsplit V is unramified over ℚ_p with almost self-dual lattice; split places have self-dual lattice; ramified quadratic places are unramified over ℚ_p with self-dual lattice, construct the O_E-model by integral CM pairs and all corresponding local clauses. At ramified quadratic places use the Krämer enhancement with its rank/base restrictions when a regular model is required. Introduce principal congruence levels only at split places satisfying CM matching and `E_ν/E_{r,v}` unramified, by normalization in the generic cover. Keep the ramified coefficient exceptions for both almost self-dual and Krämer regularity. (LZ22, §14.1–14.2, pp. 84–85; HLSY23 §10.2, pp. 77–79; RSZ21 Theorems 6.2 and 6.7, pp. 30, 32.)

*Route.* Specify the global integral abelian-scheme groupoid with all local conditions and sign components. Identify each localization with its semi-global moduli via the canonical lattice-defined level orbit. Use finite normalization for the selected generic level covers and the Drinfeld-level models of IgusaVarietiesAndTorsionConcentration §0.31 to prove finite flatness and the stated regular loci.

**API.**

- A point is a global integral CM pair satisfying each local clause.
- Localization at ν is the corresponding semi-global functor with its lattice-defined levels.
- For permitted split congruence levels the model is the finite normalization in the generic cover.
- Level restrictions compose and agree with both generic and semi-global forgetful maps.

**Checks.**

- At a self-dual unramified inert place localization is the smooth Layer 7 model.
- At an almost self-dual place a ramified E_ν/ℚ_p is not certified regular by the semistable local theorem.
- A split congruence level failing CM matching or the unramified reflex extension is not covered by the regular-level theorem.

*Needs:* §7.4; §7.8; §7.9; PELModuli §§M4.5–M4.6; §6.6; SchemeAndStackFoundations Layer 1; IgusaVarietiesAndTorsionConcentration §0.31; EndoscopicTransferAndUnitaryTraceComparison §10.2.

### Examples

- Good and bad bases. For F⁺=ℚ and F=ℚ(i) with V split at 3, the prime 3 is inert in F and unramified in F⁺, so it need not divide d and the comparison of §7.6 at 3 lands in the PELModuli §M2.8 moduli. For F⁺=ℚ(√3) and F=F⁺(i)=ℚ(ζ₁₂), the place of F⁺ above 3 is inert in F but 3 is ramified in F⁺, and the comparison lands in the multichain moduli of gap:bad-prime-projectivity.
- Wedge versus Krämer at n=2. The wedge chart uv=ϖ over `O_{F⁺_{v₀}}` becomes uv=t²·(unit) over `O_{F_{v₀}}`, not regular at the origin; the Krämer chart yz=u lives over `O_{F̆_{v₀}}` and stays regular after an unramified extension `E_ν/F_{v₀}`.
- Isotropy for F⁺=ℚ. For n=4 the trace form of a hermitian space of signature (3,1) is a rational quadratic form of signature (6,2) in 8 variables, isotropic by Meyer's theorem; the exotic model is then not proper, which is why §7.7 asserts projectivity only for F⁺≠ℚ.

### Dependencies

Within this roadmap: Layer 1 (§1.2); Layer 2 (§2.2); Layer 3 (§3.4); Layer 4 (§4.1, §4.6); Layer 5 (§5.1, §5.6, §5.7); Layer 6 (§6.1, §6.3, §6.4, §6.5, §6.6, §6.7, §6.8).

Suppliers: PELModuli §M0.10, §M1.7, §M1.1, §M2.8, §M1.6, §§M4.5–M4.6; SchemeAndStackFoundations Layer 1, Layer 4; AbelianSchemesAndArithmeticModuli §A4.7, §A4.3; ShimuraCompactifications §7.18, §7.5, §7.3; AlgebraicModuliForArithmeticGeometry §1.3; IgusaVarietiesAndTorsionConcentration §0.31; EndoscopicTransferAndUnitaryTraceComparison §10.2.

Supplier contracts: gap:bad-prime-projectivity, gap:unitary-multichain-stabilizer (see Exact supplier contracts).

## Layer 8: Neat unitary models and integral isogeny moduli

Construct the mixed global isogeny model using an actual totally positive F⁺ scalar and prove its required local degree q². In the special inert LTXZZ setting construct neat principal and almost self-dual pair models with the common-scalar arrow relation and retained CM factor. Prove the rank-one tangent formula and explicit smooth/crossing local equations, identify the correctly chosen generic Hermitian datum and integral tame Hecke system.

### 8.1 Neat smooth unitary moduli

Use the special inert setting of LTXZZ22 Definition 3.3.4: 𝔭 is a prime of F⁺ that is inert in F, the rational prime p below it is odd and unramified in F, and F⁺_𝔭=ℚ_p; the composite of the distinguished embedding τ∞ with the fixed isomorphism ℂ≅ℚ̄_p induces the place 𝔭 of F⁺. In this setting (§§8.1–8.4 and 8.7), p-adic lattices are self-dual at every prime of F⁺ above p other than 𝔭, and every defect of a lattice or of a polarization at p lies at 𝔭. Take the unramified coefficient ring `ℤ_{p,Φ}`, N≥1, a Hermitian space V of signature (N−1,1) at the distinguished embedding and definite at the others, a self-dual lattice of V⊗_F F_𝔮 at every prime 𝔮 of F⁺ above p, and neat tame unitary/CM levels. Over the finite étale CM level scheme T_p of PELModuli §§M4.7–M4.8, define pairs (A₀,i₀,λ₀,η₀;A,i,λ,η^p) with (A,i,λ) a unitary O_F-abelian scheme of signature type NΦ−τ∞+τ∞^c in the sense of PELModuli §M1.3, λ p-principal, and Hermitian Hom-Tate level η^p. Arrows are prime-to-p quasi-isogenies φ₀,φ on both factors with the SAME c∈ℤ_(p)^× multiplying λ₀ and λ, and with transported CM and Hom levels. This arrow relation differs from RSZ’s exact CM-isomorphism convention; the two groupoids are related through the common-scalar quotient of §6.3. Sending a pair to (A₀×A, i₀×i, λ₀×λ, η₀^p⊕(η^p⊗η₀^p)), where V^p(A)≅Hom_F(V^p(A₀),V^p(A))⊗V^p(A₀) because V^p(A₀) is free of rank one, is a finite morphism to the PEL moduli of PELModuli §M2.8 for the product datum (the algebra F×F with its involution, the sum of the two Hermitian spaces, the self-dual lattice at p in the sense of §6.7 and a common similitude factor); p is a good prime in the sense of PELModuli §M0.10 for this datum. (LTXZZ22, Definition 3.3.4, p. 147; §4.1, the initial data and the choice of ℂ≅ℚ̄_p; §4.2, the self-dual lattices at the primes above p; Lemma 4.2.1 and Definition 4.2.2, pp. 159–161.)

*Route.* Use the existing CM/PEL carriers with the two prescribed neat levels and special inert coefficient field. Impose the p-principal polarization and Hom-level while using the common-scalar quasi-isogeny arrow relation on both factors. Compare the resulting quotient to the RSZ or auxiliary-CM generic functor through the actual quotient maps. Prove the comparison with the product PEL moduli finite: the pair is recovered from its image (A₀ and A as the images of the two idempotents of O_F×O_F, η^p from the product level structure and η₀^p), the arrow relations agree because a prime-to-p F×F-linear quasi-isogeny of A₀×A is a pair (φ₀,φ) and the PEL similitude factor is the common scalar c, and the conditions defining the source (the CM component T_p, the Kottwitz type of A, p-principality of λ) are closed; so the comparison is proper and quasi-finite, hence finite.

**API.**

- A point is a CM pair with p-principal λ, with arrows the prime-to-p quasi-isogenies scaling λ₀ and λ by the same p-unit.
- Each point has a CM level point in T_p.
- The generic fibre is Sh(V,K^pK_p)×(T_p)_η with the chosen embedding conventions.
- Neat prime-to-p level changes act on both CM and Hom-Tate factors as specified in §8.5.
- At a complex point identify the negative period line with `Hom_ℂ(H₁^dR(A₀)_{τ∞},ω_{A∨,τ∞})`; the source has rank one and the displayed target has rank one.

**Checks.**

- For N=1 its relative deformation dimension is zero.
- Scaling λ₀ and λ by different rational p-units is not the stated arrow relation.
- The comparison with the product PEL moduli does not identify (A₀,λ₀;A,λ) with (A₀,λ₀;A,cλ) for a p-unit c≠1: λ₀×cλ is not a rational multiple of λ₀×λ, since a common multiple would have to be 1 on the first factor and c on the second.
- An inert place with [F⁺_𝔭:ℚ_p]>1 is excluded from this model, even when another RSZ theorem applies.
- Special inertness is a condition on 𝔭, not on p. For F⁺=ℚ(√2), F=F⁺(i) and p=7, the prime 7 splits in F⁺ as 𝔭𝔭′ because 2≡3² mod 7, 𝔭 is inert in F because −1 is not a square mod 7, 7 is unramified in F=ℚ(ζ₈), and F⁺_𝔭=ℚ₇; so 𝔭 is special inert although 7 is not inert in F. Requiring p itself to be inert in F would leave a single prime of F⁺ above p, of local degree [F⁺:ℚ], and F⁺_𝔭=ℚ_p would then force F⁺=ℚ.
- For N=3, the condition that a map carry `ω_{A₀∨,τ∞}=0` into `ω_{A∨,τ∞}` is vacuous and gives dimension 3, whereas the required period line has dimension 1.

*Needs:* §6.3; §6.7; §7.2; PELModuli §M0.10; PELModuli §M0.18; PELModuli §M1.3; PELModuli §M1.6; PELModuli §§M4.7–M4.8; §6.6; PELModuli §M2.8.

### 8.2 Neat almost self-dual moduli

Under the same special inert and neat coefficient hypotheses, fix the standard definite Hermitian space V° of rank N≥1 and a self-dual lattice of V°⊗_F F_𝔮 at every prime 𝔮 of F⁺ above p; its away-p Hom-Tate data index the moduli. Define the LTXZZ22 almost self-dual CM pair with Kottwitz type NΦ−τ∞+τ∞^c and ker λ[p^∞] contained in A[𝔭] and of rank p², keeping the common p-unit scalar on both polarization arrows. At 𝔭 this polarization has defect one and at the other primes of F⁺ above p it is principal, whereas the lattices of the fixed tame reference space are self-dual at every prime above p. For N=1 retain the zero-dimensional smooth boundary case. The generic unitary space is a separately chosen indefinite uniformization datum, not V° itself. (LTXZZ22, §5.1 and Definition 5.2.1, pp. 188–189; Remark 5.2.4, p. 190.)

*Route.* Keep the same CM factor and arrows as in §8.1. Replace the principal local polarization condition by the rank-p² kernel bound, with the prescribed tame Hermitian reference datum. Treat N=1 separately from the n≥2 mixed local functor.

**API.**

- A point is a CM pair with the defect-one polarization and fixed tame level.
- Each point has a CM level point in T_p.
- The p-primary polarization kernel is contained in A[𝔭], hence killed by p, and has rank p².
- Permitted tame Hecke changes preserve the local defect-one kernel type.

**Checks.**

- A p-principal polarization fails this kernel-rank condition.
- For N=1 the moduli has zero relative dimension; no crossing stratum is introduced.
- The definite tame V° is not used as the archimedean datum of its generic Shimura variety.

*Needs:* §8.1; §2.1; PELModuli §M1.1.

### 8.3 Almost self-dual generic comparison

Choose an indefinite Hermitian V′ with the distinguished signature, an away-p isometry j:V°⊗𝔸_f^p≅V′⊗𝔸_f^p and a p-adic lattice Λ′_p of V′ that is almost self-dual at 𝔭, with Λ′_𝔭^♯/Λ′_𝔭 of length one, and self-dual at the other primes of F⁺ above p, with its stabilizer K′_p. The generic fibre of the almost self-dual model is Sh(V′,jK^pK′_p)×(T_p)_η. This comparison depends on the uniformization datum (V′,j,Λ′_p); changing it gives the corresponding transported comparison. Its existence uses gap:hermitian-local-global and the two-place invariant change. (LTXZZ22, Definition 5.2.6 and formula (5.2), pp. 192–193.)

*Route.* Use gap:hermitian-local-global to obtain V′ with the prescribed archimedean and p-adic invariants. Compare the rational Hom-Tate and polarization datum with its stabilizer lattices. Apply the canonical PEL comparison, retaining the independent CM level point.

**API.**

- A uniformization datum (V′,j,Λ′_p) has the prescribed signatures and local isometries.
- The generic fibre of the almost self-dual model is Sh(V′,jK^pK′_p)×(T_p)_η.
- The transported tame compact open is jK^p and the p-level is Stab(Λ′_p).
- An isomorphism of uniformization data transports the generic comparison and Hecke maps.

**Checks.**

- A wholly definite V′ is invalid when N>1 and the chosen signature is (N−1,1).
- Replacing Λ′_p by a self-dual lattice changes the generic level comparison.
- For two different CM level points the product comparison retains two separate components.

*Needs:* §8.2; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9; PELModuli §M3.8; ShimuraVarieties §6.7; PELModuli §§M3.1–M3.2; gap:hermitian-local-global.

### 8.4 Almost self-dual local equations

Over a perfect residue field k of a point of T_p, the completed local ring of the almost self-dual model is either `W(k)[[t₁,…,t_{N−1}]]`, or, for N≥2, W(k)[[x₁,…,x_N]]/(x₁x_N−p). Thus the model is regular and strictly semistable of relative dimension N−1 over the unramified coefficient ring. The N=1 model has only the first type. Quasi-projectivity does not follow from the local rings. For the uniformization datum (V′,j,Λ′_p) of §8.3, sending a pair to (A₀×A, i₀×i, λ₀×λ) with the induced away-p level structure is a finite morphism to the multichain moduli of gap:bad-prime-projectivity for the product datum (the algebra F×F with its involution, V₀⊕V′, a common similitude factor), base-changed to the coefficient ring, whose multichain at p is generated by Λ₀⊕Λ′_p⊂Λ₀⊕Λ′_p^♯ in the sense of §6.7; hence the model is quasi-projective over T_p, and it is projective over T_p exactly when its generic fibre is proper, that is, when V′ is anisotropic. The balloon, ground and link geometry and the tangent exact sequences of Theorem 5.2.5(2)–(5) are planned by SelmerIwasawaCohomologyPartII §2.3; this target gives only the ambient local equations. (LTXZZ22, Theorem 5.2.5(1) and its local-model proof, pp. 190–193; RZ96, Definition 6.9, p. 279 (the multichain moduli problem); Stacks, Tags 0B3G, 0B3H, 0C4M, 0C4N, 01WN, 0BCL (quasi-projectivity and properness along finite morphisms, and over T_p).)

*Route.* Normalize the local polarization pairing to diag(p,1,…,1). Describe simultaneous Hodge line/hyperplane lifts and their orthogonality relation by Grothendieck–Messing. In the crossing chart eliminate the remaining variables to obtain x₁x_N=p; in the other admissible charts solve for one variable to obtain a smooth power-series ring. Check the impossible fourth rank case and the N=1 boundary before concluding semistability. Prove the comparison with the product PEL moduli finite as in §8.1 (the pair is recovered from the two idempotents of O_F×O_F and λ; the kernel condition on λ is closed). Pull back the gap’s quasi-projectivity to obtain quasi-projectivity over the coefficient ring (Stacks Tags 0B3G, 0B3H, 0C4M), hence over T_p, since the model is quasi-compact over T_p (Stacks Tag 0C4N). If the generic fibre is proper then V′ is anisotropic, the product datum has no cusp label, its generic fibre is proper (ShimuraCompactifications §§7.3 and 7.5 over the reflex field), the gap makes its moduli proper, the model is proper as it is finite over it (Stacks Tag 01WN), and proper quasi-projective is projective (Stacks Tag 0BCL); the converse is base change to the generic fibre.

**Checks.**

- For N=2 the crossing ring is W(k)[[x₁,x₂]]/(x₁x₂−p).
- The ambient local rings are reduced and regular although the special fibre can cross.
- After a ramified coefficient extension p=t^e with e>1, this argument supplies flatness but not regularity.
- For N=1, V′ has rank one and is anisotropic, so the product datum has no cusp label and the model is finite over T_p, hence projective, in agreement with its zero-dimensional boundary case.
- For N=2 the model is projective over T_p for every F⁺: Λ′_𝔭 is almost self-dual, so in an orthogonal basis its Gram matrix is diag(1,p) up to units, det V′ has valuation 1 at the inert prime 𝔭, −det V′ is not a norm from the unramified F_𝔭 (norms have even valuation), and V′ is anisotropic already at 𝔭. This differs from the self-dual model of §8.7, where V at N=2 can be isotropic. The first non-projective case is N=3 with F⁺=ℚ: V′ has signature (2,1), the quadratic form x↦h(x,x) on V′ viewed as a 6-dimensional ℚ-space is indefinite, hence isotropic by Meyer's theorem, so V′ is isotropic (a 3-dimensional hermitian space over F_𝔭 is isotropic, so 𝔭 imposes nothing), the product datum has a cusp label and the model is quasi-projective but not projective.
- The multichain of the comparison at p is Λ₀⊕Λ′_p⊂Λ₀⊕Λ′_p^♯⊂p⁻¹(Λ₀⊕Λ′_p), with Λ′_p^♯/Λ′_p of order p², so its multichain of abelian schemes is A₀×A followed by A₀×A^∨ through λ; a p-principal λ would give the single self-dual lattice of §8.1 instead.

*Needs:* §8.2; §7.5; §6.7; AbelianSchemesAndArithmeticModuli §A4.7; SchemeAndStackFoundations Layer 4; gap:bad-prime-projectivity; §8.3; §8.1; ShimuraCompactifications §7.3; ShimuraCompactifications §7.5.

### 8.5 Integral level and Hecke system

For fixed allowable integral p-type, form the system over sufficiently small prime-to-p unitary and CM compact opens. The Hecke map indexed by g in `U(V)(𝔸_{F⁺,f}^p)` and a in the CM torus transports η^p to η^p∘g and η₀ to η₀∘a, with the source/target compact opens satisfying the usual inclusion; correspondences are indexed by `K^p∖U(V)(𝔸_{F⁺,f}^p)/K′^p`. The permitted level-forgetful maps are finite étale and compose compatibly. For the LTXZZ almost self-dual case use V° for the tame system and transport it through j in the generic comparison. At p only the split Drinfeld tower of IgusaVarietiesAndTorsionConcentration §0.31 is included. (LTXZZ22, §4.2, pp. 161–162; §5.2, p. 189; compare LL22 §4.5, p. 66.)

*Route.* Restrict the existing adelic level category to prime-to-p compact opens preserving the chosen integral local type. Transport the two level structures on the same polarized abelian pair and verify the common-scalar arrow equivalence. Use the prime-to-p étale Tate torsors to prove finite étaleness, and compare the generic Hecke composition with the imported level category.

**API.**

- For an inclusion of compact opens there is a change-of-level map.
- Each unitary double coset and element of the CM torus defines a Hecke correspondence.
- On generic fibres these maps are the canonical adelic Hecke maps.
- Transport by g and then h agrees with the composite of the associated level maps, in the ordering convention of ShimuraVarieties §1.7.

**Checks.**

- At g=1,a=1 and identical levels the transport is the identity.
- The unitary finite adeles are those of F⁺, not of the CM field F.
- A nonsplit change of parahoric p-type is not declared finite étale by this theorem.

*Needs:* §8.1; §8.2; §8.3; IgusaVarietiesAndTorsionConcentration §0.31; PELModuli §M1.13; ShimuraVarieties §1.7.

### 8.6 Mixed integral isogeny moduli

At the inert almost self-dual distinguished place v₀, choose the totally positive global scalar u₀=(x₀,x₀)∈F⁺ with valuation one at v₀ and zero at the other v|p, and the rank-(n+1) Hermitian extension V♯=V⊥⟨u₀⟩ with the lattices and compact opens of LZ22 §13.4. Enhance the semi-global CM pair by a principal-at-v₀ target A♯ and an `O_{F,(p)}-linear` isogeny α:A×A₀→A♯ in the prime-to-p isogeny category, with ker α⊂(A×A₀)[u₀], α*λ♯=λ×u₀λ₀, and transported tame and other-p levels. Fix the selected CM component and framing isogeny. The v₀-primary degree is q²: the two source polarization factors each have degree q² there, and the target is principal there. Any degree statement for an actual global representative must also retain its away-p factors. The printed global degree q is incompatible with this necessary local equation. Conjugating the global signature (n−1,1) to Layer 1’s (1,n−1) sends the local CM source to ℰ̄ of Layer 2. (LZ22, §13.4, pp. 82–83, with §10.2, pp. 64–65.)

*Route.* Choose V♯, u₀, the local self-dual overlattice and the other levels exactly as in §13.4; impose the isogeny relation in the localized abelian-scheme category. Impose the displayed polarization pullback and transported levels; derive its degree rather than the incompatible printed degree. Fix the basic framing component so that its distinguished deformation problem is the mixed local functor.

**API.**

- A point is the almost self-dual pair together with (A♯,α), where α has kernel in (A×A₀)[u₀], α*λ♯=λ×u₀λ₀, and transported levels.
- Forgetting A♯ and α gives the almost self-dual pair.
- (A♯,λ♯) with its induced level is a principal rank-(n+1) pair.
- The two generic projections identify with the prescribed unitary isogeny correspondence after the CM-product and generic-fibre comparisons of §§6.3 and 7.2.

**Checks.**

- For q=3, deg λ=9 and deg(u₀λ₀)=9 at v₀, the target is principal there, and the v₀-primary degree of α is 9 rather than 3; no assertion about its away-p degree is inferred.
- An α with correct polarization but wrong transported tame level is not a point.
- The formal distinguished isogeny has the same fixed reduction as Layer 2; merely specifying its degree is insufficient.

*Needs:* §2.4; §7.2; PELModuli §M2.14; AbelianSchemesAndArithmeticModuli §A6.13.

### 8.7 Smooth integral geometry and tangent space

The neat smooth unitary model is a smooth quasi-projective scheme over T_p of relative dimension N−1. At a geometric point its relative tangent space is `Hom(ω_{A∨,τ∞},H₁^dR(A)_{τ∞}/ω_{A∨,τ∞})`, with source rank 1 and target rank N−1. Its generic fibre is the canonical unitary Shimura variety times the CM factor. It is projective over T_p exactly when its generic fibre is proper. Both quasi-projectivity and this criterion come from the PEL moduli of the product A₀×A through the finite comparison morphism of §8.1: that PEL moduli is quasi-projective (ShimuraCompactifications §7.18); the product datum has a cusp label exactly when the product Hermitian space has a nonzero totally isotropic F×F-stable subspace, that is, the CM line being anisotropic, exactly when V is isotropic, which is exactly when the generic fibre is not proper; with no cusp label the PEL moduli is proper (ShimuraCompactifications §§7.3 and 7.5). Projectivity does not follow from smoothness and quasi-projectivity alone. Here H₁^dR is the dual of the imported H¹_dR. On complex points the negative period line is `Hom_ℂ(H₁^dR(A₀)_{τ∞},ω_{A∨,τ∞})`; the condition on the zero subspace `ω_{A₀∨,τ∞}` cannot define that line. (LTXZZ22, Theorem 4.2.3 and formula (4.2), pp. 161–163; Remark 4.2.5, p. 163 (corrected period line); Stacks, Tags 0B3G, 0B3H, 0C4M, 0C4N, 01WN, 0BCL (quasi-projectivity and properness along finite morphisms, and over T_p).)

*Route.* By PELModuli §M2.12 the deformations of (A,λ) are the pairs of mutually orthogonal lifts of `ω_{A∨,τ∞}` and `ω_{A∨,τ∞^c}`; the first has rank one and determines the second, the factors at the other embeddings are forced, and the CM factor has no deformations because T_p is étale, so a first-order deformation is a homomorphism from `ω_{A∨,τ∞}` to `H₁^dR(A)_{τ∞}/ω_{A∨,τ∞}`. Use neat levels for scheme representability; for quasi-projectivity pull back the quasi-projectivity of ShimuraCompactifications §7.18 along the finite comparison of §8.1 (a finite morphism is quasi-affine of finite type, hence quasi-projective, and quasi-projective morphisms compose over a quasi-compact base and are stable under base change: Stacks Tags 0B3H, 0C4M, 0B3G); this gives quasi-projectivity over the coefficient ring, and over T_p because the model is quasi-compact over T_p (Stacks Tag 0C4N). Identify the generic canonical model. For the projectivity clause: if the generic fibre is proper then V is anisotropic, the product datum has no cusp label, its PEL moduli is proper by ShimuraCompactifications §§7.3 and 7.5, the model is proper as it is finite over that moduli (Stacks Tag 01WN), and a proper quasi-projective morphism is projective (Stacks Tag 0BCL); the converse is base change to the generic fibre.

**Checks.**

- For N=2 the tangent dimension is one.
- The CM tangent contribution is zero because T_p is étale over the coefficient ring.
- For F⁺=ℚ and N=2, V has signature (1,1) and is isotropic exactly when −det V is a norm from F; then the product datum has a cusp label, the generic fibre is a non-proper Shimura curve and the model is not projective, while for anisotropic V the model is projective.

*Needs:* §8.1; §7.6; PELModuli §M1.3; PELModuli §M2.12; AbelianSchemesAndArithmeticModuli §A4.7; AbelianSchemesAndArithmeticModuli §A4.3; ShimuraVarieties §§2.5–2.7; SchemeAndStackFoundations Layer 4; ShimuraCompactifications §§7.3, 7.5, 7.18.

### Examples

- The period line for N=3. At τ∞ the Hodge subspace of H₁^dR(A₀) is zero, so asking a map to send it into the Hodge subspace of A imposes nothing and leaves the 3-dimensional Hom space; the period line `Hom_ℂ(H₁^dR(A₀)_{τ∞},ω_{A∨,τ∞})` has dimension 1.
- Almost self-dual rank two. For N=2 the crossing ring is W(k)[[x₁,x₂]]/(x₁x₂−p), of Krull dimension 2 and relative dimension 1, regular because x₁x₂−p is not in the square of the maximal ideal.
- Tangent space for N=2. The tangent space of §8.7 is Hom from a line to a line, of dimension N−1=1; the CM factor T_p contributes nothing because it is étale.

### Dependencies

Within this roadmap: Layer 2 (§2.1, §2.4); Layer 6 (§6.3, §6.6, §6.7); Layer 7 (§7.2, §7.5, §7.6).

Suppliers: PELModuli §M0.10, §M0.18, §M1.3, §M1.6, §M2.8, §M2.12, §M1.1, §M3.8, §§M3.1–M3.2, §M1.13, §M2.14, §§M4.7–M4.8; AbelianSchemesAndArithmeticModuli §A4.7, §A6.13, §A4.3; SchemeAndStackFoundations Layer 4; ShimuraCompactifications §§7.3, 7.5, 7.18; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9; ShimuraVarieties §6.7, §1.7, §§2.5–2.7; IgusaVarietiesAndTorsionConcentration §0.31.

Supplier contracts: gap:bad-prime-projectivity, gap:hermitian-local-global (see Exact supplier contracts).

## Layer 9: Basic-locus formal uniformization

Prove the Tate–Dieudonné comparison for basic CM pairs and construct quotients of formal schemes by discrete groups. Construct the nearby Hermitian framing datum, all CM/banal local factors and the arithmetic quotient morphism Θ to the selected basic completion. Prove the inert principal/ASD, mixed-isogeny and exotic comparisons; compare Krämer completions in the rank range of Layer 7. Prove the framing-class partition and Hasse condition needed for the full basic locus; compare the auxiliary CM product and its level changes without deleting discrete factors.

### 9.1 Tate–Dieudonné comparison for basic CM pairs

Let A and A′ be polarized abelian varieties over F̄_p and K a commutative semisimple ℚ-algebra acting on both through embeddings into the rational endomorphism algebras that are stable under the Rosati involutions, such that for every place 𝔭 of K above p the 𝔭-parts N_𝔭 and N′_𝔭 of the two rational Dieudonné modules are isoclinic of the same slope; equivalently, A×A′ with the diagonal K-action and the product polarization has isoclinic 𝔭-part at every 𝔭. Then Hom_K(A,A′)⊗ℚ_ℓ→Hom_K(V_ℓA,V_ℓA′) is an isomorphism for every prime ℓ≠p, and Hom_K(A,A′)⊗ℚ_p is isomorphic to the K-linear maps of rational Dieudonné modules commuting with Frobenius. A unitary CM pair (A₀,A) of this roadmap (K=F) is basic when A₀×A satisfies this hypothesis: at a place w of F above p other than the distinguished one, A[w^∞] is isogenous to the n-th power of a rank-one `O_{F_w}-module` and both A₀[w^∞] and A[w^∞] have slope |Φ_w|/[F_w:ℚ_p], where Φ_w is the set of embeddings in Φ inducing w; at the distinguished place, inert or ramified over F⁺ in the uniformizations of this layer, basicness means that A[w^∞] is isoclinic, hence of slope 1/2 like A₀[w^∞]. For a basic pair this identifies `Hom_{O_F}(A₀,A)⊗ℚ_v` with the local Hom spaces at every finite place v of F⁺, compatibly with the hermitian forms, and the group of polarized self-quasi-isogenies of the pair with an inner form of the RSZ group. (RZ96, Lemma 6.28, applied to A×A′, and Corollary 6.29 in the corrected form given under References, RZ96, pp. 292–293; proof of Theorem 6.30, pp. 293–294.)

This target assumes K, A and A′ as stated, and that at every place 𝔭 of K above p the parts N_𝔭 and N′_𝔭 are isoclinic of the same slope; each factor being isoclinic separately does not suffice.

*Route.* Apply RZ96 Lemma 6.28 to A×A′ with the diagonal K-action and the product polarization, whose hypothesis is the common-slope condition: over a large enough finite field, over which A, A′ and all K-linear homomorphisms are defined, a power of the Frobenius of A×A′ is the image of one element u∈K acting diagonally. Away from p apply Tate’s theorem over finite fields (EndoscopicTransferAndUnitaryTraceComparison §8.3) to A×A′ and take the K-linear corner Hom_K(A,A′); since the same u gives the Frobenius power of both factors, every K-linear map V_ℓA→V_ℓA′ intertwines the two Frobenius powers. At p use the Dieudonné-module form of Tate’s theorem over the finite field for A×A′, proved by the same commutant and dimension count and restricted to the same corner, with the isogeny classification of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.17 and the B-linear classification of EndoscopicTransferAndUnitaryTraceComparison §8.10.

**Checks.**

- For a supersingular elliptic curve A=A′ and K=ℚ both sides at ℓ≠p have dimension 4 (End⁰A⊗ℚ_ℓ=M₂(ℚ_ℓ)), and at p both are the quaternion division algebra over ℚ_p of invariant 1/2, the endomorphisms of the isoclinic slope-1/2 isocrystal of height 2.
- The isoclinic hypothesis is necessary: for an ordinary elliptic curve over F̄_p and K=ℚ, End⁰ is an imaginary quadratic field of dimension 2 while End(V_ℓ) has dimension 4.
- Each factor being isoclinic at every place does not suffice: for K imaginary quadratic with p split, A an ordinary elliptic curve over F̄_p with CM by O_K and A′=A with the K-action precomposed by conjugation, every 𝔭-part is one-dimensional, hence isoclinic, but at 𝔭 the slopes are 0 and 1. Hom_K(A,A′)=0, since End⁰A=K is commutative and fι(a)=ι(ā)f forces (a−ā)f=0, while the conjugate-semilinear maps of the free rank-one K⊗ℚ_ℓ-module V_ℓA form a ℚ_ℓ-space of dimension 2; at p both sides vanish.
- For a basic pair with V_ℓA₀ free of rank one and V_ℓA free of rank n over F⊗ℚ_ℓ, Hom_F has rank n over F⊗ℚ_ℓ, matching dim_F `Hom_{O_F}(A₀,A)⊗ℚ=n`.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§8.3, 8.10; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.17; AbelianSchemesAndArithmeticModuli §§A4.1, A6.10–A6.11.

### 9.2 Quotients of formal schemes by discrete groups

Let 𝔐 be a formal scheme locally formally of finite type over Spf O_Ĕ and Γ a group acting on 𝔐 over Spf O_Ĕ such that (i) for every quasi-compact open U of 𝔐_red the set {γ∈Γ : U∩γU≠∅} is finite and (ii) every point of 𝔐 has an open neighbourhood U with U∩γU=∅ for every γ≠1. Construct the quotient Γ∖𝔐: the fpqc quotient sheaf is represented by a formal scheme locally formally of finite type over Spf O_Ĕ, and 𝔐→Γ∖𝔐 is a Γ-torsor and a Zariski local isomorphism. This conclusion uses the disjoint neighbourhoods of (ii). Freeness on points, including generic points of components, does not imply (ii). (RZ96, proof of Proposition 2.37, pp. 66–67, applied when these neighbourhoods exist.)

For a framed space 𝔐 of §0.2, with structure-preserving framing quasi-isogeny group J(ℚ_p), and a discrete, torsion-free subgroup Γ⊂J(ℚ_p) separated in its profinite topology, construct the étale quotient sheaf Γ∖𝔐 as a formal algebraic space locally formally of finite type, and prove that 𝔐→Γ∖𝔐 is an étale Γ-torsor. Profinite separation means that for every γ≠1 there is a finite-index normal subgroup not containing γ. This theorem does not assume (ii). (RZ96, Propositions 2.34–2.37, pp. 64–67.)

For the unitary uniformization data of Layer 9, let I(ℚ) be the polarized self-quasi-isogeny group of the basic pair, acting on 𝔐×G(𝔸_f^p)/K^p. Decompose its quotient sheaf over tame double cosets into Γ_g∖𝔐, where Γ_g is the image in J(ℚ_p) of I(ℚ)∩(J(ℚ_p)×gK^pg⁻¹). For sufficiently small K^p these projections are injective and each Γ_g is discrete, torsion-free and profinitely separated, so the formal algebraic-space theorem applies. For general K^p retain the quotient formal Deligne–Mumford stack with finite stabilizers. The arithmetic application asserts no disjoint Zariski neighbourhoods; formal-scheme representability at sufficiently small level is established together with Θ in §9.5. All quotients are sheaves, or the indicated quotient stack, on `Nilp_{O_Ĕ}`. (RZ96, proof of Theorem 6.23, pp. 289–290; Theorem 6.30, p. 293.)

The first theorem assumes 𝔐, Γ and (i)–(ii) as stated. The algebraic-space theorem assumes the framed space of §0.2 and a discrete, torsion-free, profinitely separated Γ⊂J(ℚ_p); the arithmetic application verifies these hypotheses for Γ_g at sufficiently small K^p.

*Route.* Under (ii), glue the images of disjoint-translate neighbourhoods along the action to represent the quotient by a formal scheme. For the arithmetic application prove discreteness of I(ℚ) in J(ℚ_p)×G(𝔸_f^p), then discreteness and local finiteness for each Γ_g by RZ96 Proposition 2.34. Compact stabilizers give finite stabilizers, and small tame level excludes torsion by the polarized-automorphism argument of RZ96 Theorem 6.23. To prove profinite separation, fix a tame prime ℓ≠p and a faithful linear realization of I over ℚ_ℓ. The compact tame-level image preserves a ℤ_ℓ-lattice; reduction modulo ℓ^r separates every nonidentity γ for some r. Apply RZ96 Proposition 2.37: local finiteness and separation supply finite-index normal subgroups avoiding the finitely many nonidentity translates meeting a chosen bounded chart. Glue the resulting finite free quotients in the étale topology. Freeness identifies the fibre product of 𝔐 with itself over Γ_g∖𝔐 with Γ_g×𝔐, giving the étale torsor. This construction does not use Θ.

**API.**

- Under (i)–(ii), Γ∖𝔐 is a formal scheme locally formally of finite type and the projection is a Γ-torsor and a Zariski local isomorphism.
- For a discrete, torsion-free, profinitely separated Γ⊂J(ℚ_p) acting on the framed space, Γ∖𝔐 is a formal algebraic space locally formally of finite type and the projection is an étale Γ-torsor; in particular this applies to the arithmetic Γ_g.
- In either sheaf quotient, a Γ-invariant morphism from 𝔐 to a formal scheme factors uniquely through the quotient.
- For sufficiently small tame levels K′^p⊂K^p the level-forgetful map of arithmetic quotients is finite étale.

**Checks.**

- For Γ trivial the quotient is 𝔐 and the torsor has one sheet.
- For Γ=ℤ acting on `𝔐=⊔_{h∈ℤ}𝔑` by translating the index, a neighbourhood in one copy is disjoint from every nontrivial translate, so (ii) holds and Γ∖𝔐≅𝔑. For Γ=mℤ⊂ℤ the map between quotients has m sheets, for m≥1.
- For the unramified quadratic L/ℚ₃ take the rank-three hermitian form with Gram matrix H having rows (0,1,0), (1,0,0), (0,0,3). Its determinant is −3. Put Λ₊=O_L(3e)+O_Lf+O_La, Λ₋=O_Le+O_L(3f)+O_La and Σ=Λ₊+Λ₋. Their duals are O_Le+O_L(f/3)+O_L(a/3), O_L(e/3)+O_Lf+O_L(a/3), and O_Le+O_Lf+O_L(a/3), respectively. Thus 3Λ♯⊆Λ⊆Λ♯ in all three cases and the dual-quotient lengths are 3,3,1. In the rank-three unramified unitary space the first two lattices label irreducible curves C₊, C₋ meeting in the single point x=V(Σ); the dimensions are (3−1)/2=1 and (1−1)/2=0. (LZ22, §§2.5–2.7, p. 12.)
- In that example g=diag(3,1/3,1) satisfies g*Hg=H and gΛ₋=Λ₊. Its powers have valuations (m,−m,0), so Γ=⟨g⟩ is discrete infinite cyclic, torsion-free and profinitely separated. RZ96 Propositions 2.34–2.37 apply. Every open U containing x contains both generic points η₊ and η₋, and gη₋=η₊, so η₊∈U∩gU. The algebraic-space theorem applies to this framed action, while (ii) fails. This tests the proposed implication from discreteness and freeness; it does not prescribe a global CM pair with Γ as its arithmetic subgroup.
- The scalar −1∈U(V)(K) fixes every point of N_n, since −1 is an automorphism of every (X,ι,λ) carrying ρ to −ρ; the quotient sheaf by {±1} is N_n itself and N_n→N_n has one sheet, not two, so it is not a {±1}-torsor. The quotient stack retains this stabilizer; an effective action alone still needs its point stabilizers checked.

*Needs:* §0.2; §9.1 (faithful realizations of the arithmetic self-quasi-isogeny group); AdicSpacesPartIII Layer F0; SchemeAndStackFoundations Layer 1.

### 9.3 Nearby unitary framing datum

For the global unitary V and distinguished nonsplit finite place v₀, use the hermitian local–global existence of gap:hermitian-local-global to choose V′, definite at all real places, with the invariant at v₀ switched and all other finite local spaces unchanged. Fix the away-v₀ isometry and a basic CM pair realizing these local data. Identify its exact-polarization quasi-isogeny group with U(V′) and the rational-similitude pair group with `G̃′=Z^ℚ×_{𝔾_m}G′^ℚ`. A framing choice selects an isogeny component; the full basic locus requires the Hasse/principal-homogeneous-space partition, rather than assuming every basic point is in that component. (Zhang21, §7.3, equations (7.3)–(7.4) and footnote 3, pp. 908–909; RZ96 Theorems 6.27 and 6.30, pp. 292–293.)

*Route.* Obtain V′ from gap:hermitian-local-global with the invariants at v₀ and at the distinguished real place switched, not merely from the classification of a generic PEL datum. Use §9.1 to identify the self-quasi-isogenies with the Hermitian isometry group. Check the signatures, all finite signs and the CM component; retain the partition if the group Hasse kernel is nontrivial.

**API.**

- V′ and its global group are determined by a chosen basic pair and the two-place change of invariants.
- The v₀ realization is the Hermitian special-Hom space of the selected local framing.
- The chosen away-v₀ identification matches the original adelic group and compact-open levels.
- A polarized quasi-isogeny between framing pairs conjugates the group identification and induced quotient presentation.

**Checks.**

- Flipping only the finite v₀ invariant violates the product formula; the distinguished real signature must change as well.
- At an inert principal place V′_v₀ is nonsplit; at an inert almost self-dual place it is split.
- Choosing a different admissible global framing class must retain its component label until the Hasse comparison is proved.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9; PELModuli §M3.8; §6.1; §6.8; §1.5; §2.3; §3.6; §5.9; §9.1; PELModuli §§M3.1–M3.2; gap:hermitian-local-global.

### 9.4 Banal and CM local factors

In the RSZ uniformization hypotheses, the full absolute p-local framed space N′ is the product `(Z^ℚ(ℚ_p)/K_{Z,p})×N_{O_{Ĕ_ν}}×∏_{v|p,v≠v₀}U(V_v)/K_v`, where the other p-factors are banal and satisfy sign and Eisenstein and N is the matching principal or almost self-dual relative framed space. The two coset factors are formal discrete étale spaces. For an exotic model replace N by its absolute exotic factor and then use Layer 4. This decomposition is equivariant for the identified local framing group; none of the discrete factors is discarded before quotienting. (LZ22, §13.1, pp. 80–81; RSZ20 Lemma 8.16, p. 53, and Remark 8.18, p. 54, Appendix B, pp. 58–60.)

*Route.* Split the absolute p-divisible group by the p-adic places and the CM torus component. Use the strict Eisenstein condition and banal deformation rigidity to identify each nondistinguished factor with its discrete lattice-coset functor. Apply the relative comparison only to the distinguished factor and verify the actions on every factor.

**API.**

- The full local framed functor is the product of the distinguished factor and the discrete factors displayed.
- After the chosen absolute-to-relative framing identification the distinguished factor is N.
- The product decomposition intertwines the framing-group actions on all factors.
- Changing a compact-open level in a discrete factor gives its coset-forgetful map.

**Checks.**

- A nontrivial `Z^ℚ(ℚ_p)/K_{Z,p}` factor is retained even when N is connected.
- If v₀ is the only place above p, the other-unitary-place product is a one-point factor.
- A nonbanal de Rham deformation cannot be identified with a discrete coset merely because its generic signature matches.

*Needs:* §9.3; §6.5; §6.8; §0.5; §4.6; §0.2; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.10.

### 9.5 Unitary uniformization morphism

For a chosen basic global CM pair and sufficiently small integral level, construct Θ from the arithmetic quotient sheaf Q=G̃′(ℚ)∖(N′×G̃(𝔸_f^p)/K^p), represented initially by the formal algebraic space of §9.2, to the completion of the integral model along the basic isogeny component. Starting from the framed p-divisible deformation and the away-p lattice/level data, use Serre–Tate effectivity and the quasi-isogeny pushout construction to recover the polarized abelian pair. Descent through quasi-isogenies makes the map independent of representatives. Prove that Θ is an isomorphism of étale sheaves onto the completion along an open-and-closed basic sublocus Z′; thus Q is represented by that formal scheme. Equality with the full basic locus Z requires the Hasse hypothesis of RZ96 Theorem 6.30 or a disjoint union over framing classes. (RZ96, §§6.13–6.16, pp. 282–284; Theorem 6.23 and its proof, pp. 289–290; Theorems 6.24, 6.27 and 6.30, pp. 291–295.)

*Route.* Construct the polarized abelian quasi-isogeny pushout for every finite locally closed framed chart; retain the exact CM factor. Use Serre–Tate (AbelianSchemesAndArithmeticModuli §A4.9) and effectivity of polarized formal lifts (§A4.8) to compare the infinitesimal functors. Descend the construction to the quotient sheaf of §9.2. Prove full faithfulness modulo global quasi-isogenies, compatibility with the tame level torsor, and essential surjectivity onto the selected completion, using the basic rational comparison and the Hasse partition. These give the sheaf isomorphism and therefore formal-scheme representability. Alternatively, the quasi-finite representability argument of RZ96 Theorem 6.23, pp. 289–290, first makes Q a formal scheme using Θ; formal étaleness, radiciality, surjectivity and properness on the reduced loci then give the isomorphism. Neither route requires condition (ii) of §9.2 for the arithmetic action.

**API.**

- Θ is defined on a framed deformation together with its discrete and tame level data and descends to Q.
- Changing by G̃′(ℚ) yields canonically isomorphic polarized abelian data.
- On infinitesimal deformation functors Θ is the Serre–Tate/local-model comparison.
- Θ identifies Q with the indicated completed basic component as an étale sheaf; that completion represents Q by a formal scheme.
- Θ commutes with permitted tame Hecke maps and the associated changes of level.

**Checks.**

- The RZ96 framing convention points from the fixed object to the deformation; use inversion to compare with the local ρ:X→𝕏 convention. For g=diag(3,1/3), gg⁻¹=id whereas g²=diag(9,1/9)≠id.
- Without the Hasse hypothesis the theorem concludes Z′⊂Z open and closed, rather than equality with all Z: one chosen framing class among two accounts for one component of the partition.
- When the CM quotient class set has two elements, the source of Θ retains both labelled fibres; deleting that class factor leaves one fibre instead of two.
- The map Spec k→Spec(k[ε]/(ε²)) is bijective on geometric points but kills the one-dimensional tangent direction ε; the deformation comparison must therefore be an isomorphism on nilpotent bases, not merely on geometric points.
- For the intersecting-component action in §9.2 the quotient map remains an étale torsor although every neighbourhood U of x has η₊∈U∩gU. The arithmetic uniformization proof obtains a formal scheme from Θ and its completed target, without asserting (ii) for such actions.

*Needs:* §9.3; §9.4; AbelianSchemesAndArithmeticModuli §A4.9; AbelianSchemesAndArithmeticModuli §A4.8; §0.2; §9.2 (the formal algebraic-space quotient and étale torsor); §9.1; §7.1; §7.2; §7.3; §7.4; §8.6 (the integral models whose completions §§9.6–9.10 identify); AdicSpacesPartIII Layer F0 (completion along the basic locus).

### 9.6 Exotic basic-locus uniformization

In the compact even-rank LL22 setting and at a ramified distinguished u with F⁺_u/ℚ_p unramified, fix P₀∈Y(O_K̆), a basic point P in the P₀ fibre and the induced totally definite Hermitian `V′=Hom_{O_F}(A₀,A)⊗ℚ` with h′(x,y)=ϖ^−1 λ₀^−1 y^∨λ_A x, where `ϖ∈O_{F⁺}` is totally positive, has the LL22 valuations at the places of U and in addition val_u(ϖ)=1. The completion of that fibre is `U(V′)(F⁺)∖(N^exo×U(V)(𝔸_f^{u})/∏_{v∈U}L_v)` over O_K̆, with the precise other-local/tame cosets of LL22 (4.8). The quotient is initially built with N_Φ and identified with N^exo by Layer 4. Under the framing identification of `V′⊗_{F⁺}F⁺_u` with V^exo of Layer 3, h′=(u²/ϖ)·h^exo; the factor u²/ϖ is a unit of F⁺_u, so the identification preserves the unitary group, duals of lattices and the integrality of norms, and it is an isometry exactly when ϖ=u² in F⁺_u. This is the first assertion of Proposition 4.30; its special-divisor identity belongs to the cycle consumers. (LL22, §4.5, the pairing on V and the morphism (4.8), Remark 4.29 and Proposition 4.30, pp. 67–68.)

*Route.* Fix the CM point and basic pair before defining the global Hom space, its normalization and the framing. Choose a polarized height-zero quasi-isogeny by the basic rational comparison; use it to construct the absolute framed point and every away-u coset. Show independence under the global unitary group and apply the RZ96 basic uniformization argument. Compose with the full absolute/relative exotic equivalence and check level equivariance.

**Checks.**

- The source’s base-point dependence is retained, as in Remark 4.29.
- A proof of the divisor formula is not used to establish this moduli isomorphism.
- The CM fibre is fixed before writing the unitary quotient.
- At n=2 the two forms on the same Hom space differ by u²/ϖ, which has valuation 1−val_u(ϖ) in F⁺_u: with val_u(ϖ)=1 it is a unit and a lattice self-dual for h^exo is self-dual for h′; with val_u(ϖ)=0 the h′-dual of a self-dual Λ is (u²/ϖ)^−1Λ≠Λ, and the integrality test `(x,x)∈O_{F⁺_u}` shifts by one valuation.

*Needs:* §7.3; §9.5; §4.6; §3.6; §6.4; §6.3.

### 9.7 Inert basic-locus uniformization

For the localized or semi-global RSZ model with p>2 at the distinguished inert place and the other p-types as in Layer 7, after base change to `O_{Ĕ_ν}` the basic completion is `G̃′(ℚ)∖(N_{O_{Ĕ_ν}}×G̃(𝔸_f^{v₀})/K^{v₀})`, with the notation `G̃(𝔸_f^{v₀})/K^{v₀}` including the CM p-coset and all other p-local cosets from §9.4. N is Layer 1 in the principal self-dual case and Layer 2 in the almost self-dual case. In the principal case ramified `F⁺_{v₀}/ℚ_p` is allowed when the signature at v₀ is of Mihatsch type (§6.5): the Eisenstein condition at v₀ is then Mihatsch's P(r,s), and §0.5 with K₀=ℚ_p identifies the absolute factor with Layer 1. For a signature not of Mihatsch type no P(r,s) describes that factor and this identification is not asserted. In the almost self-dual case keep the source’s unramified `F⁺_{v₀}/ℚ_p` hypotheses. Include the framing-class partition from Θ until the stated unitary Hasse argument identifies the full basic locus. (LZ22, §13.1, equation (13.1.0.1) and footnote 5, pp. 80–81; Zhang21 equations (7.3)–(7.6), pp. 908–909; Cho18 Theorem 4.3, pp. 42–43.)

*Route.* Apply Θ with the exact good/almost self-dual integral conditions. Identify the principal absolute factor by Mihatsch and the almost self-dual factor by Cho’s specified comparison. Absorb the discrete product factors in the away-v₀ notation and prove its equivariance. Use the imported Hermitian Hasse theorem and the selected CM/sign components to account for all framing classes.

**Checks.**

- For n=1 the principal distinguished factor has no relative formal parameter.
- A ramified principal base-field comparison does not imply the same extension of the almost self-dual theorem.
- The displayed quotient and level maps agree on formal functors, not only geometric points.

*Needs:* §9.5; §7.9; §7.1; §1.1; §2.1; §0.5; §6.5; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9; PELModuli §M3.2.

### 9.8 CM partition and Li–Liu product

For the RSZ completion the CM projection is the discrete quotient Z^ℚ(ℚ)∖Z^ℚ(𝔸_f)/K_Z; each fibre has the corresponding nearby-unitary quotient presentation with chosen transported level. For the unramified compact Li–Liu auxiliary model, the comparison of Layer 6 gives a level-compatible isomorphism `X̂_L≅(U(V′)(F⁺)∖(N×U(V)(𝔸_f^u)/L^u))×_{Spf O_K}Ŷ` after base change to O_K̆, as in LL21 (8.2). For the exotic case use the fibrewise §9.6 and the CM tower descent to reassemble the auxiliary CM factor. This states the product only in the specified auxiliary-model conventions; a single chosen fibre does not by itself identify the entire RSZ completion. (Zhang21, Equations (7.5)–(7.6), p. 909; LL21 equation (8.2), p. 37; LL22 equation (4.8), pp. 67–68.)

*Route.* Project the full quotient to its CM torus factor and compute the stabilizer of each chosen component. Use the auxiliary CM product comparison to identify the corresponding fibre family. Prove naturality over the CM tower and tame level changes, then descend the fibrewise identifications.

**Checks.**

- When the CM class set has two elements the RSZ completion retains two labelled fibres.
- The Ŷ factor in the Li–Liu formula is preserved by all level-forgetful maps.

*Needs:* §9.7; §9.6; §6.3; §8.5; §6.6; §9.2.

### 9.9 Krämer completion compatibility

For every n≥2, in the ramified setting of §7.4 with `E_ν/F_{v₀}` unramified, the global Krämer enhancement completed along a selected basic component is the corresponding principal ramified framed completion with the Layer 5 Krämer filtration, times its CM and other discrete local factors and modulo the global framing group. The comparison conjugates the local Lie labels as specified in Layer 7 and preserves the forgetful map to the wedge model. It uses the moduli functor and Θ, not the regularity of either side. (HLSY23, §10.2, pp. 77–79 (the global Krämer model and its condition (H4)); RSZ21 Definition 6.10 and Lemma 6.11, pp. 33–34 (the Krämer–Eisenstein condition); RZ96, Theorem 6.30, p. 293, through §9.5 (the completion of the underlying model). No cited text states the comparison with the Krämer filtration; the transport of the filtration to the completion is new here.)

*Route.* Apply the formal deformation comparison to the underlying polarized ramified pair. Transport the Hodge filtration to the precisely labeled Krämer subbundle through the local-model diagram. Check descent of the enhancement and compatibility with the wedge forgetful maps.

**Checks.**

- The completed subbundle has rank n−1 with the declared local conjugate action.
- At n=2 the comparison is asserted as for n≥3: both sides are étale locally yz=u over `O_{Ĕ_ν}` (§5.6), and nothing in the comparison uses the blowup description of RSZ21 Theorem 6.7(ii), which needs n≥3.

*Needs:* §7.4; §5.3; §9.5; §0.7.

### 9.10 Mixed basic-locus comparison

The completion of the corrected mixed integral isogeny model at its chosen basic framing component is the arithmetic quotient of the mixed local framed space Ñ_n of §2.4 with the same CM, other-p and tame factors as in Layer 9. The two forgetful maps to the almost self-dual and principal rank-(n+1) completions correspond to π₁ and π₂ of Layer 2, equivariantly for the embedded nearby group. On generic fibres they recover the stated isogeny correspondence. Its proof uses the moduli functor and generic projections. For context, LRZ26 Theorem 14.6.2 proves that π₁ is integrally finite flat of degree q+1 and π₂ is proper and an isomorphism away from a zero-dimensional center, with exceptional projective spaces. There is no integral identification of Ñ_n with the special divisor Z(x₀) of §2.4, through which π₂ factors. That divisor-resolution and its intersection consequences belong to the cycle consumer, rather than being a hypothesis of this moduli uniformization. (LZ22, §13.4, pp. 82–83; §10.2 and Remark 10.2.1, pp. 64–65; distinguish Conjecture 10.4.1, p. 67.)

*Route.* Use Serre–Tate full faithfulness for the finite-kernel isogeny α as well as its source and target. Identify the local framing isogeny and the two transported level structures. Apply Θ to the enhanced functor and verify that forgetting α commutes with both quotient maps.

**Checks.**

- The local isogeny has degree q² consistent with the polarization identity.
- The first generic projection has degree q+1; this is not the degree of α.

*Needs:* §8.6; §9.5; §2.4; §2.5; §9.7.

### Examples

- Discrete quotients. For Γ=ℤ acting on `𝔐=⊔_{h∈ℤ}𝔑` by shifting the index, (i)–(ii) of §9.2 hold and Γ∖𝔐≅𝔑. The rank-three intersecting-component action of §9.2 instead gives a formal algebraic-space quotient and an étale torsor without (ii). For Γ={±1} acting on N_n through U(V)(K), −1 fixes every point: the quotient sheaf is N_n, while the quotient stack retains the order-two stabilizer.
- Tate–Dieudonné for a supersingular curve. For A=A′ a supersingular elliptic curve over F̄_p and K=ℚ, End⁰A⊗ℚ_ℓ=M₂(ℚ_ℓ) has dimension 4 for ℓ≠p, and at p both sides are the quaternion division algebra over ℚ_p of invariant 1/2.
- Exotic normalization at n=2. On the same Hom space h′=(u²/ϖ)·h^exo; with val_u(ϖ)=1 the factor is a unit and a lattice self-dual for h^exo is self-dual for h′, while with val_u(ϖ)=0 the h′-dual of a self-dual lattice Λ is (u²/ϖ)⁻¹Λ≠Λ.

### Dependencies

Within this roadmap: Layer 0 (§0.1, §0.2, §0.5, §0.7); Layer 1 (§1.1, §1.5); Layer 2 (§2.1, §2.3, §2.4, §2.5); Layer 3 (§3.6); Layer 4 (§4.6); Layer 5 (§5.3, §5.9); Layer 6 (§6.1, §6.3, §6.4, §6.5, §6.6, §6.8); Layer 7 (§7.1, §7.2, §7.3, §7.4, §7.9); Layer 8 (§8.5, §8.6).

Suppliers: EndoscopicTransferAndUnitaryTraceComparison §§8.3, 8.10; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.17, §R07.2.10; AbelianSchemesAndArithmeticModuli §§A4.1, A6.10–A6.11, §A4.9, §A4.8; AdicSpacesPartIII Layer F0; SchemeAndStackFoundations Layer 1; GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9; PELModuli §M3.8, §§M3.1–M3.2, §M3.2.

Supplier contracts: gap:hermitian-local-global (see Exact supplier contracts).


## Downstream consumers

SelmerIwasawaCohomologyPartII uses the models of Layers 7 and 8 in its Layers 2 and 5. The native
strictly semistable models of LTXZZ22 §5.2, their local equations and generic-fibre comparison, and
the smooth models of LTXZZ22 §4.2 are §§8.1–8.4 and 8.7 here (construction, local equations, strict
semistability, generic-fibre comparison); they are owned here and are not part of the canonical
models of ShimuraVarieties §6.7, which are generic. The special-fibre items of the source papers belong to
that roadmap:

| Source items | Owner |
| --- | --- |
| LTXZZ22 Theorem 4.3.5 and the basic correspondence (Definitions 4.3.1–4.3.4) | SelmerIwasawaCohomologyPartII §2.2 |
| LTXZZ22 Propositions 4.4.4, 4.4.6 and Constructions 5.3.6, 5.4.6, 5.5.5, 5.6.1 (definite uniformization of sources) | SelmerIwasawaCohomologyPartII §§2.2–2.3 |
| LTXZZ22 Theorems 5.2.5(2)–(5), 5.3.4, 5.4.4, 5.5.3 (balloon, ground and link strata) | SelmerIwasawaCohomologyPartII §2.3 |
| LTXZZ22 Lemma 5.6.2 and Theorems 5.7.7–5.7.8 (link cohomology, excess intersections) | SelmerIwasawaCohomologyPartII §2.4 |
| LTXZZ22 §5.11 (product resolution, Theorem 5.11.5, the potential map) | SelmerIwasawaCohomologyPartII §§2.6, 5.2, 5.4 |
| LTXZZ22 Propositions 4.5.5–4.5.9 and 5.10.6–5.10.14 (rank-increase Cartesian diagrams) | SelmerIwasawaCohomologyPartII §§2.6, 5.2 |
| LTXZZ22 Appendix A (hermitian Frobenius incidence varieties) | SelmerIwasawaCohomologyPartII §§2.2–2.4 |

The local spaces of Layers 1–5, their special homomorphism spaces and the uniformizations of Layer 9
are the inputs of arithmetic intersection problems on unitary Shimura varieties (the Kudla–Rapoport
conjecture in the principal, almost self-dual and Krämer cases, and the arithmetic fundamental lemma);
apart from the single divisor Z(x₀) of §2.4, through which π₂ factors, the special cycles and
intersection numbers themselves are not constructed here.

## References

Locators throughout refer to the editions below. Where a source states something that is false or
unsupported as printed, the note says what is used instead; the targets use the corrected form.

- **Zhang21.** Wei Zhang, *Weil representation and Arithmetic Fundamental Lemma*, Annals of
  Mathematics 193 (2021), 863–978; read as [arXiv:1909.02697v3](https://arxiv.org/abs/1909.02697v3),
  whose section, equation, footnote and lemma numbers are cited, with the page numbers of the
  published version. Note: footnote 3, p. 908, identifies the absolute Rapoport–Zink space at v₀
  with the relative one by Mih19 Theorem 3.1 for every CM type; the Eisenstein condition of RSZ21
  §5.2, case (2), is Mihatsch's signature condition only for signatures of Mihatsch type (§6.5), and
  §9.7 makes the identification only for those.
- **LZ22.** Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*,
  [arXiv:1908.01701v3](https://arxiv.org/pdf/1908.01701v3), with its printed pagination. Note: §13.4,
  p. 82, assigns the auxiliary global isogeny degree q; the polarization identity of the same
  paragraph forces v₀-primary degree q² (both source factors have degree q² at v₀ and the target is
  principal there), which §8.6 uses. §13.1, footnote 5, p. 81, applies Mih19 when v₀ is ramified
  over p for every CM type; §9.7 keeps the restriction to signatures of Mihatsch type (§6.5).
- **LL21.** Chao Li and Yifeng Liu, *Chow groups and L-derivatives of automorphic motives for unitary
  groups*, Annals of Mathematics 194 (2021); author final copy of 20 October 2021
  ([author page](https://www.math.columbia.edu/~chaoli/AIPF.pdf)), with its pagination.
- **LL22.** Chao Li and Yifeng Liu, *Chow groups and L-derivatives of automorphic motives for unitary
  groups, II*, Forum of Mathematics, Pi 10 (2022), e5; author copy of 16 January 2022
  ([author page](https://www.math.columbia.edu/~chaoli/AIPF2.pdf)), with its pagination and equation
  numbering. Notes: in §4.3, p. 58, and §4.5, p. 66, the exotic conditions at the ramified places
  above p are printed for the CM source A₀[v^∞]; only A[v^∞], of height 2nf, can satisfy them, and
  §7.3 imposes them on A. In §4.5, p. 66, the integral models are called smooth projective with a
  reference to RSZ20 Theorem 4.7, which proves flatness, the generic fibre and smoothness but no
  projectivity; §7.7 proves projectivity by gap:bad-prime-projectivity and ShimuraCompactifications
  §§7.3 and 7.5.
- **HLSY23.** Qiao He, Chao Li, Yousheng Shi and Tonghai Yang, *A proof of the Kudla–Rapoport
  conjecture for Krämer models*, [arXiv:2208.07988v2](https://arxiv.org/pdf/2208.07988v2); locators
  are for this version. Notes: Definition 2.2(2), p. 10, gives the framing as a height-zero O_L-linear
  quasi-isogeny without relating the polarizations; §5.3 requires the framing polarization to pull
  back to an O_K-unit multiple of the object polarization, as Howard19 §2 does. The introduction, §1.2,
  p. 2, gives the Krämer filtration rank one; Definition 2.2(3) has rank n−1, which §5.1 uses. In
  §10.2, p. 78, the Krämer model is called regular and semistable at every place above the ramified
  and almost self-dual places, with references to RSZ20 Theorems 5.2 and 5.4. Part (ii) of RSZ20
  Theorem 5.2 gives semistable reduction at an almost self-dual place only when E_ν is unramified over
  ℚ_p, and the lattice types that theorem admits at a ramified place include a self-dual lattice only
  for n=2, which part (ii) excludes; the semistable reduction of the Krämer model at a ramified place
  is RSZ21 Theorem 6.7(ii), for n≥3 and ν unramified over `F_{v₀}`. §§7.8–7.10 keep both hypotheses,
  and §7.8 treats n=2 through the charts of §5.6.
- **LTXZZ22.** Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu, *On the
  Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*, Inventiones Mathematicae 228 (2022),
  107–375; read as [arXiv:1912.11942v3](https://arxiv.org/abs/1912.11942v3), whose numbering agrees
  with the published version for the items cited, with published page numbers. Notes: Definition
  4.2.2, p. 160, writes the unitary Hecke parameter with adeles of F; U(V) is a group over F⁺ and §8.5
  uses `U(V)(𝔸_{F⁺,f}^p)`. The last assertion of Theorem 4.2.3, p. 161, equates projectivity of the
  integral model with properness of its generic fibre without an integral properness argument; §8.7
  supplies one through ShimuraCompactifications §§7.3, 7.5 and 7.18. Remark 4.2.5, p. 163, defines the
  negative period line by a condition on the source Hodge subspace, which is zero at τ∞; §8.1 uses
  `Hom_ℂ(H₁^dR(A₀)_{τ∞},ω_{A∨,τ∞})`.
- **RSZ20.** Michael Rapoport, Brian Smithling and Wei Zhang, *Arithmetic diagonal cycles on unitary
  Shimura varieties*, [arXiv:1710.06962](https://arxiv.org/pdf/1710.06962), with its printed pages.
- **RSZ21.** Michael Rapoport, Brian Smithling and Wei Zhang, *On Shimura varieties for unitary
  groups*, Pure and Applied Mathematics Quarterly 17 (2021); author copy of 16 April 2020
  ([author page](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/unitshim.pdf)).
- **RSZ17.** Michael Rapoport, Brian Smithling and Wei Zhang, *On the arithmetic transfer conjecture
  for exotic smooth formal moduli spaces*, Duke Mathematical Journal 166 (2017), 2183–2336;
  [arXiv:1503.06520v3](https://arxiv.org/pdf/1503.06520v3), with the arXiv numbering and pagination.
  Its §3 takes the base field to be ℚ_p.
- **PaRa09.** Georgios Pappas and Michael Rapoport, *Local models in the ramified case. III. Unitary
  groups*, Journal of the Institute of Mathematics of Jussieu 8 (2009), 507–564;
  [arXiv:math/0702286v1](https://arxiv.org/pdf/math/0702286v1), with the arXiv numbering (lettered
  subsections) and pagination; its §1.b.1 assumes n≥3.
- **Mih19.** Andreas Mihatsch, *Relative unitary RZ-spaces and the Arithmetic Fundamental Lemma*,
  [arXiv:1611.06520v2](https://arxiv.org/pdf/1611.06520v2); Theorems 3.1 and 3.3 are numbered as in
  this version.
- **Cho18.** Sungyoon Cho, *The basic locus of the unitary Shimura variety with parahoric level
  structure, and special cycles*, [arXiv:1807.09997](https://arxiv.org/pdf/1807.09997).
- **Howard19.** Benjamin Howard, *Linear invariance of intersections on unitary Rapoport–Zink spaces*,
  Forum Mathematicum 31 (2019), 1265–1281; [arXiv:1811.01482](https://arxiv.org/pdf/1811.01482).
- **RZ96.** Michael Rapoport and Thomas Zink, *Period Spaces for p-divisible Groups*, Annals of
  Mathematics Studies 141, Princeton University Press, 1996
  ([author-hosted scan](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/Rapoport_Period%20spaces.pdf)),
  with the printed page numbers. Note: Corollary 6.29, p. 293, asserts the ℓ-adic and p-adic K-linear
  Hom comparisons for two polarized K-objects each satisfying the isoclinic hypothesis of Lemma 6.28
  separately; for K imaginary quadratic with p split, an ordinary CM elliptic curve A and A′=A with
  conjugated K-action, Hom_K(A,A′)⊗ℚ_ℓ=0 while Hom_K(V_ℓA,V_ℓA′) has dimension 2. §9.1 requires the
  two 𝔭-parts to be isoclinic of the same slope at every 𝔭 above p.
- **Wu16.** Haifeng Wu, *The supersingular locus of unitary Shimura varieties with exotic good
  reduction*, [arXiv:1609.08775](https://arxiv.org/pdf/1609.08775); ground field ℚ_p.
- **Kraemer03.** Nicole Krämer, *Local models for ramified unitary groups*,
  [arXiv:math/0302025v1](https://arxiv.org/pdf/math/0302025v1), with its printed page numbers; its
  Theorem 4.5 assumes n≥3.
- **LRZ26.** Chao Li, Michael Rapoport and Wei Zhang, *Quasi-canonical AFL and Arithmetic Transfer
  conjectures at parahoric levels*, [arXiv:2404.02214v2](https://arxiv.org/pdf/2404.02214v2).
- **RZ17.** Michael Rapoport and Thomas Zink, *On the Drinfeld moduli problem of p-divisible groups*,
  Cambridge Journal of Mathematics 5 (2017); [arXiv:1408.4071v2](https://arxiv.org/pdf/1408.4071v2),
  with the arXiv pagination.
- **Stacks.** The Stacks project authors, *The Stacks project*, chapter Morphisms of Schemes,
  [Tags 0B3G, 0B3H, 0C4M, 0C4N, 01WN, 0BCL](https://stacks.math.columbia.edu/download/morphisms.pdf).
